package com.huitian.repo.machinecenter.dao.impl;

import org.springframework.stereotype.Repository;

import com.huitian.po.indent.Indent;
import com.huitian.po.machinecenter.Center;
import com.huitian.repo.fw.dao.impl.StringIdBaseDaoImpl;
import com.huitian.repo.indent.dao.IndentDao;
import com.huitian.repo.machinecenter.dao.CenterDao;


@Repository(CenterDao.BEAN_NAME)
public class CenterDaoImpl extends StringIdBaseDaoImpl<Center> implements CenterDao {

}
