<#include "/include/common.ftl" />
<title>新增设备账号</title>
<style type="text/css">
.grid {
  width: 100%;
  height: 140px;
}
</style>
<#include "/include/common-entry-grid.ftl" />
 <#include "/include/common-cityselect.ftl" />

<script src="static/scripts/account/centerAccount.js?randomId=<%=Math.random()%>"></script>

</head>

<body>

  <#include "/include/body-begin.ftl" />

  <div ng-controller="centerAccountAddController">

    <form name="form1" class="form-horizontal" novalidate>
      <div class="panel panel-default">
        <div class="panel-heading">设备账号基本信息</div>
        <div class="panel-body">

          <div class="row">
 
         
            <div class="col-md-4">
              <div class="form-group"
                ng-class="{ 'has-error': form1.centerId.$invalid && (form1.$submitted || form1.centerId.$touched)}">
                <label class="control-label required col-md-4">加工中心：</label>
               <div class="col-md-8">
                  <select class="form-control" ng-model="data.centerId"
                    name="centerId" uib-tooltip="此项为必填项"
                    tooltip-enable="form1.centerId.$invalid" required>
                    <#list centerList as center>
                    <option value="${center.id}">${center.name1}</option>
                    </#list>
                  </select>
                </div>
              </div>
            </div>
  
          
         
                
                        
            <div class="col-md-4">
              <div class="form-group"
                ng-class="{ 'has-error': form1.name1.$invalid && (form1.$submitted || form1.name1.$touched)}">
                <label for="name1"
                  class="control-label required col-md-4">用户名：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="name1"
                    name="name1" ng-model="data.name1"
                    uib-tooltip="此项为必填项"
                    tooltip-enable="form1.name1.$invalid"  placeholder="登录时的用户名" required>
                </div>
              </div>
            </div>  
            
             <div class="col-md-4">
               <div class="form-group"
                ng-class="{ 'has-error': form1.password.$invalid && (form1.$submitted || form1.password.$touched)}">
                <label class="control-label required col-md-4">密码：</label>
                <div class="col-md-8">
            <input type="text" class="form-control" id="password"
                    name="password" ng-model="data.password"
                    uib-tooltip="此项为必填项"
                    tooltip-enable="form1.password.$invalid" required>
                </div>
              </div>
            </div>
   
                  </div>
                  <div class="row">
            <div class="col-md-10 col-md-offset-2">
              <button type="submit" class="btn btn-primary"
                fng-click="save();">
                <span class="glyphicon glyphicon-ok"></span>&nbsp;保存
              </button>
              &nbsp;&nbsp;&nbsp;
              <button type="button" class="btn btn-success"
                ng-click="goBack();">
                <span class="glyphicon glyphicon-chevron-left"></span>&nbsp;返回
              </button>
            </div>
          </div>
        </div>
      </div>
    </form>
    <#include "/include/body-end.ftl" />
</body>
</html>