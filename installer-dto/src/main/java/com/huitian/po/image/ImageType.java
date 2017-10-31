package com.huitian.po.image;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.huitian.po.base.StringIdPo;
@Entity
@Table(name = "HT_IMAGETYPE")
public class ImageType extends StringIdPo{
	/**
	 * 字段	类型	空	默认	注释
id	int(10)	否		类别ID
code1	varchar(20)	否		类别编码
name1	varchar(20)	是		类别名称
order	varchar(20)	否		排序序号
create_date	date	否		创建日期
	 */
	
	@Column(name = "TYPENAME", length = 45, columnDefinition = "VARCHAR(45) DEFAULT ''")
	private String typeName;
	@Column(name = "TYPECODE", length = 45, columnDefinition = "VARCHAR(45) DEFAULT ''")
	private String typeCode;
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}
	
}
