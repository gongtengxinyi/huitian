<#include "/include/common.ftl" />
<style type="text/css">
</style>
<#include "/include/common-entry.ftl"/>

<script type="text/javascript" src="static/scripts/xmAccount/accountAdd.js"></script>
</head>
<body>
<body>
  <#include "/include/body-begin.ftl" />

  <div ng-controller="AdminAddController">

    <form name="form1" class="form-horizontal" novalidate>
      <div class="panel panel-default">
        <div class="panel-heading">新增用户</div>
        <div class="panel-body">

          <div class="form-group"
            ng-class="{ 'has-error': form1.mobile.$invalid && (form1.$submitted || form1.mobile.$touched)}">
            <label class="control-label required col-md-2">手机号：</label>
            <div class="col-md-10">
              <input type="text" class="form-control" name="mobile"
                ng-model="data.mobile" placeholder="必填项" 
                ng-pattern="/(^13\d{9}$)|(^14)[5,7]\d{8}$|(^15[0,1,2,3,5,6,7,8,9]\d{8}$)|(^17)[0,1,2,3,5,6,7,8,9]\d{8}$|(^18\d{9}$)/"
                required>
                <div ng-show="form1.mobile.$dirty && form1.mobile.$invalid">
                    <font size="2" color="red">电话格式不正确</font>
                  </div>
            </div>
          </div>
                   
          
          <div class="form-group"
            ng-class="{ 'has-error': form1.apartyIdDisp.$invalid && (form1.$submitted || form1.apartyIdDisp.$touched)}">
            <label class="control-label  col-md-2">甲方名称：</label>
            <div class="col-md-4">
              <input type="hidden" name="apartyId"
                ng-model="data.apartyId"
                ng-init="data.apartyId='${data.apartyId}'" />
              <input type="text" ng-model="data.apartyIdDisp"
                name="apartyIdDisp" class="form-control"
                uib-typeahead="pair.text as pair.text for pair in doTypeaheadApartys($viewValue)"
                typeahead-on-select="onTypeaheadApartySelect($item, $model, $label)"
                typeahead-min-length="1" typeahead-loading="loadingTest"
                typeahead-no-results="noResults" uib-tooltip="此项为必填项"
                tooltip-enable="form1.apartyIdDisp.$invalid" 
                ng-init="data.apartyIdDisp='${data.apartyIdDisp}'"
                 >
              <i ng-show="loadingTest"
                class="glyphicon glyphicon-refresh"></i>
              <div ng-show="noResults">
                <i class="glyphicon glyphicon-remove"></i>没有找到相关信息
              </div>
            </div>
          </div>
         
              
          <div class="row">
            <div class="col-md-8 col-md-offset-2">
              <button type="submit" class="btn btn-primary"
                ng-click="save();">
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