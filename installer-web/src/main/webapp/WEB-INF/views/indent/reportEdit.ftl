<#include "/include/common.ftl" />
<style type="text/css">
.grid {
  width: 100%;
  height: 140px;
}
</style>
<title>订单异常信息</title>

<#include "/include/common-entry-grid.ftl" />
<#include "/include/photoswipe.ftl" />
<!--  -->
<script src="static/js/jwplayer.js"></script>
<script src="static/scripts/indent/reportEdit.js?randomId=<%=Math.random()%>"></script>

</head>

<body ng-init="data.id='${id}'">
  <#include "/include/body-begin.ftl" />

  <div ng-controller="manageExceptionController">

    <form name="form1" class="form-horizontal" novalidate>
    <input type="hidden" id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
      <div class="panel panel-default">
        <div class="panel-heading">修改安装总结</div>
        <div class="panel-body">
          
          <div class="row">
          <div class="col-md-12">
            <div class="form-group">
              <label class="control-label col-md-2">工人安装总结：</label>
              <div class="col-md-10">
                <textarea type="text" class="form-control" disabled
                  name="reportContent" ng-model="data.reportContent" ng-init="data.reportContent='${reportContent}'"></textarea>
              </div>
            </div>
            </div>
          </div>
          <div class="row">
          <div class="col-md-12">
            <div class="form-group">
              <label class="control-label col-md-2">品控安装总结：</label>
              <div class="col-md-10">
                <textarea type="text" class="form-control" 
                   ng-model="data.reportContentQA" ng-init="data.reportContentQA='${reportContentQA}'"></textarea>
              </div>
            </div>
            </div>
          </div>      
          <div class="row">
            <div class="col-md-10 col-md-offset-2">
             <#if updateExc==true>
              <button ng-if="data.executeStatus != 'AFTER'" type="submit" class="btn btn-primary"
                ng-click="save();">
                <span class="glyphicon glyphicon-ok"></span>&nbsp;保存
              </button>
             </#if>
              <span ng-if="data.executeStatus != 'AFTER'">&nbsp;&nbsp;&nbsp;</span>
              <button type="button" class="btn btn-success" onclick="window.close()">
                <!-- ng-click="goBack();" -->
                <span class="glyphicon glyphicon-chevron-left"></span>&nbsp;关闭
              </button>
            </div>
          </div>
        </div>
      </div>
    </form>
    
    
  </div>
    <#include "/include/body-end.ftl" />
</body>
</html>
