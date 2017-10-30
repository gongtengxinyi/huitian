var app = angular.module('app',// 
['ui.bootstrap','ifu.template','ifu.form','ifu.util']);

app.controller('IndentController',//
[ '$scope', '$http', '$window','$uibModal', 'UrlUtil',
  function($scope, $http, $window, $uibModal, UrlUtil) {
	var pageNo=$("#pageNo").val();
	var id=$("#id").val();
	
	//加载页面信息
	$http.get("demand/load.do", {
	    params : {
	      id : id
	    }
	  }).then(function(response) {
	    $scope.data = response.data;
	   
	  });
	
	
	//加载文件
	  $http.get('indent/loadInstallImgFiles.do', {
	    params : {
	      id : id
	    }
	  }).then(function(data) {
	    $scope.installImgFiles = data.data;
	  });
	  
	//删除文件
	  $scope.delPact = function(id) {

		    var modalScope = $scope.$new(true);
		    modalScope.message = "您确认要删除该文件吗？";

		    $uibModal.open({
		      templateUrl : 'template/modal/delete.html',
		      scope : modalScope
		    }).result.then(function() {
		      $http.get('indent/delPact.do', {
		        params : {
		          id : id
		        }
		      }).then(function(response) {
		        var data = response.data;
		        if (data.success) {
		          alert("成功删除文件！");
		          $http.get('indent/loadInstallImgFiles.do', {
		            params : {
		              id : $scope.data.id
		            }
		          }).then(function(data) {
		            $scope.installImgFiles = data.data;
		          });
		        } else {
		          alert("删除失败");
		        }

		      });
		    });

		  }
	 
 
//保存
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
	        url : 'demand/doUpdateDemand.do', 
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
	          data : $scope.data,
	          file : $scope.file
	        }
	      }).then(function(response) {
	    	  var data = response.data;
		      if (data.success) {
		        var modalScope = $scope.$new(true);
		        modalScope.message = data.err_msg;
		        UrlUtil.autoJump(modalScope, $scope.goBack);
		      } else {
		        var modalScope = $scope.$new(true);
		        modalScope.title = "保存失败,请确认自己有回复权限！";
		        modalScope.message = data.err_msg;
		        $uibModal.open({
		          templateUrl : 'template/modal/alert.html',
		          scope : modalScope
		        }); 
		      }
		    });
	    
	    
	    
	    
	    
		  };
  
		  $scope.goBack =function(){
			  
			  $window.location.href = UrlUtil.transform('demand/demandList.do?id='+$scope.data.id+'&pageNo='+pageNo);
			  window.opener.location.reload();//刷新父页面
			  window.close();
		  };
		  
		  $scope.close=function(){
			 
			  window.close();
		  };

	  
		

}]);
