var app = angular.module('app', ['ui.bootstrap', 'ifu.cityselect2','ifu.template','ifu.util']);

app.controller('indentCostListController',//
['$scope', '$http', '$uibModal','UrlUtil','$window',//
function($scope,$http, $uibModal,UrlUtil,$window) {
	$scope.sf = {};
	 var pageNo=$("#pageNo").val();//将查看内容页面的PageNo传递回来，放入隐藏域，在这里取值
	 $scope.pager = { //初始化pager的各个属性，totalItems，itemsPerPage都不能少，直接设置currentPage一个属性不起作用。
	      totalItems:100,
	      itemsPerPage:10,
	      currentPage : pageNo, //初始化当前页面为传递过来的页面值，确保返回的结果为查看记录内容前的页面
	      maxSize : 10
	  }
	 
	//查询日期
	 $scope.queryDateBegin = {
	 		    opened : false
	 		  };

	 $scope.queryDateEnd = {
	 		    opened : false
	 		  };
	 $scope.openQueryDateBegin = function() {
	 	  $scope.queryDateBegin.opened = true;
	 	}
	 $scope.openQueryDateEnd = function() {
	 $scope.queryDateEnd.opened = true;
	 }

	   $scope.sf.queryDateBegin=Date.parse($("#queryDateBegin").val());//将存储在隐藏域的日期显示在日期控件  实际上门日期
	   $scope.sf.queryDateEnd=Date.parse($("#queryDateEnd").val()); 
           
    $scope.query = function() {	 
    	 $("#pageNo").val=$scope.pager.currentPage;
	    $http.post('indentCost/doListForAll.do',$scope.sf || {},{
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
	
 $scope.$watch('pager.currentPage', $scope.query);
  
 
}]);
