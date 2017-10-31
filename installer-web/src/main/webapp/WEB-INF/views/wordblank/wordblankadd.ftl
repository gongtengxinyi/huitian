<#include "/include/common.ftl" />
<title>新增毛坯</title>
<style type="text/css">
.grid {
  width: 100%;
  height: 140px;
}
</style>
<#include "/include/common-entry-grid.ftl" />
 <#include "/include/common-cityselect.ftl" />

<script src="static/scripts/wordblank/wordblank.js?randomId=<%=Math.random()%>"></script>

</head>

<body>

  <#include "/include/body-begin.ftl" />

  <div ng-controller="wordblankAddController">

    <form name="form1" class="form-horizontal" novalidate>
      <div class="panel panel-default">
        <div class="panel-heading">毛坯基本信息</div>
        <div class="panel-body">

          <div class="row">
             <div class="col-md-4">
              <div class="form-group"
                ng-class="{ 'has-error': form1.maopiWeight.$invalid && (form1.$submitted || form1.maopiWeight.$touched)}">
                <label for="maopiWeight"
                  class="control-label required col-md-4">克重：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="maopiWeight"
                    name="maopiWeight" ng-model="data.maopiWeight"
                    uib-tooltip="此项为必填项"
                    tooltip-enable="form1.maopiWeight.$invalid" required>
                </div>
              </div>
            </div>
          
            <div class="col-md-4">
              <div class="form-group"
                ng-class="{ 'has-error': form1.maopiWidth.$invalid && (form1.$submitted || form1.maopiWidth.$touched)}">
                <label for="maopiWidth"
                  class="control-label required col-md-4">宽度：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="maopiWidth"
                    name="maopiWidth" ng-model="data.maopiWidth"
                    uib-tooltip="此项为必填项"
                    tooltip-enable="form1.maopiWidth.$invalid" required>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group"
                ng-class="{ 'has-error': form1.maopiPrice.$invalid && (form1.$submitted || form1.maopiPrice.$touched)}">
                <label class="control-label required col-md-4">价格：</label>
                <div class="col-md-8">
            <input type="text" class="form-control" id="maopiPrice"
                    name="maopiPrice" ng-model="data.maopiPrice"
                    uib-tooltip="此项为必填项"
                    tooltip-enable="form1.maopiPrice.$invalid" required>
                </div>
              </div>
            </div>
          </div>
          
                <div class="row">
             <div class="col-md-4">
              <div class="form-group"
                ng-class="{ 'has-error': form1.material.$invalid && (form1.$submitted || form1.material.$touched)}">
                <label for="material"
                  class="control-label required col-md-4">材质：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="material"
                    name="material" ng-model="data.material"
                    uib-tooltip="此项为必填项"
                    tooltip-enable="form1.material.$invalid" required>
                </div>
              </div>
            </div>
          
            <div class="col-md-4">
              <div class="form-group"
                ng-class="{ 'has-error': form1.name1.$invalid && (form1.$submitted || form1.name1.$touched)}">
                <label for="name1"
                  class="control-label required col-md-4">毛坯名称：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="name1"
                    name="name1" ng-model="data.name1"
                    uib-tooltip="此项为必填项"
                    tooltip-enable="form1.name1.$invalid" required>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group"
                ng-class="{ 'has-error': form1.imageTypeId.$invalid && (form1.$submitted || form1.imageTypeId.$touched)}">
                <label for="imageTypeId"
                  class="control-label required col-md-4">上传图片：</label>
                 <div class="col-md-8">
                 	<input type="file" name="imgFiles" file-model="file.imgFiles"
										accept="image/jpeg,image/png,image/gif,image/jpg" multiple />
                </div>
              </div>
            </div>
<!--               <div class="col-md-4"> -->
<!--               <div class="form-group" -->
<!--                 ng-class="{ 'has-error': form1.file.$invalid && (form1.$submitted || form1.file.$touched)}"> -->
<!--                 <label for="file" -->
<!--                   class="control-label required col-md-4">毛坯名称：</label> -->
<!--                 <div class="col-md-8"> -->
<!--                   <input type="file" class="form-control" id="file" -->
<!--                     name="file" ng-model="data.file" -->
<!--                     uib-tooltip="此项为必填项" -->
<!--                     tooltip-enable="form1.file.$invalid" required> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
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