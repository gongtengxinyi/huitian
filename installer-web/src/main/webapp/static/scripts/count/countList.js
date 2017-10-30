var app = angular.module('app', [ 'ui.bootstrap', 'ifu.cityselect2',
		'ifu.template', 'ifu.util' ]);

app.controller('ManagerListController',//
[ '$scope', '$http', 'UrlUtil', '$uibModal', '$window',//
function($scope, $http, UrlUtil, $uibModal, $window) {
	$scope.data = {};

	$scope.planDoorDateEnd = {
		opened : false
	};

	// 注册开始时间控件
	$scope.openplanDoorDateEndBegin = function() {
		$scope.planDoorDateEnd.opened = true;
	}
	$scope.planDoorDateStart = {
		opened : false
	};

	// 注册开始时间控件
	$scope.openplanDoorDateStartBegin = function() {
		$scope.planDoorDateStart.opened = true;
	}

	$scope.query = function() {

		$http.get('indent/countInformation.do', {
			params : {

				planDoorDateStart : $scope.data.planDoorDateStart,
				planDoorDateEnd : $scope.data.planDoorDateEnd
			}
		})//
		.then(function(response) {
			$scope.data1 = response.data;

		});
		console.log($scope.data || {});
	}

} ]);
