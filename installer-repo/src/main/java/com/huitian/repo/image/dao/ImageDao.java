package com.huitian.repo.image.dao;

import com.huitian.po.image.Image;
import com.huitian.repo.fw.dao.StringIdBaseDao;

public interface ImageDao extends StringIdBaseDao<Image> {

    String BEAN_NAME = "imageDao";
}
