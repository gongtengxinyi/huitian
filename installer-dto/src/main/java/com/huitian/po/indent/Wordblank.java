package com.huitian.po.indent;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.huitian.po.base.StringIdPo;
@Entity
@Table(name = "HT_WORDBLANK")
public class Wordblank extends StringIdPo{
@Column(name = "WORDBLANKTYPEID", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
private String wordblankTypeId;
@Column(name = "LENGTH", precision = 11, scale = 3, columnDefinition = "DOUBLE(11, 3) DEFAULT 0")
private double length;
@Column(name = "WIDTH", precision = 11, scale = 3, columnDefinition = "DOUBLE(11, 3) DEFAULT 0")
private double width;
@Column(name = "HEIGHT", precision = 11, scale = 3, columnDefinition = "DOUBLE(11, 3) DEFAULT 0")
private double height;
@Column(name = "PRICE", precision = 11, scale = 3, columnDefinition = "DOUBLE(11, 3) DEFAULT 0")
private double price;
@Column(name = "FROM", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
private String from;//Huoyuan
@Column(name = "USE", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
private String use;
public String getWordblankTypeId() {
	return wordblankTypeId;
}
public void setWordblankTypeId(String wordblankTypeId) {
	this.wordblankTypeId = wordblankTypeId;
}
public double getLength() {
	return length;
}
public void setLength(double length) {
	this.length = length;
}
public double getWidth() {
	return width;
}
public void setWidth(double width) {
	this.width = width;
}
public double getHeight() {
	return height;
}
public void setHeight(double height) {
	this.height = height;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
public String getFrom() {
	return from;
}
public void setFrom(String from) {
	this.from = from;
}
public String getUse() {
	return use;
}
public void setUse(String use) {
	this.use = use;
}

}
