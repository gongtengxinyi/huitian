var app = angular.module('app',// 
['ui.bootstrap','ifu.form', 'ifu.template','ifu.util']);

app.controller('workerEditController', ['$scope', '$http', '$window', '$uibModal','UrlUtil',
    function($scope, $http, $window,$uibModal, UrlUtil) {
	var pageNo=$("#pageNo").val();
	
	
      $http.get("worker/findWorkerById.do", {
        params : {
          id : $scope.data.id
        }
      }).then(function(response) {
        $scope.data = response.data;
        console.log($scope.data);
      });

      $scope.save = function() {

        if (!$scope.form1.$valid) {
          return false;
        }
        $http.post('worker/checkWorker.do', $scope.data).then(function(response) {
          var data = response.data;
          if (data.success) {
            var modalScope = $scope.$new(true);
            modalScope.message = "操作成功！";
            UrlUtil.autoJump(modalScope, $scope.goBack);
          } else {
           // alert("操作失败，请稍后重试！");
            var modalScope = $scope.$new(true);
	        modalScope.title = data.err_msg;
	       // modalScope.message =data.err_msg;// "您没有编辑订单的权限！";
	        $uibModal.open({
	          templateUrl : 'template/modal/alert.html',
	          scope : modalScope
	        }); 
          }
        });
      }
      
      $scope.goBack = function() {
    	  $window.location.href = UrlUtil.transform('worker/workerList.do?pageNo='+pageNo);
    	 
      }

    }]);
