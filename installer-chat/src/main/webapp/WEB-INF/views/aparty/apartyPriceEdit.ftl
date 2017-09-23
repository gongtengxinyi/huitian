<#include "/include/common.ftl" />
<title>新增项目</title>
<style type="text/css">
.grid {
  width: 100%;
  height: 140px;
}
</style>
<#include "/include/common-entry-grid.ftl" />
<!--  -->


<script src="static/scripts/aparty/apartyPriceEdit.js?randomId=<%=Math.random()%>"></script>

</head>

<body >
 

  <#include "/include/body-begin.ftl" />
  <div ng-controller="ItemController" >

    <form name="form1" class="form-horizontal" novalidate>   
    <input type="hidden" id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
      <div class="panel panel-default">
        <div class="panel-heading">价格体系</div>
        <div class="panel-body">
	        <div class="form-group">
	            <label for="priceName" class="control-label required col-md-2">价格名称： </label>
	            <div class="col-md-4">
	             <input type="hidden" class="form-control" id="apartyId" value="${apartyId}" ng-model="data.id" ng-init="data.id='${apartyId}'"/> 
	               <input type="text" class="form-control" name="apartyName" value="${apartyName}" disabled/>           
	            </div>
	        </div>
	         <div class="form-group"
            ng-class="{ 'has-error': form1.remarks.$invalid && (form1.$submitted || form1.remarks.$touched)}">
            <label for="remarks" class="control-label  col-md-2">备注：</label>
            <div class="col-md-10">
              <textarea class="form-control" name="remarks"
                ng-model="data.remarks" uib-tooltip="此项为必填项"
                tooltip-enable="form1.remarks.$invalid" ></textarea>
            </div>
          </div>
	         <div class="col-md-10 col-md-offset-2">
            <button type="button" class="btn btn-success pull-right" ng-click="goBack()">
              <span class="glyphicon glyphicon-chevron-left"  ></span>&nbsp;返回
            </button>
            <button type="submit" class="btn btn-primary pull-right" ng-click="save()"> 
              <span class="glyphicon glyphicon-ok"></span>&nbsp;保存
            </button>
            &nbsp;&nbsp;&nbsp;
           
          </div>
       </div>
      <div class="panel panel-default">
        <div class="panel-heading">报价信息</div>
        <div class="panel-body">
          <table class="table table-bordered" id="offer">
            <thead>
              <tr>
                <th>类型</th>
                <th>类别</th>
                <th>内容</th>
                <th>单位</th>
                <th>报价</th>
             <!--    <th>工人收入</th>
                <th>合伙人收入</th>
               <th>利润率%</th> -->
              </tr>
            </thead>
             <tbody>
         
           </tbody>
          </table>
        </div>
      </div>

         
        </div>
      </div>
    </form>
  </div>
  <#include "/include/body-end.ftl" />
</body>
<script type="text/javascript">
  function jian(index) {
    if (isNaN($("#workerRate" + index).val()) || isNaN($("#managerRate" + index).val())) {
      $("#profitRate" + index).val("");
    } else {
      $("#profitRate" + index).val(
          eval(100 - $("#workerRate" + index).val() - $("#managerRate" + index).val()))
    }
  }
</script>
</html>