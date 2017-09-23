<#include "/include/common.ftl" />
<title>新增项目</title>
<style type="text/css">
.grid {
  width: 100%;
  height: 140px;
}
</style>
<#include "/include/common-entry-grid.ftl" />


<script type="text/javascript" src="static/scripts/chongzhi/chongzhi.js?randomId=<%=Math.random()%>"></script>

</head>
<body>
<body>
  <#include "/include/body-begin.ftl" />

  <div ng-controller="AdminAddController">

    <form name="form1" class="form-horizontal" novalidate>
      <div class="panel panel-default">
        <div class="panel-heading">充值</div>
        <div class="panel-body">

          <div class="form-group" 
            ng-class="{ 'has-error': form1.user.$invalid && (form1.$submitted || form1.user.$touched)}">
            <label class="control-label required col-md-2">充值金额：</label>
            <div class="col-md-4">
              <input  type="text" ng-model="data.chongzhi" class="form-control" name="user"  
                      placeholder="必填项" numeric decimals="2"  required>
            </div><label> 元</label>
          </div>
         
          <div class="row">
            <div class="col-md-8 col-md-offset-2">
              <button type="submit" class="btn btn-primary"
                ng-click="save();">
                <span class="glyphicon glyphicon-ok"></span>&nbsp;充值
              </button>
              &nbsp; &nbsp; &nbsp;
              <button type="button" class="btn btn-success"
                ng-click="save();">
                <span class="glyphicon glyphicon-chevron-left"></span>&nbsp;充值明细
              </button>
            </div>
          </div>
        </div>
      </div>
    </form>
    <#include "/include/body-end.ftl" />
</body>
</html>