var app = angular.module('app',// 
['ui.bootstrap','ifu.form', 'ifu.util']);

app.controller('managerEditController', ['$scope', '$http', '$window', 'UrlUtil',
    function($scope, $http, $window, UrlUtil) {
	var pageNo=$("#pageNo").val();
      $http.get("manager/findLabelByManagerId.do", {
        params : {
          id : $scope.data.id
        }
      }).then(function(response) {
        $scope.data = response.data;        
      });

      $scope.update = function() {

        if (!$scope.form1.$valid) {
          return false;
        }
        $http.post('manager/updateManagerLabel.do', $scope.data).then(function(response) {
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
        $window.location.href = UrlUtil.transform('manager/managerList.do?pageNo='+pageNo);
      }

    }]);
