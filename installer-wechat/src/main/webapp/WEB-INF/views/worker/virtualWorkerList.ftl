<#include "/include/common.ftl" />
<title>工匠管理查询</title>
<#include "/include/common-list.ftl" />
<#include "/include/common-cityselect2.ftl" />



<script src="static/scripts/account/virtualWorkerList.js?randomId=<%=Math.random()%>"></script>
</head>
<body>
  <#include "/include/body-begin.ftl" />
  <div ng-controller="WorkerListController">
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
      <div class="panel-heading">虚拟工匠管理查询</div>
      <div class="panel-body">
        <div class="row">
          <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">工匠账号</label>
              <div class="col-md-8">
                <input type="text" class="form-control"
                  ng-model="sf.account.account" ng-keyup="autoQuery($event)" ng-init="sf.account.account='${sf.account.account}'">
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">工匠姓名</label>
              <div class="col-md-8">
                <input type="text" class="form-control"
                  ng-model="sf.account.name1" ng-keyup="autoQuery($event)" ng-init="sf.account.name1='${sf.account.name1}'">
              </div>
            </div>
          </div>
                    
         
        </div>
        
        
        <div class="row">
         <div class="col-md-6"  col-lg-3">
            <div class="form-group" cityselect2>
              <label class="control-label text-nowrap col-md-4 col-lg-2">服务地区</label>
              <div class="col-md-8 col-lg-10">
                <div class="row">
                  <div class="col-md-4">
                    <select class="form-control" name="regionProv" ng-change="query()" ng-init="sf.regionProv='${sf.regionProv}'"
                      ng-model="sf.regionProv"
                      ng-options="prov.v as prov.n for prov in provs">
                    </select>
                  </div>
                  <div class="col-md-4" ng-hide="!cities">
                    <select class="form-control" name="regionCity"  ng-change="query()" ng-init="sf.regionCity='${sf.regionCity}'"
                      ng-model="sf.regionCity"
                      ng-options="city.v as city.n for city in cities">
                    </select>
                  </div>
                 <!--  <div class="col-md-4" ng-hide="!dists">
                    <select class="form-control" name="regionDist" ng-change="query()" ng-init="sf.regionDist='${sf.regionDist}'"
                      ng-model="sf.regionDist"
                      ng-options="dist.v as dist.n for dist in dists">
                    </select>
                  </div> -->
                </div>
              </div>
            </div>
          </div>
          
         
        </div>
        
        
        
        <div class="row">
          
          <div class="col-md-6 col-lg-3 pull-right">
             <!-- <button class="btn btn-success" ng-click ="$('#dataExcel').tableExport({type: 'excel', escape: 'false'});">导出Excel</button> --> 
            
          
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
            <th>工匠账号</th>
            
            <th>工匠姓名</th>
           
            <th>服务区域</th>
           
            <th>操作</th>
          </tr>
        </thead>
        <tbody ng-repeat="data in rows">
          <tr>
            <td>{{data.account.account}}</td>
          
            <td>{{data.account.name1}}</td>
           
            <td>{{data.serviceCity}}</td>
           
            <td><span ng-if="data.status != 'UNCHECK'"> <a
                href="virtualWorker/virtualWorkerEdit.do?id={{data.id}}&&status=1&&pageNo={{pager.currentPage}}"       
                 class="btn btn-success btn-xs">查看</a>   <!-- worker/workerEdit.do?id={{data.id}}&&status=1&&page={{pager.currentPage}} -->
            </span> <span
              ng-if="data.status == 'PASS' && data.roleStatus == 'ENABLED' && data1.apartyIdDisp=='' && ${controlWorker}==true">
                <a href="worker/controlWorker.do?id={{data.id}}&&status=0&&pageNo={{pager.currentPage}}"
                class="btn btn-success btn-xs">停用角色</a>
            </span> <span
              ng-if="data.status == 'PASS' && data.roleStatus == 'DISABLED' && data1.apartyIdDisp=='' && ${controlWorker}==true">
                <a href="worker/controlWorker.do?id={{data.id}}&&status=1&&pageNo={{pager.currentPage}}"
                class="btn btn-success btn-xs">启用角色</a>
            </span> <span><a href="" ng-click="delWorker()" ng-if="data1.apartyIdDisp=='' || data1.apartyIdDisp==null && ${delWorker}==true"
              class="btn btn-success btn-xs">删除</a></span>
              <span ></span> </td>
          </tr>
        </tbody>
      </table>
      <div class="panel-footer">
        <!--  -->
        <#include "/include/pagination.ftl" />
      </div>
    </div>
  </div>
  <#include "/include/body-end.ftl" />
</body>
</html>