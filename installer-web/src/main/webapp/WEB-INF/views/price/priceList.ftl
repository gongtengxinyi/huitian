<#include "/include/common.ftl" />
<title>项目管理查询</title>
<#include "/include/common-list.ftl" />
<!--  <script type="text/javascript"
  src="${base}/static/My97DatePicker/WdatePicker.js"></script> -->
 
<script src="static/scripts/price/priceList.js?randomId=<%=Math.random()%>"></script>
</head>
<body>
  <#include "/include/body-begin.ftl" />

  <div ng-controller="PriceListController">
    <input type="hidden" id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
    <div class="panel panel-default form-horizontal">
      <div class="panel-heading">价格体系查询</div>
      <div class="panel-body">
        <div class="row">
        <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">价格体系名称</label>
              <div class="col-md-8">
                <input type="text" class="form-control" ng-keyup="autoQuery($event)" id="priceName" 
                  ng-model="sf.priceName" ng-init="sf.priceName='${data.priceName}'" >
              </div>
            </div>
          </div>
        
          
          <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">状态</label>
              <div class="col-md-8">
                <select class="form-control" ng-model="sf.status" ng-change="query()">
                  <#list itemStatusList as s>
                  <option value="${s.value}"<#if
                    s.value=='${sf.status}'>selected="true"</#if>
                    >${s.text}</option> </#list>
                </select>
              </div>
            </div>
          </div>
          
        </div>
        
        <div class="row">
          <div class="col-md-3 pull-right">
            <button class="btn btn-warning pull-right"
              ng-click="query()">
              <span class="glyphicon glyphicon-search"></span>&nbsp;筛选
            </button>
          </div>
        </div>

      </div>
    </div>
    <div class="panel panel-default">
      <table class="table table-bordered table-striped">
        <thead>
          <tr>            
            <th>名称</th>
            <th>备注</th>           
            <th width="100px">状态</th>
            <th width="120px">操作</th>
          </tr>
        </thead>
        <tbody ng-repeat="data in rows">
          <tr>            
            <td><a href="price/priceEdit.do?id={{data.id}}&&pageNo={{pager.currentPage}}">{{data.priceName}}</a></td>
            <td>{{data.remarks}}</td>            
            <td>{{data.statusDisp}}</td>
            <td>
              <span ng-if="data.status=='NORMAL' && ${priceStatus}==true" class="btn btn-success btn-xs">
                    <a class="btn btn-success btn-xs"  href="price/priceStatus.do?status=0&&id={{data.id}}&&pageNo={{pager.currentPage}}">停用</a></span>
              <span ng-if="data.status=='STOP' && ${priceStatus}==true" class="btn btn-success btn-xs">
                    <a class="btn btn-success btn-xs" href="price/priceStatus.do?status=1&&id={{data.id}}&&pageNo={{pager.currentPage}}">启用</a></span>
            </td>
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