package com.huitian.po.account;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.huitian.po.base.StringIdPo;

@Entity
@Table(name = "HT_CENTERACCOUNT")
public class CenterAccount extends StringIdPo {
	@Column(name = "CENTERID", length = 45, columnDefinition = "VARCHAR(45) DEFAULT ''")
	private String cennterId;// 用户属于哪一个加工中心（其值为HT_CENTER表中的id字段）
	@Column(name = "NAME1", length = 45, columnDefinition = "VARCHAR(45) DEFAULT ''")
	private String name1;// 登录用户名
	@Column(name = "PASSWORD", length = 45, columnDefinition = "VARCHAR(45) DEFAULT ''")
	private String password;// 登录密码
	@Column(name = "SYSTEMPUSH", length = 45, columnDefinition = "VARCHAR(45) DEFAULT 'NO'")
	private String systemPush;//是否是系统推送账号 
	
	public String getCennterId() {
		return cennterId;
	}

	public void setCennterId(String cennterId) {
		this.cennterId = cennterId;
	}

	public String getName1() {
		return name1;
	}

	public void setName1(String name1) {
		this.name1 = name1;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
