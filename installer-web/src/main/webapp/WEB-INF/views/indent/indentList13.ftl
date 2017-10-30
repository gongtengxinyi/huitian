 <#include "/include/common.ftl" />
<title>订单管理查询</title>
<#include "/include/common-list.ftl" />
<#include "/include/common-cityselect2.ftl" />
<script src="static/bootstrap/bootstrap.min.js"></script>
<link rel="stylesheet" href="static/css/bootstrap-select.min.css">

<script src="static/js/bootstrap-select.min.js"></script>
<script
	src="static/scripts/indent/indentList13.js?randomId=<%=Math.random()%>"></script>
</head>
<body
	ng-init="itemId='${itemId}'; mark='${mark}';noScrab='${noScrab}'; status='${status}';progress='${progress}';ifLeft='${ifLeft}'">
	<#include "/include/body-begin.ftl" />
	<div ng-controller="IndentListController">
		<p>
		<p align="right">
			<a href="javascript:;" id="toggle_keleyi_com" target="_self">
				筛选面板收起&lt;&lt;</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</p>
		<script type="text/javascript">
      $(function() {
    	
        $("#toggle_kel" + "eyi_com").click(function() {
          $(this).text($("#content").is(":hidden") ? "筛选面板收起<<" : "筛选面板展开>>");
          $("#content").slideToggle();
        });
      });
    </script>

		<div class="panel panel-default form-horizontal" id="content"
			style="display: block;">
			<div class="panel-heading">订单管理查询</div>
			<input type="hidden" id="pageNo" value="${pageNo}"
				ng-init="pageNo='${pageNo}'"> <input type="hidden"
				id="sf.isAPI" ng-model="sf.isAPI" value="${sf.isAPI}"
				ng-init="sf.isAPI='${sf.isAPI}'">
			<!-- 用于存储点击页面顶部未抢单按钮时的查询条件 -->
			<input type="hidden" id="sf.ifLeft" ng-model="sf.ifLeft"
				value="${sf.ifLeft}" ng-init="sf.ifLeft='${sf.ifLeft}'">
			<!-- 用于存储点击页面顶部未抢单按钮时的查询条件 -->
			<input type="hidden" id="sf.overTime" ng-model="sf.overTime"
				value="${sf.overTime}" ng-init="sf.overTime='${sf.overTime}'">
			<!-- 用于存储点击页面顶部超时响应时的查询条件 -->
			<input type="hidden" id="sf.exceptionType"
				ng-model="sf.exceptionType" value="${sf.exceptionType}"
				ng-init="sf.exceptionType='${sf.exceptionType}'">
			<!-- 用于存储点击页面顶部未抢单按钮时的查询条件 -->
			<input type="hidden" id="sf.workerContact"
				ng-model="sf.workerContact" value="${sf.workerContact}"
				ng-init="sf.workerContact='${sf.workerContact}'">

			<input type="hidden" id="queryDateBegin"
				value="${(sf.queryDateBegin?string('yyyy-MM-dd'))!}"> <input
				type="hidden" id="queryDateEnd"
				value="${(sf.queryDateEnd?string('yyyy-MM-dd'))!}"> <input
				type="hidden" id="sf.paidanType" ng-model="sf.paidanType"
				value="${sf.paidanType}" ng-init="sf.paidanType='${sf.paidanType}'">
			<input type="hidden" id="sf.qaJiesuanProgress"
				ng-model="sf.qaJiesuanProgress" value="${sf.qaJiesuanProgress}"
				ng-init="sf.qaJiesuanProgress='${sf.qaJiesuanProgress}'">

			<!-- 用于存储点击页面顶部待核算按钮时的查询条件 -->
			<input type="hidden" id="sf.transferProgress"
				ng-model="sf.transferProgress" value="${sf.transferProgress}"
				ng-init="sf.transferProgress='${sf.transferProgress}'">
			<div class="panel-body">
				<div class="row">
					<div class="col-md-6 col-lg-3">
						<div class="form-group">
							<label class="control-label text-nowrap col-md-4">商家名称</label>
							<div class="col-md-8">
								<!-- ng-model="sf.aparty.name1" ng-keyup="autoQuery($event)" ng-init="sf.aparty.name1='${data.apartyIdDisp}'"> -->
								<input type="text" class="form-control" id="apartyIdDisp"
									ng-model="sf.aparty.name1" ng-keyup="autoQuery($event)"
									ng-init="sf.aparty.name1='${sf.aparty.name1}'">
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3">
						<div class="form-group">
							<label class="control-label text-nowrap col-md-4">项目名称</label>
							<div class="col-md-8">
								<input type="text" class="form-control" ng-model="sf.apartyPriceName.itemName"
									ng-keyup="autoQuery($event)"
									ng-init="sf.apartyPriceName.itemName='${sf.apartyPriceName.itemName}'">
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-3">
						<div class="form-group">
							<label class="control-label text-nowrap col-md-4">业主姓名</label>
							<div class="col-md-8">
								<input type="text" class="form-control"
									ng-model="sf.contact.name1" ng-keyup="autoQuery($event)"
									ng-init="sf.contact.name1='${sf.contact.name1}'">
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-3">
						<div class="form-group">
							<label class="control-label text-nowrap col-md-4">业主电话</label>
							<div class="col-md-8">
								<input type="text" class="form-control"
									ng-model="sf.contact.mobile" ng-keyup="autoQuery($event)"
									ng-init="sf.contact.mobile='${sf.contact.mobile}'">
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6 col-lg-3">
						<div class="form-group">
							<label class="control-label text-nowrap col-md-4">经理人</label>
							<div class="col-md-8">
								<input type="text" class="form-control"
									ng-model="sf.managerName1" ng-keyup="autoQuery($event)"
									ng-init="sf.managerName1='${sf.managerName1}'">
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-3">
						<div class="form-group">
							<label class="control-label text-nowrap col-md-4">接单工人</label>
							<div class="col-md-8">
								<input type="text" class="form-control"
									ng-model="sf.workerName1" ng-keyup="autoQuery($event)"
									ng-init="sf.workerName1='${sf.workerName1}'">
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3">
						<div class="form-group">
							<label class="control-label text-nowrap col-md-4">监理姓名</label>
							<div class="col-md-8">
								<input type="text" class="form-control"
									ng-model="sf.contact.supName1" ng-keyup="autoQuery($event)"
									ng-init="sf.contact.supName1='${sf.contact.supName1}'">
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3">
						<div class="form-group">
							<label class="control-label text-nowrap col-md-4">监理电话</label>
							<div class="col-md-8">
								<input type="text" class="form-control"
									ng-model="sf.contact.supMobile" ng-keyup="autoQuery($event)"
									ng-init="sf.contact.supMobile='${sf.contact.supMobile}'">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 col-lg-3">
						<#if status=='EXCEPTION' || status=='NORMAL'>
						<!--  如果是在页面上方点击的异常订单，那么就不ng-init -->
						<div class="form-group">
							<label class="control-label text-nowrap col-md-4">订单状态</label>
							<div class="col-md-8">
								<select id="sel" class="form-control" ng-change="query()"
									ng-model="sf.status"> <#list indentStatusList as item>
									<option value="${item.value}"<#if
										item.value=='${sf.status}'>selected="true"</#if> >${item.text}</option>
									</#list>
								</select>
							</div>
						</div>
					</div>
					<#else>
					<div class="form-group">
						<label class="control-label text-nowrap col-md-4">订单状态</label>
						<div class="col-md-8">
							<select id="sel" class="form-control" ng-change="query()"
								ng-init="sf.status='${sf.status}'" ng-model="sf.status">
								<#list indentStatusList as item>
								<option value="${item.value}"<#if
									item.value=='${sf.status}'>selected="true"</#if> >${item.text}</option>
								</#list>
							</select>
						</div>
					</div>
				</div>
				</#if>
				<div class="col-md-6 col-lg-3">
					<div class="form-group">
						<label class="control-label text-nowrap col-md-4">执行状态</label>
						<div class="col-md-8">
							<select id="sel" class="form-control" ng-change="query()"
								ng-init="sf.executeStatus='${sf.executeStatus}'"
								ng-model="sf.executeStatus"> <#list
								indentExecuteStatusList as item>
								<option value="${item.value}"<#if
									item.value=='${sf.executeStatus}'>selected="true"</#if>
									>${item.text}</option> </#list>
							</select>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="form-group">
						<label class="control-label text-nowrap col-md-4">服务类型</label>
						<div class="col-md-8">
							<select id="sel" class="form-control" ng-model="sf.serveType"
								ng-change="query()" ng-init="sf.serveType='${sf.serveType}'">
								<#list serveTypelist as item>
								<option value="${item.code1}"<#if
									item.code1=='${sf.serveType}'>selected="true"</#if>
									>${item.name1}</option> </#list>
							</select>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="form-group">
						<label class="control-label text-nowrap col-md-4">订单品类</label>
						<div class="col-md-8">
							<select id="indentType" ng-change="query()"
								ng-model="sf.indentType"
								ng-init="sf.indentType='${sf.indentType }'" class="form-control"
								multiple data-live-search="false" data-done-button="true">
								<#list indentTypeList as item>
									<option value="${item.value}"<#if
									item.value=='${sf.indentType}'>selected="true"</#if>
									>${item.text}</option>
								</#list>
							</select>
						</div>
					</div>
				</div>
			</div>


			<#if sf.releaseDateBegin??>
			<!-- 将日期放在隐藏域里，用来存储日期查询条件 -->
			<input type="hidden" id=releaseBegin
				value='${sf.releaseDateBegin?string('yyyy-MM-dd')}'> </#if>
			<#if sf.releaseDateEnd??>
			<!-- 将日期放在隐藏域里，用来存储日期查询条件 -->
			<input type="hidden" id=releaseEnd
				value='${sf.releaseDateEnd?string('yyyy-MM-dd')}'> </#if>
			<div class="row">
				<div class="col-md-6 col-lg-3">
					<div class="form-group">
						<label class="control-label text-nowrap col-md-4">异常状态</label>
						<div class="col-md-8">
							<select id="sel" class="form-control" ng-change="query()"
								ng-init="sf.excepStatus='${sf.excepStatus}'"
								ng-model="sf.excepStatus"> <#list indentExcepStatusList
								as item>
								<option value="${item.value}"<#if
									item.value=='${sf.excepStatus}'>selected="true"</#if>
									>${item.text}</option> </#list>
							</select>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="form-group">
						<label class="control-label text-nowrap col-md-4">评价状态</label>
						<div class="col-md-8">
							<select id="sel" class="form-control" ng-change="query()"
								ng-init="sf.evaluateStatus='${sf.evaluateStatus}'"
								ng-model="sf.evaluateStatus"> <#list
								indentEvaluateStatusList as item>
								<option value="${item.value}"<#if
									item.value=='${sf.evaluateStatus}'>selected="true"</#if>
									>${item.text}</option> </#list>
							</select>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="form-group">
						<label class="control-label text-nowrap col-md-4">订单类型</label>
						<div class="col-md-8">
							<select id="sel" class="form-control" ng-change="query()"
								ng-init="sf.indentSource='${sf.indentSource}'"
								ng-model="sf.indentSource"> <#list sourceList as item>
								<option value="${item.value}"<#if
									item.value=='${sf.indentSource}'>selected="true"</#if>
									>${item.text}</option> </#list>
							</select>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="form-group">
						<label class="control-label text-nowrap col-md-4">操作进度</label>
						<#if progress=='INVITEEVAL'>
						<!--  如果是在页面上方点击的待离开订单，那么就不ng-init -->
						<div class="col-md-8">
							<select id="sel" class="form-control" ng-change="query()"
								"
                  ng-model="sf.progress"> <#list
								scnodeList as item>
								<option value="${item.code1}"<#if
									item.value=='${sf.progress}'>selected="true"</#if>
									>${item.name1}</option> </#list>
							</select>
						</div>
						<#else>
						<div class="col-md-8">
							<select id="sel" class="form-control" ng-change="query()"
								ng-init="sf.progress='${sf.progress}'" ng-model="sf.progress">
								<#list scnodeList as item>
								<option value="${item.code1}"<#if
									item.value=='${sf.progress}'>selected="true"</#if>
									>${item.name1}</option> </#list>
							</select>
						</div>
						</#if>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3"col-lg-3">
					<div class="form-group">
						<label class="control-label text-nowrap col-md-4">业主地址</label>
						<div class="col-md-8">
							<input type="text" class="form-control"
								ng-model="sf.contact.detailAddr1" ng-keyup="autoQuery($event)"
								ng-init="sf.contact.detailAddr1='${sf.contact.detailAddr1}'">
						</div>
					</div>
				</div>
				<div class="col-md-3"col-lg-3">
					<div class="form-group">
						<label class="control-label text-nowrap col-md-4">发布状态</label>
						<div class="col-md-8">
							<select id="sel" class="form-control" ng-change="query()"
								ng-init="sf.releaseStatus='${sf.releaseStatus}'"
								ng-model="sf.releaseStatus"> <#list
								indentPushStatusList as item>
								<option value="${item.value}"<#if
									item.value=='${sf.releaseStatus}'>selected="true"</#if>
									>${item.text}</option> </#list>
							</select>
						</div>
					</div>
				</div>

				<div class="col-md-6"col-lg-3">
					<div class="form-group" cityselect2>
						<label class="control-label text-nowrap col-md-4 col-lg-2">服务地区</label>
						<div class="col-md-8 col-lg-10">
							<div class="row">
								<div class="col-md-4">
									<select class="form-control" name="regionProv"
										ng-change="query()" ng-init="sf.regionProv='${sf.regionProv}'"
										ng-model="sf.regionProv"
										ng-options="prov.v as prov.n for prov in provs">
									</select>
								</div>
								<div class="col-md-4" ng-hide="!cities">
									<select class="form-control" name="regionCity"
										ng-change="query()" ng-init="sf.regionCity='${sf.regionCity}'"
										ng-model="sf.regionCity"
										ng-options="city.v as city.n for city in cities">
									</select>
								</div>
								<div class="col-md-4" ng-hide="!dists">
									<select class="form-control" name="regionDist"
										ng-change="query()" ng-model="sf.regionDist"
										ng-init="sf.regionDist='${sf.regionDist}'"
										ng-options="dist.v as dist.n for dist in dists">
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="row">
				<!-- releaseDate begin -->
				<div class="col-md-6 col-lg-3">
					<div class="form-group">
						<label class="control-label text-nowrap col-md-4">订单主号</label>
						<div class="col-md-8">
							<input type="text" class="form-control" ng-model="sf.mainCode1"
								ng-keyup="autoQuery($event)"
								ng-init="sf.mainCode1='${sf.mainCode1}'">
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="form-group">
						<label class="control-label text-nowrap col-md-4">订单流水号</label>
						<div class="col-md-8">
							<input type="text" class="form-control"
								ng-model="sf.indentFlowWaterNum" ng-keyup="autoQuery($event)"
								ng-init="sf.indentFlowWaterNum='${sf.indentFlowWaterNum}'">
						</div>
					</div>
				</div>

				<!-- releaseDate end -->
				<div class="col-md-6 ">
					<div class="row">
						<#if Session.USER_BEAN.adminRole!='ruzhu' &&
						Session.USER_BEAN.adminRole!='zhizhufang'>
						<!-- 入驻商家不输入工匠比例这些项目 -->
						<div class="col-md-6 col-lg-6">
							<div class="form-group">
								<label class="control-label text-nowrap col-md-4">测试订单</label>
								<div class="col-md-2 ">
									<!-- <input type="checkbox" name="testIndent" id="testIndent" ng-click="query()" 
                    ng-model="sf.remarks" ng-init="sf.remarks='${sf.remarks}'"> -->

									<input type="checkbox" name="testIndent" id="testIndent"
										ng-click="query()" ng-model="sf.vIndent"
										ng-init="sf.vIndent='${sf.vIndent}'">
								</div>

								<label class="control-label text-nowrap col-md-4">线下订单</label>


								<div class="col-md-2">
									<!-- <input type="checkbox" name="testIndent" id="testIndent" ng-click="query()" 
                    ng-model="sf.remarks" ng-init="sf.remarks='${sf.remarks}'"> -->
									<input type="checkbox" name="ifOffline" id="ifOffline"
										ng-click="query()" ng-model="sf.ifOffline"
										ng-init="sf.ifOffline='${sf.ifOffline}'">
								</div>

							</div>

						</div>

						</#if>

						<div class="col-md-6 col-lg-6">
							<div class="form-group">
								<label class="control-label text-nowrap col-md-4">订单ID</label>
								<div class="col-md-8 ">
									<input type="text" class="form-control" ng-model="sf.code1"
										ng-keyup="autoQuery($event)" ng-init="sf.code1='${sf.code1}'">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>



			<div class="row">
				<div class="col-md-6 col-lg-3">
					<div class="form-group">
						<label class="control-label text-nowrap col-md-4">日期类型</label>
						<div class="col-md-8">
							<#if Session.USER_BEAN.indentRole=='indentCaiwu,'>
							<select id="sel" class="form-control" ng-change="query()"
							ng-init="sf.ifCaiwu='${indentCaiwu}'"
								ng-init="sf.dateType='${sf.dateType}'" ng-model="sf.dateType" ng-model="sf.ifCaiwu">
								<#list dateTypeList as item>
								<option value="${item.value}"<#if
									item.value=='${sf.dateType}' >selected="true"</#if>
									>${item.text}</option> </#list>
							</select>
							<#else>
							<select id="sel" class="form-control" ng-change="query()"
								ng-init="sf.dateType='${sf.dateType}'" ng-model="sf.dateType" ng-model="sf.dateType">
								<#list dateTypeList as item>
								<#if item.ifShow!='false'>
								<option value="${item.value}"<#if 
									item.value=='${sf.dateType}' >selected="true"</#if>
									>${item.text}</option> 
								</#if>
									</#list>
							</select>
							</#if>
						</div>
					</div>
				</div>
			
				<div class="col-md-6">
					<div class="row">

						<div class="col-md-8 col-lg-10">
							<div class="row">
								<div class="col-md-6">
									<p class="input-group">

										<input type="text" class="form-control" ng-change="query()"
											uib-datepicker-popup ng-model="sf.queryDateBegin"
											is-open="queryDateBegin.opened"
											datepicker-options="dateOptions" ng-required="true" /> <span
											class="input-group-btn">
											<button type="button" class="btn btn-default"
												ng-click="openQueryDateBegin()">
												<i class="glyphicon glyphicon-calendar"></i>
											</button>
										</span>
									</p>
								</div>
								<div class="col-md-6">
									<p class="input-group">
										<input type="text" class="form-control" ng-change="query()"
											uib-datepicker-popup ng-model="sf.queryDateEnd"
											is-open="queryDateEnd.opened"
											datepicker-options="dateOptions" ng-required="true" /> <span
											class="input-group-btn">
											<button type="button" class="btn btn-default"
												ng-click="openQueryDateEnd()">
												<i class="glyphicon glyphicon-calendar"></i>
											</button>
										</span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 甲方订单号查询条件 -->
				<div class="row">
					<div class="col-md-6 col-lg-3">
						<div class="form-group">
							<label class="control-label text-nowrap col-md-4">商家订单号</label>
							<div class="col-md-8">
								<input type="text" class="form-control"
									ng-model="sf.codeJiafang" ng-keyup="autoQuery($event)"
									ng-init="sf.codeJiafang='${sf.codeJiafang}'">
							</div>
						</div>
					</div>
				</div>


				<!-- 收付款状态 -->
				<#if (indentCaiwu=='true' || indentVerify=='true') >
				<div class="row">
					<div class="col-md-6 col-lg-3">
						<div class="form-group" style="padding-left: 20px;">
							<label class="control-label text-nowrap col-md-4">收付款状态</label>
							<div class="col-md-8">
								<select id="sel" class="form-control" ng-change="query()"
									ng-init="sf.payOrIncomeStatus='${sf.payOrIncomeStatus}'"
									ng-model="sf.payOrIncomeStatus">
									<option value="">--请选择--</option>
									<option value="payYes">已付款</option>
									<option value="payNo">未付款</option>
									<option value="incomeYes">已收款</option>
									<option value="incomeNo">未收款</option>
								</select>
							</div>
						</div>
					</div>
                    <div class="col-md-6 col-lg-3">
                        <div class="form-group" style="padding-left: 20px;">
                            <label class="control-label text-nowrap col-md-4">录入人</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control"
                                       ng-model="sf.createBy" ng-keyup="autoQuery($event)"
                                       ng-init="sf.createBy='${sf.createBy}'">
                            </div>
                        </div>
                    </div>
				</div>	
					</#if>


					<div class="row">

						<div class="col-md-6 pull-left">						
						
					
                           <#if indentAssign==true || Session.USER_BEAN.adminRole=='zhizhuang'>
							<button id="release" class="btn btn-warning"
								ng-click="pushIndentList()">
								<span class="glyphicon glyphicon-send">批量发布订单</span>
							</button>

						  </#if>
							<!-- 批量标记已收到流转表 -->
							<#if indentCaiwu==true || sf.isAPI=='RELEASE'>
							<button id="release" class="btn btn-warning"
								ng-click="releaseIndent('transfer')">
								<span class="glyphicon glyphicon-send">批量标记已收到流转表</span>
							</button>
						 </#if>

							<!-- 批量提交订单 -->
							<#if Session.USER_BEAN.adminRole=='ruzhu'>
							<button id="release" class="btn btn-warning"
								ng-click="releaseIndent()">
								<span class="glyphicon glyphicon-send">批量提交订单</span>
							</button>
							</#if> <#if
							sf.isAPI=='NOTINCOMEBILL'>
							<button id="release" class="btn btn-warning"
								ng-click="releaseIndent()">
								<span class="glyphicon glyphicon-send">批量标记应收账单</span>
							</button>
							 </#if> <#if
							sf.isAPI=='NOTPAYWORKERBILL' || sf.isAPI=='NOTPAYMANAGERBILL'>
							<button id="release" class="btn btn-warning"
								ng-click="releaseIndent()">
								<span class="glyphicon glyphicon-send">批量标记应付账单</span>
							</button>
							<input type="checkbox" id="selectAll1" name="selectAll1" ng-click="selectClick()">
							<label class="control-label text-nowrap ">全选</label> </#if> <#if
							sf.isAPI=='PAYWORKERBILL' || sf.isAPI=='PAYMANAGERBILL'>
							<button id="release" class="btn btn-warning"
								ng-click="releaseIndent()">
								<span class="glyphicon glyphicon-send">批量提报应付账单</span>
							</button>
						   </#if> <#if
							sf.isAPI=='INCOMEBILL'>
							<button id="release" class="btn btn-warning"
								ng-click="releaseIndent()">
								<span class="glyphicon glyphicon-send">批量提报应收账单</span>
							</button>
						   </#if> <#if
							sf.isAPI=='NOTINCOME'>
							<button id="release" class="btn btn-warning"
								ng-click="releaseIndent()">
								<span class="glyphicon glyphicon-send">批量标记已收款</span>
							</button>
						 </#if> <#if
							sf.isAPI=='NOTPAY' >
							<button id="release" class="btn btn-warning"
								ng-click="releaseIndent()">
								<span class="glyphicon glyphicon-send">批量标记已付款</span>
							</button>
						 </#if>
						 	<input type="checkbox" id="selectAll1" name="selectAll1" ng-click="selectClick()">
							<label class="control-label text-nowrap">全选</label>
						</div>

						<div class="col-md-3 pull-right">
							<button class="btn btn-primary pull-right" id="btnExport"
								ng-click="export()">
								<span class="glyphicon glyphicon-cloud-download"></span>&nbsp;筛选导出订单
							</button>
							<button id="search" class="btn btn-info pull-right"
								ng-click="query()">
								<span class="glyphicon glyphicon-search"></span>&nbsp;筛选
							</button>

							<!-- <button id="export" class="btn btn-info pull-right"
							ng-click="exportExcel()">
							<span class="glyphicon glyphicon-search"></span>&nbsp;导出
						</button> -->

						</div>


					</div>
				</div>


			</div>

		</div>


		<div class="panel panel-default" ng-cloak>
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th style="width: 20px;">&nbsp;</th>
						<th style="width: 230px;">订单ID+主号</th> <#if indentVerify=='true'
						|| indentInsert=='true'>
						<th style="width: 80px;">订单流水号</th> </#if>



						<!-- <th>订单流水号</th> -->
						<th style="width: 170px;">来单 计划上门日期</th>



						<th style="width: 170px;">业主信息</th>
						<!-- 					<th style="width: 180px;">业主地址</th>  -->
						<!-- 					<#if		Session.USER_BEAN.adminRole!='ruzhu'> -->
						<!-- 					入驻商家显示甲方名称 -->
						<!-- 					<th>甲方名称</th>  -->

						<!-- 					</#if> -->
 <#if Session.USER_BEAN.adminRole!='ruzhu'> <!-- 入驻商家不显示甲方名称 -->
						<th style="width: 170px;">商家名称</th>
 </#if>
						<th style="width: 140px;">订单类别</th>

						<!--  
					<th>执行状态</th>
					<th>订单状态</th>
					<th>订单类型</th>
					-->
						<th style="width: 130px;">订单信息</th>


						<!-- 					<th>接单日期</th> -->
						<!-- 	<th>联系日期</th>
					<th>上门日期</th> -->
						<#if Session.USER_BEAN.adminRole!='ruzhu'>
						<!-- 入驻商家不输入工匠比例这些项目 -->

						<!-- 					<th>签到日期</th> -->


						<th style="width: 130px;">订单金额明细</th> <#if indentCaiwu=='true'||
						indentVerify=='true'>
						<th style="width: 80px;">状态</th> </#if> </#if>
						<th style="width: 190px;">抢单工人信息</th>
						<th style="width: 60px;">操作</th>

					</tr>
				</thead>
				<tbody ng-repeat="data in rows">
					<tr>
						<td><input type="checkbox" name="checkboxOne" id="one" ng-model="data.checked" ng-click="selectOne()"></td>
						<td>

							<div class="btn-group">


								主号: &nbsp;&nbsp;&nbsp;{{data.mainCode1}}<br> 订单ID:<font
									ng-if="data.status == 'CANCEL'" color="red"> <a
									href="indent/indentView.do?indentId={{data.id}}&&pageNo={{pager.currentPage}}"
									ng-bind="data.code1"></a>


								</font> <font ng-if="data.status == 'EXCEPTION'" color="orange"><a
									href="indent/indentView.do?indentId={{data.id}}&&pageNo={{pager.currentPage}}"
									ng-bind="data.code1"></a></font> <font ng-if="data.status == 'OVER'"
									color="green"><a
									href="indent/indentView.do?indentId={{data.id}}&&pageNo={{pager.currentPage}}"
									ng-bind="data.code1"></a></font> <font ng-if="data.status == 'NORMAL'"><a
									href="indent/indentView.do?indentId={{data.id}}&&pageNo={{pager.currentPage}}"
									ng-bind="data.code1"></a></font><span>
									<button type="button" class="btn  dropdown-toggle btn-xs"
										data-toggle="dropdown" data-toggle="tooltip" title="点击显示操作项">
										<span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu">
									<#if Session.USER_BEAN.adminRole!='ruzhu'> <!--  入驻商家不能显示     -->
										<#if indentInsert=='true' || indentVerify =='true' ||
											indentCaiwu=='true'>
										<li><span ng-if="data.hasAuth == 'YES'"><a
												class="glyphicon glyphicon-print"
												href="reportIndent/createTransferGrid.do?indentId={{data.id}}">&nbsp;打印流转表</a></span></li>
										</#if>

										<li>
										<li><span
											ng-if="data.releaseStatus == 'UNRELEASED' && ${indentAssign}==true && data.hasAuth == 'YES' && data.transferProgress=='ASSIGN'"><a
												href="" class="glyphicon glyphicon-send"
												ng-click="pushIndent(data.id);">&nbsp;发布订单</a></span></li>
										<li><span
											ng-if="${indentRecall}==true && data.releaseStatus == 'RELEASED' && data.progStatus==''  && data.hasAuth == 'YES'"><a
												href="" class="glyphicon glyphicon-send"
												ng-click="recallIndent(data.id);">&nbsp;撤回发布</a></span></li>
										<li><span
											ng-if="data.ifLeft != 'YES' && data.progStatus == 'INVITEEVAL' && data.status == 'NORMAL' && ${indentLeft}==true && data.hasAuth == 'YES'"><a
												class="glyphicon glyphicon-ok" href=""
												ng-click="leftIndent(data.id);">&nbsp;确认离开</a></span></li></#if>
										<li><span
											ng-if="data.evaluateStatus == 'EVALUATED' && data.hasAuth == 'YES'"><a
												target="_blank" class="glyphicon glyphicon-eye-open"
												href="indentEvaluate/indentEvaluateMsg.do?indentId={{data.id}}&&pageNo={{pager.currentPage}}">&nbsp;查看评价</a></span></li>
										<li><span><a class="glyphicon glyphicon-eye-open"
												ng-if="${indentQA}==true && data.hasAuth == 'YES'"
												href="indent/indentView.do?type=PROGRESS&indentId={{data.id}}&&pageNo={{pager.currentPage}}">&nbsp;订单进程</a></span></li>

										<li><span><a class="glyphicon glyphicon-eye-open"
												ng-if="${indentQA}==true && data.hasAuth == 'YES'"
												href="fs/downloadZipAll.do?indentId={{data.id}}">&nbsp;一键导出照片</a></span></li>

										
										<#if Session.USER_BEAN.adminRole!='ruzhu'>
										<li><span
											ng-if="(data.executeStatus == 'CENTRE' || data.executeStatus == 'BEFORE') && ${finishIndentAuth}==true && data.hasAuth == 'YES'"><a
												class="glyphicon glyphicon-ok" href=""
												ng-click="finishIndent(data.id);">&nbsp;强制完成</a></span></li>
										<li>
										<span
											ng-if="data.executeStatus == 'AFTER' && data.status == 'OVER' && ${doSaveException}==true && data.hasAuth == 'YES'"><a
												class="glyphicon glyphicon-ok" href=""
												ng-click="recallOver(data.id);">&nbsp;撤销终止</a></span></li></#if> <#if
										Session.USER_BEAN.adminRole=='normal'> 
										
										<li><span
											ng-if="${indentAssign}==true && data.executeStatus != 'BEFORE' && ${workerChangeAuth}==true && data.hasAuth == 'YES'"><a
												class="glyphicon glyphicon-ok" href=""
												ng-click="changeWorker(data.id,data.regionCity);">&nbsp;更换工匠</a></span></li>
										</#if> <#if Session.USER_BEAN.adminRole=='zhizhuang'>
										<li><span
											ng-if="data.executeStatus == 'CENTRE' && ${workerChangeAuth}==true && data.hasAuth == 'YES'"><a
												class="glyphicon glyphicon-ok" href=""
												ng-click="changeWorker(data.id,data.regionCity);">&nbsp;更换工匠</a></span></li>
										</#if>

										<li><span><a
												ng-if="${contactAuth}==true && data.hasAuth == 'YES'"
												class="glyphicon glyphicon-plus" href=""
												ng-click="indentContact(data.id);">&nbsp;新增联系记录</a></span></li>

                                       <#if Session.USER_BEAN.adminRole!='ruzhu'> <!--  入驻商家不能显示     -->
										<li><span><a class="glyphicon glyphicon-eye-open"
												ng-if="data.hasAuth == 'YES'"
												href="indentAction/indentActionList.do?id={{data.id}}&&pageNo={{pager.currentPage}}">&nbsp;操作明细</a></span></li>
										
										<li><span><a class="glyphicon glyphicon-eye-open"
												ng-if="${indentQA}==true && data.hasAuth == 'YES'"
												href="indent/indentView.do?type=EXCEPTION&indentId={{data.id}}&&pageNo={{pager.currentPage}}">&nbsp;查看异常</a></span></li>
                                       
										<li><!-- <span
											ng-if="${indentAssign}==true && (data.ifGoodsArrive=='NO' || data.ifGoodsType=='') && data.transferProgress=='ASSIGN'  &&  data.executeStatus=='BEFORE' && data.hasAuth == 'YES'"><a
												href="" class="glyphicon glyphicon-exclamation-sign"
												ng-click="markGoodsArrive(data.id);">&nbsp;标记为已到货</a></span></li> -->
										<li><span
											ng-if="${indentAssign}==true  && data.transferProgress=='ASSIGN'  &&  data.executeStatus=='BEFORE' && data.hasAuth == 'YES'"><a
												href="" class="glyphicon glyphicon-exclamation-sign"
												ng-click="markIndent(data.id,'WAIT');">&nbsp;标记为等通知</a></span></li>
										<!-- <li><span
											ng-if="${indentAssign}==true && data.ifGoodsArrive=='YES' && data.transferProgress=='ASSIGN' &&  data.executeStatus=='BEFORE' && data.hasAuth == 'YES'"><a
												href="" class="glyphicon glyphicon-exclamation-sign"
												ng-click="markIndent(data.id,'CONFIRM');">&nbsp;标记为已确定上门日期</a></span></li> -->
										<li><span
											ng-if="data.status == 'OVER' && data.newCode1 == '' && ${doExtraIndentAdd}==true && data.hasAuth == 'YES'"><a
												href="" class="glyphicon glyphicon-plus"
												ng-click="extraIndent(data.id);">&nbsp;二次上门</a></span></li>
										<li><span
											ng-if="data.status == 'OVER' && data.newCode1 == '' && ${indentCancelSecond}==true  && data.hasAuth == 'YES'"><a
												href="" class="glyphicon glyphicon-remove"
												ng-click="cancelExtraIndent(data.id);">&nbsp;取消二次上门</a></span></li>
										<li><span
											ng-if="${resendCode}==true && data.workerId != '' &&  data.executeStatus=='CENTRE' && data.hasAuth == 'YES'"><a
												href="" class="glyphicon glyphicon-plus"
												ng-click="sendCode(data.id);">&nbsp;发送核销码</a></span></li>
										<li><span
											ng-if="${indentAssign}==true &&  data.executeStatus!='BEFORE' && data.hasAuth == 'YES'"><a
												href="" ng-click="changeDoorDate(data.id);"
												class="glyphicon glyphicon-exclamation-sign">&nbsp;修改计划上门日期</a></span></li>
										<li><span
											ng-if="${changeAddress}==true && data.executeStatus == 'CENTRE' && data.hasAuth == 'YES'"><a
												class="glyphicon glyphicon-ok" href=""
												ng-click="changeAddress(data.id);">&nbsp;修改业主信息</a></span></li>
									 </#if>
										<!--  <li><span
                  ng-if="data.executeStatus == 'CENTRE' && ${doSaveException}==true && data.hasAuth == 'YES'"><a
                    href="" class="glyphicon glyphicon-plus"
                    ng-click="indentExceptionAdd(data.id);">&nbsp;新增工匠反馈</a></span></li>
                     -->

										<#--<#if Session.USER_BEAN.apartyId==''>-->
										<!--  众联用户才开放记账功能 -->
										<li><span
                                                ng-if="${indentVerify}==true && data.hasAuth == 'YES' || Session.USER_BEAN.adminRole=='zhizhuang'"><a
                                                href="indent/indentCommitBill.do?indentId={{data.id}}&&pageNo={{pager.currentPage}}"
                                                class="glyphicon glyphicon-exclamation-sign">&nbsp;账单信息</a></span></li>
										<li><#if indentCaiwu==true || indentVerify==true> <span
											ng-if="data.hasAuth == 'YES' "><a
												href="indentTiaozheng/indentMoneyAddJiafang.do?indentId={{data.id}}&&pageNo={{pager.currentPage}}"
												class="glyphicon glyphicon-plus">&nbsp;商家调整记账</a></span> </#if>
										</li>

										<li><#if indentCaiwu==true || indentQA==true> <span
											ng-if="data.hasAuth == 'YES'  && data.executeStatus != 'BEFORE'"><a
												href="indentTiaozheng/indentMoneyAddWorker.do?indentId={{data.id}}&&pageNo={{pager.currentPage}}"
												class="glyphicon glyphicon-plus">&nbsp;工匠调整记账</a></span> </#if>
										</li>
										<li><span
											ng-if="${indentCaiwu}==true && data.hasAuth == 'YES'"><a
												href="" ng-click="incomeAndPay(data.id,'INCOME');"
												class="glyphicon glyphicon-plus">&nbsp;标记为已收款</a></span></li>


										<li><span
											ng-if="${indentCaiwu}==true && data.hasAuth == 'YES'"><a
												class="glyphicon glyphicon-ok" href=""
												ng-click="flowTable(data.id);">&nbsp;已收到流转表</a></span></li>

										<li><span
											ng-if="${indentCaiwu}==true && data.hasAuth == 'YES'"><a
												href="" ng-click="incomeAndPay(data.id,'PAY');"
												class="glyphicon glyphicon-exclamation-sign">&nbsp;标记为已付款</a></span></li>
										<li><span
											ng-if="${indentCaiwu}==true && data.hasAuth == 'YES'"><a
												href="indent/indentJournalIncomeAdd.do?indentId={{data.id}}&&pageNo={{pager.currentPage}}&&journalType=INCOME"
												class="glyphicon glyphicon-exclamation-sign">&nbsp;收款</a></span></li>
										<li><span
											ng-if="${indentCaiwu}==true && data.hasAuth == 'YES'"><a
												href="indent/indentJournalPayAdd.do?indentId={{data.id}}&&pageNo={{pager.currentPage}}&&journalType=PAY"
												class="glyphicon glyphicon-plus">&nbsp;付款</a></span></li>
 <#if Session.USER_BEAN.apartyId==''>
										<li><span
                                                ng-if="${indentQA}==true && data.hasAuth == 'YES'"><a
                                                href="" ng-click="hasCondition(data.id)"
                                                class="glyphicon glyphicon-exclamation-sign">&nbsp;台面已具备安装条件</a></span></li>
 </#if>
										<!-- 取消订单 -->
										<li><span
											ng-if="${indentInsert}==true &&  data.executeStatus=='BEFORE' && data.hasAuth == 'YES'"><a
												href="" ng-click="cancelIndent(data.id);"
												class="glyphicon glyphicon-remove">&nbsp;取消订单</a></span></li>

									

										<#--</#if>-->
										<li><#if Session.USER_BEAN.adminRole=='normal'> <!-- 管家用户，如果该订单允许操作，显示删除按钮 -->
											<span> <#if Session.USER_BEAN.isAdmin=='true'> <!-- 管理员允许删除 -->
												<a
												ng-if="${doDelAuth}==true && data.hasAuth == 'YES'  && data.executeStatus == 'BEFORE'"
												class="glyphicon glyphicon-trash" href=""
												ng-click="indentDelete(data.id);">&nbsp;删除</a> <#else> <!-- 不是管理员，如果是接单员并且订单处于接单中时，可以删除 -->
												<a
												ng-if="data.transferProgress=='INSERT' && ${doDelAuth}==true && data.hasAuth == 'YES'  && data.executeStatus == 'BEFORE'"
												class="glyphicon glyphicon-trash" href=""
												ng-click="indentDelete(data.id);">&nbsp;删除</a> </#if> <a
												ng-if="${doDelCenterAuth}==true && data.hasAuth == 'YES' && data.executeStatus != 'BEFORE'"
												class="glyphicon glyphicon-trash" href=""
												ng-click="indentDelete(data.id);">&nbsp;删除</a></span> </#if> <#if
											Session.USER_BEAN.adminRole=='zhizhuang'> <!-- 管家用户，如果该订单允许操作，显示删除按钮 -->
											<span> <a
												ng-if="${doDelAuth}==true && data.hasAuth == 'YES' "
												class="glyphicon glyphicon-trash" href=""
												ng-click="indentDelete(data.id);">&nbsp;删除</a></span> </#if> <#if
											Session.USER_BEAN.adminRole=='ruzhu'> <!-- 入驻商家如果已经提交订单，那么不再允许删除 -->
											<span><a ng-if="data.ifCommit!='YES'"
												class="glyphicon glyphicon-trash" href=""
												ng-click="indentDelete(data.id);">&nbsp;删除</a></span> </#if>

										</li>
									</ul>
								</span>

							</div>
						</td>

						<!-- 	<td>{{data.indentFlowWaterNum}}</td> -->
						<#if indentVerify=='true' || indentInsert=='true'>

						<td><span ng-repeat="data1 in data.indentFlowCodeList">
								{{data1}} </span></td> </#if>




						<td><#if indentInsert=="true">

							来单日期:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{data.receiveDate}}<br>
							</#if> 计划上门日期:{{data.planDoorDate}}

						</td>




						<td>姓名:<a
							href="indent/indentEditNoitem.do?id={{data.id}}&&pageNo={{pager.currentPage}}&&apartyId={{data.apartyId}}"
							ng-bind="data.contactName"> </a> <br> <#if
							indentAssign=='true'>
							<p>
								电话:<span ng-bind="data.contactMobile"> </span> </br> </#if> <span
									ng-bind="data.contactAddr"></span></td>
						<input type="hidden" ng-init="sf.isAPI='${sf.isAPI}'" />
					<#if Session.USER_BEAN.adminRole!='ruzhu'> <!-- 入驻商家不显示甲方名称 -->
						<td>
                            <span ng-if="data.indentTypeJiafang=='RUZHU'">入驻商家:</span>
                            <span ng-if="data.indentTypeJiafang!='RUZHU'">商家:</span>
							{{data.apartyName}}<br>  <span ng-if="data.itemName!=''"> 项目: {{data.itemName}} </span>
						</td>
					</#if>
                        <td ng-bind="data.serveTypeDisp"></td>


						<td>
							 <a
							href="indent/indentView.do?type=PROGRESS&indentId={{data.id}}&&pageNo={{pager.currentPage}}">

								执行状态:{{data.executeStatusDisp}}</a><br>

							订单状态:{{data.statusDisp}}<br> 订单类型:{{data.indentSourceDisp}}
						</td>

						<#if Session.USER_BEAN.adminRole!='ruzhu'>
						<!-- 入驻商家不显示这几列 -->
						<td><#if indentInsert=='true' || indentVerify =='true' ||
							indentCaiwu=='true' || Session.USER_BEAN.adminRole=='zhizhuang'>

							应收金额:{{data.jiafangFee+data.tiaozhengFeeJiafang-data.deductFeeJiafang
							}} <br> </#if>
							<#--<#if indentAssign=='true' ||indentInsert=='true' || indentQA=='true' || Session.USER_BEAN.isAdmin=='true' || Session.USER_BEAN.adminRole=='zhizhuang'>
									工匠金额: {{data.workerFee}}<br>
									经理人金额:{{data.managerFee}}<br>
							</#if> -->
							<#if 
							indentCaiwu=='true' || indentVerify =='true' || Session.USER_BEAN.adminRole=='zhizhuang'> 应付金额:
							{{data.actualPay+data.tiaozhengFeeWorker+data.tiaozhengFeeManager
							}}
                           <br> 实际支付金额:{{data.realPayFee}}<br> 
                           		实际收款金额:{{data.realGainFee}}<br> 
								质保金额:{{data.deposit}} 							</#if>


						</td>
						<#if indentCaiwu=='true' || indentVerify=='true'>
						<td><span
							style="font-family: Microsoft YaHei UI; font-size: 12px; color: red">
								{{ data.payOver}}
								 </span><br> <span
							style="font-family: Microsoft YaHei UI; font-size: 12px; color: green">
								{{data.incomeOver}}
								</span><br>
								 <!-- 收款标记状态 --> <span
							style="font-family: Microsoft YaHei UI; font-size: 12px; color: #E72DCB">
								{{data.incomeBillStatus}}</span><br>
								 <!-- 付款标记状态 --> <span
							style="font-family: Microsoft YaHei UI; font-size: 12px; color: blue">
								{{data.payBillStatus}}</span></td> </#if> </#if>
						<td>工匠姓名: <span
							ng-bind="data.workerName1"> </span> <br> <#--<#if
							indentAssign=='true'>--> 工匠电话:<span ng-bind="data.workerMobile">
						</span><br> <#--</#if> -->接单日期:<span ng-bind="data.serviceDateString"></span><br>
							签到日期:<span ng-bind="data.signDateString"></span>
						</td>

								 
						<!-- 入驻商家不显示这几列  end -->
						<td>
							
							
						 <#if Session.USER_BEAN.adminRole=='normal'> <span
							class="label label-warning"
							ng-if=" data.ifReturnRuZhu!='YES' && data.transferProgress!='' && data.executeStatus!='AFTER' && data.status!='CANCEL'">
								{{data.transferProgressDisp}} </span> 
								<span class="label label-warning" ng-if="data.progStatus =='' && data.ifReturnRuZhu=='YES' && data.executeStatus!='AFTER' && data.status!='CANCEL'">
								退回商家中</span> 
								<span class="label label-warning"
							ng-if="data.progStatus =='' && data.ifReturnRuZhu!='YES'&& data.transferProgress=='' && data.executeStatus!='AFTER'">
								接单中1 </span> <!--  <span   class="label label-warning" ng-if="data.progStatus !=''">
            {{data.progStatusDisp}}
          </span>  --> <br> <span
							ng-if="data.releaseStatus == 'UNRELEASED' && ${indentAssign}==true && data.hasAuth == 'YES' && data.transferProgress=='ASSIGN'"><a
								class="btn btn-success btn-xs" ng-click="pushIndent(data.id);">
									<span class="glyphicon glyphicon-send"></span>&nbsp;发布订单
							</a></span> <span
							ng-if="data.status == 'CANCEL' && ${indentAssign}==true && data.hasAuth == 'YES' && data.ifConfirmCancel!='YES'"><a
								class="btn btn-success btn-xs"
								ng-click="confirmCancelIndent(data.id)"> <span
									class="glyphicon glyphicon-ok-sign"></span>&nbsp;确认取消
							</a></span> <span
							ng-if="data.releaseStatus == 'UNRELEASED' && ${indentInsert}==true && data.hasAuth == 'YES' && (data.transferProgress=='INSERT' || data.transferProgress=='') && data.executeStatus!='AFTER'"><a
								class="btn btn-success btn-xs"
								ng-click="transferIndent(data.id,data.transferProgress);"> <span
									class="glyphicon glyphicon-send"></span>&nbsp;转核算员
							</a></span> <span
							ng-if="data.releaseStatus == 'UNRELEASED' && ${indentVerify}==true && data.hasAuth == 'YES' && data.transferProgress=='VERIFY' && data.executeStatus!='AFTER'"><a
								class="btn btn-success btn-xs"
								ng-click="transferIndent(data.id,data.transferProgress);"> <span
									class="glyphicon glyphicon-send"></span>&nbsp;转派单员
							</a></span> 
							</#if>
							
							<#if indentVerify=='true' || indentAssign=='true'> <span
							ng-if="data.transferProgress!='INSERT' && data.releaseStatus == 'UNRELEASED'&& data.hasAuth == 'YES'&& data.executeStatus!='AFTER'">
								<a class="btn btn-success btn-xs"
								ng-click="returnIndent(data.id);"> <span
									class="glyphicon glyphicon-send"></span>&nbsp;退回订单
							</a></span>
							</#if> 
							
							<#if indentInsert=='true'> <span

							ng-if="data.releaseStatus == 'UNRELEASED'&& data.transferProgress=='INSERT' && data.hasAuth == 'YES'&& data.executeStatus!='AFTER' && data.indentTypeJiafang=='RUZHU'">
								<a class="btn btn-success btn-xs"
								ng-click="returnMerchant(data.id);"> <span
									class="glyphicon glyphicon-send"></span>&nbsp;退回商家
							</a>
						</span> </#if> 
						
					
						<#if Session.USER_BEAN.adminRole=='zhizhuang'> <span
							ng-if="data.releaseStatus == 'UNRELEASED'  && data.hasAuth == 'YES' "><a
								class="btn btn-success btn-xs" ng-click="pushIndent(data.id);">
									<span class="glyphicon glyphicon-send"></span>&nbsp;发布订单
							</a></span> </#if> 
							
							<span
							ng-if="data.status == 'OVER' && data.newCode1 == '' && ${doExtraIndentAdd}==true && data.hasAuth == 'YES'"><a
								class="btn btn-success btn-xs" ng-click="extraIndent(data.id);"><span
									class="glyphicon glyphicon-plus"></span>&nbsp;二次上门</a></span> <!-- <span
						ng-if="data.originalCode1 != '' && data.hasAuth == 'YES'"><a ng-bind="data.originalCode1"
							href="indent/indentEdit.do?code1={{data.originalCode1}}&&pageNo={{pager.currentPage}}"></a></span> -->
							<!-- <span
            ng-if="data.status == 'EXCEPTION' && data.hasAuth == 'YES'"><a class="btn btn-warning btn-xs"
              href="indentExc/indentExcList.do?indentId={{data.id}}&&pageNo={{pager.currentPage}}"><span
                class="glyphicon glyphicon-eye-open"></span>&nbsp;查看异常</a></span> -->
							<span
							ng-if="${indentQA}==true && data.status == 'EXCEPTION' && data.hasAuth == 'YES'"><a
								class="btn btn-warning btn-xs"
								href="indent/indentView.do?type=EXCEPTION&indentId={{data.id}}&&pageNo={{pager.currentPage}}"><span
									class="glyphicon glyphicon-eye-open"></span>&nbsp;查看异常</a></span>
									
									 <#if
							Session.USER_BEAN.adminRole=='normal'> <span
							ng-if="${indentQA}==true && data.qaJiesuanProgress == '' && data.executeStatus == 'AFTER' && data.status != 'CANCEL' && data.hasAuth == 'YES'"><a
								class="btn btn-warning btn-xs" href=""
								ng-click='qaJiesuan(data.id)'><span
									class="glyphicon glyphicon-eye-open"></span>&nbsp;申请结算</a></span><span
							ng-if="${indentVerify}==true && data.qaJiesuanProgress=='VERIFY' && data.hasAuth == 'YES'"><a
								class="btn btn-warning btn-xs"
								href="indent/indentCommitBill.do?indentId={{data.id}}&&pageNo={{pager.currentPage}}"><span
									class="glyphicon glyphicon-exclamation-sign"></span>&nbsp;账单信息</a></span></#if>
							<span
							ng-if="data.evaluateStatus == 'EVALUATED' && data.hasAuth == 'YES'"><a
								target="_blank" class="btn btn-success btn-xs"
								href="indentEvaluate/indentEvaluateMsg.do?indentId={{data.id}}&&pageNo={{pager.currentPage}}">
									<span class="glyphicon glyphicon-eye-open"></span>&nbsp;查看评价
							</a></span>
							 <#if Session.USER_BEAN.adminRole=='ruzhu'> <!-- 入驻商家显示提交订单列 ,已经提交的订单不再显示此按钮-->
							<#-- <span class="label label-warning"
							    ng-if="data.progStatus ==''&& data.ifReturnRuZhu=='NO' && data.transferProgress=='INSERT' && data.executeStatus!='AFTER' && data.ifCommit=='YES'">接单中2
						    </span>-->
						    <span
							class="label label-warning"
							ng-if="data.ifCommit=='YES' && data.ifReturnRuZhu!='YES' && data.transferProgress!='' && data.executeStatus!='AFTER' && data.status!='CANCEL'">
								{{data.transferProgressDisp}} </span> 
							<span ng-if="data.ifCommit!='YES'"><a
								class="btn btn-success btn-xs" ng-click="commitIndent(data.id);">
									<span class="glyphicon glyphicon-send"></span>&nbsp;提交订单
							</a></span>
	
							<span class="label label-warning" ng-if="data.progStatus =='' && data.ifReturnRuZhu=='YES' && data.executeStatus!='AFTER' && data.status!='CANCEL'">
								平台退回</span> 
							</#if>
						</td>

					</tr>
				</tbody>
			</table>

			<div class="panel-footer">
				<!--  -->
				<#include "/include/pagination.ftl" />
			</div>
		</div>
	</div>

	<#include "/include/body-end.ftl" />

</body>
</html>