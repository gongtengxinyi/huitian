<#include "/include/common.ftl" />
<title>添加经理人</title>
<#include "/include/common-list.ftl" />
<#include "/include/common-cityselect2.ftl" />

<script src="static/scripts/account/managerJoinJfList.js?randomId=<%=Math.random()%>"></script>
</head>
<body>
  <#include "/include/body-begin.ftl" />
  <div ng-controller="ManagerListController">
<form id="inputForm" name="form1" class="form-horizontal" novalidate >
    <div class="panel panel-default form-horizontal">
      <div class="panel-heading">添加经理人</div>
      <div class="panel-body">
        <div class="row">
         <!--  <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">经理人工号</label>
              <div class="col-md-8">
                <input type="text" class="form-control"
                  ng-model="sf.code1" ng-keyup="autoQuery($event)">
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">经理人姓名</label>
              <div class="col-md-8">
                <input type="text" class="form-control"
                  ng-model="sf.account.name1" ng-keyup="autoQuery($event)">
              </div>
            </div>
          </div> -->
          <div class="col-md-6 col-lg-3">
            <div class="form-group">
             <label class="control-label text-nowrap col-md-4">经理人电话</label>
              <div class="col-md-8">
                <input type="text" class="form-control" name="mobile"
                 ng-pattern="/(^13\d{9}$)|(^14)[5,7]\d{8}$|(^15[0,1,2,3,5,6,7,8,9]\d{8}$)|(^17)[0,1,2,3,5,6,7,8,9]\d{8}$|(^18\d{9}$)/"
                    
                  ng-model="sf.account.mobile" ng-keyup="autoQuery($event)">
                  <div ng-show="form1.mobile.$dirty && form1.mobile.$invalid">
                    <font size="2" color="red">电话格式不正确</font>
                  </div>
              </div>
            </div>
          </div>
         
          <div class="col-md-6 col-lg-3 pull-right">
            
            <button class="btn btn-warning pull-right"
              ng-click="query()">
              <span class="glyphicon glyphicon-search"></span>&nbsp;筛选
            </button>
          
            <!-- <div class="form-group">
              <label class="control-label text-nowrap col-md-4">角色状态</label>
              <div class="col-md-8">
                <select class="form-control" ng-model="sf.roleStatus" ng-change="query()">
                  <#list roleStatusList as item>
                  <option value="${item.value}"<#if
                    item.value=='${sf.roleStatus}'>selected="true"</#if>
                    >${item.text}</option> </#list>
                </select>
              </div>
            </div> -->
          </div>
        </div>
       

    <div class="panel panel-default">
      <table class="table table-bordered table-striped">
        <thead>
          <tr>
            <th>经理人电话</th>
            <th>经理人工号</th>
            <th>经理人姓名</th>
            <th>服务区域</th>
            <th>审核状态</th>
            <th>角色状态</th>
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
            <td>{{data.verifier}}</td>
            <td> <span > <a
                href="manager/managerEdit.do?id={{data.id}}&&status=1"
                class="btn btn-success btn-xs">查看</a>
            </span> <span ng-if="data.apartyId=='' || data.apartyId==null" > <a href="manager/managerJoinJf.do?id={{data.id}}&&status=1" 
                class="btn btn-success btn-xs">添加</a>
            </span> <a href="manager/wkList.do?id={{data.id}}"
              class="btn btn-success btn-xs">工匠列表</a></td>
          </tr>
        </tbody>
      </table>
      <div class="panel-footer"><#include "/include/pagination.ftl" /></div>
    </div>
    </form>
  </div>
  <#include "/include/body-end.ftl" />
</body>
</html>