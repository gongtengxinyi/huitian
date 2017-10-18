package com.huitian.api.image.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huitian.api.fw.service.impl.StringIdBaseServiceImpl;
import com.huitian.api.image.service.ImageService;
import com.huitian.api.indent.service.IndentService;
import com.huitian.po.image.Image;
import com.huitian.repo.fw.dao.SqlDao;
import com.huitian.repo.image.dao.ImageDao;

@Service(ImageService.BEAN_NAME)
public class ImageServiceImpl extends StringIdBaseServiceImpl<Image>implements ImageService {



	@Autowired
	private SqlDao sqlDao;


	@Autowired
	public void setBaseDao(ImageDao dao) {
		super.setBaseDao(dao);
	}
}