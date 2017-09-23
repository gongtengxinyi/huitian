package com.huitian.api.fw.service;

import java.io.Serializable;
import java.util.List;

import com.huitian.dto.Filter;
import com.huitian.dto.Order;
import com.huitian.dto.Page;
import com.huitian.dto.Pageable;

/**
 * 多数服务类的基类
 * @author ZlyjB
 *
 * @param <T>
 * @param <ID>
 */
public interface BaseService<T, ID extends Serializable> extends Tag {

	//查找，返回一个对象
    T find(ID id);
    //查找所有，返回一个对象链表
    List<T> findAll();
    //查找一个ID序列，返回对象列表
    List<T> findList(@SuppressWarnings("unchecked") ID... ids);
    //查找，指定返回的最多条数，指定筛选条件，指定排序方式，返回一个对象链表
    List<T> findList(Integer count, List<Filter> filters, List<Order> orders);
    //查找，指定起始位置，返回条数，筛选条件，排序方式
    List<T> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders);
    //查询某一页
    Page<T> findPage(Pageable pageable);

    //总数
    long count();

    //指定筛选条件的总数
    long count(Filter... filters);

    //指定ID记录是否存在
    boolean exists(ID id);

    //指定筛选条件的记录是否存在
    boolean exists(Filter... filters);

    //保存
    void save(T entity);

    //更新，返回记录集
    T update(T entity);

    //更新，忽略某几个字段，返回记录集
    T update(T entity, String... ignoreProperties);

    //删除指定ID的记录
    void delete(ID id);

    //删除指定id序列的记录
    void delete(@SuppressWarnings("unchecked") ID... ids);

    //删除一个实体
    void delete(T entity);

}