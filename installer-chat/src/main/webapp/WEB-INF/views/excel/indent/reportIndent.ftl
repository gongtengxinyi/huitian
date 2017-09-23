<#include "/include/common.ftl" />
<title>订单导出</title>
<#include "/include/common-list.ftl" />


<script src="static/scripts/excel/indent/reportIndent.js"></script>
</head>
<body>
  <#include "/include/body-begin.ftl" />
  <div ng-controller="IndentListController">
  <form id="inputForm" name="form1" class="form-horizontal" novalidate>
    <div class="panel panel-default form-horizontal">
      <div class="panel-heading">导出订单</div>
      <div class="panel-body">
        <div class="row">
          <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">发布日期</label>
              <div class="col-md-8">
                <div class="row">
                  <div class="col-md-10">
                    <p class="input-group">
                      <input type="text" class="form-control" 
                        uib-datepicker-popup
                        ng-model="data.serviceDate" 
                        is-open="serviceDate.opened"
                        datepicker-options="dateOptions"
                        ng-required="true" ng-keyup="autoQuery($event)"/> <span
                        class="input-group-btn">
                        <button type="button" class="btn btn-default"
                          ng-click="openServiceDate()">
                          <i class="glyphicon glyphicon-calendar"></i>
                        </button>
                      </span>
                    </p>
                  </div>
                  
                </div>
                </div>
            </div>
          </div>
          
          
         
        
        <div class="row">
        
          <div class="col-md-6 col-lg-3 ">
              
            <button class="btn btn-primary" ng-click="exportToday()"
              ng-click="changeWorker()">
              <span class="glyphicon glyphicon-cloud-download"></span>&nbsp;导出今日订单
            </button>&nbsp;
             <button class="btn btn-primary "  ng-click="exportOtherday()"
              ng-click="changeWorker()">
              <span class="glyphicon glyphicon-cloud-download"></span>&nbsp;导出所选日期订单
            </button>&nbsp;
            
          </div>
        </div>
      </div>
    </div>

    
      </table>
     
    </div>
    </form>
  </div>
  <#include "/include/body-end.ftl" />
</body>
</html>