package com.huitian.api.image.service;

import com.huitian.api.fw.service.StringIdBaseService;
import com.huitian.po.image.Image;
import com.huitian.po.image.ImageType;

public interface ImageTypeService extends StringIdBaseService<ImageType> {
    
    /**
     * 绘天接口测试
     * 
     */
    String BEAN_NAME = "imageTypeService";
   	
}