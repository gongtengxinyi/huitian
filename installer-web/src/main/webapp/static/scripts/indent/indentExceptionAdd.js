var app = angular.module('app',// 
['ui.bootstrap','ifu.template','ifu.form','ifu.util']);

app.controller('IndentController',//
[ '$scope', '$http', '$window','$uibModal', 'UrlUtil',
  function($scope, $http, $window, $uibModal, UrlUtil) {
	var pageNo=$("#pageNo").val();
 
	$scope.data = {};
	
 
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
	        url : 'indent/doSaveException.do', 
	        headers : {
	          'Content-Type' : undefined
	        },
	        transformRequest : function(data) {
	          var formData = new FormData();        
	          formData.append("data", angular.toJson(data.data));        
	          for ( var f in data.file) {
	            var items = data.file[f];
	            for (var i in items) {
	              formData.append(f, items[i]);
	            }
	          }
	          return formData;
	        },
	        data : {
	          data : $scope.data, //实体类对象json
	          file : $scope.file //文件
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
	 window.location.href = UrlUtil.transform('indent/indentView.do?indentId='+$scope.data.indentId+'&type=EXCEPTION&pageNo='+pageNo);
 
	  window.opener.location.reload();//刷新父页面
	  window.close();
  }
 
  $scope.close=function(){
		 
		  window.close();
	  }
 
  

}]);
