<#include "/include/common.ftl" />
<title>指定工匠</title>
<#include "/include/common-list.ftl" /> <#include
"/include/common-cityselect2.ftl" />

<script type="text/javascript" src="static/tableExport/jquery.base64.js"></script>

<script type="text/javascript" src="static/tableExport/tableExport.js"></script>

<script
	src="static/scripts/indent/workerChange.js?randomId=<%=Math.random()%>"></script>
</head>
<body>
	<#include "/include/body-begin.ftl" />
	<div ng-controller="WorkerListController">
		<input type="hidden" id="indentId" value="${id}"
			ng-model="data.indentId" ng-init="data.indentId='${id}'"> <input
			type="hidden" id="city" value="${city}" ng-model="data.city"
			ng-init="data.city='${city}'"> <input type="hidden"
			id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
		<div class="panel panel-default form-horizontal">
			<div class="panel-heading">指定新的工匠</div>
			<div class="panel-body">

                 <input type="hidden" name="workerId" ng-model="data.workerId"
								ng-init="data.workerId='${data.workerId}'" />
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label  col-md-2">更换工匠:</label>
							<div class="col-md-10">
								<input type=text ng-model="data.workerName1"
									placeholder="请输入姓名或者电话号码检索" name="workerName1"
									class="form-control"
									uib-typeahead="pair.text as pair.text for pair in doTypeaheadWorker($viewValue)"
									typeahead-on-select="onTypeaheadWorkerSelect($item, $model, $label)"
									typeahead-min-length="1" typeahead-loading="loadingTest"
									typeahead-no-results="noResultsworker" uib-tooltip="此项为必填项"
									tooltip-enable="form1.workerName1.$invalid"
									ng-init="data.workerName1='${data.workerName1}'"> <i
									ng-show="loadingTest1" class="glyphicon glyphicon-refresh"></i>
							</div>
						</div>
					</div>
					<div ng-show="noResultsworker">
								<i class="glyphicon glyphicon-remove"></i>没有找到相关信息
							</div>
				</div>
				<br>
				<div class="row">

					<div class="col-md-6">
						<div class="form-group"
							ng-class="{ 'has-error': form1.remarks.$invalid && (form1.$submitted || form1.remarks.$touched)}">
							<label class="control-label  col-md-2">更换理由：</label>
							<div class="col-md-10">
								<textarea type="text" class="form-control" name="remarks"
									ng-model="data.remarks" uib-tooltip=""
									tooltip-enable="form1.remarks.$invalid"></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="row">

				<div class="col-md-3 col-lg-8 pull-right">

					<button class="btn btn-warning pull-left" ng-click="changeWorker()">
						<span class="glyphicon glyphicon-ok"></span>&nbsp;更换
					</button>
					&nbsp;

					<button class="btn btn-warning " ng-click="goBack()">
						<span class="glyphicon glyphicon-chevron-left"></span>&nbsp;返回
					</button>
				</div>
			</div>
		</div>
	</div>


	<div class="panel panel-default">
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>操作人</th>
					<th>更换理由</th>

					<th>工匠</th>
					<th>操作日期</th>


				</tr>
			</thead>
			<tbody>
				<#list changeList as changeWorker>
				<tr>
					<td>${changeWorker.name1}</td>
					<td>${changeWorker.remarks}</td>

					<td>${changeWorker.workerName}</td>
					<td>${changeWorker.createDateStr}</td>


				</tr>
				</#list>
			</tbody>
		</table>

		<div class="panel-footer">
			<!--  -->
			<#include "/include/pagination.ftl" />
		</div>
	</div>
</body>
</html>