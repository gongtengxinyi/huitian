<#include "/include/common.ftl" />
<title>新增图片</title>
<style type="text/css">
.grid {
  width: 100%;
  height: 140px;
}
</style>
<#include "/include/common-entry-grid.ftl" />
 <#include "/include/common-cityselect.ftl" />

<script src="static/scripts/image/imageadd.js?randomId=<%=Math.random()%>"></script>

</head>

<body>

  <#include "/include/body-begin.ftl" />

  <div ng-controller="imageAddController">

    <form name="form1" class="form-horizontal" novalidate>
      <div class="panel panel-default">
        <div class="panel-heading">图片基本信息</div>
        <div class="panel-body">

          <div class="row">
             <div class="col-md-4">
              <div class="form-group"
                ng-class="{ 'has-error': form1.imageTypeId.$invalid && (form1.$submitted || form1.imageTypeId.$touched)}">
                <label for="imageTypeId"
                  class="control-label required col-md-4">图片类别名字：</label>
                 <div class="col-md-8">
                  <select class="form-control" ng-model="data.imageTypeId"
                    name="imageTypeId" uib-tooltip="此项为必填项"
                    tooltip-enable="form1.imageTypeId.$invalid" required>
                    <#list imageTypeList as imageType>
                    <option value="${imageType.id}">${imageType.typeName}</option>
                    </#list>
                  </select>
                </div>
              </div>
            </div>
          
            <div class="col-md-4">
              <div class="form-group"
                ng-class="{ 'has-error': form1.picCode.$invalid && (form1.$submitted || form1.picCode.$touched)}">
                <label for="picCode"
                  class="control-label required col-md-4">图片code：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="picCode"
                    name="picCode" ng-model="data.picCode"
                    uib-tooltip="此项为必填项"
                    tooltip-enable="form1.picCode.$invalid" required>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group"
                ng-class="{ 'has-error': form1.imgName.$invalid && (form1.$submitted || form1.imgName.$touched)}">
                <label class="control-label required col-md-4">图片名字：</label>
                <div class="col-md-8">
            <input type="text" class="form-control" id="imgName"
                    name="imgName" ng-model="data.imgName"
                    uib-tooltip="此项为必填项"
                    tooltip-enable="form1.imgName.$invalid" required>
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