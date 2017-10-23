package com.huitian.repo.image.dao.impl;

import org.springframework.stereotype.Repository;

import com.huitian.po.image.Image;
import com.huitian.po.image.ImageType;
import com.huitian.repo.fw.dao.impl.StringIdBaseDaoImpl;
import com.huitian.repo.image.dao.ImageDao;
import com.huitian.repo.image.dao.ImageTypeDao;


@Repository(ImageTypeDao.BEAN_NAME)
public class ImageTypeDaoImpl extends StringIdBaseDaoImpl<ImageType> implements ImageTypeDao {

}
