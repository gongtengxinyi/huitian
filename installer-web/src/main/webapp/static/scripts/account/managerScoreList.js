var app = angular.module('app', ['ui.bootstrap','ifu.util']);

app.controller('WorkerScoreListController',
['$scope', '$http','$window','UrlUtil',
function($scope, $http,$window,UrlUtil) {
	var pageNo=$("#pageNo").val();
  $scope.pager = {
    currentPage : 1,
    maxSize : 10
  }

  $scope.query = function() {
	 
    $http.post('score/list.do', $scope.sf || {}, {
      params : {
        page : $scope.pager.currentPage
      }
    }).then(function(response) {
      var data = response.data;
      $scope.pager.totalItems = data.page.total;
      $scope.pager.itemsPerPage = data.page.pageSize;

      $scope.rows = data.rows;
    });
  }

  $scope.$watch('pager.currentPage', $scope.query);
  
  $scope.goBack = function() {
	    $window.location.href = UrlUtil.transform('manager/managerList.do?pageNo='+pageNo);
  }

}]);
