var app = angular.module('app', ['ui.bootstrap', 'ifu.cityselect2', 'ifu.template', 'ifu.util']);

app.controller('ChongzhiListController',//
['$scope', '$http', '$uibModal', 'UrlUtil', '$window',//
function($scope, $http, $uibModal, UrlUtil, $window) {

	 $scope.pager = { //初始化pager的各个属性，totalItems，itemsPerPage都不能少，直接设置currentPage一个属性不起作用。
		      totalItems:3,
		      itemsPerPage:10,
		      currentPage : 	1, //初始化当前页面为传递过来的页面值，确保返回的结果为查看记录内容前的页面
		      maxSize : 10
		  }
	
	
	 $scope.comitDateBegin = {
			    opened : false
			  };

	  $scope.comitDateEnd = {
	    opened : false
	  };
	
	//提交开始时间控件
	  $scope.openComitDateBegin = function() {
	    $scope.comitDateBegin.opened = true;
	  }
	//提交结束时间控件
	  $scope.openComitDateEnd = function() {
	    $scope.comitDateEnd.opened = true;
	  }
  
  $scope.goBack = function() {
    $window.location.href = UrlUtil.transform('admin/adminList.do');
  }

}]);