package com.huitian.api.image.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huitian.api.fw.service.impl.StringIdBaseServiceImpl;
import com.huitian.api.image.service.ImageService;
import com.huitian.api.image.service.ImageTypeService;
import com.huitian.po.image.ImageType;
import com.huitian.repo.fw.dao.SqlDao;
import com.huitian.repo.image.dao.ImageDao;
import com.huitian.repo.image.dao.ImageTypeDao;

@Service(ImageTypeService.BEAN_NAME)
public class ImageTypeServiceImpl extends StringIdBaseServiceImpl<ImageType>implements ImageTypeService {



	@Autowired
	private SqlDao sqlDao;


	@Autowired
	public void setBaseDao(ImageTypeDao dao) {
		super.setBaseDao(dao);
	}
}