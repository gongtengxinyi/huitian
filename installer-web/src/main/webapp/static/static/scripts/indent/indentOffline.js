var app = angular.module('app',// 
['ui.bootstrap','ifu.template','ifu.form','ifu.util']);

app.controller('IndentController',//
[ '$scope', '$http', '$window','$uibModal', 'UrlUtil',
  function($scope, $http, $window, $uibModal, UrlUtil) {
	var pageNo=$("#pageNo").val();
   var indentId=$("#indentId").val();
   var stepId=$("#stepId").val();
	$scope.data = {};
 
  $scope.update = function() {
	 	 
	    return $http({
	        method : 'POST',
	        url : 'indent/indentOfflineSaveFile.do', 
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
	  $window.location.href = UrlUtil.transform('indent/indentView.do?indentId='+indentId+'&pageNo=1&indentOffline=yes');
	  window.close();
  }
  

}]);
