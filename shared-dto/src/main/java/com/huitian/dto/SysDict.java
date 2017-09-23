package com.huitian.dto;

import java.io.Serializable;

/**
 * 类似一个键值对，用于下拉列表框，维护ID和字符串的对应关系，例如，列表的ID和NAME字段的对应关系
 * 在下拉列表框中显示的是条目的名称，但是我们实际需要的是ID
 * @author ZlyjB
 *
 */

public class SysDict implements Serializable {

    private static final long serialVersionUID = 1L;

    public static final SysDict ALL = new SysDict("", "--全部 --", 0);
    public static final SysDict EMPTY = new SysDict("", "", 0);
    public static final SysDict CHECK = new SysDict("", "--请选择--", 0);

    private String value;//值
    private String text;//文本
    private int orders;//顺序

    public SysDict() {
    }

    public SysDict(String value, String text, int orders) {
        super();
        this.value = value;
        this.text = text;
        this.orders = orders;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getOrders() {
        return orders;
    }

    public void setOrders(int orders) {
        this.orders = orders;
    }
}