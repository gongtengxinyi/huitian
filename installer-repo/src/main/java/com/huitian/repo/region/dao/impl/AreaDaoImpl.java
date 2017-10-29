package com.huitian.repo.region.dao.impl;

import org.springframework.stereotype.Repository;

import com.huitian.po.region.Area;
import com.huitian.repo.fw.dao.impl.StringIdBaseDaoImpl;
import com.huitian.repo.region.dao.AreaDao;


@Repository(AreaDao.BEAN_NAME)
public class AreaDaoImpl extends StringIdBaseDaoImpl<Area> implements AreaDao {

}
