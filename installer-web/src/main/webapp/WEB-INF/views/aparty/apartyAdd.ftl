<#include "/include/common.ftl" />
<title>新增甲方</title>
<style type="text/css">
.grid {
  width: 100%;
  height: 140px;
}
</style>
<#include "/include/common-entry-grid.ftl" /> <#include "/include/common-cityselect.ftl" />

<script src="static/scripts/aparty/apartyAdd.js?randomId=<%=Math.random()%>"></script>

</head>

<body>

  <#include "/include/body-begin.ftl" />

  <div ng-controller="ApartyAddController">

    <form name="form1" class="form-horizontal" novalidate>
      <div class="panel panel-default">
        <div class="panel-heading">甲方基本信息</div>
        <div class="panel-body">

          <div class="row">
            <div class="col-md-6">
              <div class="form-group"
                ng-class="{ 'has-error': form1.name1.$invalid && (form1.$submitted || form1.name1.$touched)}">
                <label for="name1"
                  class="control-label required col-md-4">甲方名称：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="name1"
                    name="name1" ng-model="data.name1"
                    uib-tooltip="此项为必填项"
                    tooltip-enable="form1.name1.$invalid" required>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group"
                ng-class="{ 'has-error': form1.industry.$invalid && (form1.$submitted || form1.industry.$touched)}">
                <label class="control-label required col-md-4">甲方行业：</label>
                <div class="col-md-8">
                  <select class="form-control" ng-model="data.industry"
                    name="industry" uib-tooltip="此项为必填项"
                    tooltip-enable="form1.industry.$invalid" required>
                    <#list industryList as industry>
                    <option value="${industry.value}">${industry.text}</option>
                    </#list>
                  </select>
                </div>
              </div>
            </div>
          </div>
         
          <div class="form-group"
            ng-class="{ 'has-error': form1.regionProv.$invalid && (form1.$submitted || form1.regionProv.$touched)}"
            cityselect>
            <label class="control-label required col-md-2">甲方地址：</label>
            <div class="col-md-2">
              <select class="form-control" ng-model="data.regionProv"
                name="regionProv"
                ng-options="prov.v as prov.n for prov in provs" required>
              </select>
            </div>
            <div class="col-md-2" ng-hide="!cities">
              <select class="form-control" name="regionCity"
                ng-model="data.regionCity"
                ng-options="city.v as city.n for city in cities">
              </select>
            </div>
            <div class="col-md-2" ng-hide="!dists">
              <select class="form-control" name="regionDist"
                ng-model="data.regionDist"
                ng-options="dist.v as dist.n for dist in dists">
              </select>
            </div>
            <div class="col-md-2" >
              <div class="form-group"
               ng-class="{ 'has-error': form1.isZhizhuang.$invalid && (form1.$submitted || form1.isZhizhuang.$touched)}">
                <input type="checkbox" name="isZhizhuang" id="isZhizhuang" ng-model="data.isZhizhuang" >直装用户&nbsp;&nbsp;
                <input type="checkbox" name="isAllIndent" id="isAllIndent" ng-model="data.isAllIndent" >允许工人看到平台所有订单
               </div>
            </div>
           
          </div>
          <div class="form-group"
            ng-class="{ 'has-error': form1.addr1.$invalid && (form1.$submitted || form1.addr1.$touched)}">
            <label class="control-label required col-md-2">通信地址：</label>
            <div class="col-md-10">
              <textarea type="text" class="form-control" name="addr1"
                ng-model="data.addr1" uib-tooltip="此项为必填项"
                tooltip-enable="form1.addr1.$invalid" required></textarea>
            </div>
          </div>
          <div class="form-group"
            ng-class="{ 'has-error': form1.remarks.$invalid && (form1.$submitted || form1.remarks.$touched)}">
            <label class="control-label required col-md-2">甲方备注：</label>
            <div class="col-md-10">
              <textarea type="text" class="form-control" name="remarks"
                ng-model="data.remarks" uib-tooltip="此项为必填项"
                tooltip-enable="form1.remarks.$invalid" required></textarea>
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