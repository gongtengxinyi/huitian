package com.huitian.api.indent.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huitian.api.fw.service.impl.StringIdBaseServiceImpl;
import com.huitian.api.indent.service.IndentService;
import com.huitian.po.indent.Indent;
import com.huitian.po.indent.IndentParam;
import com.huitian.repo.fw.dao.SqlDao;
import com.huitian.repo.indent.dao.IndentDao;

@Service(IndentService.BEAN_NAME)
public class IndentServiceImpl extends StringIdBaseServiceImpl<Indent>implements IndentService {

	private static final String PUSH_TYPE = "pushType";

	@Autowired
	private SqlDao sqlDao;


	@Autowired
	public void setBaseDao(IndentDao dao) {
		super.setBaseDao(dao);
	}
}