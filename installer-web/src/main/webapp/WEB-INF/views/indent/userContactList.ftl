<#include "/include/common.ftl" />
<title>订单管理查询</title>
<#include "/include/common-list.ftl" />

<script src="static/scripts/indent/userContactList.js?randomId=<%=Math.random()%>"></script>
</head>
<body ng-init="data.indentId='${indentId}'">
  <#include "/include/body-begin.ftl" />
  <div ng-controller="IndentExceptionController">
   <input type="hidden" id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
    <div class="row">
      <div class="col-md-12">
        <ol class="breadcrumb">
          <li><a href="home/homepage.do"><span
              class="glyphicon glyphicon-home"></span>&nbsp;Home</a></li>
          <li><a><span
              class="glyphicon glyphicon-triangle-right"></span>&nbsp;订单管理</a></li>
          <li><a href="indent/indentList.do"><span
              class="glyphicon glyphicon-triangle-right"></span>&nbsp;全部订单</a></li>
          <li><a ng-click="goBack();"><span
              class="glyphicon glyphicon-triangle-right"></span>&nbsp;订单节点</a></li>
          <li class="active"><span
            class="glyphicon glyphicon-triangle-bottom"></span>&nbsp;业主留言</li>
        </ol>
      </div>
    </div>

    <div class="panel panel-default">
      <div class="panel-heading">业主留言列表</div>
      <div class="panel-body">
        <table class="table table-bordered table-striped">
          <thead>
            <tr>
              <th width="100px">留言日期</th>
              <th>留言内容</th>
             <!--  <th>处理结果</th> -->
              <th>回复内容</th>
              <th>回复人</th>
              <th>回复日期</th>
              <th>操作</th>
            </tr>
          </thead>
     
          <tbody ng-repeat="data in rows">
            <tr>
              <td>{{data.timeDate}}</td>
              <td>{{data.speak}}</td>     
        
            <!--    <td>{{data.resultDisp}}</td> -->
               <td>{{data.answer}}</td>
               <td>{{data.adminName1}}</td>
               <td>{{data.answerDateStr}}</td>
              <td><a href="userContact/manageUserContact.do?id={{data.id}}" class="btn btn-success btn-xs">详细信息</a></td>
            </tr>
          </tbody>
       
        </table>
        <div class="row">
          <div class="col-md-12">
            <button type="button" class="btn btn-success pull-right"
              ng-click="goBack();">
              <span class="glyphicon glyphicon-chevron-left"></span>&nbsp;返回
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <#include "/include/body-end.ftl" />
</body>
</html>