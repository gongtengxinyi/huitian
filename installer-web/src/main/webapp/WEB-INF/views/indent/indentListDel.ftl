<#include "/include/common.ftl" />
<title>订单管理查询</title>
<#include "/include/common-list.ftl" />
<#include "/include/common-cityselect2.ftl" />
<script src="static/bootstrap/bootstrap.min.js"></script>
<link rel="stylesheet" href="static/css/bootstrap-select.min.css">

<script src="static/js/bootstrap-select.min.js"></script>
<script
        src="static/scripts/indent/indentListDel.js?randomId=<%=Math.random()%>"></script>
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
        <input type="hidden" id="sf.ifLeft" ng-model="sf.ifLeft"
               value="${sf.ifLeft}" ng-init="sf.ifLeft='${sf.ifLeft}'">
        <input type="hidden" id="sf.ifDel" ng-model="sf.ifDel"
               ng-init="sf.ifDel='YES'">
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
    </div>
</#if>


    <div class="row">

        <div class="col-md-6 pull-left">
		<button id="release" class="btn btn-warning"
                    ng-click="releaseIndent('DELETEALL')">
                <span class="glyphicon glyphicon-send">批量彻底删除</span>
         </button>
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
            <th  style="width: 230px;">订单ID+主号</th>




		<#if indentVerify=='true' || indentInsert=='true'>
            <th  style="width: 80px;">订单流水号</th>
		</#if>



            <!-- <th>订单流水号</th> -->
            <th style="width: 170px;">删除日期</th>
            <th style="width: 170px;">删除原因</th>



            <th style="width: 170px;">业主信息</th>
            <!-- 					<th style="width: 180px;">业主地址</th>  -->
                <!-- 					<#if		Session.USER_BEAN.adminRole!='ruzhu'> -->
            <!-- 					入驻商家显示甲方名称 -->
            <!-- 					<th>甲方名称</th>  -->

                <!-- 					</#if> -->

            <th style="width: 170px;">商家项目名称</th>
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


            <th style="width: 130px;">
                订单金钱明细

            </th>



			<#if indentCaiwu=='true'|| indentVerify=='true'>
                <th style="width: 80px;">状态</th>
			</#if>
            <th style="width: 190px;">抢单工人信息</th>

		</#if>
            <th style="width: 60px;">操作</th>

        </tr>
        </thead>
        <tbody ng-repeat="data in rows">
        <tr>
						<td><input type="checkbox" name="checkboxOne" id="one" ng-model="data.checked" ng-click="selectOne()"></td>

            <td>

                <div class="btn-group">


                    主号:	&nbsp;&nbsp;&nbsp;{{data.mainCode1}}<br>

                    订单ID:{{data.code1}}


            </td>

            <!-- 	<td>{{data.indentFlowWaterNum}}</td> -->
		<#if indentVerify=='true' || indentInsert=='true'>

            <td>	<span   ng-repeat="data1 in data.indentFlowCodeList">
					{{data1}}
					</span>
            </td>

		</#if>

            <td>
                删除日期：{{data.delDateString}}<br>
                删除人：{{data.delPerson}}

            </td>


            <td>
                {{data.delReason}}

            </td>




            <td>
                姓名:{{data.contactName}}<br>
			<#if indentAssign=='true'>
            <p>
                电话:<span ng-bind="data.contactMobile">
								 </span>
                </br>
			</#if>
                <span ng-bind="data.contactAddr"></span>
            </td>
            <input type="hidden" ng-init="sf.isAPI='${sf.isAPI}'" />

            <td >
			<#if
			Session.USER_BEAN.adminRole!='ruzhu'>
                <!-- 入驻商家显示甲方名称 -->
                商家:{{data.apartyName}}<br>

			</#if>
                项目:	{{data.itemName}}


            </td>
            <td ng-bind="data.serveTypeDisp"></td>


            <td>


                执行状态:{{data.executeStatusDisp}}<br>

                订单状态:{{data.statusDisp}}<br>
                订单类型:{{data.indentSourceDisp}}
            </td>

            <!-- 	<td>{{data.callDateString}}</td> -->
            <!-- 	<td>{{data.appointDateString}}</td> -->
		<#if Session.USER_BEAN.adminRole!='ruzhu'>
            <!-- 入驻商家不显示这几列 -->


            <td>

				<#if indentInsert=='true'		|| indentVerify =='true' || indentCaiwu=='true'>

                    应收金额:{{data.jiafangFee+data.tiaozhengFeeJiafang-data.deductFeeJiafang }} <br>

				</#if>
                工匠金额:	{{data.workerFee}}<br>
                经理人金额:{{data.managerFee}}<br>
				<#if indentVerify=='true' ||
				indentCaiwu=='true'>

                    应付金额:	{{data.actualPay+data.tiaozhengFeeWorker+data.tiaozhengFeeManager  }}

				</#if>


            </td>



			<#if indentCaiwu=='true' || indentVerify=='true'>
                <td>
					<span	style="font-family: Microsoft YaHei UI; font-size: 12px; color: red">
							{{data.incomeOver}} </span><br>
                    <span	style="font-family: Microsoft YaHei UI; font-size: 12px; color: green">
							{{data.payOver}}</span><br>
                    <!-- 收款标记状态 -->
                    <span	style="font-family: Microsoft YaHei UI; font-size: 12px; color: #E72DCB">
							{{data.incomeBillStatus}}</span><br>
                    <!-- 付款标记状态 -->
                    <span	style="font-family: Microsoft YaHei UI; font-size: 12px; color: blue">
							{{data.payBillStatus}}</span>
                </td>
			</#if>

            <td>

                工匠姓名: <span ng-if="data.executeStatus!='BEFORE'" ng-bind="data.workerName1">

					</span> <br>
				<#if	indentAssign=='true'>

                    工匠电话:<span ng-if="data.executeStatus!='BEFORE'" ng-bind="data.workerMobile"> </span><br>
				</#if>
                接单日期:<span ng-bind="data.serviceDateString"></span><br>
                签到日期:<span ng-bind="data.signDateString"></span>
            </td>
            <!-- tableA样式只针对 操作项
    <a class="btn btn-success btn-xs"><span
        class="glyphicon glyphicon-pause"></span>暂停</a>-->
		</#if>
            <!-- 入驻商家不显示这几列  end -->
            <td>
            <span><a
                    class="btn btn-success btn-xs"
                    ng-click="indentDeleteRestore(data.id)"> <span
                    class="glyphicon glyphicon-send"></span>&nbsp;恢复
            </a></span>
                <span><a
                        class="btn btn-warning btn-xs"
                        ng-click="indentDelete(data.id)"> <span
                        class="glyphicon glyphicon-trash"></span>&nbsp;彻底删除
            </a></span>
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