package com.huitian.repo.account.dao.impl;

import com.huitian.po.account.CenterAccount;
import com.huitian.repo.account.dao.CenterAccountDao;
import com.huitian.repo.fw.dao.impl.StringIdBaseDaoImpl;
import org.springframework.stereotype.Repository;

/**
 * *Created by IntelliJ IDEA.
 * *User: 丁建磊
 * *create in 19:09 2017/9/24
 * *content:
 */
@Repository(CenterAccountDao.BEAN_NAME)
public class CenterAccountDaoImpl extends StringIdBaseDaoImpl<CenterAccount> implements CenterAccountDao {


}
