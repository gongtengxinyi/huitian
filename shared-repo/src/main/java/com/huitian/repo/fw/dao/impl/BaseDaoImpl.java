package com.huitian.repo.fw.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.FlushModeType;
import javax.persistence.LockModeType;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Fetch;
import javax.persistence.criteria.From;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Selection;

import org.apache.commons.lang3.StringUtils;

import com.huitian.dto.Filter;
import com.huitian.dto.Order;
import com.huitian.dto.Page;
import com.huitian.dto.Pageable;
import com.huitian.dto.Filter.Operator;
import com.huitian.dto.Order.Direction;
import com.huitian.po.base.OrderPo;
import com.huitian.repo.fw.dao.BaseDao;
import com.huitian.util.Validate;

/**
 * BaseDao的实现
 * @author ZlyjB
 *
 * @param <T>
 * @param <ID>
 */
public abstract class BaseDaoImpl<T, ID extends Serializable> implements BaseDao<T, ID> {

    protected Class<T> entityClass;

    private static volatile long aliasCount = 0;

    //EntityManager实体管理器。其中实现了基本的数据库操作
    //EntityManager 是用来对实体Bean 进行操作的辅助类。他可以用来产生/删除持久化的实体Bean，通过主键查找实体bean，
    //也可以通过EJB3 QL 语言查找满足条件的实体Bean。实体Bean 被EntityManager 管理时，EntityManager跟踪他的状态改变，
    //在任何决定更新实体Bean 的时候便会把发生改变的值同步到数据库中。
    //当实体Bean 从EntityManager 分离后，他是不受管理的，EntityManager 无法跟踪他的任何状态改变。
    @PersistenceContext
    protected EntityManager entityManager;

    @SuppressWarnings("unchecked")
    public BaseDaoImpl() {
        Type type = getClass().getGenericSuperclass();
        Type[] parameterizedType = ((ParameterizedType) type).getActualTypeArguments();
        entityClass = (Class<T>) parameterizedType[0];
    }

    /**
     * 通过主键ID查询。查询指定类和主键的实体。 
     * 如果再说持久上下文中包含实体实例，返回之。
     */
    public T find(ID id) {
        if (id != null) {
            return entityManager.find(entityClass, id);
        }
        return null;
    }

    /**
     * 查询
     * 枚举 LockModeType:查询期间加锁？
     */
    public T find(ID id, LockModeType lockModeType) {
        if (id != null) {
            if (lockModeType != null) {
                return entityManager.find(entityClass, id, lockModeType);
            } else {
                return entityManager.find(entityClass, id);
            }
        }
        return null;
    }

