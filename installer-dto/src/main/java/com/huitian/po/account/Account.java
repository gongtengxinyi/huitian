package com.huitian.po.account;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.huitian.po.base.StringIdPo;
@Entity
@Table(name = "HT_ACCOUNT")
public class Account extends StringIdPo{
	@Column(name = "NAME1", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String name1;
	@Column(name = "MOBILE", length = 45, columnDefinition = "VARCHAR(45) DEFAULT ''")
	private String mobile;
	@Column(name = "ADDRESS", length = 125, columnDefinition = "VARCHAR(125) DEFAULT ''")
	private String address;
	@Column(name = "SEX", length = 45, columnDefinition = "VARCHAR(45) DEFAULT ''")
	private String sex;
	@Column(name = "AGE", length = 45, columnDefinition = "VARCHAR(45) DEFAULT ''")
	private String age;
	@Column(name = "COUNT", columnDefinition = "INT DEFAULT 0")
	private int count;//所有订单数量
	
	public String getName1() {
		return name1;
	}
	public void setName1(String name1) {
		this.name1 = name1;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	

}
