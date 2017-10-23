package com.huitian.po.indent;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.huitian.po.base.StringIdPo;
@Entity
@Table(name = "HT_WORDBLANKTYPE")
public class WordblankType extends StringIdPo{
@Column(name = "WORDBLANKNAME", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
private String wordblankName;
@Column(name = "WORDBLANKCODE", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
private String wordblankCode;
public String getWordblankName() {
	return wordblankName;
}
public void setWordblankName(String wordblankName) {
	this.wordblankName = wordblankName;
}
public String getWordblankCode() {
	return wordblankCode;
}
public void setWordblankCode(String wordblankCode) {
	this.wordblankCode = wordblankCode;
}

}
