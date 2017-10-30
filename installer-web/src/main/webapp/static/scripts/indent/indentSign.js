var app = angular.module('app',// 
['ui.bootstrap','ifu.template','ifu.form','ifu.util']);

app.controller('IndentController',//
[ '$scope', '$http', '$window','$uibModal', 'UrlUtil',
  function($scope, $http, $window, $uibModal, UrlUtil) {
	var pageNo=$("#pageNo").val();
 
	$scope.data = {};
	//时间控件处理
	  $scope.signDate = {
		      opened : false
		  };  
	  $scope.openSignDate = function() {
		  
		    $scope.signDate.opened = true;
		  }
 
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
	  
	 
	    return $http({
	        method : 'POST',
	        url : 'indent/doSaveIndentSign.do', 
	        headers : {
	          'Content-Type' : undefined
	        },
	        transformRequest : function(data) {
	          var formData = new FormData();        
	          formData.append("data", angular.toJson(data.data));        	       
	          return formData;
	        },
	        data : {
	          data : $scope.data, //实体类对象json
	         
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
  
 

  $scope.goBack=function(){
	 window.location.href = 'indent/indentView.do?indentOffline=ok&indentId='+$scope.data.indentId+'&pageNo=1';

	  window.close();
  }
 
  $scope.close=function(){
		  window.close();
	  }
 
  

}]);
