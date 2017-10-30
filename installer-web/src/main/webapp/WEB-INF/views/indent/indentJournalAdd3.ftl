<#include "/include/common.ftl" />
<title></title>
<#include "/include/common-entry-grid.ftl" />
<!--  -->


<script type="text/javascript" src="static/scripts/indent/indentJournalAdd3.js?randomId=<%=Math.random()%>"></script>
</head>
<body ng-init="data.id='${id}'">
  <#include "/include/body-begin.ftl" />
  <div ng-controller="IndentController">
    <form id="inputForm" name="form1" class="form-horizontal" novalidate enctype="multipart/form-data">
    <input type="hidden" id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
    <input type="hidden" id="indentId" ng-model="data.indentId" value="${indentId}" ng-init="data.indentId='${indentId}'">
    <input type="hidden" id="journalType" ng-model="data.journalType" value="${journalType}" ng-init="data.journalType='${journalType}'">
      <div class="panel panel-default">
        <div class="panel-heading">
        <#if journalType=="INCOME">收款
        <#else>付款</#if>记账</div>
         <div class="panel panel-default">
        <div class="panel-heading">
 <#if excelList>    
       商家名称：${excelList.get(0).apartyName} &nbsp;&nbsp;  经理人： ${excelList.get(0).managerName}&nbsp;&nbsp;&nbsp;&nbsp; 工人： ${excelList.get(0).workerName} </div>
 </#if>       
        <div class="panel panel-default" ng-cloak>
       
    <table class="table table-bordered table-striped">
      <thead>
        <tr>          
          <th>品类</th>
          <th>产品名称</th>          
          <th>应收数量</th>
          <th>单价</th>
          <th>商家扣款</th>
          <th>商家调整</th>
          <th>应收总金额</th>
          <th>应付数量</th>
          <th>单价</th>
          <th>调整</th>          
          <th>应付总金额</th>
          <th>实际支付总金额</th>
          <th>实际收款总金额</th>
          <th>提报应收账单到财务日期</th>
          <th>提报应付账单到财务日期</th>
          <th>标记收款日期</th>
          <th>标记付款日期</th>
          </tr>
          </thead>
            <tbody>           
<#list excelList as excel>
            <tr>
              <td>${excel.serveSort}</td>
              <td>${excel.productName} </td>
              <td>${excel.indentNumJiafang}&nbsp;${excel.unitJiafang}</td>
              <td>${excel.priceJiafang} </td>
              <td>${excel.deduct_jiafang} </td>
              <td>${excel.tiaozheng_jiafang} </td> 
              <td>${excel.priceSumJiafangNeed} </td> 
              <td>${excel.indentNum}&nbsp;${excel.unit} </td>   
              <td>${excel.price} </td>   
              <td>${excel.tiaozheng_worker+excel.tiaozheng_manager} </td> 
              <td>${excel.priceSumNeed} </td> 
              <td>${excel.realPayFee} </td> 
              <td>${excel.realGainFee} </td> 
              <td>${excel.incomeBillOverDate} </td> 
              <td>${excel.payBillOverDate} </td>  
              <td>${excel.incomeDate} </td> 
              <td>${excel.payDate} </td>                
            </tr>
