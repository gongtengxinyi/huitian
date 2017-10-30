var app = angular.module('app', ['ui.bootstrap', 'ifu.cityselect2', 'ifu.util']);

app.controller('advsListController',//
['$scope', '$http', '$uibModal','$window', 'UrlUtil',//
function($scope,$http, $uibModal, $window,UrlUtil) {
	$scope.data={};
	 var pageNo=$("#pageNo").val();//将查看内容页面的PageNo传递回来，放入隐藏域，在这里取值
	 $scope.pager = { //初始化pager的各个属性，totalItems，itemsPerPage都不能少，直接设置currentPage一个属性不起作用。
	      totalItems:100,
	      itemsPerPage:10,
	      currentPage : pageNo, //初始化当前页面为传递过来的页面值，确保返回的结果为查看记录内容前的页面
	      maxSize : 10
	  }
           
    $scope.query = function() {	 
    	 $("#pageNo").val=$scope.pager.currentPage;
		 var currentPage=$scope.pager.currentPage;//$scope.pager.currentPage;
	    $http.post('advs/doadvsList.do',$scope.sf || {},{
	      params : {
	        page:$scope.pager.currentPage	       
	      }
	    }).then(function(response) {
	      var data = response.data;
	      $scope.pager.totalItems = data.page.total;
	      $scope.pager.itemsPerPage = data.page.pageSize;
	      $scope.rows = data.rows;
	    });
  }
	
	 //删除
	 $scope.deleteAdvs = function(id) {
		    $http.get('advs/advsDelete.do', {
		      params : {
		        id : id
		      }
		    }).then($scope.query);

		  }
		  
	  $scope.enable = function(id,type) {
		    $http.get('advs/enable.do', {
		      params : {
		        id : id,
                type:type
		      }
		    }).then($scope.query);
		  }
		  
		  $scope.disable = function(id,type) {
		    $http.get('advs/disable.do', {
		      params : {
		        id : id,
				type:type
		      }
		    }).then($scope.query);
		  }
 $scope.$watch('pager.currentPage', $scope.query);
  
 
}]);
