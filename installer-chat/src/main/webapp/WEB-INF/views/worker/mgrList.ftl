<#include "/include/common.ftl" />
<title>工匠管理查询</title>
<#include "/include/common-list.ftl" />

<script src="static/scripts/account/mgrList.js?randomId=<%=Math.random()%>"></script>
</head>
<body ng-init="data.id='${id}'">
  <#include "/include/body-begin.ftl" />
  <div ng-controller="MgrListController">
  
    <div class="panel panel-default form-horizontal">
      <div class="panel-heading">历史经理人列表</div>
       <input type="hidden" id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
      <div class="panel panel-default">
        <table class="table table-bordered table-striped">
          <thead>
            <tr>
              <th>姓名</th>
              <th>手机号</th>
              <th>备注</th>
              <th>时间</th>
              <th>状态</th>
            </tr>
          </thead>
          <tbody ng-repeat="data in rows">
            <tr>
              <td>{{data.name1}}</td>
              <td>{{data.mobile}}</td>
              <td>{{data.desc1}}</td>
              <td>{{data.applyDate}}</td>
              <td>{{data.statusDisp}}</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="form-group">
        <div class="col-md-12">
          <button type="button" class="btn btn-success pull-right"
            ng-click="goBack();">
            <span class="glyphicon glyphicon-chevron-left"></span>&nbsp;返回
          </button>
        </div>
      </div>
    </div>
  </div>
  <#include "/include/body-end.ftl" />
</body>
</html>