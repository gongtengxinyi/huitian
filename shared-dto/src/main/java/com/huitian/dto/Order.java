package com.huitian.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

/**
 * 排序方式，ASC和DESC两种
 * @author ZlyjB
 *
 */
public class Order implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 枚举，两种排序方式，ASC DESC
     * @author ZlyjB
     *
     */
    public enum Direction {

        ASC,

        DESC;

        public static Direction fromString(String value) {
            return Direction.valueOf(value.toLowerCase());
        }
    }

    private static final Direction DEFAULT_DIRECTION = Direction.DESC;//默认倒序

    private String property;//用于排序的字段

    private Direction direction = DEFAULT_DIRECTION;//排序的方向 ASC DESC

    public Order() {
    }

    /**
     * 构造函数，字段，方向 
     * @param property
     * @param direction
     */
    public Order(String property, Direction direction) {
        this.property = property;
        this.direction = direction;
    }

    /**
     * 指定字段，升序
     * @param property
     * @return
     */
    public static Order asc(String property) {
        return order(property, Direction.ASC);
    }

    public static Order desc(String property) {
        return order(property, Direction.DESC);
    }
    
    /**
     * 构造一个order
     * 
     * @param field
     * @param type
     * @return
     */
    public static Order order(String field, Direction direction) {

        Order ret = new Order(field, direction);

        return ret;
    }

    /**
     * 获取当前order的字段
     * @return
     */
    public String getProperty() {
        return property;
    }

	/**
	 * 设置当前order的字段
	 * @param property
	 */
    public void setProperty(String property) {
        this.property = property;
    }

    /**
     * 获取order的方向
     * @return
     */
    public Direction getDirection() {
        return direction;
    }

    /**
     * 设置order的方向
     * @param direction
     */
    public void setDirection(Direction direction) {
        this.direction = direction;
    }
    
    /**
     * 将order加入到sql后面 
     * 
     * @param sql
     * @param orders
     * @return 返回处理过的sql
     */
    public static String appendOrder(String sql, List<Order> orders) {
        if (orders == null || orders.isEmpty())
            return sql;

        StringBuilder ret = new StringBuilder(sql);
        for (int i = 0, imax = orders.size(); i < imax; i++) {
            Order order = orders.get(i);
            if (i > 0) {
                ret.append(", ");
            } else {
                ret.append(" order by ");
            }
            ret.append(order.getProperty()).append(" ").append(order.getDirection());
        }

        return ret.toString();
    }

    /**
     * 将order里面的field name转换成另外一个field name
     *  原因在于，我们前台输入的条件中的field可能与后台查询不一致 
     * Collection--java.util.Collection 接口是描述 Set 和 List 集合类型的根接口，其中定义了有关集合操作的普遍性方法（部分）
     * @param orders
     * @param mapping
     * @return 一个新的order list，里面的每个都是新建拷贝 
     */
    public static List<Order> changeFieldName(Collection<Order> orders, Map<String, String> mapping) {
        List<Order> ret = new ArrayList<Order>();

        if (orders == null || orders.isEmpty()) {
            return ret;
        }

        for (Order order : orders) {
            String oriName = order.getProperty();
            String destName = mapping.get(oriName);
            if (destName == null) {
                destName = oriName;
            }
            ret.add(Order.order(destName, order.getDirection()));
        }

        return ret;
    }

    /**
     * 两个类相等的方法
     */
    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        Order other = (Order) obj;
        return new EqualsBuilder() //
                .append(getProperty(), other.getProperty()) //
                .append(getDirection(), other.getDirection()).isEquals();
    }

    /**
     * 哈希值
     */
    @Override
    public int hashCode() {
        return new HashCodeBuilder(17, 37) //
                .append(getProperty()).append(getDirection()) //
                .toHashCode();
    }

}