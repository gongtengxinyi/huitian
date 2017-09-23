package com.huitian.api.fw.service;

import java.util.List;

import com.huitian.dto.Order;

/**
 * PagerService接口，翻页服务
 * @author ZlyjB
 *
 * @param <SF>
 * @param <BEAN>
 */
public interface PagerService<SF, BEAN> {

    List<BEAN> list(SF sf, int start, int limit, List<Order> orders);

    int count(SF sf);
}
