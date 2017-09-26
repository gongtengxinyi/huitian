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
@Table(name = "HT_INDENTPARAM")
public class IndentParam extends StringIdPo {

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
	private String alignType;// alignType
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

	public String getPicCount() {
		return picCount;
	}

	public void setPicCount(String picCount) {
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

}
