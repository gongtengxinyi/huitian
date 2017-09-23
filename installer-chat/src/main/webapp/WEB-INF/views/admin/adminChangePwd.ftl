<#include "/include/common.ftl" />
<style type="text/css">
</style>
<#include "/include/common-entry.ftl"/>
<script type="text/javascript" src="static/scripts/admin/adminChangePwd.js?randomId=<%=Math.random()%>"></script>
</head>
<body>
<body>

  <#include "/include/body-begin.ftl" />

  <div ng-controller="AdminChangePwdController">

    <form name="form1" class="form-horizontal" novalidate>
      <div class="panel panel-default">
        <div class="panel-heading">修改密码</div>
        <div class="panel-body">

          <div class="form-group" ng-class="{'has-error': form1.oldPwd.$invalid && (form1.$submitted || form1.oldPwd.$touched)}">
            <label class="control-label required col-md-2" >旧密码：</label>
            <div class="col-md-10">
              <input type="password" class="form-control" name="oldPwd"
                ng-model="data.oldPwd" required>
            </div>
          </div>
          <div class="form-group"
            ng-class="{'has-error': form1.newPwd.$invalid && (form1.$submitted || form1.newPwd.$touched)}">
            <label class="control-label required col-md-2" >新密码：</label>
            <div class="col-md-10">
              <input type="password" class="form-control" name="newPwd"
                ng-model="data.newPwd" required>
            </div>
          </div>
          <div class="form-group"
            ng-class="{'has-error': form1.confirmNewPwd.$invalid && (form1.$submitted || form1.confirmNewPwd.$touched)}">
            <label class="control-label required col-md-2" >确认新密码：</label>
            <div class="col-md-10">
              <input type="password" class="form-control" name="confirmNewPwd"
                ng-model="data.confirmNewPwd" placeholder="在这里再次输入新密码" required>
            </div>
          </div>
          
          <div class="row">
            <div class="col-md-10 col-md-offset-2">
              <button type="submit" class="btn btn-primary"
                ng-click="doSave();" ng-disabled="data.isSystem == 1"
                uib-tooltip="系统内置账号不允许操作"
                tooltip-enable="data.isSystem == 1">
                <span class="glyphicon glyphicon-ok"></span>&nbsp;保存
              </button>
             
              &nbsp; &nbsp; &nbsp;
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