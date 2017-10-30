var app = angular.module('app', [ 'ui.bootstrap', 'ifu.util' ]);

app.controller('SctypeNodeController', [
		'$scope',
		'$http',
		'$window',
		'UrlUtil',
		'$uibModal',//
		function($scope, $http, $window, UrlUtil, $uibModal) {
			$scope.data = {};
			// 保存
			$scope.doSave = function() {

				if (!$scope.form1.$valid) {
					return false;
				}
				$http.post('sctypeNode/save.do', $scope.data).then(function() {
					$scope.goBack();
				});
			}
			$scope.goBack = function() {
				$window.location.href = UrlUtil
						.transform('sctype/goSctypeNodeTree.do');
			}
		} ]);