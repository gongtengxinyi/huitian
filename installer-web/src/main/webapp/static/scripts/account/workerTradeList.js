var app = angular.module('app', ['ui.bootstrap']);

app.controller('WorkerTradeListController',//
['$scope', '$http',//
function($scope, $http) {
  
  $scope.pager = {
    currentPage : 1,
    maxSize : 10
  }
  
  $scope.sf = {};
  $scope.sf.tradeType = "CASH";

  $scope.query = function() {
    $http.post('workerTrade/list.do', $scope.sf || {}, {
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

}]);
