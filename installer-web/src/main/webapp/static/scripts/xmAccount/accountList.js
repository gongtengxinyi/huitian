var app = angular.module('app', ['ui.bootstrap']);

app.controller('AdminListController',//
['$scope', '$http',//
function($scope, $http) {

  $scope.pager = {
    currentPage : 1,
    maxSize : 10
  }

  //查询
  $scope.query = function() {
    $http.post('xmAccount/dolist.do', $scope.sf || {}, {
      params : {
        page : $scope.pager.currentPage
      }
    }).then(function(response) {
      var data = response.data;
      $scope.pager.totalItems = data.page.total;
      $scope.pager.itemsPerPage = data.page.pageSize;

      $scope.rows = data.rows;
      console.log($scope.rows);
    });
  }

  $scope.$watch('pager.currentPage', $scope.query);
  
  //停用
  $scope.enable = function(id) {
    $http.get('xmAccount/enable.do', {
      params : {
        id : id
      }
    }).then($scope.query);
  }
  //启用
  $scope.disable = function(id) {
	  
	  
    $http.get('xmAccount/disable.do', {
      params : {
        id : id
      }
    }).then($scope.query);
  }
  
  $scope.autoQuery = function(e){
	  var keycode = window.event?e.keyCode:e.which;
      if(keycode==13){         
          $scope.query();
      }
  };

}]);
