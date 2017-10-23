package com.huitian.repo.account.dao;

import com.huitian.po.account.Account;
import com.huitian.repo.fw.dao.StringIdBaseDao;

/**
 * *Created by IntelliJ IDEA.
 * *User: 丁建磊
 * *create in 19:17 2017/9/24
 * *content:
 */
public interface AccountDao extends StringIdBaseDao<Account> {
    String BEAN_NAME = "AccountDao";
}
