package com.huitian.po.indent;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import org.hibernate.cache.ReadWriteCache.Item;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.huitian.api.fw.TransformField;
import com.huitian.po.base.StringIdPo;
import com.huitian.util.Dto;

/***
 * 订单信息表
 * 
 * @author dingjianlei
 *
 */

@Entity
@Table(name = "HT_INDENTPARAM")
public class IndentParam extends StringIdPo {
	@Column(name = "PICTYPEID", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String picTypeId;// 图案类别id
	
	@Column(name = "INDENTSTATUS", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String indentStatus;//订单的状态 未开始，加工中，已结束 待发货，已发货	
	@Column(name = "PAYSTATUS", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String payStatus;//结账状态
	@Column(name = "RECEIVERNAME", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String receiverName;
	@Column(name = "RECEIVERMOBILE", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String receiverMobile;
	@Column(name = "CENTERID", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String centerId;// 加工中心id
	

	@Column(name = "PAYMODE", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String payMode;//结账方式
	@Column(name = "WORDBLANKID", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String wordblankId;//毛坯的id
	
	@Column(name = "ADDRESSDETAIL", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String addressDetail;
	
	   @Column(name = "MACHINESTARTDATE", columnDefinition = "DATETIME DEFAULT 19000101", nullable = false, updatable = false)
	    private Date machineStartDate;//机器加工时间开始
	

	   @Column(name = "MACHINEENDDATE", columnDefinition = "DATETIME DEFAULT 19000101", nullable = false, updatable = false)
	    private Date machineEndDate;//加工结束时间
	   
	@Column(name = "PICTYPE", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String picType;// 图案类别
	@Column(name = "PICCODE", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String picCode;// 图案编码
	@Column(name = "WORDCONTENT", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String wordContent;// 文字内容
	@Column(name = "WORDSIZE", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String wordSize;
	@Column(name = "WORDFONT", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String wordFont;
	@Column(name = "ALIGNTYPE", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String alignType;// alignType对齐方式（枚举）
	@Column(name = "WORDLEANSIZE", precision = 11, scale = 3, columnDefinition = "DOUBLE(11, 3) DEFAULT 0")
	private double wordLeanSize;// 倾斜度
	@Column(name = "PICCOUNT", columnDefinition = "INT DEFAULT 1")
	private int picCount;// picCount
	@Column(name = "SPACESIZE", precision = 11, scale = 3, columnDefinition = "DOUBLE(11, 3) DEFAULT 0")
	private double spaceSize;// 图案间距
	@Column(name = "INDENTID", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String indentId;// 订单id
	
	
//	private double xLongToZero;//距离x轴距离1
//	private double yLongToZero;//距离y轴距离
//	private double zSpin;//z轴旋转
//	private double zoom;//放大倍数
	
	@Column(name = "XLONGTOZERO", precision = 11, scale = 3, columnDefinition = "DOUBLE(11, 3) DEFAULT 0")
	private double xLongToZero;// 倾斜度
	
	
	@Column(name = "YLONGTOZERO", precision = 11, scale = 3, columnDefinition = "DOUBLE(11, 3) DEFAULT 0")
	private double yLongToZero;// 倾斜度
	
	@Column(name = "ZSPAN", precision = 11, scale = 3, columnDefinition = "DOUBLE(11, 3) DEFAULT 0")
	private double zSpin;// 倾斜度
	
	@Column(name = "ZOOM", precision = 11, scale = 3, columnDefinition = "DOUBLE(11, 3) DEFAULT 0")
	private double zoom;// 倾斜度
	
	
	
	public double getxLongToZero() {
		return xLongToZero;
	}
	public void setxLongToZero(double xLongToZero) {
		this.xLongToZero = xLongToZero;
	}
	public double getyLongToZero() {
		return yLongToZero;
	}
	public void setyLongToZero(double yLongToZero) {
		this.yLongToZero = yLongToZero;
	}
	public double getzSpin() {
		return zSpin;
	}
	public void setzSpin(double zSpin) {
		this.zSpin = zSpin;
	}
	public double getZoom() {
		return zoom;
	}
	public void setZoom(double zoom) {
		this.zoom = zoom;
	}
	public String getPicTypeId() {
		return picTypeId;
	}
	public void setPicTypeId(String picTypeId) {
		this.picTypeId = picTypeId;
	}
	public String getIndentStatus() {
		return indentStatus;
	}
	public void setIndentStatus(String indentStatus) {
		this.indentStatus = indentStatus;
	}
	public String getPayStatus() {
		return payStatus;
	}
	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverMobile() {
		return receiverMobile;
	}
	public void setReceiverMobile(String receiverMobile) {
		this.receiverMobile = receiverMobile;
	}
	public String getCenterId() {
		return centerId;
	}
	public void setCenterId(String centerId) {
		this.centerId = centerId;
	}
	public String getPayMode() {
		return payMode;
	}
	public void setPayMode(String payMode) {
		this.payMode = payMode;
	}
	public String getWordblankId() {
		return wordblankId;
	}
	public void setWordblankId(String wordblankId) {
		this.wordblankId = wordblankId;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public Date getMachineStartDate() {
		return machineStartDate;
	}
	public void setMachineStartDate(Date machineStartDate) {
		this.machineStartDate = machineStartDate;
	}
	public Date getMachineEndDate() {
		return machineEndDate;
	}
	public void setMachineEndDate(Date machineEndDate) {
		this.machineEndDate = machineEndDate;
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
	public String getWordContent() {
		return wordContent;
	}
	public void setWordContent(String wordContent) {
		this.wordContent = wordContent;
	}
	public String getWordSize() {
		return wordSize;
	}
	public void setWordSize(String wordSize) {
		this.wordSize = wordSize;
	}
	public String getWordFont() {
		return wordFont;
	}
	public void setWordFont(String wordFont) {
		this.wordFont = wordFont;
	}
	public String getAlignType() {
		return alignType;
	}
	public void setAlignType(String alignType) {
		this.alignType = alignType;
	}
	public double getWordLeanSize() {
		return wordLeanSize;
	}
	public void setWordLeanSize(double wordLeanSize) {
		this.wordLeanSize = wordLeanSize;
	}
	
	public int getPicCount() {
		return picCount;
	}
	public void setPicCount(int picCount) {
		this.picCount = picCount;
	}
	public double getSpaceSize() {
		return spaceSize;
	}
	public void setSpaceSize(double spaceSize) {
		this.spaceSize = spaceSize;
	}
	public String getIndentId() {
		return indentId;
	}
	public void setIndentId(String indentId) {
		this.indentId = indentId;
	}

}
