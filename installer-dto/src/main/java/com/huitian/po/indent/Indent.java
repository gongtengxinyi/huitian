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
 * @author liurengjie
 *
 */

@Entity
@Table(name = "HT_INDENT")
public class Indent extends StringIdPo {
	@Column(name = "INDENTSTATUS", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String indentStatus;//订单的状态 未开始，加工中，已结束 待发货，已发货	
	@Column(name = "PAYSTATUS", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String payStatus;//结账状态
	@Column(name = "RECEIVERNAME", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String receiverName;
	@Column(name = "RECEIVERMOBILE", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String receiverMobile;
	@Column(name = "ADDRESSDETAIL", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String addressDetail;
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
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	


}
