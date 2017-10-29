package com.huitian.repo.indent.dao.impl;

import org.springframework.stereotype.Repository;

import com.huitian.po.indent.Indent;
import com.huitian.po.indent.Wordblank;
import com.huitian.po.indent.WordblankType;
import com.huitian.repo.fw.dao.impl.StringIdBaseDaoImpl;
import com.huitian.repo.indent.dao.IndentDao;
import com.huitian.repo.indent.dao.WordblankDao;
import com.huitian.repo.indent.dao.WordblankTypeDao;


@Repository(WordblankTypeDao.BEAN_NAME)
public class WordblankTypeDaoImpl extends StringIdBaseDaoImpl<WordblankType> implements WordblankTypeDao {

}
