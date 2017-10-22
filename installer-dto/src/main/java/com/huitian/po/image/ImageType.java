package com.huitian.po.image;

import com.huitian.po.base.StringIdPo;

public class ImageType extends StringIdPo{
	private String typeName;
	private String typeCode;
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
