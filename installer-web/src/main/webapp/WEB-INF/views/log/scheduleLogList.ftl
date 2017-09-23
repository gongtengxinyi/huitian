<#include "/include/common.ftl" />
<title>定时计划日志查询</title>
<#include "/include/common-list.ftl" />
<!--  <script type="text/javascript"
  src="${base}/static/My97DatePicker/WdatePicker.js"></script> -->
 
<script src="static/scripts/log/scheduleLog.js"></script>
</head>
<body>
  <#include "/include/body-begin.ftl" />

  <div ng-controller="schduleLogController">
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
      <div class="panel-heading">定时计划操作记录查询</div>
      <div class="panel-body">
        <div class="row">
        <div class="col-md-6 col-lg-4">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">定时计划类名</label>  
              <div class="col-md-8">    
                <input type="text" class="form-control" ng-keyup="autoQuery($event)" id="className" 
                  ng-model="className">
              </div>
            </div>
          </div>      
               <div class="col-md-6 col-lg-8">
            <div class="row">
              <label class="control-label text-nowrap col-md-4 col-lg-2">操作日期</label>
              <div class="col-md-8 col-lg-10">
                <div class="row">
                  <div class="col-md-6 col-lg-5"  >
                    <p class="input-group">
                      <input type="text" class="form-control" ng-keyup="autoQuery($event)"
                        uib-datepicker-popup ng-model="startDate"
                        is-open="crtDateBegin.opened"
                        datepicker-options="dateOptions"
                        ng-required="true" /> <span
                        class="input-group-btn">
                        <button type="button" class="btn btn-default"
                          ng-click="openCrtDateBegin()">
                          <i class="glyphicon glyphicon-calendar"></i>
                        </button>
                      </span>
                    </p>
                  </div>
                  <div class="col-md-6 col-lg-5">
                    <p class="input-group">
                      <input type="text" class="form-control" ng-keyup="autoQuery($event)"
                        uib-datepicker-popup ng-model="endDate"
                        is-open="crtDateEnd.opened"
                        datepicker-options="dateOptions"
                        ng-required="true" /> <span
                        class="input-group-btn">
                        <button type="button" class="btn btn-default"
                          ng-click="openCrtDateEnd()">
                          <i class="glyphicon glyphicon-calendar"></i>
                        </button>
                      </span>
                    </p>
                  </div>
                </div>
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
<!-- 
日志时间 date
计划名 scheduleName
类名 ClassName
执行结果 ExecuteResult
备注 remarks
 -->
      </div>
    </div>
    <div class="panel panel-default" >
      <table class="table table-bordered table-striped">
        <thead>
          <tr>
            <th width="200px">定时计划名</th>
            <th width="200px">定时计划类名</th>
            <th width="200px">定时计划时间</th>
            <th width="200px">执行结果</th>
            <th >备注</th>               
          </tr>
        </thead>
        <!-- 
        
	private String scheduleName;
	private String className;
	private String executeResult;
	private String remarks;
         -->
        <tbody ng-repeat="data in rows">
          <tr>
            <td>{{data.scheduleName}}</td>
            <td>{{data.className}}</td>
            <td>{{data.date}}</td>
              <td >{{data.executeResult}}</td> 
            <td>{{data.remarks}}</td>         
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