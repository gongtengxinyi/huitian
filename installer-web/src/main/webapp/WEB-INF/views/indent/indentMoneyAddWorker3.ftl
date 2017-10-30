<#include "/include/common.ftl" />
<title></title>
<#include "/include/common-entry-grid.ftl" />
<!--  -->


<script type="text/javascript"
	src="static/scripts/indent/indentMoneyAddWorker3.js?randomId=<%=Math.random()%>"></script>
</head>
<body ng-init="data.id='${id}'">
	<#include "/include/body-begin.ftl" />
	<div ng-controller="IndentController">
		<form id="inputForm" name="form1" class="form-horizontal" novalidate
			enctype="multipart/form-data">
			<input type="hidden" id="pageNo" value="${pageNo}"
				ng-init="pageNo='${pageNo}'"> <input type="hidden"
				id="indentId" ng-model="data.indentId" value="${indentId}"
				ng-init="data.indentId='${indentId}'">
			<div class="panel panel-default">
				<div class="panel-heading">记账调整</div>
				<div class="panel-body">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
							<th style="width: 150px;">订单ID</th>
								<th style="width: 100px;">上门次数</th>
								<th style="width: 100px;">姓名</th>
								<th style="width: 200px;">调整金额</th>
								<th style="width: 200px;">调整类别</th>
								<th >调整原因</th>
							</tr>
						</thead>
						<#list indentList as indent>
						<tr>
							<td>${indent.code1}</td>
							<td>${indent.doorTimes}次</td>
							<td>${indent.workerName1}</td>
							
							<td>
							<input type="hidden" ng-model="data.tiaozhengDto.tiaozheng_${indent.id}_indentId"
							     ng-init="data.tiaozhengDto.tiaozheng_${indent.id}_indentId='${indent.id}'">
							<input class="form-control" type="text" 
								ng-model="data.tiaozhengDto.tiaozheng_${indent.id}_tiaozhengFee"
								style="width: 100px; display: inline-block; margin: 0 15px;"
								numeric decimals="3"></td>
							<td>
							   <select id="sel" class="form-control" name="serceType" 
                    ng-model="data.tiaozhengDto.tiaozheng_${indent.id}_tiaozhengType" >
                    <#list tiaozhengWorkerTypeList as item>
                    <option value="${item.value}">${item.text}</option> </#list>
                  </select>
							</td>
							<td><textarea type="text" class="form-control" maxlength="200"
                  ng-model="data.tiaozhengDto.tiaozheng_${indent.id}_tiaozhengContent">
              </textarea></td>
              
						</tr>

						</#list>
					</table>
           <div class="form-group" >
                  <label class="control-label  col-md-2">上传文件：</label>
                  <div class="col-md-10">
                    <div class="row">
                      <div class="col-md-12">
                          <input type="file" name="imgFiles" file-model="file.imgFiles" multiple />
                      </div>
                    </div>
                    <div class="row" ng-repeat="f in file.imgFiles">
                      <div class="col-md-12">
                        <span>{{f.name}} 
                      </div>
                    </div>
                  </div>
            </div>
					<div class="form-group">
						<div class="col-md-10 col-md-offset-2">
							<button type="submit" id="btnSave" class="btn btn-primary"
								ng-click="update();">
								<span class="glyphicon glyphicon-ok"></span>保存
							</button>
							&nbsp;&nbsp;&nbsp;

							<button type="button" class="btn btn-success"
								ng-click="goBack();">
								<span class="glyphicon glyphicon-chevron-left"></span>&nbsp;返回
							</button>
							&nbsp;&nbsp;&nbsp;

						</div>
					</div>
					<div>
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									 <th width="100px">操作人</th>
				            <th width="120px">调整类别</th>
				            <th width="120px">调整金额</th>
				            <th>调整原因</th>
				            <!-- <th>调整原因</th> -->
				            <th width="150px">操作日期</th>
				            <th width="400px">附件</th>

								</tr>
							</thead>
							<tbody>
								<#list tiaozhengList as tiaozheng>
								<tr>
									<td>${tiaozheng.name1}</td>
									<td>${tiaozheng.tiaozhengWorkerTypeDisp}</td>
									<td>${tiaozheng.tiaozhengFee}</td>
									<td>${tiaozheng.content}</td>
									<!-- <td>${tiaozheng.reasons}</td> -->
									<td>${tiaozheng.createDateStr}</td>
                  <td>
                     <#list tiaozheng.fileIndexList as f>                  
                         <span>${f.fileName} <a href="fs/download.do?fileid=${f.id}">【下载】</a></span>
                     </#list>
                  </td>
								</tr>
								</#list>
							</tbody>
						</table>

					</div>


				</div>
			</div>
	</div>
	</div>
	</form>
	</div>
	<#include "/include/body-end.ftl" />
</body>
</html>