package com.huitian.po.image;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.huitian.po.base.StringIdPo;
@Entity
@Table(name = "HT_IMAGETYPE")
public class ImageType extends StringIdPo{
	@Column(name = "TYPENAME", length = 45, columnDefinition = "VARCHAR(45) DEFAULT ''")
	private String typeName;
	@Column(name = "TYPECODE", length = 45, columnDefinition = "VARCHAR(45) DEFAULT ''")
	private String typeCode;
	@Column(name = "USE", length = 45, columnDefinition = "VARCHAR(45) DEFAULT ''")
	private String use;
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
	public String getUse() {
		return use;
	}
	public void setUse(String use) {
		this.use = use;
	}
	

}
