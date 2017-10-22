package com.huitian.repo.indent.dao.impl;

import org.springframework.stereotype.Repository;

import com.huitian.po.indent.IndentDto;
import com.huitian.repo.fw.dao.impl.StringIdBaseDaoImpl;
import com.huitian.repo.indent.dao.IndentDtoDao;


@Repository(IndentDtoDao.BEAN_NAME)
public class IndentDtoDaoImpl extends StringIdBaseDaoImpl<IndentDto> implements IndentDtoDao {

}
