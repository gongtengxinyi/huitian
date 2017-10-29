<#include "/include/common.ftl" />
<title>图片管理查询</title>
<#include "/include/common-list.ftl" />
<#include "/include/common-cityselect2.ftl" />
 
 
<script type="text/javascript" src="static/tableExport/jquery.base64.js"></script>  
  
<script type="text/javascript" src="static/tableExport/tableExport.js"></script> 
 
<script src="static/scripts/image/imageList.js?randomId=<%=Math.random()%>"></script>
</head>
<body>
  <#include "/include/body-begin.ftl" />
  <div ng-controller="ManagerListController">
  <p>
   <p align="right"> <a href="javascript:;" id="toggle_keleyi_com" target="_self">
    筛选面板收起&lt;&lt;</a>&nbsp;&nbsp;&nbsp;&nbsp;</p>
    <script type="text/javascript">
      $(function() {
        $("#toggle_kel" + "eyi_com").click(function() {
          $(this).text($("#content").is(":hidden") ? "筛选面板收起<<" : "筛选面板展开>>");
          $("#content").slideToggle();
        });
      });
    </script>
    <input type="hidden" id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
    <div class="panel panel-default form-horizontal" id="content"  style="display: yes;">
      <div class="panel-heading">图片管理查询</div>
      <div class="panel-body">
        <div class="row">
          <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">图片类别</label>
              <div class="col-md-8">
                <input type="text" class="form-control"
                  ng-model="sf.code1" ng-keyup="autoQuery($event)" ng-init="sf.code1='${sf.code1}'" >
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">图片名称</label>
              <div class="col-md-8">
                <input type="text" class="form-control"
                  ng-model="sf.account.name1" ng-keyup="autoQuery($event)" ng-init="sf.account.name1='${sf.account.name1}'">
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 col-lg-3 pull-right">
            <span >
                <a id="linkAddManager" href="manager/managerJoinJfList.do"
                class="btn btn-success btn-xs" >添加图片</a>
            </span>  &nbsp;&nbsp;&nbsp;
            <button class="btn btn-warning pull-right"
              ng-click="query()">
              <span class="glyphicon glyphicon-search"></span>&nbsp;筛选
            </button>
          </div>
        </div>
      </div>
    </div>

    <div class="panel panel-default">
      <table id="dataExcel" class="table table-bordered table-striped">
        <thead>
          <tr>
            <th>图案类别</th>
            <th>图案编码</th>
            <th>图片名字</th>
            <th>图片url</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody ng-repeat="data in rows">
          <tr>
            <td>{{imageList.picType}}</td>
            <td>{{imageList.picCode}}</td>
            <td>{{imageList.imgName}}</td>
            <td>{{imageList.imgUrl}}</td>
            <td><a href="score/scoreList.do?workerType=0&&id={{data.id}}&&pageNo={{pager.currentPage}}">{{data.score}}</a></td>
            <td>{{data.verifier}}</td>
            <td> <span id="spanStop" 
              ng-if="data.status == 'PASS' && data.roleStatus == 'ENABLED' && data1.apartyIdDisp=='' && ${controlManager}==true">
                <a href="manager/controlManager.do?id={{data.id}}&&status=0&&pageNo={{pager.currentPage}}"
                class="btn btn-success btn-xs">停用</a>
            </span> <span id="spanStart"
              ng-if="data.status == 'PASS' && data.roleStatus == 'DISABLED' && data1.apartyIdDisp=='' && ${controlManager}==true">
                <a href="manager/controlManager.do?id={{data.id}}&&status=1&&pageNo={{pager.currentPage}}"
                class="btn btn-success btn-xs">启用</a>
            </span>  <span ng-if="data1.apartyIdDisp!='' && ${delManager}==true"> <a
                href="" ng-click="delJfManager()"
                class="btn btn-success btn-xs">删除</a>
            </span> <a href="manager/wkList.do?id={{data.id}}&&pageNo={{pager.currentPage}}"
              class="btn btn-success btn-xs">工匠列表</a></td>
          </tr>
        </tbody>
      </table>
      <div class="panel-footer"><#include "/include/pagination.ftl" /></div>
    </div>
  </div>
  <#include "/include/body-end.ftl" />
</body>
</html>