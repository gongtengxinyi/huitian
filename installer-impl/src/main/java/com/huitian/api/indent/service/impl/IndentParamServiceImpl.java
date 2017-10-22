package com.huitian.api.indent.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huitian.api.fw.service.impl.StringIdBaseServiceImpl;
import com.huitian.api.indent.service.IndentParamService;
import com.huitian.po.indent.IndentParam;
import com.huitian.repo.fw.dao.SqlDao;
import com.huitian.repo.indent.dao.IndentParamDao;

@Service(IndentParamService.BEAN_NAME)
public class IndentParamServiceImpl extends StringIdBaseServiceImpl<IndentParam>implements IndentParamService {

	private static final String PUSH_TYPE = "pushType";

	@Autowired
	private SqlDao sqlDao;


	@Autowired
	public void setBaseDao(IndentParamDao dao) {
		super.setBaseDao(dao);
	}
}