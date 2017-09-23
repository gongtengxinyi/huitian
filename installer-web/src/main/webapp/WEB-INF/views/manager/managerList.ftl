<#include "/include/common.ftl" />
<title>经理人管理查询</title>
<#include "/include/common-list.ftl" />
<#include "/include/common-cityselect2.ftl" />
 
 
<script type="text/javascript" src="static/tableExport/jquery.base64.js"></script>  
  
<script type="text/javascript" src="static/tableExport/tableExport.js"></script> 
 
<script src="static/scripts/account/managerList.js?randomId=<%=Math.random()%>"></script>
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
      <div class="panel-heading">经理人管理查询</div>
      <div class="panel-body">
        <div class="row">
          <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">经理人工号</label>
              <div class="col-md-8">
                <input type="text" class="form-control"
                  ng-model="sf.code1" ng-keyup="autoQuery($event)" ng-init="sf.code1='${sf.code1}'" >
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">经理人姓名</label>
              <div class="col-md-8">
                <input type="text" class="form-control"
                  ng-model="sf.account.name1" ng-keyup="autoQuery($event)" ng-init="sf.account.name1='${sf.account.name1}'">
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
                    <select class="form-control" name="regionDist" ng-change="query()"
                      ng-model="sf.regionDist"
                      ng-options="dist.v as dist.n for dist in dists">
                    </select>
                  </div>
                </div>
              </div>
            </div>
          </div>
           <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">经理人电话</label>
              <div class="col-md-8">
                <input type="text" class="form-control" 
                  ng-model="sf.account.mobile" ng-keyup="autoQuery($event)" ng-init="sf.account.mobile='${sf.account.mobile}'">
              </div>
            </div>
          </div>
          
          <div class="col-md-6 col-lg-3 pull-right">
            <span >
                <a id="linkAddManager" href="manager/managerJoinJfList.do" ng-if="data1.apartyIdDisp!=''"
                class="btn btn-success btn-xs" >添加经理人</a>
            </span>  &nbsp;&nbsp;&nbsp;
             <button class="btn btn-success" onClick ="$('#dataExcel').tableExport({type: 'excel', escape: 'false'});">导出Excel</button>
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
            <th>经理人电话</th>
            <th>经理人工号</th>
            <th>经理人姓名</th>
            <th>服务区域</th>
            <th>审核状态</th>
            <th>角色状态</th>
            <th>积分</th>            
            <th>审核人</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody ng-repeat="data in rows">
          <tr>
            <td>{{data.account.mobile}}</td>
            <td>{{data.code1}}</td>
            <td>{{data.account.name1}}</td>
            <td>{{data.serveCity}}</td>
            <td>{{data.statusDisp}}</td>
            <td>{{data.roleStatusDisp}}</td>
            <td><a href="score/scoreList.do?workerType=0&&id={{data.id}}&&pageNo={{pager.currentPage}}">{{data.score}}</a></td>
            <td>{{data.verifier}}</td>
            <td> <span ng-if="data.status == 'UNCHECK' && data1.apartyIdDisp=='' && ${checkManager}==true"> <a
                href="manager/managerEdit.do?id={{data.id}}&&status=0&&pageNo={{pager.currentPage}}"
                class="btn btn-success btn-xs">审验资质</a>
            </span><span ng-if="data.status != 'UNCHECK'"> <a
                href="manager/managerEdit.do?id={{data.id}}&&status=1&&pageNo={{pager.currentPage}}"
                class="btn btn-success btn-xs">查看</a>
            </span> <span id="spanStop" 
              ng-if="data.status == 'PASS' && data.roleStatus == 'ENABLED' && data1.apartyIdDisp=='' && ${controlManager}==true">
                <a href="manager/controlManager.do?id={{data.id}}&&status=0&&pageNo={{pager.currentPage}}"
                class="btn btn-success btn-xs">停用角色</a>
            </span> <span id="spanStart"
              ng-if="data.status == 'PASS' && data.roleStatus == 'DISABLED' && data1.apartyIdDisp=='' && ${controlManager}==true">
                <a href="manager/controlManager.do?id={{data.id}}&&status=1&&pageNo={{pager.currentPage}}"
                class="btn btn-success btn-xs">启用角色</a>
            </span> <span ng-if="data1.apartyIdDisp=='' || data1.apartyIdDisp==null && ${delManager}==true"> <a
                href="" ng-click="delManager()"
                class="btn btn-success btn-xs">删除</a>
            </span> <span ng-if="data1.apartyIdDisp!='' && ${delManager}==true"> <a
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