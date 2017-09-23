package com.huitian.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.huitian.dto.Order.Direction;

/**
 * 分页
 * @author ZlyjB
 *
 * @param <T>
 */
public class Page<T> implements Serializable {
	//ID
    private static final long serialVersionUID = 1L;
    //列表  final 初始化之后不能再改变
    private final List<T> content = new ArrayList<T>();

    //总数
    private final long total;

    //分页参数
    private final Pageable pageable;

    /**
     * 构造函数  总条目数设置为0
     */
    public Page() {
        this.total = 0L;//长整形0
        this.pageable = new Pageable();
    }

    /**
     * 构造函数
     * @param content 条目链表
     * @param total 总数
     * @param pageable 分页属性
     */
    public Page(List<T> content, long total, Pageable pageable) {
        this.content.addAll(content);
        this.total = total;
        this.pageable = pageable;
    }

    /**
     * 获取页码数
     * @return
     */
    public int getPageNumber() {
        return pageable.getPageNumber();
    }

    /**
     * 获取每页条目数
     * @return
     */
    public int getPageSize() {
        return pageable.getPageSize();
    }

    /**
     * 获取SearchProperty
     * @return
     */
    public String getSearchProperty() {
        return pageable.getSearchProperty();
    }

    /**
     * 获取SearchValue
     * @return
     */
    public String getSearchValue() {
        return pageable.getSearchValue();
    }

    /**
     * 获取OrderProperty
     * @return
     */
    public String getOrderProperty() {
        return pageable.getOrderProperty();
    }

    /**
     * 获取OrderDirection
     * @return
     */
    public Direction getOrderDirection() {
        return pageable.getOrderDirection();
    }

    /**
     * 获取Orders 包含排序的字段和排序顺序 ASC DESC两种 
     * @return
     */
    public List<Order> getOrders() {
        return pageable.getOrders();
    }

    /**
     * 获取筛选条件
     * @return
     */
    public List<Filter> getFilters() {
        return pageable.getFilters();
    }

    /**
     * 获取总页数
     * @return
     */
    public int getTotalPages() {
        return (int) Math.ceil((double) getTotal() / (double) getPageSize());
    }

    /**
     * 获取contents，查询内容
     * @return
     */
    public List<T> getContent() {
        return content;
    }

    /**
     * 获取总条目数
     * @return
     */
    public long getTotal() {
        return total;
    }

    /**
     * 获取翻页属性
     * @return
     */
    public Pageable getPageable() {
        return pageable;
    }
}