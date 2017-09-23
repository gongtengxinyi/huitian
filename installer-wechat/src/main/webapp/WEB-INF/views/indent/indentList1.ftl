 <#include "/include/common.ftl" />
<title>订单管理查询</title>
<#include "/include/common-list.ftl" /> <#include
"/include/common-cityselect2.ftl" />



<script src="static/bootstrap/bootstrap.min.js"></script>

<script src="static/scripts/indent/indentList1.js?randomId=<%=Math.random()%>"></script>
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
			style="display: yes;">
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
      <input type="hidden" id="sf.workerContact" ng-model="sf.workerContact"
        value="${sf.workerContact}" ng-init="sf.workerContact='${sf.workerContact}'">
			<!-- 用于存储点击页面顶部超时响应时的查询条件 -->
			<div class="panel-body">
				<div class="row">
					<div class="col-md-6 col-lg-3">
						<div class="form-group">
							<label class="control-label text-nowrap col-md-4">甲方名称</label>
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
								<input type="text" class="form-control" ng-model="sf.item.name1"
									ng-keyup="autoQuery($event)"
									ng-init="sf.item.name1='${sf.item.name1}'">
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
					<!-- comitDate begin -->
					<div class="col-md-6">
						<div class="row">
							<label class="control-label text-nowrap col-md-4 col-lg-2">提交日期</label>
							<div class="col-md-8 col-lg-10">
								<div class="row">
									<div class="col-md-6">
										<p class="input-group">
											<input type="text" class="form-control" uib-datepicker-popup
												ng-model="sf.comitDateBegin" is-open="comitDateBegin.opened"
												datepicker-options="dateOptions" ng-required="true"
												ng-keyup="autoQuery($event)"
												ng-init="sf.comitDateBegin='${sf.comitDateBegin}'" /> <span
												class="input-group-btn">
												<button type="button" class="btn btn-default"
													ng-click="openComitDateBegin()">
													<i class="glyphicon glyphicon-calendar"></i>
												</button>
											</span>
										</p>
									</div>
									<div class="col-md-6">
										<p class="input-group">
											<input type="text" class="form-control" uib-datepicker-popup
												ng-model="sf.comitDateEnd" is-open="comitDateEnd.opened"
												datepicker-options="dateOptions" ng-required="true"
												ng-keyup="autoQuery($event)"
												ng-init="sf.comitDateEnd='${sf.comitDateEnd}'" /> <span
												class="input-group-btn">
												<button type="button" class="btn btn-default"
													ng-click="openComitDateEnd()">
													<i class="glyphicon glyphicon-calendar"></i>
												</button>
											</span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- comitDate end -->

					<!-- gotDate begin -->
					<div class="col-md-6">
						<div class="row">
							<label class="control-label text-nowrap col-md-4 col-lg-2">项目周期</label>
							<div class="col-md-8 col-lg-10">
								<div class="row">
									<div class="col-md-6">
										<p class="input-group">
											<input type="text" class="form-control"
												ng-keyup="autoQuery($event)" uib-datepicker-popup
												ng-model="sf.gotDateBegin"
												ng-init="sf.gotDateBegin='${sf.gotDateBegin}'"
												is-open="gotDateBegin.opened"
												datepicker-options="dateOptions" ng-required="true" /> <span
												class="input-group-btn">
												<button type="button" class="btn btn-default"
													ng-click="openGotDateBegin()">
													<i class="glyphicon glyphicon-calendar"></i>
												</button>
											</span>
										</p>
									</div>
									<div class="col-md-6">
										<p class="input-group">
											<input type="text" class="form-control"
												ng-keyup="autoQuery($event)" uib-datepicker-popup
												ng-model="sf.gotDateEnd"
												ng-init="sf.gotDateEnd='${sf.gotDateEnd}'"
												is-open="gotDateEnd.opened" datepicker-options="dateOptions"
												ng-required="true" /> <span class="input-group-btn">
												<button type="button" class="btn btn-default"
													ng-click="openGotDateEnd()">
													<i class="glyphicon glyphicon-calendar"></i>
												</button>
											</span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- gotDate end -->
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
						<label class="control-label text-nowrap col-md-4">订单类别</label>
						<div class="col-md-8">
							<select id="sel" class="form-control" ng-change="query()"
								ng-init="sf.indentType='${sf.indentType}'"
								ng-model="sf.indentType"> <#list indentTypeList as
								item>
								<option value="${item.value}"<#if
									item.value=='${sf.indentType}'>selected="true"</#if>
									>${item.text}</option> </#list>
							</select>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<!-- releaseDate begin -->
				<div class="col-md-6">
					<div class="row">
						<label class="control-label text-nowrap col-md-4 col-lg-2">发布日期</label>
						<div class="col-md-8 col-lg-10">
							<div class="row">
								<div class="col-md-6">
									<p class="input-group">
										<input type="text" class="form-control" uib-datepicker-popup
											ng-model="sf.releaseDateBegin"
											ng-init="sf.releaseDateBegin='${sf.releaseDateBegin}'"
											is-open="releaseDateBegin.opened"
											datepicker-options="dateOptions" ng-required="true"
											ng-keyup="autoQuery($event)" /> <span
											class="input-group-btn">
											<button type="button" class="btn btn-default"
												ng-click="openReleaseDateBegin()">
												<i class="glyphicon glyphicon-calendar"></i>
											</button>
										</span>
									</p>
								</div>
								<div class="col-md-6">
									<p class="input-group">
										<input type="text" class="form-control" uib-datepicker-popup
											ng-model="sf.releaseDateEnd"
											ng-init="sf.releaseDateEnd='${sf.releaseDateEnd}'"
											is-open="releaseDateEnd.opened"
											datepicker-options="dateOptions" ng-required="true"
											ng-keyup="autoQuery($event)" /> <span
											class="input-group-btn">
											<button type="button" class="btn btn-default"
												ng-click="openReleaseDateEnd()">
												<i class="glyphicon glyphicon-calendar"></i>
											</button>
										</span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- releaseDate end -->
				<div class="col-md-6 ">
					<div class="row">
						<div class="col-md-6 col-lg-6">
							<div class="form-group">
								<label class="control-label text-nowrap col-md-4">测试订单</label>
								<div class="col-md-8 ">
									<input type="checkbox" name="testIndent" id="testIndent"
										ng-model="sf.remarks" ng-init="sf.remarks='${sf.remarks}'">
								</div>
							</div>
						</div>
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
						<label class="control-label text-nowrap col-md-4">上门次数</label>
						<div class="col-md-8">
							<select id="sel" class="form-control" ng-change="query()"
								ng-init="sf.source='${sf.source}'" ng-model="sf.source">
								<#list sourceList as item>
								<option value="${item.value}"<#if
									item.value=='${sf.source}'>selected="true"</#if> >${item.text}</option>
								</#list>
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
		<!--		<div class="col-md-3"col-lg-3">
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
				<div class="col-md-9"col-lg-3">
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
				</div> -->

       
         
				<div>
					<div class="col-md-3 pull-left">
						<button id="release" class="btn btn-warning" ng-show="release"
							ng-click="releaseIndent()">
							<span class="glyphicon glyphicon-send">发布订单</span>
						</button>
						<input type="checkbox" name="selectAll1" ng-show="selectAll"
							ng-click="selectClick()"> <label
							class="control-label text-nowrap " ng-show="text">全选</label>
					</div>

					<div class="col-md-3 pull-right">
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


	<div class="panel panel-default">
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th style="width: 20px;">&nbsp;</th>
					<th>订单ID</th>
					<th>业主姓名</th>
					<th>业主地址</th>
					<th>甲方名称</th>
					<th>项目名称</th>
					<th>订单类别</th>
					<th>执行状态</th>
					<th>订单状态</th>
					<th>接单日期</th>
				<!-- 	<th>联系日期</th>
					<th>上门日期</th> -->
					<th>签到日期</th>
					<th>工匠金额</th>
					<th>经理人金额</th>
					<th>抢单工人</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody ng-repeat="data in rows">
				<tr>
					<td><input type="checkbox" ng-model="data.checked"></td>

					<td>
						
						<div class="btn-group">
						  <font ng-if="data.status == 'CANCEL'" color="red">{{data.code1}}</font>
                <font ng-if="data.status == 'EXCEPTION'" color="orange">{{data.code1}}</font>
                <font ng-if="data.status == 'OVER'" color="green">{{data.code1}}</font>
                <font ng-if="data.status == 'NORMAL'">{{data.code1}}</font><span>
							<button type="button" class="btn  dropdown-toggle btn-xs"
								data-toggle="dropdown" data-toggle="tooltip"  title="点击显示操作项">
								 <span
									class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<li><span
									ng-if="data.releaseStatus == 'UNRELEASED' && ${indentPush}==true && data.hasAuth == 'YES'"  ><a
										href="" class="glyphicon glyphicon-send"
										ng-click="pushIndent(data.id);">&nbsp;发布订单</a></span></li>
								  <li><span
                  ng-if="${indentRecall}==true && data.releaseStatus == 'RELEASED'  && data.serviceDate == '' && data.hasAuth == 'YES'"><a
                    href="" class="glyphicon glyphicon-send"
                    ng-click="recallIndent(data.id);">&nbsp;撤回发布</a></span></li>
								<li><span
									ng-if="data.ifLeft != 'YES' && data.progStatus == 'INVITEEVAL' && data.status == 'NORMAL' && ${indentLeft}==true && data.hasAuth == 'YES'"><a
										class="glyphicon glyphicon-ok" href=""
										ng-click="leftIndent(data.id);">&nbsp;确认离开</a></span></li>
								<li><span ng-if="data.evaluateStatus == 'EVALUATED' && data.hasAuth == 'YES'"><a
										class="glyphicon glyphicon-eye-open"
										href="indentEvaluate/indentEvaluateMsg.do?indentId={{data.id}}&&pageNo={{pager.currentPage}}">&nbsp;查看评价</a></span></li>
								<li><span><a class="glyphicon glyphicon-eye-open" ng-if="data.hasAuth == 'YES'"
										href="indentNode/indentNodeTree.do?id={{data.id}}&&pageNo={{pager.currentPage}}">&nbsp;订单进程</a></span></li>

								<li><span
									ng-if="data.executeStatus == 'CENTRE' && ${finishIndentAuth}==true && data.hasAuth == 'YES'"><a
										class="glyphicon glyphicon-ok" href=""
										ng-click="finishIndent(data.id);">&nbsp;强制完成</a></span></li>

								<li><span
									ng-if="data.executeStatus == 'CENTRE' && ${workerChangeAuth}==true && data.hasAuth == 'YES'"><a
										class="glyphicon glyphicon-ok" href=""
										ng-click="changeWorker(data.id);">&nbsp;更换工匠</a></span></li>

								<li><span><a ng-if="${contactAuth}==true && data.hasAuth == 'YES'"
										class="glyphicon glyphicon-plus" href=""
										ng-click="indentContact(data.id);">&nbsp;新增联系记录</a></span></li>
								

								<li><span><a class="glyphicon glyphicon-eye-open" ng-if="data.hasAuth == 'YES'"
										href="indentAction/indentActionList.do?id={{data.id}}&&pageNo={{pager.currentPage}}">&nbsp;操作明细</a></span></li>
								<li><!-- <span><a class="glyphicon glyphicon-eye-open" ng-if="data.hasAuth == 'YES'"
                    href="indentWorkerContact/indentWorkerContactList.do?indentId={{data.id}}&&pageNo={{pager.currentPage}}">&nbsp;查看信息沟通</a></span> -->
                    <span><a class="glyphicon glyphicon-eye-open" ng-if="data.hasAuth == 'YES'"
                    href="indentExc/indentExcList.do?indentId={{data.id}}&&pageNo={{pager.currentPage}}">&nbsp;查看异常</a></span></li>
								<!-- <li><span><a 
                    class="glyphicon glyphicon-eye-open" ng-if="data.hasAuth == 'YES'"
                    href="indentGps/indentGpsList.do?id={{data.id}}&&pageNo={{pager.currentPage}}">&nbsp;查看定位</a></span></li> -->
								


								<li><span
									ng-if="data.status == 'OVER' && data.newCode1 == '' && ${doExtraIndentAdd}==true && data.hasAuth == 'YES'"><a
										href="" class="glyphicon glyphicon-plus"
										ng-click="extraIndent(data.id);">&nbsp;二次上门</a></span></li>
								<li><span ng-if="${resendCode}==true && data.workerId != '' &&  data.executeStatus=='CENTRE' && data.hasAuth == 'YES'"><a 
                    href="" class="glyphicon glyphicon-plus"
                    ng-click="sendCode(data.id);">&nbsp;发送核销码</a></span></li>
								<li class="divider"></li>
                <li><span><a ng-if="${doDelAuth}==true && data.hasAuth == 'YES'"
                    class="glyphicon glyphicon-trash" href=""
                    ng-click="doDelete(data.id);">&nbsp;删除</a></span></li>
							</ul></span>
						</div>
					</td>
					<td><a
						href="indent/indentEdit.do?id={{data.id}}&&pageNo={{pager.currentPage}}">{{data.contactName}}</a></td>
						<td>{{data.contactAddr}}</td>
					<td>{{data.apartyName}}</td>
					<td>{{data.itemName}}</td>
					<td>{{data.serveTypeDisp}}</td>
					<td><a
            href="indentNode/indentNodeTree.do?id={{data.id}}&&pageNo={{pager.currentPage}}">{{data.executeStatusDisp}}</a></td>
					<td>{{data.statusDisp}}</td>
					<td>{{data.serviceDateString}}</td>
				<!-- 	<td>{{data.callDateString}}</td> -->
				<!-- 	<td>{{data.appointDateString}}</td> -->
					<td>{{data.signDateString}}</td>
					<td>{{data.workerFee}}</td>
					<td>{{data.managerFee}}</td>
					<td><span ng-if="data.executeStatus != 'BEFORE'">{{data.workerName1}}</span></td>
					<!-- tableA样式只针对 操作项 
            <a class="btn btn-success btn-xs"><span
                class="glyphicon glyphicon-pause"></span>暂停</a>-->
					<td><span
						ng-if="data.releaseStatus == 'UNRELEASED' && ${indentPush}==true && data.hasAuth == 'YES'"><a
							class="btn btn-success btn-xs" ng-click="pushIndent(data.id);">
							<span
								class="glyphicon glyphicon-send"></span>&nbsp;发布订单</a></span> 
								 <span
						ng-if="data.status == 'OVER' && data.newCode1 == '' && ${doExtraIndentAdd}==true && data.hasAuth == 'YES'"><a
							class="btn btn-success btn-xs" ng-click="extraIndent(data.id);"><span
								class="glyphicon glyphicon-plus"></span>&nbsp;二次上门</a></span> <span
						ng-if="data.status == 'OVER' && data.newCode1 != '' && data.hasAuth == 'YES'"><a
							href="indent/indentEdit.do?code1={{data.newCode1}}&&pageNo={{pager.currentPage}}">{{data.newCode1}}</a></span>
					<span
            ng-if="data.status == 'EXCEPTION' && data.hasAuth == 'YES'"><a class="btn btn-warning btn-xs"
              href="indentExc/indentExcList.do?indentId={{data.id}}&&pageNo={{pager.currentPage}}"><span
                class="glyphicon glyphicon-eye-open"></span>&nbsp;查看异常</a></span>
          <span
            ng-if="data.workerContact == '1' && data.hasAuth == 'YES'"><a class="btn btn-warning btn-xs"
              href="indentWorkerContact/indentWorkerContactList.do?indentId={{data.id}}&&pageNo={{pager.currentPage}}"><span
                class="glyphicon glyphicon-eye-open"></span>&nbsp;查看消息</a></span>
						<span
						ng-if="data.ifLeft != 'YES' && data.progStatus == 'INVITEEVAL' && data.status == 'NORMAL' && ${indentLeft}==true && data.hasAuth == 'YES'"><a
							ng-click="leftIndent(data.id);" href=""
							class="btn btn-success btn-xs"><span
                class="glyphicon glyphicon-ok"></span>&nbsp;确认离开</a></span> 
             <span ng-if="data.evaluateStatus == 'EVALUATED' && data.hasAuth == 'YES'"><a
                    class="btn btn-success btn-xs"
                    href="indentEvaluate/indentEvaluateMsg.do?indentId={{data.id}}&&pageNo={{pager.currentPage}}">
                    <span
                class="glyphicon glyphicon-eye-open"></span>&nbsp;查看评价</a></span>
                
               
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