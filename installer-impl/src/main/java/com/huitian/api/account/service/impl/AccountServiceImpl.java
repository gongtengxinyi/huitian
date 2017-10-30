package com.huitian.api.account.service.impl;

import com.huitian.api.account.service.AccountService;
import com.huitian.api.account.service.CenterAccountService;
import com.huitian.api.fw.service.impl.StringIdBaseServiceImpl;
import com.huitian.po.account.Account;
import com.huitian.po.account.CenterAccount;
import com.huitian.repo.account.dao.AccountDao;
import com.huitian.repo.account.dao.CenterAccountDao;
import com.huitian.repo.fw.dao.SqlDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(AccountService.BEAN_NAME)
public class AccountServiceImpl extends StringIdBaseServiceImpl<Account>implements AccountService {


	@Autowired
	private SqlDao sqlDao;
	@Autowired
	public void setBaseDao(AccountDao dao) {
		super.setBaseDao(dao);
	}


}