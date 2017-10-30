var app = angular.module('app',// 
['ui.bootstrap','ifu.template','ifu.form','ifu.cityselect2','ifu.util']);

app.controller('IndentController',//
[ '$scope', '$http', '$window','$uibModal', 'UrlUtil',
  function($scope, $http, $window, $uibModal, UrlUtil) {
	var pageNo=$("#pageNo").val();
 
	  $http.get("indent/loadAddress.do", {
		    params : {
		      id : $scope.data.indentId
		    }
		  }).then(function(response) {
		    $scope.data = response.data;
		   
		  });
	  $http.get('indent/loadInstallImgFiles.do', {
		    params : {
		      id : $scope.data.indentId
		    }
		  }).then(function(data) {
		    $scope.installImgFiles = data.data;
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
	$http({
   	 method : 'POST',
        url : 'indent/doUpdateAddress.do', 
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
		        modalScope.title = "保存失败";
		        modalScope.message = data.err_msg;
		        $uibModal.open({
		          templateUrl : 'template/modal/alert.html',
		          scope : modalScope
		        }); 
		      }
		    });
	    
	    
	    
	    
	    
		  }
  
//删除安装图纸
  $scope.delPact = function(id) {

	    var modalScope = $scope.$new(true);
	    modalScope.message = "您确认要删除该图纸吗？";

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
	          alert("成功删除该合同信息！");
	          $http.get('indent/loadInstallImgFiles.do', {
	            params : {
	              id : $scope.data.indentId
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

  
 
  
  $scope.goBack=function(){
	  $window.location.href = UrlUtil.transform('indent/indentList.do?pageNo='+pageNo);
  }
  

}]);
