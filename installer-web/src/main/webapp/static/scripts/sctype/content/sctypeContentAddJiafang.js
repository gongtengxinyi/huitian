var app = angular.module('app', ['ui.bootstrap','ifu.form', 'ifu.util']);

app.controller('SctypeContentController', ['$scope', '$http', '$window', 'UrlUtil',//
function($scope, $http, $window, UrlUtil) {
	var apartyId=$("#apartyId").val();
  $scope.data = {
      sctypeSortId : $scope.sctypeSortId,
      apartyId:apartyId
  };

  $scope.doSave = function() {

    if (!$scope.form1.$valid) {
      return false;
    }
    $("#saveBtn").attr("disabled", true);
    $http.post('sctypeContent/doJiafangSave.do', $scope.data).then(function() {
      $scope.goBack();
    });
  }

  $scope.goBack = function() {
    $window.location.href = UrlUtil.transform('sctype/sctypeJiafangTree.do?apartyId='+apartyId);
  }
}]);
