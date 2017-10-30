package com.huitian.repo.region.dao.impl;

import org.springframework.stereotype.Repository;

import com.huitian.po.region.Prov;
import com.huitian.repo.fw.dao.impl.StringIdBaseDaoImpl;
import com.huitian.repo.region.dao.ProvDao;


@Repository(ProvDao.BEAN_NAME)
public class ProvDaoImpl extends StringIdBaseDaoImpl<Prov> implements ProvDao {

}
