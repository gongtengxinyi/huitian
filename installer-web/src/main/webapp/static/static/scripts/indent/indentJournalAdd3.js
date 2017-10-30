var app = angular.module('app',// 
['ui.bootstrap','ifu.template','ifu.form','ifu.util']);

app.controller('IndentController',//
[ '$scope', '$http', '$window','$uibModal', 'UrlUtil',
  function($scope, $http, $window, $uibModal, UrlUtil) {
	var pageNo=$("#pageNo").val();
	var indentId=$("#indentId").val();
	var journalType=$("#journalType").val();
	$scope.data = {};
 
  $scope.update = function() {
	  
	  var yanzheng=$("#yanzheng").val();
	  var yanzheng1=$("#yanzheng1").val();
	  var yanzheng2=$("#yanzheng2").val();
	 if($("#journalType").val()=="INCOME") {
		 if (yanzheng.length==0 || yanzheng2.length==0) {
		      var modalScope = $scope.$new(true);
		      modalScope.title = "信息不完整";
		      modalScope.message = "当前表单输入信息不完整，请补充完整后再保存！";
		      $uibModal.open({
		        templateUrl : 'template/modal/alert.html',
		        scope : modalScope
		      }); 
		      return false;
		    }
		 $("#saveBtn").attr("disabled", true);
	    $http.post('indent/doSaveJournalIncome.do', $scope.data).then(function(response) {
	    	  var data = response.data;
		      if (data.success) {
		        var modalScope = $scope.$new(true);
		        modalScope.message = data.err_msg;
		        UrlUtil.autoJump(modalScope, $scope.refresh);
		      } else {
		 		 $("#saveBtn").attr("disabled", false);

		        var modalScope = $scope.$new(true);
		        modalScope.title = "保存失败";
		        modalScope.message = data.err_msg;
		        $uibModal.open({
		          templateUrl : 'template/modal/alert.html',
		          scope : modalScope
		        }); 
		      }
		    });
	 }
	 else{
		 if (yanzheng.length==0 || yanzheng2.length==0) {
		      var modalScope = $scope.$new(true);
		      modalScope.title = "信息不完整";
		      modalScope.message = "当前表单输入信息不完整，请补充完整后再保存！";
		      $uibModal.open({
		        templateUrl : 'template/modal/alert.html',
		        scope : modalScope
		      }); 
		      return false;
		    }
		 $("#saveBtn").attr("disabled", true);
		 $http.post('indent/doSaveJournalPay.do', $scope.data).then(function(response) {

	    	  var data = response.data;
		      if (data.success) {
		        var modalScope = $scope.$new(true);
		        modalScope.message = data.err_msg;
		        UrlUtil.autoJump(modalScope, $scope.refresh);
		      } else {
		    	  $("#saveBtn").attr("disabled", false);
		        var modalScope = $scope.$new(true);
		        modalScope.title = "保存失败";
		        modalScope.message = data.err_msg;
		        $uibModal.open({
		          templateUrl : 'template/modal/alert.html',
		          scope : modalScope
		        }); 
		      }
		    });
	 }	   
		  }
 
  //刷新当前页面
  $scope.refresh=function(){
	
	  if(journalType=="PAY"){
	     $window.location.href = UrlUtil.transform('indent/indentJournalPayAdd.do?journalType=PAY&pageNo='+pageNo+'&indentId='+indentId);
	  }
	  else if(journalType=="INCOME"){
		 $window.location.href = UrlUtil.transform('indent/indentJournalIncomeAdd.do?journalType=INCOME&pageNo='+pageNo+'&indentId='+indentId);
	  }
  }
  //返回订单列表
  $scope.goBack=function(){
		 $window.location.href = UrlUtil.transform('indent/indentList.do?pageNo='+pageNo);
		  
	  }
  

}]);
