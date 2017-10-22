package com.huitian.api.machinecenter.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huitian.api.fw.service.impl.StringIdBaseServiceImpl;
import com.huitian.api.machinecenter.service.CenterService;
import com.huitian.po.machinecenter.Center;
import com.huitian.repo.fw.dao.SqlDao;
import com.huitian.repo.machinecenter.dao.CenterDao;

@Service(CenterService.BEAN_NAME)
public class CenterServiceImpl extends StringIdBaseServiceImpl<Center>implements CenterService {

	private static final String PUSH_TYPE = "pushType";

	@Autowired
	private SqlDao sqlDao;


	@Autowired
	public void setBaseDao(CenterDao dao) {
		super.setBaseDao(dao);
	}
}