<#include "/include/common.ftl" />
<title>毛坯列表</title>
<#include "/include/common-list.ftl" />
<script src="static/scripts/wordblank/wordblanklist.js?randomId=<%=Math.random()%>"></script>
</head>
<body>
  <#include "/include/body-begin.ftl" />

  <div ng-controller="wordblankListController">

    <div class="panel panel-default form-horizontal">
      <div class="panel-heading">账号管理查询</div>
      <div class="panel-body">
        <div class="row">
          <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">毛坯名称</label>
              <div class="col-md-8">
                <input type="text" class="form-control"
                  ng-model="sf.user">
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
            <th>毛坯名称</th>
            <th>毛坯材质</th>
            <th>毛坯克重</th>
            <th>毛坯宽度</th>
            <th>毛坯价格</th>
          </tr>
        </thead>
        <tbody ng-repeat="data in rows">
          <tr>
            <td>{{data.name1}}</td>
            <td><a href="admin/adminEdit.do?id={{data.id}}">{{data.material}}</a></td>
            <td>{{data.maopiWeight}}</td>
            <td>{{data.maopiWidth}}</td>
            <td>{{data.maopiPrice}}</td>
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