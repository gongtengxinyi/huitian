package com.huitian.api.indent.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huitian.api.fw.service.impl.StringIdBaseServiceImpl;
import com.huitian.api.indent.service.WordblankService;
import com.huitian.po.indent.Wordblank;
import com.huitian.repo.fw.dao.SqlDao;
import com.huitian.repo.indent.dao.WordblankDao;

@Service(WordblankService.BEAN_NAME)
public class WordblankServiceImpl extends StringIdBaseServiceImpl<Wordblank>implements WordblankService {

	private static final String PUSH_TYPE = "pushType";

	@Autowired
	private SqlDao sqlDao;


	@Autowired
	public void setBaseDao(WordblankDao dao) {
		super.setBaseDao(dao);
	}
}