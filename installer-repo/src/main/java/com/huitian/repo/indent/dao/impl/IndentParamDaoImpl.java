package com.huitian.repo.indent.dao.impl;

import org.springframework.stereotype.Repository;

import com.huitian.po.indent.IndentParam;
import com.huitian.repo.fw.dao.impl.StringIdBaseDaoImpl;
import com.huitian.repo.indent.dao.IndentDao;
import com.huitian.repo.indent.dao.IndentParamDao;


@Repository(IndentParamDao.BEAN_NAME)
public class IndentParamDaoImpl extends StringIdBaseDaoImpl<IndentParam> implements IndentParamDao {

}
