 <#include "/include/common.ftl" />
<title>订单管理查询</title>
<#include "/include/common-list.ftl" /> <#include
"/include/common-cityselect2.ftl" />
<script src="static/bootstrap/bootstrap.min.js"></script>
<script src="static/scripts/indent/indentList.js?randomId=<%=Math.random()%>"></script>
</head>
<body
	ng-init="status='  ${status}';progress='${progress}';">
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
      <input type="hidden" id="sf.workerContact" ng-model="sf.workerContact"
        value="${sf.workerContact}" ng-init="sf.workerContact='${sf.workerContact}'">
			<div class="panel-body">
				<div class="row">
					<div class="col-md-4 col-lg-4">
						<div class="form-group">
							<label class="control-label text-nowrap col-md-4">下单用户</label>
							<div class="col-md-8">			
								<input type="text" class="form-control" id="apartyIdDisp"
									ng-model="sf.aparty.name1" ng-keyup="autoQuery($event)"
									ng-init="sf.aparty.name1='${sf.aparty.name1}'">
							</div>
						</div>
					</div>
					<div class="col-md-4 col-lg-4">
						<div class="form-group">
							<label class="control-label text-nowrap col-md-4">加工中心</label>
							<div class="col-md-8">
								<input type="text" class="form-control" ng-model="sf.item.name1"
									ng-keyup="autoQuery($event)"
									ng-init="sf.item.name1='${sf.item.name1}'">
							</div>
						</div>
					</div>

					<div class="col-md-4 col-lg-4">
						<div class="form-group">
							<label class="control-label text-nowrap col-md-4">毛坯类型</label>
							<div class="col-md-8">
								<input type="text" class="form-control"
									ng-model="sf.contact.name1" ng-keyup="autoQuery($event)"
									ng-init="sf.contact.name1='${sf.contact.name1}'">
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<!-- releaseDate begin -->
				<div class="col-md-8">
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
			</div>
		 	<div class="row">
				<div>
					<div class="col-md-3 pull-right">
						<button id="search" class="btn btn-info pull-right"
							ng-click="query()">
							<span class="glyphicon glyphicon-search"></span>&nbsp;筛选
						</button>
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
					<th>签到日期</th>
					<th>工匠金额</th>
					<th>经理人金额</th>
					<th>抢单工人</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody ng-repeat="data in rows">
			  <tr>
			   <td>
			   1
			   </td>
			   <td>
			   1
			   </td><td>
			   1
			   </td><td>
			   1
			   </td><td>
			   1
			   </td><td>
			   1
			   </td><td>
			   1
			   </td><td>
			   1
			   </td><td>
			   1
			   </td><td>
			   1
			   </td><td>
			   1
			   </td><td>
			   1
			   </td><td>
			   1
			   </td><td>
			   1
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