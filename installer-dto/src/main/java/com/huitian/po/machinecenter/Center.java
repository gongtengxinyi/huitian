package com.huitian.po.machinecenter;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.huitian.po.base.StringIdPo;
@Entity
@Table(name = "HT_CENTER")
public class Center extends StringIdPo {
	/**
	 * city	varchar(20)	否		所属城市
name1	varchar(20)	否		名称
workDate	date	否		营业时间
maopiType	varchar(20)	否		支持毛坯类型
maxZhuanshu	int(32)	否		最大转数
maxDepth	double	否		最大加工深度
maopiNum	int(32)	否		毛坯库存量
	 */
	@Column(name = "NAME1", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String name1;// 城市名字
	@Column(name = "CITY_NAME", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String cityname;// 城市名字
	@Column(name = "CITY_ID", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String cityId;// 城市名字
	@Column(name = "MAXDEPTH", precision = 11, scale = 3, columnDefinition = "DOUBLE(11, 3) DEFAULT 0")
	private double maxDepth;
	@Column(name = "MAOPINUM", columnDefinition = "INT DEFAULT 1")
	private int maopiNum;// picCount
	@Column(name = "REMARKS", length = 255, columnDefinition = "VARCHAR(255) DEFAULT ''")
	private String remarks;// 城市名字
	@Column(name = "MAXZHUANSHU", columnDefinition = "INT DEFAULT 1")
	private int maxZhuanshu;// picCoun
	   @Column(name = "WORK_DATE", columnDefinition = "DATETIME DEFAULT 19000101", nullable = true, updatable = false)
	    private Date workDate;
	   
	   
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getName1() {
		return name1;
	}
	public void setName1(String name1) {
		this.name1 = name1;
	}
	public String getCityId() {
		return cityId;
	}
	public void setCityId(String cityId) {
		this.cityId = cityId;
	}
	public String getCityname() {
		return cityname;
	}
	public void setCityname(String cityname) {
		this.cityname = cityname;
	}
	public double getMaxDepth() {
		return maxDepth;
	}
	public void setMaxDepth(double maxDepth) {
		this.maxDepth = maxDepth;
	}
	public int getMaopiNum() {
		return maopiNum;
	}
	public void setMaopiNum(int maopiNum) {
		this.maopiNum = maopiNum;
	}
	public int getMaxZhuanshu() {
		return maxZhuanshu;
	}
	public void setMaxZhuanshu(int maxZhuanshu) {
		this.maxZhuanshu = maxZhuanshu;
	}
	public Date getWorkDate() {
		return workDate;
	}
	public void setWorkDate(Date workDate) {
		this.workDate = workDate;
	}
	   
}
