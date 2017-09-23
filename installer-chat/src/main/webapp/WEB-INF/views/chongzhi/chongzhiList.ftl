<#include "/include/common.ftl" />
<title>充值明细</title>
<#include "/include/common-list.ftl" /> <#include "/include/common-cityselect2.ftl" />

<script src="static/scripts/chongzhi/chongzhiList.js?randomId=<%=Math.random()%>"></script>
</head>
<body>
  <#include "/include/body-begin.ftl" />

  <div ng-controller="ChongzhiListController">

    <div class="panel panel-default form-horizontal">
      <div class="panel-heading">账号管理查询</div>
      <div class="panel-body">
        <div class="row">
          <!-- comitDate begin -->
          <div class="col-md-6">
            <div class="row">
              <label class="control-label text-nowrap col-md-4 col-lg-2">充值日期</label>
              <div class="col-md-8 col-lg-10">
                <div class="row">
                  <div class="col-md-6">
                    <p class="input-group">
                      <input type="text" class="form-control"
                        uib-datepicker-popup       
                        ng-model="sf.comitDateBegin"                
                        is-open="comitDateBegin.opened"
                        datepicker-options="dateOptions"
                        ng-required="true" ng-keyup="autoQuery($event)" /> <span
                        class="input-group-btn">
                        <button type="button" class="btn btn-default"
                          ng-click="openComitDateBegin()">
                          <i class="glyphicon glyphicon-calendar"></i>
                        </button>
                      </span>
                    </p>
                  </div>
                  <div class="col-md-6">
                    <p class="input-group">
                      <input type="text" class="form-control"
                        uib-datepicker-popup 
                        ng-model="sf.comitDateEnd"
                        is-open="comitDateEnd.opened"
                        datepicker-options="dateOptions"
                        ng-required="true" ng-keyup="autoQuery($event)" /> <span
                        class="input-group-btn">
                        <button type="button" class="btn btn-default"
                          ng-click="openComitDateEnd()">
                          <i class="glyphicon glyphicon-calendar"></i>
                        </button>
                      </span>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
         
         
          <div class="col-md-6 col-lg-3 pull-right">
            <button class="btn btn-warning pull-right"
              ng-click="">
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
            <th>充值日期</th>
            <th>充值金额</th>
           
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>2016-06-15</td>
            <td>10000</a></td>
            
          </tr>
           <tr>
            <td>2016-05-15</td>
            <td>50000</a></td>
            
          </tr>
           <tr>
            <td>2016-04-15</td>
            <td>50000</a></td>
            
          </tr>
        </tbody>
      </table>

      <div class="panel-footer">
        <!--  -->
        <#include "/include/pagination.ftl" />
      </div>
    </div>
    <#include "/include/body-end.ftl" />
</body>
</html>