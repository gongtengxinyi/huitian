package com.huitian.repo.image.dao.impl;

import org.springframework.stereotype.Repository;

import com.huitian.po.image.Image;
import com.huitian.repo.fw.dao.impl.StringIdBaseDaoImpl;
import com.huitian.repo.image.dao.ImageDao;


@Repository(ImageDao.BEAN_NAME)
public class ImageDaoImpl extends StringIdBaseDaoImpl<Image> implements ImageDao {

}
