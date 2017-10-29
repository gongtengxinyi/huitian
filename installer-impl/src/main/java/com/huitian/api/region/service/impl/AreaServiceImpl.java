package com.huitian.api.region.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huitian.api.fw.service.impl.StringIdBaseServiceImpl;
import com.huitian.api.region.service.AreaService;
import com.huitian.po.region.Area;
import com.huitian.repo.fw.dao.SqlDao;
import com.huitian.repo.region.dao.AreaDao;

@Service(AreaService.BEAN_NAME)
public class AreaServiceImpl extends StringIdBaseServiceImpl<Area>implements AreaService {

	private static final String PUSH_TYPE = "pushType";

	@Autowired
	private SqlDao sqlDao;


	@Autowired
	public void setBaseDao(AreaDao dao) {
		super.setBaseDao(dao);
	}
}