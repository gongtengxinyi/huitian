package com.huitian.po.indent;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.huitian.po.base.StringIdPo;
@Entity
@Table(name = "HT_WORDBLANK")
public class Wordblank extends StringIdPo{
	/**
	 * name1	varchar(20)	否		毛坯名称
maopiWeight	double	否		克重
maopiWidth	double	否		宽度
material	varchar(20)	否		材质
maopiPrice	double	否	0	价格
	 */

@Column(name = "NAME1", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
private String name1;
@Column(name = "MAOPIWEIGHT", precision = 11, scale = 3, columnDefinition = "DOUBLE(11, 3) DEFAULT 0")
private double maopiWeight;
@Column(name = "MAOPIWIDTH", precision = 11, scale = 3, columnDefinition = "DOUBLE(11, 3) DEFAULT 0")
private double maopiWidth;
@Column(name = "MAOPIPRICE", precision = 11, scale = 3, columnDefinition = "DOUBLE(11, 3) DEFAULT 0")
private double maopiPrice;
@Column(name = "MATERIAL", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
private String material;//Huoyuan
@Column(name = "WORDBLANKURL", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
private String wordBlankUrl;//Huoyuan



public String getWordBlankUrl() {
	return wordBlankUrl;
}
public void setWordBlankUrl(String wordBlankUrl) {
	this.wordBlankUrl = wordBlankUrl;
}
public String getName1() {
	return name1;
}
public void setName1(String name1) {
	this.name1 = name1;
}
public double getMaopiWeight() {
	return maopiWeight;
}
public void setMaopiWeight(double maopiWeight) {
	this.maopiWeight = maopiWeight;
}
public double getMaopiWidth() {
	return maopiWidth;
}
public void setMaopiWidth(double maopiWidth) {
	this.maopiWidth = maopiWidth;
}
public double getMaopiPrice() {
	return maopiPrice;
}
public void setMaopiPrice(double maopiPrice) {
	this.maopiPrice = maopiPrice;
}
public String getMaterial() {
	return material;
}
public void setMaterial(String material) {
	this.material = material;
}

}
