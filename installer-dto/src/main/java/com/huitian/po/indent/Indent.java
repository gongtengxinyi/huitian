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

	/**
	 * |id	           |varchar(32)       |否	|	 |	  id         |
|accountId       |varchar(32)   |是	|    |	 用户id(HT_ACCOUNT表中的id)	|
|productType       |varchar(20)   |是	|    |	 毛坯型号	|
|machineCenter       |varchar(20)   |是	|    |	 加工中心	|
|price         |decimal(11)   |是   |    |	 价格	 |
|payStatus         |varchar(20)   |是   |    |    付款状态     |
|payMode         |varchar(20)   |是   |    |    付款方式     |
|payDate         |varchar(20)   |是   |    |    付款时间    |
|status       |varchar(20)   |是   |    |    订单状态（正常，取消，退款等）    
|machineStatus       |varchar(20)   |是   |    |    加工状态（未开始，加工中，已结束）    
|deliverStatus       |varchar(20)   |是   |    |    发货状态（待发货，已发货）    
|machineStartDate   	|date         |是   |   |   加工开始时间  |
|machineEndDate   	|date         |是   |   |   加工结束时间  |
|addressProv         |varchar(20)   |是   |    |    收货地址省份     |
|addressCity         |varchar(20)   |是   |    |    收货地址城市    |
|addressArea        |varchar(20)   |是   |    |    收货地址区县  |
|addressDetail         |varchar(255)   |是   |    |    收货地址     |
|receiverName       |varchar(20)   |是   |    |    收货人姓名  |
|receiverMobile        |varchar(20)   |是   |    |    收货人电话  |
	 */
	
	
	@Column(name = "PICTYPE", length = 45, columnDefinition = "VARCHAR(45) DEFAULT ''")
	private String picType;// 图案类别
	@Column(name = "PICCODE", length = 45, columnDefinition = "VARCHAR(45) DEFAULT ''")
	private String picCode;// 图案编码
	@Column(name = "WORDCONTENT", length = 45, columnDefinition = "VARCHAR(45) DEFAULT ''")
	private String wordContent;// 文字内容
	@Column(name = "WORDSIZE", length = 45, columnDefinition = "VARCHAR(45) DEFAULT ''")
	private String wordSize;
	@Column(name = "WORDFONT", length = 45, columnDefinition = "VARCHAR(45) DEFAULT ''")
	private String wordFont;
	@Column(name = "ALIGNTYPE", length = 45, columnDefinition = "VARCHAR(45) DEFAULT ''")
	private String alignType;// alignType对齐方式（枚举）
	@Column(name = "WORDLEANSIZE", precision = 11, scale = 3, columnDefinition = "DOUBLE(11, 3) DEFAULT 0")
	private double wordLeanSize;// 倾斜度
	@Column(name = "PICCOUNT", columnDefinition = "INT DEFAULT 1")
	private String picCount;// picCount
	@Column(name = "SPACESIZE", precision = 11, scale = 3, columnDefinition = "DOUBLE(11, 3) DEFAULT 0")
	private double spaceSize;// 图案间距
	@Column(name = "INDENTID", length = 45, columnDefinition = "VARCHAR(45) DEFAULT ''")
	private String indentId;// 订单id
	@Column(name = "RECEIVERNAME", length = 45, columnDefinition = "VARCHAR(45) DEFAULT ''")
	private String receiverName;
	@Column(name = "RECEIVERMOBILE", length = 45, columnDefinition = "VARCHAR(45) DEFAULT ''")
	private String receiverMobile;


}
