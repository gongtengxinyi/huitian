<#include "/include/common.ftl" />
<title>管理员日志查询</title>
<#include "/include/common-list.ftl" />
<!--  <script type="text/javascript"
  src="${base}/static/My97DatePicker/WdatePicker.js"></script> -->
<script src="static/scripts/log/logList.js"></script>
</head>
<body>
	<#include "/include/body-begin.ftl" />
	<div ng-controller="logListController">
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
		<input type="hidden" id="pageNo" value="${pageNo}"
			ng-init="pageNo='${pageNo}'">
		<div class="panel panel-default form-horizontal" id="content"
			style="display: yes;">
			<div class="panel-heading">管理员操作记录查询</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-6 col-lg-4">
						<div class="form-group">
							<label class="control-label text-nowrap col-md-4">管理员姓名</label>
							<div class="col-md-8">
								<input type="text" class="form-control"
									ng-keyup="autoQuery($event)" id="name" ng-model="name">
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-8">
						<div class="row">
							<label class="control-label text-nowrap col-md-4 col-lg-2">操作日期</label>
							<div class="col-md-8 col-lg-10">
								<div class="row">
									<div class="col-md-6 col-lg-5">
										<p class="input-group">
											<input type="text" class="form-control"
												ng-keyup="autoQuery($event)" uib-datepicker-popup
												ng-model="startDate" is-open="crtDateBegin.opened"
												datepicker-options="dateOptions" ng-required="true" /> <span
												class="input-group-btn">
												<button type="button" class="btn btn-default"
													ng-click="openCrtDateBegin()">
													<i class="glyphicon glyphicon-calendar"></i>
												</button>
											</span>
										</p>
									</div>
									<div class="col-md-6 col-lg-5">
										<p class="input-group">
											<input type="text" class="form-control"
												ng-keyup="autoQuery($event)" uib-datepicker-popup
												ng-model="endDate" is-open="crtDateEnd.opened"
												datepicker-options="dateOptions" ng-required="true" /> <span
												class="input-group-btn">
												<button type="button" class="btn btn-default"
													ng-click="openCrtDateEnd()">
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
					<div class="col-md-3 pull-right">
						<button class="btn btn-warning pull-right" ng-click="query()">
							<span class="glyphicon glyphicon-search"></span>&nbsp;筛选
						</button>
					</div>
				</div>

			</div>
		</div>
		<div class="panel panel-default">
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th width="200px">姓名</th>
						<th width="200px">操作类型</th>
						<th width="200px">操作日期</th>
						<th width="200px">操作对象</th>
						<th>操作描述</th>
					</tr>
				</thead>
				<tbody ng-repeat="data in rows">
					<tr>
						<td>{{data.name}}</td>
						<td>{{data.operation}}</td>
						<td>{{data.date}}</td>
						<td>{{data.adminId}}</td>
						<td>{{data.desc}}</td>
					</tr>
				</tbody>
			</table>
			<div class="panel-footer">
				<#include "/include/pagination.ftl" />
			</div>
		</div>
	</div>
	<#include "/include/body-end.ftl" />
</body>
</html>