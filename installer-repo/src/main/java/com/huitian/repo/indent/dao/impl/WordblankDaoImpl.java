package com.huitian.repo.indent.dao.impl;

import org.springframework.stereotype.Repository;

import com.huitian.po.indent.Indent;
import com.huitian.po.indent.Wordblank;
import com.huitian.repo.fw.dao.impl.StringIdBaseDaoImpl;
import com.huitian.repo.indent.dao.IndentDao;
import com.huitian.repo.indent.dao.WordblankDao;


@Repository(WordblankDao.BEAN_NAME)
public class WordblankDaoImpl extends StringIdBaseDaoImpl<Wordblank> implements WordblankDao {

}
