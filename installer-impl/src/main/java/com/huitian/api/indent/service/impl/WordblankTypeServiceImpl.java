package com.huitian.api.indent.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huitian.api.fw.service.impl.StringIdBaseServiceImpl;
import com.huitian.api.indent.service.WordblankTypeService;
import com.huitian.po.indent.WordblankType;
import com.huitian.repo.fw.dao.SqlDao;
import com.huitian.repo.indent.dao.WordblankTypeDao;

@Service(WordblankTypeService.BEAN_NAME)
public class WordblankTypeServiceImpl extends StringIdBaseServiceImpl<WordblankType>implements WordblankTypeService {

	private static final String PUSH_TYPE = "pushType";

	@Autowired
	private SqlDao sqlDao;
	@Autowired
	public void setBaseDao(WordblankTypeDao dao) {
		super.setBaseDao(dao);
	}
}