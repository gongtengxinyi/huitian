<#include "/include/common.ftl" />
<title></title>
<#include "/include/common-entry-grid.ftl" />
<!--  -->


<script type="text/javascript" src="static/scripts/indent/indentFinish.js?randomId=<%=Math.random()%>"></script>
</head>
<body ng-init="data.id='${id}'">
  <#include "/include/body-begin.ftl" />
  <div ng-controller="IndentController">
    <form id="inputForm" name="form1" class="form-horizontal" novalidate >
    <input type="hidden" id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
    <input type="hidden" id="indentId" ng-model="data.indentId" value="${id}" ng-init="data.indentId='${id}'">
      <div class="panel panel-default">
      <#if type=="indentFinish">
        <div class="panel-heading">强制完成</div>
       </#if>
        <#if type=="returnIndent">
       
        <div class="panel-heading">退回订单</div>
        </#if>
        
        <#if type=="returnMerchant">
       
        <div class="panel-heading">退回商家</div>
        </#if>
        <div class="panel-body">
        
        <div class="form-group"
            ng-class="{ 'has-error': remarks && (form1.$submitted || form1.remarks.$touched)}">
            <label class="control-label required col-md-2">原因：</label>
            <div class="col-md-10">
              <textarea type="text" class="form-control" name="remarks"
                ng-model="data.remarks" uib-tooltip=""
                tooltip-enable="form1.remarks.$invalid" ></textarea>
            </div>
          </div>
         <div class="form-group"
            ng-class="{ 'has-error': form1.checker.$invalid && (form1.$submitted || form1.checker.$touched)}">
            <label class="control-label  col-md-2">审核人：</label>
            <div class="col-md-10">
              <input type="text" class="form-control" name="checker"
                ng-model="data.checker" uib-tooltip=""
                tooltip-enable="form1.checker.$invalid" required></input>
            </div>
          </div>
          
           </div>
      </div>
     <div class="form-group">
            <div class="col-md-10 col-md-offset-2">
             <#if type=="indentFinish">
            <button type="submit" class="btn btn-primary" ng-click="update();">
                <span class="glyphicon glyphicon-ok"></span>保存
             </button>
             </#if>
             <#if type=="returnIndent">
            <button type="submit" class="btn btn-primary" ng-click="update2();">
                <span class="glyphicon glyphicon-ok"></span>保存
             </button>
             </#if>
              <#if type=="returnMerchant">
            <button type="submit" class="btn btn-primary" ng-click="update3();">
                <span class="glyphicon glyphicon-ok"></span>保存
             </button>
             </#if>
             &nbsp;&nbsp;&nbsp;
             
              <button type="button" class="btn btn-success"
                ng-click="goBack();">
                <span class="glyphicon glyphicon-chevron-left"></span>&nbsp;返回
              </button>
               &nbsp;&nbsp;&nbsp;
             
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>
  <#include "/include/body-end.ftl" />
</body>
</html>