</#list>
            </tbody>
            </table></div>
          商家调整情况：
        <div>
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>操作人</th>               
                  <th>调整金额</th>
                  <th>调整类别</th>
                  <th>调整原因</th>
                  <th>操作日期</th>
                </tr>
              </thead>
              <tbody>
                <#list jiafangTiaozhengList as jiafangTiaozheng>
                <tr>
                  <td>${jiafangTiaozheng.name1}</td>
                 
                  <td>${jiafangTiaozheng.tiaozhengFee}</td>
                  <td>${jiafangTiaozheng.tiaozhengJiafangTypeDisp}</td>
                  <td>${jiafangTiaozheng.content}</td>
                  <td>${jiafangTiaozheng.createDateStr}</td>
                </tr>
                </#list>
              </tbody>
            </table>

          </div>
          
           工匠调整情况：
        <div>
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>操作人</th>
                  <th>调整金额</th>
                  <th>调整类别</th>
                  <th>调整原因</th>
                  <th>操作日期</th>
                </tr>
              </thead>
              <tbody>
                <#list workerTiaozhengList as workerTiaozheng>
                <tr>
                  <td>${workerTiaozheng.name1}</td>
                 
                  <td>${workerTiaozheng.tiaozhengFee}</td>
                  <td>${workerTiaozheng.tiaozhengWorkerTypeDisp}</td>
                  <td>${workerTiaozheng.content}</td>
                  <td>${workerTiaozheng.createDateStr}</td>
                </tr>
                </#list>
              </tbody>
            </table>
          </div>
        
        <div class="panel-body">
        
         
          <#if journalType=="PAY">
          <div class="form-group" >
            <label class="control-label required  col-md-2">数额：</label>
            <div class="col-md-2">
              <input type="text" numeric id="yanzheng" class="form-control" value="${paySum}"  name="journalFee" ng-pattern="/^[-+]?[0-9]+(\.[0-9]+)?$/"
                ng-model="data.journalFee" uib-tooltip="" ng-init="data.journalFee='${paySum}'"
                tooltip-enable="form1.journalFee.$invalid" required>
            </div>
            <#else>
             <div class="form-group" >
            <label class="control-label required  col-md-2">数额：</label>
            <div class="col-md-2">
              <input type="text" numeric id="yanzheng" class="form-control" name="journalFee" value="${incomeSum}" ng-pattern="/^[-+]?[0-9]+(\.[0-9]+)?$/"
                ng-model="data.journalFee" uib-tooltip="" ng-init="data.journalFee='${incomeSum}'"
                tooltip-enable="form1.journalFee.$invalid" required>
            </div>
            </#if>
          <#if journalType=="PAY">
            <label class="control-label required  col-md-2">质保金：</label>
            <div class="col-md-2">
              <input type="text" numeric id="yanzheng1" class="form-control" value="${indent.deposit }" name="deposit" ng-pattern="/^[-+]?[0-9]+(\.[0-9]+)?$/"
                ng-model="data.deposit" uib-tooltip="" ng-init="data.deposit='${indent.deposit}'"
                tooltip-enable="form1.deposit.$invalid" required>
            </div>
           </#if> 
          </div>
          
         
          
          <div class="form-group"
            ng-class="{ 'has-error': form1.remarks.$invalid && (form1.$submitted || form1.remarks.$touched)}">
            <label class="control-label required  col-md-2">备注：</label>
            <div class="col-md-6">
              <textarea type="text" id="yanzheng2" class="form-control" name="remarks" maxlength="200"
                ng-model="data.remarks" uib-tooltip=""
                tooltip-enable="form1.remarks.$invalid" required></textarea>
            </div>
          </div>
         <div class="form-group">
            <div class="col-md-10 col-md-offset-2">
            <button type="submit" id="saveBtn" class="btn btn-primary" ng-click="update();">
                <span class="glyphicon glyphicon-ok"></span>保存
             </button>
             &nbsp;&nbsp;&nbsp;
             
              <button type="button" class="btn btn-success"
                ng-click="goBack();">
                <span class="glyphicon glyphicon-chevron-left"></span>&nbsp;返回
              </button>
               &nbsp;&nbsp;&nbsp;
             
            </div>
          </div>
         <div>
              <table class="table table-bordered table-striped">
        <thead>
          <tr>
            <th>操作人</th>
            <th>类型</th>
            <th>金额（元）</th>
            <th>备注</th>
            <th>操作日期</th>
            
           
          </tr>
        </thead>
        <tbody >
        <#list journalList as journal>
          <tr>
            <td>${journal.name1}</td>
            <td><#if journalType=="INCOME">收款
        <#else>付款</#if></td>
            <td>${journal.journalFee}</td>
            <td>${journal.remarks}</td>
            <td>${journal.createDateStr}</td>           
          </tr>
          </#list>
        </tbody>
      </table>
          
          </div>
      
          
           </div>
      </div>
      
    
        </div>
      </div>
    </form>
  </div>
  <#include "/include/body-end.ftl" />
</body>
</html>