<#include "/include/common.ftl" />
<title>新增图片类别</title>
<style type="text/css">
.grid {
  width: 100%;
  height: 140px;
}
</style>
<#include "/include/common-entry-grid.ftl" />
 <#include "/include/common-cityselect.ftl" />

<script src="static/scripts/image/imageTypeAdd.js?randomId=<%=Math.random()%>"></script>

</head>

<body>

  <#include "/include/body-begin.ftl" />

  <div ng-controller="imageTypeAddController">

    <form name="form1" class="form-horizontal" novalidate>
      <div class="panel panel-default">
        <div class="panel-heading">图片类别基本信息</div>
        <div class="panel-body">

          <div class="row">
             <div class="col-md-4">
              <div class="form-group"
                ng-class="{ 'has-error': form1.typeCode$invalid && (form1.$submitted || form1.typeCode.$touched)}">
                <label for="typeCode"
                  class="control-label required col-md-4">类别code：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="typeCode"
                    name="typeCode" ng-model="data.typeCode"
                    uib-tooltip="此项为必填项"
                    tooltip-enable="form1.typeCode$invalid" required>
                </div>
              </div>
            </div>
          
            <div class="col-md-4">
              <div class="form-group"
                ng-class="{ 'has-error': form1.typeName.$invalid && (form1.$submitted || form1.typeName.$touched)}">
                <label for="typeName"
                  class="control-label required col-md-4">名字：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="typeName"
                    name="typeName" ng-model="data.typeName"
                    uib-tooltip="此项为必填项"
                    tooltip-enable="form1.typeName.$invalid" required>
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