<#include "/include/common.ftl" />
<title></title>
<#include "/include/common-entry-grid.ftl" />
<!--  -->


<script type="text/javascript" src="static/scripts/indent/indentSign.js?randomId=<%=Math.random()%>"></script>
</head>
<body ng-init="data.id='${id}'">
  <#include "/include/body-begin.ftl" />
  <div ng-controller="IndentController">
    <form id="inputForm" name="form1" class="form-horizontal" novalidate enctype="multipart/form-data">
    <input type="hidden" id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
    <input type="hidden" id="id" ng-model="data.id" value="${indentId}" ng-init="data.id='${indentId}'">
     <input type="hidden" id="stepId" ng-model="data.stepId" value="${stepId}" ng-init="data.stepId='${stepId}'">
      <div class="panel panel-default">
        <div class="panel-heading">线下订单签到</div>
        <div class="panel-body">           
           <div class="form-group" >      
				<div class="col-md-9" >
								<label class="control-label required col-md-2">签到日期：</label>
								<div class="col-md-4">
									<p class="input-group"
										ng-class="{'has-error' : form1.signDate.$invalid && (form1.$submitted || form1.signDate.$touched)}">
										<input type="text" class="form-control" uib-datepicker-popup
											ng-model="data.signDate" name="signDate"
											is-open="signDate.opened" datepicker-options="dateOptions"
											ng-required="false" uib-tooltip="此项为必填项"
											tooltip-enable="form1.signDate.$invalid" /> <span
											class="input-group-btn">
											<button type="button" class="btn btn-default"
												ng-click="openSignDate()">
												<i class="glyphicon glyphicon-calendar"></i>
											</button>
										</span>
									</p>
								</div>
							</div>
            <div class="col-md-10 col-md-offset-2">
            <button type="submit" class="btn btn-primary" ng-click="update();">
                <span class="glyphicon glyphicon-ok"></span>保存
             </button>
             &nbsp;&nbsp;&nbsp;
             
              <button type="button" class="btn btn-success"
                ng-click="goBack();">
                <span class="glyphicon glyphicon-chevron-left"></span>&nbsp;关闭
              </button>
               &nbsp;&nbsp;&nbsp;
             
            </div>
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