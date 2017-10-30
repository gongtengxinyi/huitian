package com.huitian.po.region;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.huitian.po.base.StringIdPo;
@Entity
@Table(name = "HT_PROV")
public class Prov extends StringIdPo{
	//编码
	@Column(name = "CODE1", length =20, columnDefinition = "VARCHAR(20) DEFAULT ''")
	private String code1;
	
	//名称
	@Column(name = "NAME1", length =20, columnDefinition = "VARCHAR(20) DEFAULT ''")
	private String name1;

	public String getCode1() {
		return code1;
	}

	public void setCode1(String code1) {
		this.code1 = code1;
	}

	public String getName1() {
		return name1;
	}

	public void setName1(String name1) {
		this.name1 = name1;
	}
	
	
}
