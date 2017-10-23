package com.huitian.repo.indent.dao.impl;

import org.springframework.stereotype.Repository;

import com.huitian.po.indent.Indent;
import com.huitian.repo.fw.dao.impl.StringIdBaseDaoImpl;
import com.huitian.repo.indent.dao.IndentDao;


@Repository(IndentDao.BEAN_NAME)
public class IndentDaoImpl extends StringIdBaseDaoImpl<Indent> implements IndentDao {

}
