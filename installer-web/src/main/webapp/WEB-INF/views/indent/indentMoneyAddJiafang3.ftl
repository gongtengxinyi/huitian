<#include "/include/common.ftl" />
<title></title>
<#include "/include/common-entry-grid.ftl" />
<!--  -->


<script type="text/javascript" src="static/scripts/indent/indentMoneyAddJiafang3.js?randomId=<%=Math.random()%>"></script>
</head>
<body ng-init="data.id='${id}'">
  <#include "/include/body-begin.ftl" />
  <div ng-controller="IndentController">
    <form id="inputForm" name="form1" class="form-horizontal" novalidate enctype="multipart/form-data">
    <input type="hidden" id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
    <input type="hidden" id="indentId" ng-model="data.indentId" value="${indentId}" ng-init="data.indentId='${indentId}'">
      <div class="panel panel-default">
        <div class="panel-heading">记账调整</div>
        <div class="panel-body">
        
          <div class="form-group"
            ng-class="{ 'has-error': form1.tiaozhengType.$invalid && (form1.$submitted || form1.tiaozhengType.$touched)}">
            <label class="control-label required  col-md-2">调整类型：</label>
            <div class="col-md-2">
              <select id="selType" class="form-control" name="tiaozhengType" required
                    ng-model="data.tiaozhengType"  > <#list
                    indentMoneyList as item>
                    <option value="${item.value}">${item.text}</option> </#list>
                  </select>
            </div>
            <div class="col-md-2" ng-class="{ 'has-error': form1.tiaozhengJiafangType.$invalid && (form1.$submitted || form1.tiaozhengJiafangType.$touched)}">
              <select id="sel" class="form-control" name="tiaozhengJiafangType"  required
                    ng-model="data.tiaozhengJiafangType" >
                    <#list tiaozhengJiafangTypeList as item>
                    <option value="${item.value}">${item.text}</option> </#list>
                  </select>
             </div>
          </div>
          
          <div class="form-group"
            ng-class="{ 'has-error': form1.tiaozhengFee.$invalid && (form1.$submitted || form1.tiaozhengFee.$touched)}">
            <label class="control-label required  col-md-2">数额：</label>
            <div class="col-md-2">
              <input type="text" numeric class="form-control" name="tiaozhengFee" ng-pattern="/^[-+]?[0-9]+(\.[0-9]+)?$/"
                ng-model="data.tiaozhengFee" uib-tooltip=""
                tooltip-enable="form1.tiaozhengFee.$invalid" required>
            </div>
          </div>
          
          <div class="form-group"
            ng-class="{ 'has-error': form1.content.$invalid && (form1.$submitted || form1.content.$touched)}">
            <label class="control-label required  col-md-2">调整原因：</label>
            <div class="col-md-6">
              <textarea type="text" class="form-control" name="content" maxlength="100"
                ng-model="data.content" uib-tooltip=""
                tooltip-enable="form1.content.$invalid" required></textarea>
            </div>
          </div>
          <div class="form-group" >
            <label class="control-label  col-md-2">上传文件：</label>
            <div class="col-md-10">
              <div class="row">
                <div class="col-md-12">
                    <input type="file" name="imgFiles" file-model="file.imgFiles" multiple />
                </div>
              </div>
              <div class="row" ng-repeat="f in file.imgFiles">
                <div class="col-md-12">
                  <span>{{f.name}} 
                </div>
              </div>
            </div>
          </div>
         <!--  <div class="form-group"
            ng-class="{ 'has-error': form1.reasons.$invalid && (form1.$submitted || form1.reasons.$touched)}">
            <label class="control-label required  col-md-2">调整原因：</label>
            <div class="col-md-6">
              <textarea type="text" class="form-control" name="reasons" maxlength="200"
                ng-model="data.reasons" uib-tooltip=""
                tooltip-enable="form1.reasons.$invalid" required></textarea>
            </div>
          </div> -->
         <div class="form-group">
            <div class="col-md-10 col-md-offset-2">
            <button type="submit" id="btnSave" class="btn btn-primary" ng-click="update();">
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
            <th width="100px">操作人</th>
            <th width="100px">调整类型</th>
            <th width="120px">调整类别</th>
            <th width="120px">调整金额</th>
            <th>调整原因</th>
            <!-- <th>调整原因</th> -->
            <th width="150px">操作日期</th>
            <th width="400px">附件</th>
           
          </tr>
        </thead>
        <tbody >
        <#list tiaozhengList as tiaozheng>
          <tr>
            <td>${tiaozheng.name1}</td>
            <td>${tiaozheng.tiaozhengTypeDisp}</td>
            <td>${tiaozheng.tiaozhengJiafangTypeDisp}</td>
            <td>${tiaozheng.tiaozhengFee}</td>
            <td>${tiaozheng.content}</td>
           <!--  <td>${tiaozheng.reasons}</td> -->
            <td>${tiaozheng.createDateStr}</td>
            <td>
               <#list tiaozheng.fileIndexList as f>
                  
                  <span>${f.fileName} <a href="fs/download.do?fileid=${f.id}">【下载】</a></span>
               </#list>
            </td>
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