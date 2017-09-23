<#include "/include/common.ftl" />
<title>账号管理查询</title>
<#include "/include/common-list.ftl" />
<script src="static/scripts/xmAccount/accountList.js"></script>
</head>
<body>
  <#include "/include/body-begin.ftl" />

  <div ng-controller="AdminListController">

    <div class="panel panel-default form-horizontal">
      <div class="panel-heading">账号管理查询</div>
      <div class="panel-body">
        <div class="row">
          <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">手机号</label>
              <div class="col-md-8">
                <input type="text" class="form-control"
                  ng-model="sf.mobile" ng-keyup="autoQuery($event)">
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">所属甲方名称</label>
              <div class="col-md-8">
                <input type="text" class="form-control"
                  ng-model="sf.apartyName" ng-keyup="autoQuery($event)">
              </div>
            </div>
          </div>
       
          <div class="col-md-6 col-lg-3 pull-right">
            <button class="btn btn-warning pull-right"
              ng-click="query()">
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
            <th>用户名</th>
            <th>所属甲方</th>
            
            <th>状态</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody ng-repeat="data in rows">
          <tr>
            <td>{{data.mobile}}</td>
            <td>{{data.apartyDisp}}</td>          
            <td>{{data.statusDisp}}</td>
            <td>&nbsp; <a
              ng-if="data.status == 'NORMAL'"
              href="javascript:void(0)" ng-click="disable(data.id)"
              class="btn btn-warning btn-xs"><span
                class="glyphicon glyphicon-pause"></span>&nbsp;停用</a> <a
              ng-if="data.status == 'STOP'"
              href="javascript:void(0)" ng-click="enable(data.id)"
              class="btn btn-success btn-xs"><span
                class="glyphicon glyphicon-play"></span>&nbsp;启用</a></td>
          </tr>
        </tbody>
      </table>

      <div class="panel-footer">
        <!--  -->
        <#include "/include/pagination.ftl" />
      </div>
    </div>
    <#include "/include/body-end.ftl" />
</body>
</html>