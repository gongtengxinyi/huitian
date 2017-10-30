var app = angular.module('app',// 
['ui.bootstrap','ifu.template','ifu.form','ifu.util']);

app.controller('IndentController',//
[ '$scope', '$http', '$window','$uibModal', 'UrlUtil',
  function($scope, $http, $window, $uibModal, UrlUtil) {
	var pageNo=$("#pageNo").val();
 
	$scope.data = {};
	var type=$('#indentType').text();
/*	var indentCancel;
	$("#indentType").change(function(){
		indentCancel = $('#indentType').find(":selected").val();
	});*/
	
  $scope.update = function() {
	  if (!$scope.form1.$valid) {
	      var modalScope = $scope.$new(true);
	      modalScope.title = "信息不完整";
	      modalScope.message = "当前表单输入信息不完整，请补充完整后再保存！";
	      $uibModal.open({
	        templateUrl : 'template/modal/alert.html',
	        scope : modalScope
	      }); 
	      return false;
	    }
	  
	 /* if (indentCancel==0) {
	      var modalScope = $scope.$new(true);
	      modalScope.title = "请选择取消类型";
	      modalScope.message = "取消类型未选择，请您选择！";
	      $uibModal.open({
	        templateUrl : 'template/modal/alert.html',
	        scope : modalScope
	      }); 
	      return false;
	    }*/
	  
	    if (type=="取消二次上门") {
	     $http.post('indent/doCancelExtraIndent.do', $scope.data ||{},{
	        params : {
	                    pageNo :pageNo
	                }
	        }).then(function(response) {
	  	      var data = response.data;
		      if (data.success) {
		        var modalScope = $scope.$new(true);
		        modalScope.message = data.err_msg;
		        UrlUtil.autoJump(modalScope, $scope.goBack);
		      } else {
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

  if (type=="取消订单") {
	     $http.post('indent/doUpdateCancel.do', $scope.data ||{},{
	        params : {
	                    pageNo :pageNo
	                }
	        }).then(function(response) {
	  	      var data = response.data;
		      if (data.success) {
		        var modalScope = $scope.$new(true);
		        modalScope.message = data.err_msg;
		        UrlUtil.autoJump(modalScope, $scope.goBack);
		      } else {
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
  $scope.goBack=function(){
	  $window.location.href = UrlUtil.transform('indent/indentList.do?pageNo='+pageNo);
  }
}]);
