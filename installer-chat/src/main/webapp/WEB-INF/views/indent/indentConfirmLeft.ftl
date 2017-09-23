<#include "/include/common.ftl" />
<title></title>
<#include "/include/common-entry-grid.ftl" />
<!--  -->


<script type="text/javascript" src="static/scripts/indent/indentConfirmLeft.js?randomId=<%=Math.random()%>"></script>
</head>
<body ng-init="data.id='${id}'">
  <#include "/include/body-begin.ftl" />
  <div ng-controller="IndentController">
    <form id="inputForm" name="form1" class="form-horizontal" novalidate >
    <input type="hidden" id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
    <input type="hidden" id="indentId" ng-model="data.indentId" value="${id}" ng-init="data.indentId='${id}'">
      <div class="panel panel-default">
        <div class="panel-heading">确认离开</div>
        <div class="panel-body">
        
        <div class="form-group"
            ng-class="{ 'has-error': form1.remarks.$invalid && (form1.$submitted || form1.remarks.$touched)}">
            <label class="control-label required  col-md-2">备注：</label>
            <div class="col-md-10">
              <textarea type="text" class="form-control" name="remarks"
                ng-model="data.remarks" uib-tooltip=""
                tooltip-enable="form1.remarks.$invalid" required></textarea>
            </div>
          </div>
        
          
           </div>
      </div>
     <div class="form-group">
            <div class="col-md-10 col-md-offset-2">
            <button type="submit" class="btn btn-primary" ng-click="update();">
                <span class="glyphicon glyphicon-ok"></span>保存
             </button>
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