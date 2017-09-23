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
@Table(name = "ZL_INDENT", uniqueConstraints = @UniqueConstraint(columnNames = "CODE1") )
public class Indent extends StringIdPo {

	private static final long serialVersionUID = 1L;
	//订单是否确认取消
		@Column(name = "IF_CONFIRM_CANCEL", length = 10, columnDefinition = "VARCHAR(10) DEFAULT ''")
		private String ifConfirmCancel;
		
		
	public String getIfConfirmCancel() {
			return ifConfirmCancel;
		}

		public void setIfConfirmCancel(String ifConfirmCancel) {
			this.ifConfirmCancel = ifConfirmCancel;
		}

		// 订单流水号
		@Column(name = "INDENT_FLOW_WATER_NUM", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''", updatable = false)
		private String indentFlowWaterNum;
		
	public String getIndentFlowWaterNum() {
			return indentFlowWaterNum;
		}

		public void setIndentFlowWaterNum(String indentFlowWaterNum) {
			this.indentFlowWaterNum = indentFlowWaterNum;
		}

	// 订单CODE1
	@Column(name = "CODE1", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''", updatable = false)
	private String code1;

	// 指派时间
	@Column(name = "ASSIGN_DATE", columnDefinition = "DATETIME DEFAULT 19000101")
	private Date ASSIGN_DATE;
	//
	@Column(name = "ORIGINAL_CODE1", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String originalCode1;
	@Column(name = "MAIN_CODE1", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String mainCode1;
	@Column(name = "NEW_CODE1", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String newCode1;
	
	public String getMainCode1() {
		return mainCode1;
	}

	public void setMainCode1(String mainCode1) {
		this.mainCode1 = mainCode1;
	}

	/*@Transient
	private String newCode1;*/
	@Transient
	private String HasAuth; // 判定一个单子是不是直装用户单子，如果是，并且用户是管家用户的话，置HasAuth为false.(此属性用于设置一个管家用户对于一个单子是否有操作权限)

	public String getHasAuth() {
		return HasAuth;
	}

	public void setHasAuth(String hasAuth) {
		HasAuth = hasAuth;
	}
	@Column(name = "SOURCE", length = 20, columnDefinition = "VARCHAR(20) DEFAULT ''")
	private String source;

	@Transient
	private String sourceDisp;

	@Column(name = "INDENT_SOURCE", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String indentSource;

	@Transient
	private String indentSourceDisp;

	// 是否为指派单
	// @TransformField(groupCode = EnumCodes.YESNO)
	@Column(name = "INDENT_ASSIGN", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String indentAssign;

	@Transient
	private Boolean indentAssignSelected;

	// 所属甲方ID
	@Column(name = "APARTY_ID", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String apartyId;

	// 所属项目ID
	@Column(name = "ITEM_ID", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String itemId;

	// 接单工人 ID
	@Column(name = "WORKER_ID", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String workerId;

	// 接单工人名称
	@Transient
	private String workerName1;

	// 接单工人电话
	@Transient
	private String workerMobile;

	// 经理人 ID
	@Column(name = "MANAGER_ID", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String managerId;

	// 经理人名称
	@Transient
	private String managerName1;
	
	// 经理人电话
	@Transient
	private String managerMobile;

	// 总报价
	@Column(name = "SUM", precision = 11, scale = 3, columnDefinition = "DECIMAL(11, 3) DEFAULT 0")
	private BigDecimal sum;

	// 实际支付价
	@Column(name = "ACTUAL_PAY", precision = 11, scale = 3, columnDefinition = "DECIMAL(11, 3) DEFAULT 0")
	private BigDecimal actualPay;

	// 工人服务费
	@Column(name = "WORKER_FEE", precision = 11, scale = 3, columnDefinition = "DECIMAL(11, 3) DEFAULT 0")
	private BigDecimal workerFee;

	// 工人订单奖励
	@Column(name = "WORKER_AWARD", precision = 11, scale = 3, columnDefinition = "DECIMAL(11, 3) DEFAULT 0")
	private BigDecimal workerAward;

	// 经理人佣金
	@Column(name = "MANAGER_FEE", precision = 11, scale = 3, columnDefinition = "DECIMAL(11, 3) DEFAULT 0")
	private BigDecimal managerFee;

	// 经理人奖励
	@Column(name = "MANAGER_AWARD", precision = 11, scale = 3, columnDefinition = "DECIMAL(11, 3) DEFAULT 0")
	private BigDecimal managerAward;

	// 利润
	@Column(name = "PROFIT", precision = 11, scale = 3, columnDefinition = "DECIMAL(11, 3) DEFAULT 0")
	private BigDecimal profit;

	// 订单发布状态：
	// @TransformField(groupCode = EnumCodes.INDENT_RELEASE_STATUS)
	@Column(name = "RELEASE_STATUS", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String releaseStatus;

	@Transient
	private String releaseStatusDisp;

	// 订单发布时间
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "RELEASE_DATE", columnDefinition = "DATETIME DEFAULT 19000101")
	private Date releaseDate;

	@Column(name = "EXECUTE_STATUS", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String executeStatus;

	@Transient
	private String executeStatusDisp;

	// 订单的综合api状态
	@Transient
	private String indentShowStatus;

	// 订单的综合api状态描述
	@Transient
	private String indentShowStatusDisp;

	@Column(name = "STATUS", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String status;

	@Transient
	private String statusDisp;


	@Column(name = "EVALUATE_STATUS", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String evaluateStatus;

	@Transient
	private String evaluateStatusDisp;

	// 节点状态
	@Column(name = "PROG_STATUS", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String progStatus;

	// 评分
	@Column(name = "EVALUATE_SCORES", precision = 11, scale = 3, columnDefinition = "DOUBLE(11, 3) DEFAULT 0")
	private double evaluateScores;

	@Column(name = "EXCEP_STATUS", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String excepStatus;

	@Transient
	private String excepStatusDisp;

	// 登记日期
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CRT_DATE", columnDefinition = "DATETIME DEFAULT 19000101")
	private Date crtDate;

	// 服务时间
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "SERVICE_DATE", columnDefinition = "DATETIME DEFAULT 19000101")
	private Date serviceDate;

	// 订单服务时长
	@Column(name = "DURATION_TIME", length = 11, columnDefinition = "INT DEFAULT 0")
	private Integer durationTime;

	// 完工时间
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "FINISH_DATE", columnDefinition = "DATETIME DEFAULT NULL")
	private Date finishDate;

	// 评价时间
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "EVALUATE_DATE", columnDefinition = "DATETIME DEFAULT 19000101")
	private Date evaluateDate;

	// 预计完工时间
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "PLAN_DATE", columnDefinition = "DATETIME DEFAULT 19000101")
	private Date planDate;

	// 所在地区 - 省
	@Column(name = "REGION_PROV", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String regionProv;

	// 所在地区 - 市
	@Column(name = "REGION_CITY", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String regionCity;

	// 所在地区 - 区
	@Column(name = "REGION_DIST", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String regionDist;

	// 服务类型
	@Column(name = "SERVE_TYPE", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String serveType;

	@Transient
	private String serveTypeDisp;

	// 服务类别个数
	@Column(name = "SORT_COUNT", columnDefinition = "INT DEFAULT 0")
	private Integer sortCount;

	// 订单备注
	@Column(name = "COMMENT", length = 500, columnDefinition = "VARCHAR(500) DEFAULT ''")
	private String comment;

	// 付款结算
	// @TransformField(groupCode = EnumCodes.YESNO)
	@Column(name = "AP_SETTLEMENT", columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String apSettlement;

	// 收款结算
	// @TransformField(groupCode = EnumCodes.YESNO)
	@Column(name = "AR_SETTLEMENT", columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String arSettlement;

	// 录入人员Id
	@Column(name = "ADMIN_ID", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String adminId;

	// 录入人员名称
	@Column(name = "ADMIN_NAME1", length = 60, columnDefinition = "VARCHAR(60) DEFAULT ''")
	private String adminName1;

	// 接到单子日期
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "RECEIVE_DATE", columnDefinition = "DATETIME DEFAULT 19000101")
	private Date receiveDate;
	
	


	/*
	 * // 计划上门日期
	 * 
	 * @Temporal(TemporalType.TIMESTAMP)
	 * 
	 * @Column(name = "PLANDOOR_DATE", columnDefinition =
	 * "DATETIME DEFAULT 19000101") private Date planDoorDate;
	 */

	// 计划上门日期
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "PLANDOORDATE", columnDefinition = "DATETIME DEFAULT 19000101")
	private Date planDoorDate;
	private String planDoorDateString;

	// 实际上门日期
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "REALDOOR_DATE", columnDefinition = "DATETIME DEFAULT 19000101")
	private Date realDoorDate;

	// 备注
	@Column(name = "REMARKS", length = 500, columnDefinition = "VARCHAR(500) DEFAULT ''")
	private String remarks;

	// 工匠签到位置
	@Column(name = "SIGNADDRESS", length = 50, columnDefinition = "VARCHAR(50) DEFAULT ''")
	private String signAddress;

	// 工匠签到日期
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "SIGN_DATE", columnDefinition = "DATETIME DEFAULT 19000101")
	private Date signDate;

	// 工匠签到地址距离实际地址距离
	@Column(name = "SIGN_DISTANCE", precision = 11, scale = 3, columnDefinition = "DOUBLE(11, 3) DEFAULT 0")
	private double signDistance;

	// 是否联系过业主
	@Column(name = "IFCALL", length = 10, columnDefinition = "VARCHAR(10) DEFAULT ''")
	private String ifCall;

	// 工匠签到日期
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CALL_DATE", columnDefinition = "DATETIME DEFAULT NULL")
	private Date callDate;

	// 是否确认离开
	@Column(name = "IF_LEFT", length = 10, columnDefinition = "VARCHAR(10) DEFAULT 'NO'")
	private String ifLeft;

	// 确认离开日期
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "LEFT_DATE", columnDefinition = "DATETIME DEFAULT NULL")
	private Date leftDate;

	// 确认离开的备注
	@Column(name = "LEFT_REMARK", length = 500, columnDefinition = "VARCHAR(500) DEFAULT ''")
	private String leftRemark;

	// 确认离开操作人
	@Column(name = "LEFT_ADMIN", length = 50, columnDefinition = "VARCHAR(50) DEFAULT ''")
	private String leftAdmin;

	// 设计师电话
	@Column(name = "DESIGNER_MOBILE", length = 20, columnDefinition = "VARCHAR(20) DEFAULT ''")
	private String designerMobile;

	// 约定上门日期（工匠与业主约定的日期）
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "APPOINT_DATE", columnDefinition = "DATETIME DEFAULT NULL")
	private Date appointDate;

	// 工匠是否信息沟通过
	@Column(name = "WORKER_CONTACT", length = 10, columnDefinition = "VARCHAR(10) DEFAULT ''")
	private String workerContact;

	// 订单价格(当时天津钛马赫用，他们专用的饿一个字段)
	@Column(name = "INDENT_PRICE", precision = 11, scale = 3, columnDefinition = "DECIMAL(11, 3) DEFAULT 0")
	private BigDecimal indentPrice;

	// 工人服务费比例
	@Column(name = "WORKER_RATE", precision = 11, scale = 3, columnDefinition = "DECIMAL(11, 3) DEFAULT 0")
	private BigDecimal workerRate;

	// 工人服务费
	@Column(name = "MANAGER_RATE", precision = 11, scale = 3, columnDefinition = "DECIMAL(11, 3) DEFAULT 0")
	private BigDecimal managerRate;

	// 核销码
	@Column(name = "HEXIAOCODE", length = 4, columnDefinition = "VARCHAR(4) DEFAULT ''")
	private String hexiaoCode;

	// 核销日期
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "HEXIAO_DATE", columnDefinition = "DATETIME DEFAULT NULL")
	private Date hexiaoDate;

	// 指派类型，工匠或者合伙人
	@Column(name = "ASSIGN_TYPE", length = 10, columnDefinition = "VARCHAR(10) DEFAULT ''")
	private String assignType;

	@JsonProperty // 价格体系id
	@Column(name = "PRICENAME_ID", length = 32, columnDefinition = "VARCHAR(32) DEFAULT ''")
	private String priceNameId;

	@Transient
	private String assignedWorkerName;

	// 项目名称
	@Transient
	private String apartyName;

	// 是否上楼
	@Column(name = "IFGOFLOOR", length = 10, columnDefinition = "VARCHAR(13) DEFAULT 'NO'")
	private String ifGoFloor;

	// 是否拆分订单
	@Transient
	private String ifSplit;
	
	
	//是否确认提交（入驻商家录完单子后，确认提交到我们后台）
	@Column(name = "IF_COMMIT", length = 10, columnDefinition = "VARCHAR(13) DEFAULT 'NO'")
	private String ifCommit;
		
	//提交日期（入驻商家录完单子后，确认提交到我们后台）
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "COMMIT_DATE", columnDefinition = "DATETIME DEFAULT NULL")
	private Date commitDate;	
	
	// 业主是否在微信留言
	@Column(name = "IFSPEAK", length = 10, columnDefinition = "VARCHAR(13) DEFAULT 'NO'")
	private String ifSpeak;
	
	// 品类名称
	@Column(name = "SORTNAME", length = 200, columnDefinition = "VARCHAR(200) DEFAULT ''")
	private String sortName;
	
	// 甲方应付金额
	@Column(name = "JIAFANG_FEE", precision = 11, scale = 3, columnDefinition = "DECIMAL(11, 3) DEFAULT 0")
	private BigDecimal jiafangFee;
	// 应收金额
	@Column(name = "NEEDGAIN_FEE", precision = 11, scale = 3, columnDefinition = "DECIMAL(11, 3) DEFAULT 0")
	private BigDecimal needGainFee;
	
	// 实际收款金额
	@Column(name = "REALGAINFEE", precision = 11, scale = 3, columnDefinition = "DECIMAL(11, 3) DEFAULT 0")
	private BigDecimal realGainFee;	
	
	// 实际付款金额
	@Column(name = "REALPAY_FEE", precision = 11, scale = 3, columnDefinition = "DECIMAL(11, 3) DEFAULT 0")
	private BigDecimal realPayFee;	
	
	// 甲方扣款金额
	@Column(name = "DEDUCT_FEE_JIAFANG", precision = 11, scale = 3, columnDefinition = "DECIMAL(11, 3) DEFAULT 0")
	private BigDecimal deductFeeJiafang;
	
	// 甲方调整金额
	@Column(name = "TIAOZHENG_FEE_JIAFANG", precision = 11, scale = 3, columnDefinition = "DECIMAL(11, 3) DEFAULT 0")
	private BigDecimal tiaozhengFeeJiafang;
	
	// 工匠调整金额
	@Column(name = "TIAOZHENG_FEE_WORKER", precision = 11, scale = 3, columnDefinition = "DECIMAL(11, 3) DEFAULT 0")
	private BigDecimal tiaozhengFeeWorker;
	
	// 合伙人调整金额
	@Column(name = "TIAOZHENG_FEE_MANAGER", precision = 11, scale = 3, columnDefinition = "DECIMAL(11, 3) DEFAULT 0")
	private BigDecimal tiaozhengFeeManager;
	
	//工长姓名
    @Column(name = "HEAD_NAME", length = 20, columnDefinition = "VARCHAR(20) DEFAULT ''")
    private String headName;
    
    //工长电话
    @Column(name = "HEAD_MOBILE", length = 20, columnDefinition = "VARCHAR(20) DEFAULT ''")
    private String headMobile;
    
  
    @Column(name = "TRANSFERPROGRESS", length = 20, columnDefinition = "VARCHAR(20) DEFAULT ''")
    private String transferProgress;
 	
 	//转单日期（接单员转核算）
 	@Temporal(TemporalType.TIMESTAMP)
 	@Column(name = "INSERT_TRANS_DATE", columnDefinition = "DATETIME DEFAULT NULL")
 	private Date insertTransDate;	
 	
 	//转单日期（核算员转拍单）
 	@Temporal(TemporalType.TIMESTAMP)
  	@Column(name = "VERIFY_TRANS_DATE", columnDefinition = "DATETIME DEFAULT NULL")
 	private Date verifyTransDate;
 	
 	//转单日期（核算员转拍单）
 	@Temporal(TemporalType.TIMESTAMP)
 	@Column(name = "ASSIGN_TRANS_DATE", columnDefinition = "DATETIME DEFAULT NULL")
 	 private Date assignTransDate;

 	@Transient
	private String transferProgressDisp;
 	
 	//甲方订单号
    @Column(name = "CODE_JIAFANG", length = 20, columnDefinition = "VARCHAR(20) DEFAULT ''")
    private String codeJiafang;
    

	// 是否秘密派发
	@Column(name = "IFSECRETASSIGN", length = 10, columnDefinition = "VARCHAR(10) DEFAULT 'NO'")
	private String ifSecretAssign;
			
	@Transient
	private String createDateString;
	
	// 安装总结(管家端修改后的)
	@Column(name = "REPORT_CONTENT", length = 300, columnDefinition = "VARCHAR(300) DEFAULT ''")
	private String reportContent;
	
	@Column(name = "INDENT_TYPE_JIAFANG", length = 10, columnDefinition = "VARCHAR(10) DEFAULT ''")
	private String indentTypeJiafang;
	
	@Transient
	private String indentTypeJiafangDisp;
	
	

	

	public String getIndentTypeJiafang() {
		return indentTypeJiafang;
	}

	public void setIndentTypeJiafang(String indentTypeJiafang) {
		this.indentTypeJiafang = indentTypeJiafang;
	}

	public String getIndentTypeJiafangDisp() {
		return indentTypeJiafangDisp;
	}

	public void setIndentTypeJiafangDisp(String indentTypeJiafangDisp) {
		this.indentTypeJiafangDisp = indentTypeJiafangDisp;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public String getCreateDateString() {
		return createDateString;
	}

	public void setCreateDateString(String createDateString) {
		this.createDateString = createDateString;
	}

	public String getIfSecretAssign() {
				return ifSecretAssign;
	}

	public void setIfSecretAssign(String ifSecretAssign) {
				this.ifSecretAssign = ifSecretAssign;
	}
 	
    
    public String getCodeJiafang() {
		return codeJiafang;
	}

	public void setCodeJiafang(String codeJiafang) {
		this.codeJiafang = codeJiafang;
	}

	public Date getInsertTransDate() {
		return insertTransDate;
	}

	public void setInsertTransDate(Date insertTransDate) {
		this.insertTransDate = insertTransDate;
	}

	public Date getVerifyTransDate() {
		return verifyTransDate;
	}

	public void setVerifyTransDate(Date verifyTransDate) {
		this.verifyTransDate = verifyTransDate;
	}

	public Date getAssignTransDate() {
		return assignTransDate;
	}

	public void setAssignTransDate(Date assignTransDate) {
		this.assignTransDate = assignTransDate;
	}

	public String getTransferProgressDisp() {
		return transferProgressDisp;
	}

	public void setTransferProgressDisp(String transferProgressDisp) {
		this.transferProgressDisp = transferProgressDisp;
	}

	public String getTransferProgress() {
		return transferProgress;
	}

	public void setTransferProgress(String transferProgress) {
		this.transferProgress = transferProgress;
	}

	public String getHeadName() {
		return headName;
	}

	public void setHeadName(String headName) {
		this.headName = headName;
	}

	public String getHeadMobile() {
		return headMobile;
	}

	public void setHeadMobile(String headMobile) {
		this.headMobile = headMobile;
	}
	
	
	public BigDecimal getDeductFeeJiafang() {
		return deductFeeJiafang;
	}

	public void setDeductFeeJiafang(BigDecimal deductFeeJiafang) {
		this.deductFeeJiafang = deductFeeJiafang;
	}

	public BigDecimal getTiaozhengFeeJiafang() {
		return tiaozhengFeeJiafang;
	}

	public void setTiaozhengFeeJiafang(BigDecimal tiaozhengFeeJiafang) {
		this.tiaozhengFeeJiafang = tiaozhengFeeJiafang;
	}

	public BigDecimal getTiaozhengFeeWorker() {
		return tiaozhengFeeWorker;
	}

	public void setTiaozhengFeeWorker(BigDecimal tiaozhengFeeWorker) {
		this.tiaozhengFeeWorker = tiaozhengFeeWorker;
	}

	public BigDecimal getTiaozhengFeeManager() {
		return tiaozhengFeeManager;
	}

	public void setTiaozhengFeeManager(BigDecimal tiaozhengFeeManager) {
		this.tiaozhengFeeManager = tiaozhengFeeManager;
	}

	public BigDecimal getJiafangFee() {
		return jiafangFee;
	}

	public void setJiafangFee(BigDecimal jiafangFee) {
		this.jiafangFee = jiafangFee;
	}

	public BigDecimal getRealPayFee() {
		return realPayFee;
	}

	public void setRealPayFee(BigDecimal realPayFee) {
		this.realPayFee = realPayFee;
	}

	public BigDecimal getNeedGainFee() {
		return needGainFee;
	}

	public void setNeedGainFee(BigDecimal needGainFee) {
		this.needGainFee = needGainFee;
	}

	public BigDecimal getRealGainFee() {
		return realGainFee;
	}

	public void setRealGainFee(BigDecimal realGainFee) {
		this.realGainFee = realGainFee;
	}


	public String getIfSpeak() {
		return ifSpeak;
	}

	public String getSortName() {
		return sortName;
	}

	public void setSortName(String sortName) {
		this.sortName = sortName;
	}

	public String getManagerMobile() {
		return managerMobile;
	}

	public void setManagerMobile(String managerMobile) {
		this.managerMobile = managerMobile;
	}

	public void setIfSpeak(String ifSpeak) {
		this.ifSpeak = ifSpeak;
	}

	public Date getCommitDate() {
		return commitDate;
	}

	public void setCommitDate(Date commitDate) {
		this.commitDate = commitDate;
	}

	public String getIfCommit() {
		return ifCommit;
	}

	public void setIfCommit(String ifCommit) {
		this.ifCommit = ifCommit;
	}

	public String getIfSplit() {
		return ifSplit;
	}

	public void setIfSplit(String ifSplit) {
		this.ifSplit = ifSplit;
	}

	public String getIfGoFloor() {
		return ifGoFloor;
	}

	public void setIfGoFloor(String ifGoFloor) {
		this.ifGoFloor = ifGoFloor;
	}

	public String getLeftRemark() {
		return leftRemark;
	}

	public void setLeftRemark(String leftRemark) {
		this.leftRemark = leftRemark;
	}

	public String getLeftAdmin() {
		return leftAdmin;
	}

	public void setLeftAdmin(String leftAdmin) {
		this.leftAdmin = leftAdmin;
	}

	public String getApartyName() {
		return apartyName;
	}

	public void setApartyName(String apartyName) {
		this.apartyName = apartyName;
	}

	public String getAssignedWorkerName() {
		return assignedWorkerName;
	}

	public void setAssignedWorkerName(String assignedWorkerName) {
		this.assignedWorkerName = assignedWorkerName;
	}

	public String getPriceNameId() {
		return priceNameId;
	}

	public void setPriceNameId(String priceNameId) {
		this.priceNameId = priceNameId;
	}

	public String getAssignType() {
		return assignType;
	}

	public void setAssignType(String assignType) {
		this.assignType = assignType;
	}

	public Date getHexiaoDate() {
		return hexiaoDate;
	}

	public void setHexiaoDate(Date hexiaoDate) {
		this.hexiaoDate = hexiaoDate;
	}

	public String getHexiaoCode() {
		return hexiaoCode;
	}

	public void setHexiaoCode(String hexiaoCode) {
		this.hexiaoCode = hexiaoCode;
	}

	public BigDecimal getIndentPrice() {
		return indentPrice;
	}

	public void setIndentPrice(BigDecimal indentPrice) {
		this.indentPrice = indentPrice;
	}

	public BigDecimal getWorkerRate() {
		return workerRate;
	}

	public void setWorkerRate(BigDecimal workerRate) {
		this.workerRate = workerRate;
	}

	public BigDecimal getManagerRate() {
		return managerRate;
	}

	public void setManagerRate(BigDecimal managerRate) {
		this.managerRate = managerRate;
	}

	public String getWorkerContact() {
		return workerContact;
	}

	public void setWorkerContact(String workerContact) {
		this.workerContact = workerContact;
	}

	public Date getAppointDate() {
		return appointDate;
	}

	public void setAppointDate(Date appointDate) {
		this.appointDate = appointDate;
	}

	public Date getLeftDate() {
		return leftDate;
	}

	public void setLeftDate(Date leftDate) {
		this.leftDate = leftDate;
	}

	public String getIfLeft() {
		return ifLeft;
	}

	public void setIfLeft(String ifLeft) {
		this.ifLeft = ifLeft;
	}

	@Transient
	private String serviceDateString; // 服务时间

	@Transient
	private String signDateString; // 签到时间

	@Transient
	private String callDateString; // 工匠首次联系业主的电话日期

	@Transient
	private String appointDateString; // 工匠约定上门的日期

	public String getAppointDateString() {
		return appointDateString;
	}

	public void setAppointDateString(String appointDateString) {
		this.appointDateString = appointDateString;
	}

	public String getServiceDateString() {
		return serviceDateString;
	}

	public void setServiceDateString(String serviceDateString) {
		this.serviceDateString = serviceDateString;
	}

	public String getIfCall() {
		return ifCall;
	}

	public void setIfCall(String ifCall) {
		this.ifCall = ifCall;
	}

	public Date getCallDate() {
		return callDate;
	}

	public void setCallDate(Date callDate) {
		this.callDate = callDate;
	}

	public Date getSignDate() {
		return signDate;
	}

	public void setSignDistance(double signDistance) {
		this.signDistance = signDistance;
	}

	public double getSignDistance() {
		return signDistance;
	}

	public void setSignDate(Date signDate) {
		this.signDate = signDate;
	}

	public String getSignAddress() {
		return signAddress;
	}

	public void setSignAddress(String signAddress) {
		this.signAddress = signAddress;
	}

	public Date getASSIGN_DATE() {
		return ASSIGN_DATE;
	}

	public void setASSIGN_DATE(Date aSSIGN_DATE) {
		ASSIGN_DATE = aSSIGN_DATE;
	}

	public String getContactAddr() {
		return contactAddr;
	}

	public void setContactAddr(String contactAddr) {
		this.contactAddr = contactAddr;
	}

	@Transient
	private String contactAddr;
	@Transient
	private Item item;

	@Transient
	private Dto indentPriceDto;

	@Transient
	private Dto indentSortDto;
	@Transient
	private Map indentSortSplitDto;
	// 项目名称
	@Transient
	private String itemName;

	@Transient
	private String indentSort;// 用来记录订单的品类组合字符串

	// 业主名称
	@Transient
	private String contactName;

	@Column(name = "NEED_FOLLOW", length = 10, columnDefinition = "VARCHAR(10) DEFAULT ''")
	private String needFollow;// 订单是否有联系记录需要跟进

	

	public Map getIndentSortSplitDto() {
		return indentSortSplitDto;
	}

	public void setIndentSortSplitDto(Map indentSortSplitDto) {
		this.indentSortSplitDto = indentSortSplitDto;
	}

	public String getNeedFollow() {
		return needFollow;
	}

	public void setNeedFollow(String needFollow) {
		this.needFollow = needFollow;
	}

	public String getIndentSort() {
		return indentSort;
	}

	public void setIndentSort(String indentSort) {
		this.indentSort = indentSort;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	@Transient
	private List<String> indentIdList; // FJUJUAN ADD

	public List<String> getIndentIdList() {
		return indentIdList;
	}

	public void setIndentIdList(List<String> indentIdList) {
		this.indentIdList = indentIdList;
	}

	public Indent() {
		this.indentSource = DEF_STRING;
		this.sum = DEF_DECIMAL;
		this.actualPay = DEF_DECIMAL;
		this.profit = DEF_DECIMAL;
		this.apartyId = DEF_STRING;
		this.apSettlement = DEF_STRING;
		this.arSettlement = DEF_STRING;
		this.managerId = DEF_STRING;
		this.managerAward = DEF_DECIMAL;
		this.managerFee = DEF_DECIMAL;
		this.workerId = DEF_STRING;
		this.workerFee = DEF_DECIMAL;
		this.workerAward = DEF_DECIMAL;
		this.progStatus = DEF_STRING;
		this.sortCount = DEF_INTEGER;
		this.comment = DEF_STRING;
		this.releaseStatus = DEF_STRING;
		this.originalCode1 = DEF_STRING;
		this.indentAssign = DEF_STRING;

	}

	public String getCode1() {
		return code1;
	}

	public void setCode1(String code1) {
		this.code1 = code1;
	}

	public String getOriginalCode1() {
		return originalCode1;
	}

	public void setOriginalCode1(String originalCode1) {
		this.originalCode1 = originalCode1;
	}

	public String getNewCode1() {
		return newCode1;
	}

	public void setNewCode1(String newCode1) {
		this.newCode1 = newCode1;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getSourceDisp() {
		return sourceDisp;
	}

	public void setSourceDisp(String sourceDisp) {
		this.sourceDisp = sourceDisp;
	}

	public String getIndentSource() {
		return indentSource;
	}

	public void setIndentSource(String indentSource) {
		this.indentSource = indentSource;
	}

	public String getIndentSourceDisp() {
		return indentSourceDisp;
	}

	public void setIndentSourceDisp(String indentSourceDisp) {
		this.indentSourceDisp = indentSourceDisp;
	}

	public String getIndentAssign() {
		return indentAssign;
	}

	public void setIndentAssign(String indentAssign) {
		this.indentAssign = indentAssign;
	}

	public Boolean getIndentAssignSelected() {
		return indentAssignSelected;
	}

	public void setIndentAssignSelected(Boolean indentAssignSelected) {
		this.indentAssignSelected = indentAssignSelected;
	}

	public String getApartyId() {
		return apartyId;
	}

	public void setApartyId(String apartyId) {
		this.apartyId = apartyId;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getWorkerId() {
		return workerId;
	}

	public void setWorkerId(String workerId) {
		this.workerId = workerId;
	}

	public String getWorkerName1() {
		return workerName1;
	}

	public void setWorkerName1(String workerName1) {
		this.workerName1 = workerName1;
	}

	public String getWorkerMobile() {
		return workerMobile;
	}

	public void setWorkerMobile(String workerMobile) {
		this.workerMobile = workerMobile;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getManagerName1() {
		return managerName1;
	}

	public void setManagerName1(String managerName1) {
		this.managerName1 = managerName1;
	}

	public BigDecimal getSum() {
		return sum;
	}

	public void setSum(BigDecimal sum) {
		this.sum = sum;
	}

	public BigDecimal getActualPay() {
		return actualPay;
	}

	public void setActualPay(BigDecimal actualPay) {
		this.actualPay = actualPay;
	}

	public BigDecimal getWorkerFee() {
		return workerFee;
	}

	public void setWorkerFee(BigDecimal workerFee) {
		this.workerFee = workerFee;
	}

	public BigDecimal getWorkerAward() {
		return workerAward;
	}

	public void setWorkerAward(BigDecimal workerAward) {
		this.workerAward = workerAward;
	}

	public BigDecimal getManagerFee() {
		return managerFee;
	}

	public void setManagerFee(BigDecimal managerFee) {
		this.managerFee = managerFee;
	}

	public BigDecimal getManagerAward() {
		return managerAward;
	}

	public void setManagerAward(BigDecimal managerAward) {
		this.managerAward = managerAward;
	}

	public BigDecimal getProfit() {
		return profit;
	}

	public void setProfit(BigDecimal profit) {
		this.profit = profit;
	}



	public String getReleaseStatus() {
		return releaseStatus;
	}

	public String getReleaseStatusDisp() {
		return releaseStatusDisp;
	}

	public void setReleaseStatus(String releaseStatus) {
		this.releaseStatus = releaseStatus;
	}

	public void setReleaseStatusDisp(String releaseStatusDisp) {
		this.releaseStatusDisp = releaseStatusDisp;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getExecuteStatus() {
		return executeStatus;
	}

	public void setExecuteStatus(String executeStatus) {
		this.executeStatus = executeStatus;
	}

	public String getExecuteStatusDisp() {
		return executeStatusDisp;
	}

	public void setExecuteStatusDisp(String executeStatusDisp) {
		this.executeStatusDisp = executeStatusDisp;
	}

	public String getIndentShowStatus() {
		return indentShowStatus;
	}

	public void setIndentShowStatus(String indentShowStatus) {
		this.indentShowStatus = indentShowStatus;
	}

	public String getIndentShowStatusDisp() {
		return indentShowStatusDisp;
	}

	public void setIndentShowStatusDisp(String indentShowStatusDisp) {
		this.indentShowStatusDisp = indentShowStatusDisp;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatusDisp() {
		return statusDisp;
	}

	public void setStatusDisp(String statusDisp) {
		this.statusDisp = statusDisp;
	}

	public String getEvaluateStatus() {
		return evaluateStatus;
	}

	public void setEvaluateStatus(String evaluateStatus) {
		this.evaluateStatus = evaluateStatus;
	}

	public String getEvaluateStatusDisp() {
		return evaluateStatusDisp;
	}

	public void setEvaluateStatusDisp(String evaluateStatusDisp) {
		this.evaluateStatusDisp = evaluateStatusDisp;
	}

	public String getProgStatus() {
		return progStatus;
	}

	public void setProgStatus(String progStatus) {
		this.progStatus = progStatus;
	}

	public double getEvaluateScores() {
		return evaluateScores;
	}

	public void setEvaluateScores(double evaluateScores) {
		this.evaluateScores = evaluateScores;
	}

	public String getExcepStatus() {
		return excepStatus;
	}

	public void setExcepStatus(String excepStatus) {
		this.excepStatus = excepStatus;
	}

	public String getExcepStatusDisp() {
		return excepStatusDisp;
	}

	public void setExcepStatusDisp(String excepStatusDisp) {
		this.excepStatusDisp = excepStatusDisp;
	}

	public Date getCrtDate() {
		return crtDate;
	}

	public void setCrtDate(Date crtDate) {
		this.crtDate = crtDate;
	}

	public Date getServiceDate() {
		return serviceDate;
	}

	public void setServiceDate(Date serviceDate) {
		this.serviceDate = serviceDate;
	}

	public Integer getDurationTime() {
		return durationTime;
	}

	public void setDurationTime(Integer durationTime) {
		this.durationTime = durationTime;
	}

	public Date getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}

	public Date getEvaluateDate() {
		return evaluateDate;
	}

	public void setEvaluateDate(Date evaluateDate) {
		this.evaluateDate = evaluateDate;
	}

	public Date getPlanDate() {
		return planDate;
	}

	public void setPlanDate(Date planDate) {
		this.planDate = planDate;
	}

	public String getServeType() {
		return serveType;
	}

	public void setServeType(String serveType) {
		this.serveType = serveType;
	}

	public String getServeTypeDisp() {
		return serveTypeDisp;
	}

	public void setServeTypeDisp(String serveTypeDisp) {
		this.serveTypeDisp = serveTypeDisp;
	}

	public Integer getSortCount() {
		return sortCount;
	}

	public void setSortCount(Integer sortCount) {
		this.sortCount = sortCount;
	}

	public String getRegionProv() {
		return regionProv;
	}

	public String getRegionCity() {
		return regionCity;
	}

	public String getRegionDist() {
		return regionDist;
	}

	public void setRegionProv(String regionProv) {
		this.regionProv = regionProv;
	}

	public void setRegionCity(String regionCity) {
		this.regionCity = regionCity;
	}

	public void setRegionDist(String regionDist) {
		this.regionDist = regionDist;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getApSettlement() {
		return apSettlement;
	}

	public void setApSettlement(String apSettlement) {
		this.apSettlement = apSettlement;
	}

	public String getArSettlement() {
		return arSettlement;
	}

	public void setArSettlement(String arSettlement) {
		this.arSettlement = arSettlement;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminName1() {
		return adminName1;
	}

	public void setAdminName1(String adminName1) {
		this.adminName1 = adminName1;
	}

	

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	

	public Dto getIndentPriceDto() {
		return indentPriceDto;
	}

	public void setIndentPriceDto(Dto indentPriceDto) {
		this.indentPriceDto = indentPriceDto;
	}


	public Dto getIndentSortDto() {
		return indentSortDto;
	}

	public void setIndentSortDto(Dto indentSortDto) {
		this.indentSortDto = indentSortDto;
	}

	public Date getReceiveDate() {
		return receiveDate;
	}

	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}

	public Date getPlanDoorDate() {
		return planDoorDate;
	}

	public void setPlanDoorDate(Date planDoorDate) {
		this.planDoorDate = planDoorDate;
	}

	public Date getRealDoorDate() {
		return realDoorDate;
	}

	public void setRealDoorDate(Date realDoorDate) {
		this.realDoorDate = realDoorDate;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getSignDateString() {
		return signDateString;
	}

	public void setSignDateString(String signDateString) {
		this.signDateString = signDateString;
	}

	public String getCallDateString() {
		return callDateString;
	}

	public void setCallDateString(String callDateString) {
		this.callDateString = callDateString;
	}

	public String getDesignerMobile() {
		return designerMobile;
	}

	public void setDesignerMobile(String designerMobile) {
		this.designerMobile = designerMobile;
	}

	public String getPlanDoorDateString() {
		return planDoorDateString;
	}

	public void setPlanDoorDateString(String planDoorDateString) {
		this.planDoorDateString = planDoorDateString;
	}
	
	
}
