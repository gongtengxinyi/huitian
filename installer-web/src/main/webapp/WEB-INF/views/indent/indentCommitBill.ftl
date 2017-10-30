<#include "/include/common.ftl" />
<title></title>
<#include "/include/common-entry-grid.ftl" />
<!--  -->


<script type="text/javascript" src="static/scripts/indent/indentCommitBill.js?randomId=<%=Math.random()%>"></script>
</head>
<body ng-init="data.id='${id}'">
  <#include "/include/body-begin.ftl" />
  <div ng-controller="IndentController">
    <form id="inputForm" name="form1" class="form-horizontal" novalidate enctype="multipart/form-data">
    <input type="hidden" id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
    <input type="hidden" id="indentId" ng-model="data.indentId" value="${indentId}" ng-init="data.indentId='${indentId}'">
    
      <div class="panel panel-default">
        <div class="panel-heading">标记提报应收应付账单
       </div>
         <div class="panel panel-default">
        <div class="panel-heading">
<#if excelList>
       商家名称：${excelList.get(0).apartyName} &nbsp;&nbsp;  经理人： ${excelList.get(0).managerName}&nbsp;&nbsp;&nbsp;&nbsp; 工人： ${excelList.get(0).workerName}<p>
       业主姓名：${excelList.get(0).contactName} &nbsp;&nbsp; 电话：${excelList.get(0).contactMobile} &nbsp;&nbsp;  地址：${excelList.get(0).contactrAddress} &nbsp;&nbsp;  </div>
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
          <th>已收款</th>
          <th>已付款</th>
          <th>提报结算日期</th>
          <th>应收账单提报日期</th>
          <th>应付账单提报日期</th>
          <th>提报应收账单到财务日期</th>
          <th>提报应付账单到财务日期</th>
          </tr>
          </thead>
            <tbody>           
<#list excelList as excel>
            <tr>
              <td>${excel.serveSort}</td>
              <td>${excel.productName} </td>
              <td> ${excel.indentNumJiafang}&nbsp;${excel.unitJiafang}</td>
              <td>${excel.priceJiafang} </td>
              <td>${excel.deduct_jiafang} </td>
              <td>${excel.tiaozheng_jiafang} </td> 
              <td>${excel.priceSumJiafangNeed} </td> 
              <td>${excel.indentNum}&nbsp;${excel.unit} </td>   
              <td>${excel.price} </td>   
              <td>${excel.tiaozheng_worker+excel.tiaozheng_manager} </td>   
              <td>${excel.priceSumNeed} </td> 
              <td>${excel.incomeSum} </td> 
              <td>${excel.paySum} </td> 
              <td>${excel.qaJiesuanDate} </td> 
              <td>${excel.incomeBillDate} </td> 
              <td>${excel.payBillDate} </td>    
              <td>${excel.incomeBillOverDate} </td> 
              <td>${excel.payBillOverDate} </td>              
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
        
         <div>
         
         </div>
          
         
         <div class="form-group">
            <div class="col-md-10 col-md-offset-2">
            <#if qaJiesuan!='VERIFY'>
                  
             
              <span  class="label label-info">&nbsp; 品控尚未提报结算 </span>
            
            </#if>
 <#if excelList>           
            <#if excelList.get(0).incomeBillDate==null && qaJiesuan='VERIFY'> <!-- 如果已经有日期说明已经标记过，则不显示 -->
             <button type="submit" class="btn btn-primary" ng-click="commitBill('INCOME');">
                <span class="glyphicon glyphicon-ok"></span>标记已提报应收账单
             </button>
            </#if>
            <#if excelList.get(0).payBillDate==null && qaJiesuan='VERIFY'> <!-- 如果已经有日期说明已经标记过，则不显示 -->
            <button class="btn btn-primary" ng-click="commitBill('PAY');">
                <span class="glyphicon glyphicon-ok"></span>标记已提报应付账单
             </button>
             </#if>
             <#if excelList.get(0).incomeBillDate!=null && excelList.get(0).incomeBillOverDate==null && qaJiesuan='VERIFY'  > <!-- 如果已经标记过，但没提报财务，则显示 -->
             <button type="submit" class="btn btn-primary" ng-click="commitBill('INCOMEOVER');">
                <span class="glyphicon glyphicon-ok"></span>提报应收账单到财务
             </button>
            </#if>
              <#if excelList.get(0).payBillDate!=null && excelList.get(0).payBillOverDate==null && qaJiesuan='VERIFY'> <!-- 如果已经标记过，但没提报财务，则显示 -->
            <button class="btn btn-primary" ng-click="commitBill('PAYOVER');">
                <span class="glyphicon glyphicon-ok"></span>提报应付账单到财务
             </button>
             </#if>
 </#if>
             &nbsp;&nbsp;&nbsp;
             
              <button type="button" class="btn btn-success"
                ng-click="goBack();">
                <span class="glyphicon glyphicon-chevron-left"></span>&nbsp;返回
              </button>
               &nbsp;&nbsp;&nbsp;
             
            </div>
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