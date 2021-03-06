var app = angular.module('app',// 
['ui.bootstrap','ifu.template','ifu.form','ifu.cityselect2','ifu.util']);

app.controller('IndentController',//
[ '$scope', '$http', '$window','$uibModal', 'UrlUtil',
  function($scope, $http, $window, $uibModal, UrlUtil) {
	var pageNo=$("#pageNo").val();
	
	$scope.planDoorDate = {
		      opened : false
		  };  
	$scope.openPlanDoorDate = function() {
		    $scope.planDoorDate.opened = true;
		  }
	
  $http.get("indent/loadDoorDate.do", {
		    params : {
		      id : $scope.data.id
		    }
		  }).then(function(response) {
		    $scope.data = response.data;
		    $scope.data.planDoorDate = Date.parse($scope.data.planDoorDate.replace());
		  });
 
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
	console.log($scope.data);
	    $http.post('indent/doUpdateDoorDate.do', $scope.data).then(function(response) {
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
	  $window.location.href = UrlUtil.transform('indent/indentList.do?pageNo='+pageNo);
  }
  

}]);
