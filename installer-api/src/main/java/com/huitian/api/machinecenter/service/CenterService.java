package com.huitian.api.machinecenter.service;

import com.huitian.api.fw.service.StringIdBaseService;
import com.huitian.po.indent.IndentParam;
import com.huitian.po.machinecenter.Center;

public interface CenterService extends StringIdBaseService<Center> {
    
    /**
     * 绘天接口测试
     * 
     */
    String BEAN_NAME = "centerService";
   	
}