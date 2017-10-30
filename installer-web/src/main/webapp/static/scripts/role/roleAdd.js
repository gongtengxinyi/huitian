var app = angular.module('app', ['ui.bootstrap', 'ifu.util']);

app.controller('RoleAddController',//
['$scope', '$http', '$window', 'UrlUtil',//
function($scope, $http, $window, UrlUtil) {

  $scope.save = function() {
    if (!$scope.form1.$valid) {
      return false;
    }
    $("#saveBtn").attr("disabled", true);

    $http.post('role/save.do', $scope.data).then($scope.goBack);
  }
  
  $scope.goBack = function() {
    $window.location.href = UrlUtil.transform('role/roleList.do');
  }

}]);