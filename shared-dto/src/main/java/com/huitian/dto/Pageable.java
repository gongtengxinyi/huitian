package com.huitian.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

import com.huitian.dto.Order.Direction;

/**
 * 
 * @author ZlyjB
 *
 */
public class Pageable implements Serializable {
	//ID
    private static final long serialVersionUID = 1L;

    //默认页数
    private static final int DEFAULT_PAGE_NUMBER = 1;

    //默认每页条目数
    private static final int DEFAULT_PAGE_SIZE = 20;

    //默认最大页数
    private static final int MAX_PAGE_SIZE = 1000;

    //页码
    private int pageNumber = DEFAULT_PAGE_NUMBER;

    //每页条目数，先指定为默认每页条目数
    private int pageSize = DEFAULT_PAGE_SIZE;

    //搜索属性
    private String searchProperty;

    //搜索值
    private String searchValue;

    //排序属性
    private String orderProperty;

    //排序方向
    private Direction orderDirection;

    //筛选条件
    private List<Filter> filters = new ArrayList<Filter>();

    //排序条件
    private List<Order> orders = new ArrayList<Order>();

    /**
     * 构造函数
     */
    public Pageable() {
    }

    /**
     * 构造函数
     * @param pageNumber 页数
     * @param pageSize 每页条目数
     */
    public Pageable(Integer pageNumber, Integer pageSize) {
        if (pageNumber != null && pageNumber >= 1) {
            this.pageNumber = pageNumber;
        }
        if (pageSize != null && pageSize >= 1 && pageSize <= MAX_PAGE_SIZE) {
            this.pageSize = pageSize;
        }
    }

    /**
     * 获取页数
     * @return
     */
    public int getPageNumber() {
        return pageNumber;
    }

    /**
     * 设置页数
     * @param pageNumber
     */
    public void setPageNumber(int pageNumber) {
        if (pageNumber < 1) {
            pageNumber = DEFAULT_PAGE_NUMBER;
        }
        this.pageNumber = pageNumber;
    }

    /**
     * 获取每页的条目数
     */
    public int getPageSize() {
        return pageSize;
    }

    /**
     * 设置每页的条目数
     * @param pageSize
     */
    public void setPageSize(int pageSize) {
        if (pageSize < 1 || pageSize > MAX_PAGE_SIZE) {//如果小于1或者大于最大每页条目数
            pageSize = DEFAULT_PAGE_SIZE;//设置为默认每页条目数
        }
        this.pageSize = pageSize;
    }

    /**
     * 获取搜索属性
     */
    public String getSearchProperty() {
        return searchProperty;
    }

    /**
     * 设置搜索属性
     * @param searchProperty
     */
    public void setSearchProperty(String searchProperty) {
        this.searchProperty = searchProperty;
    }

    /**
     * 获取SearchValue
     * @return
     */
    public String getSearchValue() {
        return searchValue;
    }

    /**
     * 设置SearchValue
     * @param searchValue
     */
    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

    /**
     * 获取OrderProperty
     * @return
     */
    public String getOrderProperty() {
        return orderProperty;
    }

    /**
     * 设置OrderProperty
     * @param orderProperty
     */
    public void setOrderProperty(String orderProperty) {
        this.orderProperty = orderProperty;
    }

    /**
     * 获取OrderDirection
     * @return
     */
    public Direction getOrderDirection() {
        return orderDirection;
    }

    /**
     * 设置orderDirection
     * @param orderDirection
     */
    public void setOrderDirection(Direction orderDirection) {
        this.orderDirection = orderDirection;
    }

    /**
     * 获取筛选条件
     * @return
     */
    public List<Filter> getFilters() {
        return filters;
    }

    /**
     * 设置筛选条件
     * @param filters
     */
    public void setFilters(List<Filter> filters) {
        this.filters = filters;
    }

    /**
     * 获取排序字段
     * @return
     */
    public List<Order> getOrders() {
        return orders;
    }

    /**
     * 设置排序字段
     * @param orders
     */
    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    /**
     * 判断两个类是否相等
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
        Pageable other = (Pageable) obj;
        return new EqualsBuilder() //
                .append(getPageNumber(), other.getPageNumber()) //
                .append(getPageSize(), other.getPageSize()) //
                .append(getSearchProperty(), other.getSearchProperty()) //
                .append(getSearchValue(), other.getSearchValue()) //
                .append(getOrderProperty(), other.getOrderProperty()) //
                .append(getOrderDirection(), other.getOrderDirection()) //
                .append(getFilters(), other.getFilters()) //
                .append(getOrders(), other.getOrders()) //
                .isEquals();
    }

    /**
     * 哈希值
     */
    @Override
    public int hashCode() {
        return new HashCodeBuilder(17, 37) //
                .append(getPageNumber()) //
                .append(getPageSize()) //
                .append(getSearchProperty()) //
                .append(getSearchValue()) //
                .append(getOrderProperty()) //
                .append(getOrderDirection()) //
                .append(getFilters()) //
                .append(getOrders()) //
                .toHashCode();
    }
}