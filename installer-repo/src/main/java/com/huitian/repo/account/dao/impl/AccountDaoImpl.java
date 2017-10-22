package com.huitian.repo.account.dao.impl;

import org.springframework.stereotype.Repository;

import com.huitian.po.account.Account;
import com.huitian.repo.account.dao.AccountDao;
import com.huitian.repo.account.dao.CenterAccountDao;
import com.huitian.repo.fw.dao.impl.StringIdBaseDaoImpl;

/**
 * *Created by IntelliJ IDEA.
 * *User: 丁建磊
 * *create in 19:09 2017/9/24
 * *content:
 */
@Repository(AccountDao.BEAN_NAME)
public class AccountDaoImpl extends StringIdBaseDaoImpl<Account> implements AccountDao {


}
