<#include "/include/common.ftl" />
<title></title>
<#include "/include/common-entry-grid.ftl" />
<#include "/include/common-cityselect2.ftl" />
<!--  -->


<script type="text/javascript" src="static/scripts/indent/changeDoorDate.js?randomId=<%=Math.random()%>"></script>
</head>
<body ng-init="data.id='${id}'">
  <#include "/include/body-begin.ftl" />
  <div ng-controller="IndentController">
    <form id="inputForm" name="form1" class="form-horizontal" novalidate enctype="multipart/form-data">
    <input type="hidden" id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
    <input type="hidden" id="id" ng-model="data.id" value="${id}" ng-init="data.id='${id}'">
      <div class="panel panel-default">
        <div class="panel-heading">修改计划上门日期</div>
        <div class="panel-body">
        <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label col-md-4">计划上门日期：</label>
                <div class="col-md-8">
                  <p class="input-group"
                    ><!-- ng-class="{'has-error' : form1.planDoorDate.$invalid && (form1.$submitted || form1.planDoorDate.$touched)}" -->
                    <input type="text" class="form-control" uib-datepicker-popup
                      ng-model="data.planDoorDate" name="planDoorDate"
                      is-open="planDoorDate.opened"
                      datepicker-options="dateOptions" ng-required="true"
                       /> <span
                      class="input-group-btn">
                      <button type="button" class="btn btn-default"
                        ng-click="openPlanDoorDate()">
                        <i class="glyphicon glyphicon-calendar"></i>
                      </button>
                    </span>
                  </p>
                </div>
              </div>
            </div>
     
      
     <div class="form-group">
            <div class="col-md-10 col-md-offset-2">
            <button type="submit" class="btn btn-primary" ng-click="update();">
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
        </div>
      </div>
    </form>
  </div>
  <#include "/include/body-end.ftl" />
</body>
</html>