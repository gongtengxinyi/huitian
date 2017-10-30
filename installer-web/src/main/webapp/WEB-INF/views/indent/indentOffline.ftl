<#include "/include/common.ftl" />
<title></title>
<#include "/include/common-entry-grid.ftl" />
<!--  -->


<script type="text/javascript" src="static/scripts/indent/indentOffline.js?randomId=<%=Math.random()%>"></script>
</head>
<body>
  <#include "/include/body-begin.ftl" />
  <div ng-controller="IndentController">
    <form id="inputForm" name="form1" class="form-horizontal" novalidate enctype="multipart/form-data">
    <input type="hidden" id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
    <input type="hidden" id="stepId"   ng-model="data.stepId"   value="${stepId}"  ng-init="data.stepId='${stepId}'">
        <input type="hidden" id="indentId"  value="${indentId}">
      <div class="panel panel-default">
        <div class="panel-heading">上传节点照片</div>
        <div class="panel-body">
         
         <div class="form-group" >
            <label class="control-label required col-md-2">上传文件：</label>
            <div class="col-md-10">
              <div class="row">
                <div class="col-md-12">
                    <input type="file" name="imgFiles" file-model="file.imgFiles" multiple />
                </div>
              </div>
              <div class="row" ng-repeat="f in file.imgFiles">
                <div class="col-md-12">
                  <span>{{f.name}} 
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
        </div>
      </div>
    </form>
  </div>
  <#include "/include/body-end.ftl" />
</body>
</html>