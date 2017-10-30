var app = angular.module('app',// 
['ui.bootstrap', 'ifu.cityselect2', 'ifu.util']);

app.controller('workerEditController', ['$scope', '$http', '$window', 'UrlUtil','$uibModal',
    function($scope, $http, $window, UrlUtil, $uibModal) {
	var pageNo=$("#pageNo").val();
	
	
      $http.get("worker/findWorkerById.do", {
        params : {
          id : $scope.data.id
        }
      }).then(function(response) {
        $scope.data = response.data;
        console.log($scope.data.account.account);
      });

      $scope.save = function() {

        if (!$scope.form1.$valid) {
          return false;
        }
        $http.post('virtualWorker/doUpdate.do', $scope.data).then(function(response) {
          var data = response.data;
          if (data.success) {
            var modalScope = $scope.$new(true);
            modalScope.message = "操作成功！";
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
      
      $scope.goBack = function() {
    	  $window.location.href = UrlUtil.transform('virtualWorker/virtualWorkerList.do?pageNo='+pageNo);
    	 
      }

    }]);
