package com.huitian.dto;

import java.io.Serializable;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

/**
 * 数据库查询的筛选条件
 */
public class Filter implements Serializable {

    private static final long serialVersionUID = -8712382358441065075L;

    public enum Operator {

        EQ,

        NE,

        GT,

        LT,

        GE,

        LE,

        LIKE,

        IN,

        NULL,

        NOTNULL;

        public static Operator fromString(String value) {
            return Operator.valueOf(value.toLowerCase());
        }
    }

    private static final boolean DEFAULT_IGNORE_CASE = false;//默认忽略大小写

    private String property;//属性--应该是字段吧

    private Operator operator;//操作符，> >= = < <= 等等 

    private Object value;

    private Boolean ignoreCase = DEFAULT_IGNORE_CASE;

    public Filter() {
    }

    /**
     * 构造函数，结果，例如：field_A>7
     * @param property
     * @param operator
     * @param value
     */
    public Filter(String property, Operator operator, Object value) {
        this.property = property;
        this.operator = operator;
        this.value = value;
    }

    /**
     * 指定是否忽略大小写
     * @param property
     * @param operator
     * @param value
     * @param ignoreCase
     */
    public Filter(String property, Operator operator, Object value, boolean ignoreCase) {
        this.property = property;
        this.operator = operator;
        this.value = value;
        this.ignoreCase = ignoreCase;
    }

    public static Filter eq(String property, Object value) {
        return new Filter(property, Operator.EQ, value);
    }

    public static Filter eq(String property, Object value, boolean ignoreCase) {
        return new Filter(property, Operator.EQ, value, ignoreCase);
    }

    public static Filter ne(String property, Object value) {
        return new Filter(property, Operator.NE, value);
    }

    public static Filter ne(String property, Object value, boolean ignoreCase) {
        return new Filter(property, Operator.NE, value, ignoreCase);
    }

    public static Filter gt(String property, Object value) {
        return new Filter(property, Operator.GT, value);
    }

    public static Filter lt(String property, Object value) {
        return new Filter(property, Operator.LT, value);
    }

    public static Filter ge(String property, Object value) {
        return new Filter(property, Operator.GE, value);
    }

    public static Filter le(String property, Object value) {
        return new Filter(property, Operator.LE, value);
    }

    public static Filter like(String property, Object value) {
        return new Filter(property, Operator.LIKE, value);
    }

    public static Filter in(String property, Object value) {
        return new Filter(property, Operator.IN, value);
    }

    public static Filter isNull(String property) {
        return new Filter(property, Operator.NULL, null);
    }

    public static Filter isNotNull(String property) {
        return new Filter(property, Operator.NOTNULL, null);
    }

    public Filter ignoreCase() {
        this.ignoreCase = true;
        return this;
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public Operator getOperator() {
        return operator;
    }

    public void setOperator(Operator operator) {
        this.operator = operator;
    }

    public Object getValue() {
        return value;
    }

    public void setValue(Object value) {
        this.value = value;
    }

    public Boolean getIgnoreCase() {
        return ignoreCase;
    }

    public void setIgnoreCase(Boolean ignoreCase) {
        this.ignoreCase = ignoreCase;
    }

    /**
     * 本类的相等判断
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
        Filter other = (Filter) obj;
        return new EqualsBuilder() //
                .append(getProperty(), other.getProperty()) //
                .append(getOperator(), other.getOperator()) //
                .append(getValue(), other.getValue()) //
                .isEquals();
    }

    /**
     * 生成本类的哈希值
     */
    @Override
    public int hashCode() {
        return new HashCodeBuilder(17, 37) //
                .append(getProperty()).append(getOperator()).append(getValue()) //
                .toHashCode();
    }

}