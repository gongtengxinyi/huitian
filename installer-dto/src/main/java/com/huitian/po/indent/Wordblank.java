package com.huitian.po.indent;

import com.huitian.po.base.StringIdPo;

public class Wordblank extends StringIdPo{

private String wordblankTypeId;
private double length;
private double width;
private double height;
private double price;
private String from;//Huoyuan
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
