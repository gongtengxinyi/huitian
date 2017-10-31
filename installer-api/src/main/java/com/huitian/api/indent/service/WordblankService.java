package com.huitian.api.indent.service;

import java.util.List;

import com.huitian.api.fw.service.StringIdBaseService;
import com.huitian.dto.Order;
import com.huitian.po.indent.IndentParam;
import com.huitian.po.indent.Wordblank;

public interface WordblankService extends StringIdBaseService<Wordblank> {
    
    /**
     * 绘天接口测试
     * 
     */
    String BEAN_NAME = "wordblankService";

	Object list(Wordblank searchForm, int start, int limit, List<Order> orders);
   	
}