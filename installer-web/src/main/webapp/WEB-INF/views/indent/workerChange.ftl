<#include "/include/common.ftl" />
<title>指定工匠</title>
<#include "/include/common-list.ftl" />
<#include "/include/common-cityselect2.ftl" />

<script type="text/javascript" src="static/tableExport/jquery.base64.js"></script>  
  
<script type="text/javascript" src="static/tableExport/tableExport.js"></script> 

<script src="static/scripts/indent/workerChange.js?randomId=<%=Math.random()%>"></script>
</head>
<body>
  <#include "/include/body-begin.ftl" />
  <div ng-controller="WorkerListController">
    <input type="hidden" id="indentId" value="${id}" ng-init="indentId='${id}'">
    <input type="hidden" id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
    <div class="panel panel-default form-horizontal">
      <div class="panel-heading">指定新的工匠</div>
      <div class="panel-body">
        <div class="row">
          <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">选择经理人</label>
              <div class="col-md-8">
                  <select id="sel" class="form-control" name="managerId"
                    ng-model="data.managerId" required ng-change="showWorker()"> <#list
                    managerList as item>
                    <option value="${item.v}">${item.n}</option> </#list>
                  </select>
                </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3">
             <div class="form-group">
              <label class="control-label text-nowrap col-md-4">选择工匠</label>
              <div class="col-md-8">
                 <!--  <select id="sel" class="form-control" name="workerId"
                    ng-model="data.workerId" required> <#list
                    workerList as item>
                    <option value="${item.v}">${item.n}</option> </#list>
                  </select> -->
                <select class="form-control" name="workerId"
                   ng-model="data.workerId"
                   ng-options="worker.v as worker.n for worker in workers">
                </select>
                </div>
            </div>
          </div>
          
         
        
        <div class="row">
        
          <div class="col-md-6 col-lg-3 pull-right">
              
            <button class="btn btn-warning pull-left"
              ng-click="changeWorker()">
              <span class="glyphicon glyphicon-ok"></span>&nbsp;更换
            </button>&nbsp;
            <button class="btn btn-warning "
              ng-click="goBack()">
              <span class="glyphicon glyphicon-chevron-left"></span>&nbsp;返回
            </button>
          </div>
        </div>
      </div>
    </div>

    
      </table>
     
    </div>
  </div>
  <#include "/include/body-end.ftl" />
</body>
</html>