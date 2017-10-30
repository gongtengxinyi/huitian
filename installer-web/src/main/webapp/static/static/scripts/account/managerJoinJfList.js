var app = angular.module('app', ['ui.bootstrap', 'ifu.cityselect2', 'ifu.util']);

app.controller('ManagerListController',//
['$scope', '$http', 'UrlUtil', '$window',//
function($scope, $http) {
	$scope.sf = {}; //FUJUAN ADD 开始不加的时候，省份不能查询
  $scope.pager = {
    currentPage : 1,
    maxSize : 10
  }
  
  $scope.autoQuery = function(e){
	  var keycode = window.event?e.keyCode:e.which;
      if(keycode==13){         
          $scope.query();
      }
  };
  
  $scope.query = function() {
	 
    $http.post('manager/listJoinManager.do', $scope.sf || {}, {
      params : {
        page : $scope.pager.currentPage
      }
    }).then(function(response) {
      var data = response.data;
      console.log(data);
     
      $scope.pager.totalItems = data.page.total;
      $scope.pager.itemsPerPage = data.page.pageSize;

      $scope.rows = data.rows;
     
    
    });
  }
 
  $scope.$watch('pager.currentPage', $scope.query);

}]);
