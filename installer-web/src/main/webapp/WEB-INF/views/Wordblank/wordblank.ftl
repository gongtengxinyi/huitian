<#include "/include/common.ftl" />
<title>毛坯管理查询</title>
<#include "/include/common-list.ftl" />
<#include "/include/common-cityselect2.ftl" />

<script type="text/javascript" src="static/tableExport/jquery.base64.js"></script>    
<script type="text/javascript" src="static/tableExport/tableExport.js"></script> 

<script src="static/scripts/account/workerList.js?randomId=<%=Math.random()%>"></script>
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
      <div class="panel-heading">毛坯管理查询</div>
      <div class="panel-body">
        <div class="row">
          <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">工匠工号</label>
              <div class="col-md-8">
                <input type="text" class="form-control"
                  ng-model="sf.code1" ng-keyup="autoQuery($event)" ng-init="sf.code1='${sf.code1}'">
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
          
          <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">工匠电话</label>
              <div class="col-md-8">
                <input type="text" class="form-control"
                  ng-model="sf.account.mobile" ng-keyup="autoQuery($event)" ng-init="sf.account.mobile='${sf.account.mobile}'">
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">审核状态</label>
              <div class="col-md-8">
                <select class="form-control" ng-model="sf.status" ng-change="query()" ng-init="sf.status='${sf.status}'">
                  <#list checkStatusList as item>
                  <option value="${item.value}"<#if
                    item.value=='${sf.status}'>selected="true"</#if>
                    >${item.text}</option> </#list>
                </select>
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
                  <div class="col-md-4" ng-hide="!dists">
                    <select class="form-control" name="regionDist" ng-change="query()" ng-init="sf.regionDist='${sf.regionDist}'"
                      ng-model="sf.regionDist"
                      ng-options="dist.v as dist.n for dist in dists">
                    </select>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4"  >
             <div class="form-group">
              <label class="control-label text-nowrap col-md-4">经理人</label>
              <div class="col-md-8">
                <input type="text" class="form-control" ng-init="sf.managerName='${sf.managerName}'"
                  ng-model="sf.managerName" ng-keyup="autoQuery($event)"> 
              </div>
            </div>
          </div>
         
        </div>
        
        
        
        <div class="row">
          <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">角色状态</label>
              <div class="col-md-8">
                <select class="form-control" ng-model="sf.roleStatus" ng-change="query()" ng-init="sf.roleStatus='${sf.roleStatus}'">
                  <#list roleStatusList as item>
                  <option value="${item.value}"<#if
                    item.value=='${sf.roleStatus}'>selected="true"</#if>
                    >${item.text}</option> </#list>
                </select>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3 pull-right">
             <!-- <button class="btn btn-success" ng-click ="$('#dataExcel').tableExport({type: 'excel', escape: 'false'});">导出Excel</button> --> 
            
            <button class="btn btn-primary pull-right" ng-click="export()">
              <span class="glyphicon glyphicon-cloud-download"></span>&nbsp;导出所有工匠
            </button>
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
            <th>工匠电话</th>
            <th>工匠工号</th>
            <th>工匠姓名</th>
            <th>经理人</th>
            <th>服务区域</th>
            <th>审核状态</th>
            <th>角色状态</th>
            <th>积分</th>
            <th>等级</th>
            <th>审核人</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody ng-repeat="data in rows">
          <tr>
            <td>{{data.account.mobile}}</td>
            <td>{{data.code1}}</td>
            <td>{{data.account.name1}}</td>
            <td>{{data.managerIdDisp}}</td>
            <td>{{data.serviceCity}}</td>
            <td>{{data.statusDisp}}</td>
            <td>{{data.roleStatusDisp}}</td>
            <td><a href="score/scoreList.do?workerType=1&&id={{data.id}}&&pageNo={{pager.currentPage}}">{{data.score}}</a></td>
            <td>{{data.levelName}}</td>
            <td>{{data.verifier}}</td>
            <td><span ng-if="data.status == 'UNCHECK' && data1.apartyIdDisp=='' && ${checkWorker}==true"> <a
                href="worker/workerEdit.do?id={{data.id}}&&status=0&&pageNo={{pager.currentPage}}"
                 class="btn btn-success btn-xs">审验资质</a>
            </span> <span ng-if="data.status != 'UNCHECK'"> <a
                href="worker/workerEdit.do?id={{data.id}}&&status=1&&pageNo={{pager.currentPage}}"       
                 class="btn btn-success btn-xs">查看</a>   <!-- worker/workerEdit.do?id={{data.id}}&&status=1&&page={{pager.currentPage}} -->
            </span> <span
              ng-if="data.status == 'PASS' && data.roleStatus == 'ENABLED' && data1.apartyIdDisp=='' && ${controlWorker}==true">
                <a href="worker/controlWorker.do?id={{data.id}}&&status=0&&pageNo={{pager.currentPage}}"
                class="btn btn-success btn-xs">停用角色</a>
            </span> <span
              ng-if="data.status == 'PASS' && data.roleStatus == 'DISABLED' && data1.apartyIdDisp=='' && ${controlWorker}==true">
                <a href="worker/controlWorker.do?id={{data.id}}&&status=1&&pageNo={{pager.currentPage}}"
                class="btn btn-success btn-xs">启用角色</a>
            </span><span
              ng-if="data.vehicleStatus == 'UNCHECK' && data.holdWay != 'NONE' && ${checkVehicle}==true">
                <a href="worker/vehicleEdit.do?id={{data.id}}&&status=0&&pageNo={{pager.currentPage}}"
                class="btn btn-success btn-xs">审验车辆</a>
            </span><span
              ng-if="data.vehicleStatus != 'UNCHECK' && data.holdWay != 'NONE' && data1.apartyIdDisp==''">
                <a href="worker/vehicleEdit.do?id={{data.id}}&&status=1&&pageNo={{pager.currentPage}}"
                class="btn btn-success btn-xs">查看车辆</a>
            </span>  <span
              ng-if="data1.apartyIdDisp==''">
              <a href="worker/mgrList.do?id={{data.id}}&&pageNo={{pager.currentPage}}"
              class="btn btn-success btn-xs">经理人列表</a>
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