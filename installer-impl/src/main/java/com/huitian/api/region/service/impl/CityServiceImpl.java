package com.huitian.api.region.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huitian.api.fw.service.impl.StringIdBaseServiceImpl;
import com.huitian.api.region.service.CityService;
import com.huitian.po.region.City;
import com.huitian.repo.fw.dao.SqlDao;
import com.huitian.repo.region.dao.CityDao;

@Service(CityService.BEAN_NAME)
public class CityServiceImpl extends StringIdBaseServiceImpl<City>implements CityService {

	private static final String PUSH_TYPE = "pushType";

	@Autowired
	private SqlDao sqlDao;


	@Autowired
	public void setBaseDao(CityDao dao) {
		super.setBaseDao(dao);
	}
}