    /**
     * 指定筛选条件和排序方式，查询并返回一个列表
     */
    public List<T> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<T> criteriaQuery = criteriaBuilder.createQuery(entityClass);
        criteriaQuery.select(criteriaQuery.from(entityClass));
        return findList(criteriaQuery, first, count, filters, orders);
    }

    /**
     * 
     */
    public Page<T> findPage(Pageable pageable) {
        //CriteriaBuilder 构造查询条件
    	CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<T> criteriaQuery = criteriaBuilder.createQuery(entityClass);
        criteriaQuery.select(criteriaQuery.from(entityClass));
        return findPage(criteriaQuery, pageable);
    }

    /**
     * 指定筛选条件，返回记录条数
     */
    public long count(Filter... filters) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<T> criteriaQuery = criteriaBuilder.createQuery(entityClass);
        criteriaQuery.select(criteriaQuery.from(entityClass));
        return count(criteriaQuery, filters != null ? Arrays.asList(filters) : null);
    }

    /**
     * 持久化
     */
    public void persist(T entity) {
        Validate.notNull(entity);
        entityManager.persist(entity);
    }

    /**
     * 将游离态的实体持久化到数据库中，并转换为持久化态。
     */
    public T merge(T entity) {
        Validate.notNull(entity);
        return entityManager.merge(entity);
    }

    /**
     * 通过调用remove方法删除一个持久化态的实体。如果实体声明为级联删除，则相关联的实体也被删除。 
     */
    public void remove(T entity) {
        if (entity != null) {
            entityManager.remove(entity);
        }
    }

    /**
     * refresh() 刷新实体Bean,以得到最新对象 (优雅地获取最新对象方法)
     */
    public void refresh(T entity) {
        if (entity != null) {
            entityManager.refresh(entity);
        }
    }

    /**
     * refresh() 刷新实体Bean,以得到最新对象 (优雅地获取最新对象方法)
     */
    public void refresh(T entity, LockModeType lockModeType) {
        if (entity != null) {
            if (lockModeType != null) {
                entityManager.refresh(entity, lockModeType);
            } else {
                entityManager.refresh(entity);
            }
        }
    }

    /**
     * 返回实体的ID
     * @SuppressWarnings给编译器一条指令，告诉它对被批注的代码元素内部的某些警告保持静默。
     * "unchecked" 执行了未检查的转换时的警告，例如当使用集合时没有用泛型 (Generics) 来指定集合保存的类型。
     * @SuppressWarnings("unchecked")  执行了未检查的转换时，不发出警告
     */
    @SuppressWarnings("unchecked")
    public ID getIdentifier(T entity) {
        Validate.notNull(entity);
        return (ID) entityManager.getEntityManagerFactory().getPersistenceUnitUtil().getIdentifier(entity);
    }

    /**
     * Check if the instance is a managed entity instance belonging to the current persistence context.
     */
    public boolean isManaged(T entity) {
        return entityManager.contains(entity);
    }

    /**
     * Remove the given entity from the persistence context, causing a managed entity to become detached. 
     * Unflushed changes made to the entity if any (including removal of the entity), 
     * will not be synchronized to the database. Entities which previously referenced the detached entity will continue to reference it.
     */
    public void detach(T entity) {
        entityManager.detach(entity);
    }

    /**
     * Lock an entity instance that is contained in the persistence context with the specified lock mode type.
     * If a pessimistic lock mode type is specified and the entity contains a version attribute, 
     * the persistence provider must also perform optimistic version checks when obtaining the database lock. 
     * If these checks fail, the OptimisticLockException will be thrown. 
     */
    public void lock(T entity, LockModeType lockModeType) {
        if (entity != null && lockModeType != null) {
            entityManager.lock(entity, lockModeType);
        }
    }

    /**
     * clear() 分离所有当前正在被管理的实体
     */
    public void clear() {
        entityManager.clear();
    }

    /**
     *  flush() 将实体的改变立刻刷新到数据库中
     */
    public void flush() {
        entityManager.flush();
    }

    /**
     * 查询指定条件的数据，返回一个列表
     * @param criteriaQuery
     * @param first
     * @param count
     * @param filters
     * @param orders
     * @return
     */
    protected List<T> findList(CriteriaQuery<T> criteriaQuery, Integer first, Integer count, List<Filter> filters, List<Order> orders) {
        Validate.notNull(criteriaQuery);//验证
        Validate.notNull(criteriaQuery.getSelection());
        Validate.notEmpty(criteriaQuery.getRoots());

        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        Root<T> root = getRoot(criteriaQuery);
        addRestrictions(criteriaQuery, filters);
        addOrders(criteriaQuery, orders);
        if (criteriaQuery.getOrderList().isEmpty()) {
            if (OrderPo.class.isAssignableFrom(entityClass)) {
                criteriaQuery.orderBy(criteriaBuilder.asc(root.get(OrderPo.ORDER_PROPERTY_NAME)));
            } else {
                criteriaQuery.orderBy(criteriaBuilder.desc(root.get(OrderPo.CREATE_DATE_PROPERTY_NAME)));
            }
        }
        TypedQuery<T> query = entityManager.createQuery(criteriaQuery).setFlushMode(FlushModeType.COMMIT);
        if (first != null) {
            query.setFirstResult(first);
        }
        if (count != null) {
            query.setMaxResults(count);
        }
        return query.getResultList();
    }

    protected Page<T> findPage(CriteriaQuery<T> criteriaQuery, Pageable pageable) {
        Validate.notNull(criteriaQuery);
        Validate.notNull(criteriaQuery.getSelection());
        Validate.notEmpty(criteriaQuery.getRoots());

        if (pageable == null) {
            pageable = new Pageable();
        }
        //CriteriaBuilder：Used to construct criteria queries, compound selections, expressions, predicates, orderings. 
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        //Root：A root type in the from clause. Query roots always reference entities.
        Root<T> root = getRoot(criteriaQuery);
        addRestrictions(criteriaQuery, pageable);
        addOrders(criteriaQuery, pageable);
        if (criteriaQuery.getOrderList().isEmpty()) {
            if (OrderPo.class.isAssignableFrom(entityClass)) {
                criteriaQuery.orderBy(criteriaBuilder.asc(root.get(OrderPo.ORDER_PROPERTY_NAME)));
            } else {
                criteriaQuery.orderBy(criteriaBuilder.desc(root.get(OrderPo.CREATE_DATE_PROPERTY_NAME)));
            }
        }
        long total = count(criteriaQuery, null);
        int totalPages = (int) Math.ceil((double) total / (double) pageable.getPageSize());
        if (totalPages < pageable.getPageNumber()) {
            pageable.setPageNumber(totalPages);
        }
        TypedQuery<T> query = entityManager.createQuery(criteriaQuery).setFlushMode(FlushModeType.COMMIT);
        query.setFirstResult((pageable.getPageNumber() - 1) * pageable.getPageSize());
        query.setMaxResults(pageable.getPageSize());
        return new Page<T>(query.getResultList(), total, pageable);
    }

    /**
     * 返回满足条件的记录条目数
     * @param criteriaQuery
     * @param filters
     * @return
     */
    protected Long count(CriteriaQuery<T> criteriaQuery, List<Filter> filters) {
        Validate.notNull(criteriaQuery);
        Validate.notNull(criteriaQuery.getSelection());
        Validate.notEmpty(criteriaQuery.getRoots());

        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        addRestrictions(criteriaQuery, filters);

        CriteriaQuery<Long> countCriteriaQuery = criteriaBuilder.createQuery(Long.class);
        for (Root<?> root : criteriaQuery.getRoots()) {
            Root<?> dest = countCriteriaQuery.from(root.getJavaType());
            dest.alias(getAlias(root));
            copyJoins(root, dest);
        }

        Root<?> countRoot = getRoot(countCriteriaQuery, criteriaQuery.getResultType());
        countCriteriaQuery.select(criteriaBuilder.count(countRoot));

        if (criteriaQuery.getGroupList() != null) {
            countCriteriaQuery.groupBy(criteriaQuery.getGroupList());
        }
        if (criteriaQuery.getGroupRestriction() != null) {
            countCriteriaQuery.having(criteriaQuery.getGroupRestriction());
        }
        if (criteriaQuery.getRestriction() != null) {
            countCriteriaQuery.where(criteriaQuery.getRestriction());
        }
        return entityManager.createQuery(countCriteriaQuery).setFlushMode(FlushModeType.COMMIT).getSingleResult();
    }

    private synchronized String getAlias(Selection<?> selection) {
        if (selection != null) {
        	//返回集合元素的别名。如果没有别名，返回null
            String alias = selection.getAlias();
            if (alias == null) {
                if (aliasCount >= 1000) {
                    aliasCount = 0;
                }
                alias = "shopxxGeneratedAlias" + aliasCount++;
                selection.alias(alias);
            }
            return alias;
        }
        return null;
    }

    private Root<T> getRoot(CriteriaQuery<T> criteriaQuery) {
        if (criteriaQuery != null) {
            return getRoot(criteriaQuery, criteriaQuery.getResultType());
        }
        return null;
    }

    private Root<T> getRoot(CriteriaQuery<?> criteriaQuery, Class<T> clazz) {
        if (criteriaQuery != null && criteriaQuery.getRoots() != null && clazz != null) {
        	//getRoots()：Return the query roots. These are the roots that have been defined for the CriteriaQuery or Subquery itself, 
        	//including any subquery roots defined as a result of correlation. Returns empty set if no roots have been defined. 
        	//Modifications to the set do not affect the query.
            for (Root<?> root : criteriaQuery.getRoots()) {
                if (clazz.equals(root.getJavaType())) {
                	//Perform a typecast upon the expression, returning a new expression object. 
                	//This method does not cause type conversion: the runtime type is not changed. Warning: may result in a runtime failure.
                    return (Root<T>) root.as(clazz);
                }
            }
        }
        return null;
    }

    private void copyJoins(From<?, ?> from, From<?, ?> to) {
        for (Join<?, ?> join : from.getJoins()) {
            Join<?, ?> toJoin = to.join(join.getAttribute().getName(), join.getJoinType());
            toJoin.alias(getAlias(join));
            copyJoins(join, toJoin);
        }
        for (Fetch<?, ?> fetch : from.getFetches()) {
            Fetch<?, ?> toFetch = to.fetch(fetch.getAttribute().getName());
            copyFetches(fetch, toFetch);
        }
    }

    private void copyFetches(Fetch<?, ?> from, Fetch<?, ?> to) {
        for (Fetch<?, ?> fetch : from.getFetches()) {
            Fetch<?, ?> toFetch = to.fetch(fetch.getAttribute().getName());
            copyFetches(fetch, toFetch);
        }
    }

    private void addRestrictions(CriteriaQuery<T> criteriaQuery, List<Filter> filters) {
        if (criteriaQuery == null || filters == null || filters.isEmpty()) {
            return;
        }
        Root<T> root = getRoot(criteriaQuery);
        if (root == null) {
            return;
        }
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        Predicate restrictions = criteriaQuery.getRestriction() != null ? criteriaQuery.getRestriction() : criteriaBuilder.conjunction();
        for (Filter filter : filters) {
            if (filter == null || StringUtils.isEmpty(filter.getProperty())) {
                continue;
            }
            if (filter.getOperator() == Operator.EQ && filter.getValue() != null) {
                if (filter.getIgnoreCase() != null && filter.getIgnoreCase() && filter.getValue() instanceof String) {
                    restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(criteriaBuilder.lower(root.<String> get(filter.getProperty())), ((String) filter.getValue()).toLowerCase()));
                } else {
                    restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get(filter.getProperty()), filter.getValue()));
                }
            } else if (filter.getOperator() == Operator.NE && filter.getValue() != null) {
                if (filter.getIgnoreCase() != null && filter.getIgnoreCase() && filter.getValue() instanceof String) {
                    restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.notEqual(criteriaBuilder.lower(root.<String> get(filter.getProperty())), ((String) filter.getValue()).toLowerCase()));
                } else {
                    restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.notEqual(root.get(filter.getProperty()), filter.getValue()));
                }
            } else if (filter.getOperator() == Operator.GT && filter.getValue() != null) {
                restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.gt(root.<Number> get(filter.getProperty()), (Number) filter.getValue()));
            } else if (filter.getOperator() == Operator.LT && filter.getValue() != null) {
                restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.lt(root.<Number> get(filter.getProperty()), (Number) filter.getValue()));
            } else if (filter.getOperator() == Operator.GE && filter.getValue() != null) {
                restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.ge(root.<Number> get(filter.getProperty()), (Number) filter.getValue()));
            } else if (filter.getOperator() == Operator.LE && filter.getValue() != null) {
                restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.le(root.<Number> get(filter.getProperty()), (Number) filter.getValue()));
            } else if (filter.getOperator() == Operator.LIKE && filter.getValue() != null && filter.getValue() instanceof String) {
                restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.like(root.<String> get(filter.getProperty()), (String) filter.getValue()));
            } else if (filter.getOperator() == Operator.IN && filter.getValue() != null) {
                restrictions = criteriaBuilder.and(restrictions, root.get(filter.getProperty()).in(filter.getValue()));
            } else if (filter.getOperator() == Operator.NULL) {
                restrictions = criteriaBuilder.and(restrictions, root.get(filter.getProperty()).isNull());
            } else if (filter.getOperator() == Operator.NOTNULL) {
                restrictions = criteriaBuilder.and(restrictions, root.get(filter.getProperty()).isNotNull());
            }
        }
        criteriaQuery.where(restrictions);
    }

    private void addRestrictions(CriteriaQuery<T> criteriaQuery, Pageable pageable) {
        if (criteriaQuery == null || pageable == null) {
            return;
        }
        Root<T> root = getRoot(criteriaQuery);
        if (root == null) {
            return;
        }
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        Predicate restrictions = criteriaQuery.getRestriction() != null ? criteriaQuery.getRestriction() : criteriaBuilder.conjunction();
        if (StringUtils.isNotEmpty(pageable.getSearchProperty()) && StringUtils.isNotEmpty(pageable.getSearchValue())) {
            restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.like(root.<String> get(pageable.getSearchProperty()), "%" + pageable.getSearchValue() + "%"));
        }
        if (pageable.getFilters() != null) {
            for (Filter filter : pageable.getFilters()) {
                if (filter == null || StringUtils.isEmpty(filter.getProperty())) {
                    continue;
                }
                if (filter.getOperator() == Operator.EQ && filter.getValue() != null) {
                    if (filter.getIgnoreCase() != null && filter.getIgnoreCase() && filter.getValue() instanceof String) {
                        restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(criteriaBuilder.lower(root.<String> get(filter.getProperty())), ((String) filter.getValue()).toLowerCase()));
                    } else {
                        restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.equal(root.get(filter.getProperty()), filter.getValue()));
                    }
                } else if (filter.getOperator() == Operator.NE && filter.getValue() != null) {
                    if (filter.getIgnoreCase() != null && filter.getIgnoreCase() && filter.getValue() instanceof String) {
                        restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.notEqual(criteriaBuilder.lower(root.<String> get(filter.getProperty())), ((String) filter.getValue()).toLowerCase()));
                    } else {
                        restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.notEqual(root.get(filter.getProperty()), filter.getValue()));
                    }
                } else if (filter.getOperator() == Operator.GT && filter.getValue() != null) {
                    restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.gt(root.<Number> get(filter.getProperty()), (Number) filter.getValue()));
                } else if (filter.getOperator() == Operator.LT && filter.getValue() != null) {
                    restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.lt(root.<Number> get(filter.getProperty()), (Number) filter.getValue()));
                } else if (filter.getOperator() == Operator.GE && filter.getValue() != null) {
                    restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.ge(root.<Number> get(filter.getProperty()), (Number) filter.getValue()));
                } else if (filter.getOperator() == Operator.LE && filter.getValue() != null) {
                    restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.le(root.<Number> get(filter.getProperty()), (Number) filter.getValue()));
                } else if (filter.getOperator() == Operator.LIKE && filter.getValue() != null && filter.getValue() instanceof String) {
                    restrictions = criteriaBuilder.and(restrictions, criteriaBuilder.like(root.<String> get(filter.getProperty()), (String) filter.getValue()));
                } else if (filter.getOperator() == Operator.IN && filter.getValue() != null) {
                    restrictions = criteriaBuilder.and(restrictions, root.get(filter.getProperty()).in((Object[]) filter.getValue()));
                } else if (filter.getOperator() == Operator.NULL) {
                    restrictions = criteriaBuilder.and(restrictions, root.get(filter.getProperty()).isNull());
                } else if (filter.getOperator() == Operator.NOTNULL) {
                    restrictions = criteriaBuilder.and(restrictions, root.get(filter.getProperty()).isNotNull());
                }
            }
        }
        criteriaQuery.where(restrictions);
    }

    /**
     * 将排序加入到查询中
     * @param criteriaQuery
     * @param orders
     */
    private void addOrders(CriteriaQuery<T> criteriaQuery, List<Order> orders) {
        if (criteriaQuery == null || orders == null || orders.isEmpty()) {//查询为null或无排序
            return;
        }
        Root<T> root = getRoot(criteriaQuery);
        if (root == null) {
            return;
        }
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        List<javax.persistence.criteria.Order> orderList = new ArrayList<javax.persistence.criteria.Order>();
        if (!criteriaQuery.getOrderList().isEmpty()) {
            orderList.addAll(criteriaQuery.getOrderList());
        }
        for (Order order : orders) {
            if (order.getDirection() == Direction.ASC) {
                orderList.add(criteriaBuilder.asc(root.get(order.getProperty())));
            } else if (order.getDirection() == Direction.DESC) {
                orderList.add(criteriaBuilder.desc(root.get(order.getProperty())));
            }
        }
        criteriaQuery.orderBy(orderList);
    }

    private void addOrders(CriteriaQuery<T> criteriaQuery, Pageable pageable) {
        if (criteriaQuery == null || pageable == null) {
            return;
        }
        Root<T> root = getRoot(criteriaQuery);
        if (root == null) {
            return;
        }
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        List<javax.persistence.criteria.Order> orderList = new ArrayList<javax.persistence.criteria.Order>();
        if (!criteriaQuery.getOrderList().isEmpty()) {
            orderList.addAll(criteriaQuery.getOrderList());
        }
        if (StringUtils.isNotEmpty(pageable.getOrderProperty()) && pageable.getOrderDirection() != null) {
            if (pageable.getOrderDirection() == Direction.ASC) {
                orderList.add(criteriaBuilder.asc(root.get(pageable.getOrderProperty())));
            } else if (pageable.getOrderDirection() == Direction.DESC) {
                orderList.add(criteriaBuilder.desc(root.get(pageable.getOrderProperty())));
            }
        }
        if (pageable.getOrders() != null) {
            for (Order order : pageable.getOrders()) {
                if (order.getDirection() == Direction.ASC) {
                    orderList.add(criteriaBuilder.asc(root.get(order.getProperty())));
                } else if (order.getDirection() == Direction.DESC) {
                    orderList.add(criteriaBuilder.desc(root.get(order.getProperty())));
                }
            }
        }
        criteriaQuery.orderBy(orderList);
    }

}