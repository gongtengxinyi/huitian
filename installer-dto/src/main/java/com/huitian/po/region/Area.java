package com.huitian.po.region;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.huitian.po.base.StringIdPo;

@Entity
@Table(name = "HT_AREA")
public class Area extends StringIdPo{
	//省份编码(HT_PROV的code1字段)
	@Column(name = "PROVCODE", length =32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String provCode;
	//编码
	@Column(name = "CODE1", length =20, columnDefinition = "VARCHAR(20) DEFAULT ''")
	private String code1;
	//	省份编码(HT_CITY的code1字段)
	@Column(name = "PROVCITY", length =32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String provCity;
	//名称
	@Column(name = "NAME1", length =20, columnDefinition = "VARCHAR(20) DEFAULT ''")
	private String name1;
	public String getProvCode() {
		return provCode;
	}
	public void setProvCode(String provCode) {
		this.provCode = provCode;
	}
	public String getCode1() {
		return code1;
	}
	public void setCode1(String code1) {
		this.code1 = code1;
	}
	public String getProvCity() {
		return provCity;
	}
	public void setProvCity(String provCity) {
		this.provCity = provCity;
	}
	public String getName1() {
		return name1;
	}
	public void setName1(String name1) {
		this.name1 = name1;
	}

	
}
