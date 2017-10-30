var app = angular.module('app', ['treeGrid','ifu.util'])//
app.controller('ScnodeController', ['$scope', function($scope) {

}]);

app.controller('TreeGridController', ['$scope', '$http', '$window', 'UrlUtil',
                                      function($scope, $http, $window, UrlUtil) {
	var pageNo=$("#pageNo").val();
  $scope.tree = {};
  $scope.tree_data = [];

  $scope.expanding_property = {
      field : 'name1',
      displayName : '名称'
  };
  $scope.col_defs = [{
    width : '100px',
    field : 'stepTypeDisp',
    displayName : '类型'
  }, {
    width : '100px',
    field : 'stepStatusDisp',
    displayName : '状态'
  }, {
    width : '200px',
    field : 'op',
    displayName : '操作',
    cellTemplate : 
    	
    	 "<span ng-if=\"row.branch['stepType'] == 'SIGN' && (row.branch['code1'] == 'INSTALL' || row.branch['code1'] == 'MEASURE') && row.branch['stepStatus'] == 'FINISH'\">" +
         " <a class=\"btn btn-primary btn-xs\" " +
         "   href=\"indentNodeStep/showSignDetail.do?flag=sign&&id={{row.branch['id']}}\">" + //
         "      <span class=\"glyphicon glyphicon-eye-open\"></span>&nbsp;签到详情</a>" +
         "</span>"	 + //
         
         "<span ng-if=\"row.branch['stepType'] == 'SIGN' && row.branch['code1'] == 'TRANSPORT' && row.branch['stepStatus'] == 'FINISH'\">" +
         " <a class=\"btn btn-primary btn-xs\" " +
         "   href=\"indentNodeStep/showSignDetail.do?flag=logistic&&id={{row.branch['id']}}\">" + //
         "      <span class=\"glyphicon glyphicon-eye-open\"></span>&nbsp;物流详情</a>" +
         "</span>"	 + //
         
         "<span ng-if=\"row.branch['stepType'] == 'SIGN' && row.branch['code1'] == 'ARRIVAL' && row.branch['stepStatus'] == 'FINISH'\">" +
         " <a class=\"btn btn-primary btn-xs\" " +
         "   href=\"indentNodeStep/showSignDetail.do?flag=goods&&id={{row.branch['id']}}\">" + //
         "      <span class=\"glyphicon glyphicon-eye-open\"></span>&nbsp;入场详情</a>" +
         "</span>"	 + //   
       
    	
      "<span ng-if=\"row.branch['iEList'].length > 0 && row.branch['result'] != 'SUSPEND'\">" + //
      "  <a class=\"btn btn-warning btn-xs\" " + //
      "    href=\"indentExc/indentExcList.do?indentNodeId={{row.branch['id']}}\">" + //
      "      <span class=\"glyphicon glyphicon-eye-open\"></span>&nbsp;查看异常</a>" + //
      "</span>" + //
      "<span ng-if=\"row.branch['iEList'].length > 0 && row.branch['result'] == 'SUSPEND'\">" + //
      "  <a class=\"btn btn-warning btn-xs\" " + //
      "    href=\"indentExc/indentExcList.do?indentNodeId={{row.branch['id']}}\">" + //
      "      <span class=\"glyphicon glyphicon-exclamation-sign\"></span>&nbsp;暂停中</a>" + //
      "</span>" + //
      "<span ng-if=\"row.branch['iEList'].length == 0&&row.level == 1\">无异常信息</span>" + //
     
      "<span ng-if=\"row.level == 1&&row.branch['code1']=='SELFCHECK'&& row.branch['stepStatus'] != 'BEFORE'\">" +
      " <a class=\"btn btn-primary btn-xs\" " +
      "   href=\"fs/downloadZip.do?type=SELFCHECK&indentId={{row.branch['indentId']}}\">" + //
      "      <span class=\"glyphicon glyphicon-cloud-download\"></span>&nbsp;导出照片</a>" +
      "</span>" + //
      "<span ng-if=\"row.level == 1&&row.branch['code1']=='INSTALL'&& row.branch['stepStatus'] == 'AFTER'\">" +
      " <a class=\"btn btn-primary btn-xs\" " +
      "   href=\"fs/downloadZip.do?type=INSTALL&indentId={{row.branch['indentId']}}\">" + //
      "      <span class=\"glyphicon glyphicon-cloud-download\"></span>&nbsp;导出照片</a>" +
      "</span>" + //
      "<span ng-if=\"row.level == 1&&row.branch['code1']=='MEASURE'&& row.branch['stepStatus'] == 'AFTER'\">" +
      " <a class=\"btn btn-primary btn-xs\" " +
      "   href=\"fs/downloadZip.do?type=MEASURE&indentId={{row.branch['indentId']}}\">" + //
      "      <span class=\"glyphicon glyphicon-cloud-download\"></span>&nbsp;导出照片</a>" +
      "</span>" + //
      "<span ng-if=\"row.level == 1&&row.branch['code1']=='TRANSPORT'&& row.branch['stepStatus'] == 'AFTER'\">" +
      " <a class=\"btn btn-primary btn-xs\" " +
      "   href=\"fs/downloadZip.do?type=TRANSPORT&indentId={{row.branch['indentId']}}\">" + //
      "      <span class=\"glyphicon glyphicon-cloud-download\"></span>&nbsp;导出照片</a>" +
      "</span>" + //
      "<span ng-if=\"row.level == 1&&row.branch['code1']=='ARRIVAL'&& row.branch['stepStatus'] != == 'AFTER'\">" +
      " <a class=\"btn btn-primary btn-xs\" " +
      "   href=\"fs/downloadZip.do?type=ARRIVAL&indentId={{row.branch['indentId']}}\">" + //
      "      <span class=\"glyphicon glyphicon-cloud-download\"></span>&nbsp;导出照片</a>" +
      "</span>" + //
      
      "<span ng-if=\"row.branch['stepType'] == 'UPLOAD' && row.branch['stepStatus'] == 'FINISH'\">" +
      " <a   class=\"btn btn-primary btn-xs\" " +
      "   href=\"indentNodeStep/findImg.do?id={{row.branch['id']}}\">" + //
      "      <span class=\"glyphicon glyphicon-eye-open\"></span>&nbsp;查看照片</a>" +
      
     
     
      "</span>" + //
      
      "<span ng-if=\"(row.branch['stepType'] == 'INVITEEVAL' || row.branch['stepType'] == 'HEXIAO') && row.branch['stepStatus'] == 'FINISH'\">" +
      " <a class=\"btn btn-primary btn-xs\" " +
      "   href=\"indentEvaluate/indentEvaluateMsg.do?indentId={{row.branch['indentId']}}\">" + //
      "      <span class=\"glyphicon glyphicon-eye-open\"></span>&nbsp;查看评价</a>" +
      "</span>"
  }, {
	    width : '500px',
	    field : 'remarks',
	    displayName : '工人备注'
	  }];

  $http.get('indentNode/loadTreeDatas.do?id='+$scope.data.id).then(function(response) {
    $scope.tree_data = response.data;
    console.log(response.data);
   
  });

  $scope.goBack = function() {
    $window.location.href = UrlUtil.transform('indent/indentList.do?pageNo='+pageNo);
  }
  
  $scope.lookException = function() {
    $window.location.href = UrlUtil.transform('indentExc/indentExcList.do?indentId='+$scope.data.id+'&&pageNo='+pageNo);
  }
  
  //打开沟通详情列表
  $scope.lookContact = function() {
	    $window.location.href = UrlUtil.transform('indentWorkerContact/indentWorkerContactList.do?indentId='+$scope.data.id+'&&pageNo='+pageNo);
	  }
 
  $scope.show=function(){
	  console.log("aaa");
	 // $('#myModal').modal();
  }
  
}]);