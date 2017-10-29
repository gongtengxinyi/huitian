package com.huitian.repo.region.dao.impl;

import org.springframework.stereotype.Repository;

import com.huitian.po.region.City;
import com.huitian.repo.fw.dao.impl.StringIdBaseDaoImpl;
import com.huitian.repo.region.dao.CityDao;


@Repository(CityDao.BEAN_NAME)
public class CityDaoImpl extends StringIdBaseDaoImpl<City> implements CityDao {

}
