<#include "/include/common.ftl" /> <#include "/include/common-entry.ftl"
/>
<!--  -->
<#include "/include/common-cityselect2.ftl" />
<title>审核工人信息</title>

<script type="text/javascript"
  src="static/scripts/account/virtualWorkerEdit.js?randomId=<%=Math.random()%>"></script>
</head>
<body ng-init="data.id='${id}'">
  <#include "/include/body-begin.ftl" />
  <div ng-controller="workerEditController"> 
 
    <form name="form1" class="form-horizontal" novalidate>
      <div class="panel panel-default">
        <div class="panel-heading">虚拟工匠信息</div>
        <div class="panel-body">

          <div class="form-group"
            ng-class="{ 'has-error': form1.user.$invalid && (form1.$submitted || form1.user.$touched)}">
            <label class="control-label required col-md-2">账号：</label>
            <div class="col-md-10">
             <input type="hidden" id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
            <input type="hidden" class="form-control" name="user"
                ng-model="data.id" placeholder="必填项"  required>
              <input type="text" class="form-control" name="user"
                ng-model="data.account.account"  required>
            </div>
          </div>
          <div class="form-group"
            ng-class="{ 'has-error': form1.user.$invalid && (form1.$submitted || form1.user.$touched)}">
            <label class="control-label required col-md-2">姓名：</label>
            <div class="col-md-10">
              <input type="text" class="form-control" name="user"
                ng-model="data.account.name1" placeholder="必填项" required>
            </div>
          </div>
         <div class="form-group"
            ng-class="{'has-error' : form1.regionProv.$invalid && (form1.$submitted || form1.regionProv.$touched)}"
            cityselect2>
            <label class="control-label required col-md-2">服务区域：</label>
            <div class="col-md-2">
              <select class="form-control" name="regionProv"
                ng-model="data.serviceProvince"
                ng-options="prov.v as prov.n for prov in provs" required>
              </select>
            </div>
            <div class="col-md-2" 
              ng-class="{'has-error' : form1.regionCity.$invalid && (form1.$submitted || form1.regionCity.$touched)}">
              <select class="form-control" name="regionCity"
                ng-model="data.serviceCity"
                ng-options="city.v as city.n for city in cities" required ">
              </select>
            </div>
            <!-- <div class="col-md-2" ng-hide="!dists"
              ng-class="{'has-error' : form1.regionDist.$invalid && (form1.$submitted || form1.regionDist.$touched)}">
              <select class="form-control" name="regionDist"
                ng-model="data.serviceCounty"
                ng-options="dist.v as dist.n for dist in dists" required>
              </select>
            </div> -->
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