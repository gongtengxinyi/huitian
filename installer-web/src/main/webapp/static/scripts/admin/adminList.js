var app = angular.module('app', ['ui.bootstrap']);

app.controller('AdminListController',//
['$scope', '$http',//
function($scope, $http) {

  $scope.pager = {
    currentPage : 1,
    maxSize : 10
  }
//FUJUAN ADD  回车键自动查询
//Netscape/Firefox/Opera中不支持 window.event.keyCode,需要用event.which代替
//IE用event.keCode方法获取当前被按下的键盘按键值，
//而NetScape/FireFox/Opera用的则是event.which

  $scope.autoQuery = function(e){
	  var keycode = window.event?e.keyCode:e.which;
      if(keycode==13){         
          $scope.query();
      }
  };
  
  
  $scope.query = function() {
    $http.post('admin/list.do', $scope.sf || {}, {
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
  
  $scope.enable = function(id) {
	    $http.get('admin/enable.do', {
	      params : {
	        id : id
	      }
	    }).then($scope.query);
	  }
	  
	  $scope.disable = function(id) {
	    $http.get('admin/disable.do', {
	      params : {
	        id : id
	      }
	    }).then($scope.query);
	  }

}]);
