var app = angular.module('app', ['ui.bootstrap','ifu.form', 'ifu.util']);

app.controller('SctypeContentController', ['$scope', '$http', '$window', 'UrlUtil',//
function($scope, $http, $window, UrlUtil) {

  // load
  $http.get('sctypeContent/loadJiafang.do', {
    params : {
      id : $scope.id
    }
  }).then(function(response) {
    $scope.data = response.data;
    console.log($scope.data);
  });

  $scope.doSave = function() {

    if (!$scope.form1.$valid) {
      return false;
    }
    $http.post('sctypeContent/doJiafangUpdate.do', $scope.data).then(function() {
      $scope.goBack();
    });
  }

  $scope.goBack = function() {
    $window.location.href = UrlUtil.transform('sctype/sctypeJiafangTree.do?apartyId='+$scope.id);
  }
}]);