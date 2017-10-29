package com.huitian.api.region.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huitian.api.fw.service.impl.StringIdBaseServiceImpl;
import com.huitian.api.region.service.ProvService;
import com.huitian.po.region.Prov;
import com.huitian.repo.fw.dao.SqlDao;
import com.huitian.repo.region.dao.ProvDao;

@Service(ProvService.BEAN_NAME)
public class ProvServiceImpl extends StringIdBaseServiceImpl<Prov>implements ProvService {

	private static final String PUSH_TYPE = "pushType";

	@Autowired
	private SqlDao sqlDao;


	@Autowired
	public void setBaseDao(ProvDao dao) {
		super.setBaseDao(dao);
	}
}