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
        <div class="panel-heading">加工中心基本信息</div>
        <div class="panel-body">

          <div class="row">
             <div class="col-md-4">
              <div class="form-group"
                ng-class="{ 'has-error': form1.maxDepth.$invalid && (form1.$submitted || form1.maxDepth.$touched)}">
                <label for="maxDepth"
                  class="control-label required col-md-4">最大深度：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="maxDepth"
                    name="maxDepth" ng-model="data.maxDepth"
                    uib-tooltip="此项为必填项"
                    tooltip-enable="form1.maxDepth.$invalid" required>
                </div>
              </div>
            </div>
          
            <div class="col-md-4">
              <div class="form-group"
                ng-class="{ 'has-error': form1.maopiNum.$invalid && (form1.$submitted || form1.maopiNum.$touched)}">
                <label for="maopiNum"
                  class="control-label required col-md-4">毛坯数量：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="maopiNum"
                    name="maopiNum" ng-model="data.maopiNum"
                    uib-tooltip="此项为必填项"
                    tooltip-enable="form1.maopiNum.$invalid" required>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group"
                ng-class="{ 'has-error': form1.maxZhuanshu.$invalid && (form1.$submitted || form1.maxZhuanshu.$touched)}">
                <label class="control-label required col-md-4">最大转数：</label>
                <div class="col-md-8">
            <input type="text" class="form-control" id="maxZhuanshu"
                    name="maxZhuanshu" ng-model="data.maxZhuanshu"
                    uib-tooltip="此项为必填项"
                    tooltip-enable="form1.maxZhuanshu.$invalid" required>
                </div>
              </div>
            </div>
          </div>
          
                <div class="row">
             <div class="col-md-4">
              <div class="form-group"
                ng-class="{ 'has-error': form1.remarks.$invalid && (form1.$submitted || form1.remarks.$touched)}">
                <label for="remarks"
                  class="control-label required col-md-4">备注：</label>
                <div class="col-md-8">
              <textarea type="text" class="form-control" name="remarks"
                ng-model="data.remarks" uib-tooltip="此项为必填项"
                tooltip-enable="form1.remarks.$invalid" required></textarea>
                </div>
              </div>
            </div>
          
            <div class="col-md-4">
              <div class="form-group"
                ng-class="{ 'has-error': form1.name1.$invalid && (form1.$submitted || form1.name1.$touched)}">
                <label for="name1"
                  class="control-label required col-md-4">加工中心名称：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="name1"
                    name="name1" ng-model="data.name1"
                    uib-tooltip="此项为必填项"
                    tooltip-enable="form1.name1.$invalid" required>
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