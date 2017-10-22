package com.huitian.po.image;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.huitian.po.base.StringIdPo;
@Entity
@Table(name = "HT_IMAGE")
public class Image extends StringIdPo{
	private String picType;// 图案类别
	private String picCode;// 图案编码
	private String imgName;//图片名字
	private String suffix;//图片后缀
	public String getPicType() {
		return picType;
	}
	public void setPicType(String picType) {
		this.picType = picType;
	}
	public String getPicCode() {
		return picCode;
	}
	public void setPicCode(String picCode) {
		this.picCode = picCode;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public String getSuffix() {
		return suffix;
	}
	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}
	
}
