package com.huitian.po.machinecenter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.huitian.po.base.StringIdPo;
@Entity
@Table(name = "HT_CENTER")
public class Center extends StringIdPo {
	@Column(name = "CITY_NAME", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String cityname;// 城市名字
	@Column(name = "CITY_ID", length = 50, columnDefinition = "VARCHAR(50) DEFAULT ''")
	private String cityId;// 城市id
	@Column(name = "NAME1", length = 50, columnDefinition = "VARCHAR(50) DEFAULT ''")
	private String name1;// 名称
	public String getCityname() {
		return cityname;
	}
	public void setCityname(String cityname) {
		this.cityname = cityname;
	}
	public String getCityId() {
		return cityId;
	}
	public void setCityId(String cityId) {
		this.cityId = cityId;
	}
	public String getName1() {
		return name1;
	}
	public void setName1(String name1) {
		this.name1 = name1;
	}
	
}
