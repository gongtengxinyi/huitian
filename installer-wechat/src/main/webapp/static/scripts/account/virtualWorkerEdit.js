var app = angular.module('app',// 
['ui.bootstrap', 'ifu.cityselect2', 'ifu.util']);

app.controller('workerEditController', ['$scope', '$http', '$window', 'UrlUtil',
    function($scope, $http, $window, UrlUtil) {
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
            alert("操作失败，请稍后重试！");
          }
        });
      }
      
      $scope.goBack = function() {
    	  $window.location.href = UrlUtil.transform('virtualWorker/virtualWorkerList.do?pageNo='+pageNo);
    	 
      }

    }]);
