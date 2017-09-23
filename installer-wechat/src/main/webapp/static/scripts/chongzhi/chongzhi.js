var app = angular.module('app', ['ui.bootstrap','ifu.form', 'ifu.util']);

app.controller('AdminAddController',//
['$scope', '$http', '$window', 'UrlUtil',//
function($scope, $http, $window, UrlUtil) {

	
	
	$scope.save = function() {
		$window.location.href = UrlUtil.transform('chongzhi/chongzhiList.do');    
  }
  
  $scope.goBack = function() {
    $window.location.href = UrlUtil.transform('admin/adminList.do');
  }

}]);