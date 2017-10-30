var app = angular
    .module('app',// 
    ['ui.grid', 'ui.grid.edit', 'ui.grid.cellNav', 'ui.grid.validate', 'ui.bootstrap',
        'ifu.cityselect', 'ifu.form', 'ifu.util']);

app.controller('indentCostEditController',//
['$scope', '$http', '$window', '$uibModal', 'UrlUtil',//
function($scope, $http, $window, $uibModal, UrlUtil) {

  $scope.data = {};
  
  $scope.save = function() {
      if (!$scope.form1.$valid) {
          var modalScope = $scope.$new(true);
          modalScope.title = "当前信息填写不完整，请完善";

          $uibModal.open({
              templateUrl : 'template/modal/alert.html',
              scope : modalScope
          });
          return false;
      }
    return $http({
        method : 'POST',
        url : 'indentCost/doSave.do', 
        headers : {
          'Content-Type' : undefined
        },
        transformRequest : function(data) {
          var formData = new FormData();        
          formData.append("data", angular.toJson(data.data)); 
          return formData;
        },
        data : {
          data : $scope.data,        }
      }).then(function(response) {
        var data = response.data;
        if (data.success) {
          var modalScope = $scope.$new(true);
          modalScope.message = data.err_msg;
          $window.location.href = UrlUtil.transform('indentCost/indentCostList.do');
        } else {
      	  $("#saveBtn").attr("disabled", false);
          var modalScope = $scope.$new(true);
          modalScope.title = data.err_msg;
          modalScope.message = "审核失败";
          $uibModal.open({
            templateUrl : 'template/modal/alert.html',
            scope : modalScope
          }); 
        }
      });
  }
  
  

  $scope.goBack = function() {
    $window.location.href = UrlUtil.transform('indentCost/indentCostList.do');
  }
}]);