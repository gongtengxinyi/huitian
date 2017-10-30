var app = angular.module('app',// ,'ifu.workerselect'
[ 'treeGrid', 'ui.bootstrap', 'ifu.template', 'ifu.form', 'ifu.cityselect2',
		'ifu.util' ]);

app.controller('ApartyController',//
[
		'$scope',
		'$http',
		'$window',
		'$uibModal',
		'UrlUtil',
		function($scope, $http, $window, $uibModal, UrlUtil) {
			var city;
			//分页查询列表
			$scope.data = {};
			var pageNo =1;
			var apartId = $("#apartId").val();
			
			$scope.sf = {}; //FUJUAN ADD 开始不加的时候，省份不能查询
			$scope.registDateBegin = {
				    opened : false
				  };

		  $scope.registDateEnd = {
				    opened : false
				  };
			
		  
			$scope.goBack = function() {
				$window.location.href = UrlUtil
						.transform('aparty/apartyList.do?pageNo=' + pageNo);
			}
		  $scope.compare = function(size) {
			  if(size.length<=20){
				  alert("没有更多的信息！");
			  }else{
				$window.location.href = UrlUtil
						.transform('aparty/apartyMessageList.do?id='+apartId);
			  }
			}
		  $scope.compare2 = function(size) {
			  if(size.length<=20){
				  alert("没有更多的信息！");
			  }else{
				$window.location.href = UrlUtil
						.transform('aparty/apartyWorkerList.do?id='+apartId);
			  }
			}

		  $scope.compare3 = function(size) {
			  if(size.length<=20){
				  alert("没有更多的信息！");
			  }else{
				$window.location.href = UrlUtil
						.transform('aparty/apartyIndentList.do?id='+apartId);
			  }
			}
		  
		} ]);
