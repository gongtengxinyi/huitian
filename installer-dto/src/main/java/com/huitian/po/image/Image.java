package com.huitian.po.image;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.huitian.po.base.StringIdPo;
@Entity
@Table(name = "HT_IMAGE")
public class Image extends StringIdPo{
	/**
	 * id	int(32)	否		id
picType	varchar(20)	否		图案所属的类别code（其值为HT_PIC_TYPE表中的CODE1字段）
code1	varchar(20)	否		图案编码
name1	varchar(20)	否		图案名称
pic_url	varchar(255)	否		图案存放地址
order	varchar(20)	否		排序序号
create_date	date	否	0	创建日期
	 */
	@Column(name = "IMAGETYPEID", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String imageTypeId;//图形类别id
	@Column(name = "PICTYPE", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String picType;// 图案类别
	@Column(name = "PICCODE", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String picCode;// 图案编码
	@Column(name = "IMGNAME", length = 60, columnDefinition = "VARCHAR(80) DEFAULT ''")
	private String imgName;//图片名字
	@Column(name = "SUFFIX", length = 45, columnDefinition = "VARCHAR(45) DEFAULT ''")
	private String suffix;//图片后缀
	@Column(name = "IMGURL", length = 80, columnDefinition = "VARCHAR(80) DEFAULT ''")
	private String imgUrl;//图片url
	public String getImageTypeId() {
		return imageTypeId;
	}
	public void setImageTypeId(String imageTypeId) {
		this.imageTypeId = imageTypeId;
	}
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
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	
	
}
