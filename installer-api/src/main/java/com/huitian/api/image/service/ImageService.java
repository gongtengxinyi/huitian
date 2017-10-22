package com.huitian.api.image.service;

import com.huitian.api.fw.service.StringIdBaseService;
import com.huitian.po.image.Image;

public interface ImageService extends StringIdBaseService<Image> {
    
    /**
     * 绘天接口测试
     * 
     */
    String BEAN_NAME = "imageService";
   	
}