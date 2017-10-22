package com.huitian.api.indent.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huitian.api.fw.service.impl.StringIdBaseServiceImpl;
import com.huitian.api.indent.service.IndentDtoService;
import com.huitian.po.indent.IndentDto;
import com.huitian.repo.fw.dao.SqlDao;
import com.huitian.repo.indent.dao.IndentDtoDao;

@Service(IndentDtoService.BEAN_NAME)
public class IndentDtoServiceImpl extends StringIdBaseServiceImpl<IndentDto>implements IndentDtoService {

	private static final String PUSH_TYPE = "pushType";

	@Autowired
	private SqlDao sqlDao;


	@Autowired
	public void setBaseDao(IndentDtoDao dao) {
		super.setBaseDao(dao);
	}
}