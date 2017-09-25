package com.huitian.api.account.service.impl;

import com.huitian.api.account.service.CenterAccountService;
import com.huitian.api.fw.service.impl.StringIdBaseServiceImpl;
import com.huitian.po.account.CenterAccount;
import com.huitian.repo.account.dao.CenterAccountDao;
import com.huitian.repo.fw.dao.SqlDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(CenterAccountService.BEAN_NAME)
public class CenterAccountServiceImpl extends StringIdBaseServiceImpl<CenterAccount>implements CenterAccountService {


	@Autowired
	private SqlDao sqlDao;


	@Autowired
	public void setBaseDao(CenterAccountDao dao) {
		super.setBaseDao(dao);
	}

}