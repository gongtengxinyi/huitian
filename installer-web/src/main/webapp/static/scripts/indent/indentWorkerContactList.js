var app = angular.module('app', ['ui.bootstrap','ifu.util']);

app.controller('IndentExceptionController',//
['$scope', '$http', '$window', 'UrlUtil',//
function($scope, $http, $window, UrlUtil) {
	var pageNo=$("#pageNo").val();
  $scope.pager = {
    currentPage : 1,
    maxSize : 10
  }

  $scope.query = function() {
    $http.get('indentWorkerContact/list.do?indentId=' + $scope.data.indentId).then(function(response) {
      var data = response.data;
      
      $scope.rows = response.data;
    });
  }

  $scope.$watch('pager.currentPage', $scope.query);
  
  $scope.goBack = function() {
    $window.location.href = UrlUtil.transform('indent/indentList.do?pageNo='+pageNo);
  }
  
}]);
