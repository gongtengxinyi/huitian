var app = angular.module('app',
		[ 'ui.bootstrap', 'ifu.cityselect2','ifu.template', 'ifu.util']);

app.controller('MController',//
[ '$scope', '$http','$uibModal', 'UrlUtil',  '$window',//
function($scope, $http, $uibModal, UrlUtil, $window) {
	$scope.sf = {}; // FUJUAN ADD 开始不加的时候，省份不能查询
	
	 var oldId=$("#oldId").val();
	$scope.pager = {
		currentPage : 1,
		maxSize : 10
	}

	$scope.autoQuery = function(e) {
		var keycode = window.event ? e.keyCode : e.which;
		if (keycode == 13) {
			$scope.change();
		}
	};

	$scope.change = function() {
		$http.post('manager/listTransferManager.do?oldId='+oldId, $scope.sf || {}, {
			params : {
				page : $scope.pager.currentPage,
			}
		}).then(function(response) {
			var data = response.data;
			$scope.rows = data.rows;
			if (data.success) {		
			} else {
				var modalScope = $scope.$new(true);
				modalScope.title = "提示";
				modalScope.message = data.err_msg;
					$uibModal.open({
						templateUrl : 'template/modal/alert.html',
						scope : modalScope
					});
			}
		});
	}

	// 转移工匠
	$scope.transferWorker = function() {
		var modalScope = $scope.$new(true);
		var id = this.data.id;
		//var oldId=oldId;
		
		modalScope.message = "确认要转移工匠吗？ ";
		$uibModal.open({
			templateUrl : 'template/modal/confirm.html',
			scope : modalScope
		}).result.then(function() {
			$http.get('manager/transferWorker.do', {
				params : {
					id : id,
					oldId:oldId
				}
			}).then(function(response) {
				var data = response.data;
				if (data.success) {
					var modalScope = $scope.$new(true);
					modalScope.message = data.err_msg;
					UrlUtil.autoJump(modalScope, $scope.goList);
				} else {
					var modalScope = $scope.$new(true);
					modalScope.title = "提示";
					modalScope.message = data.err_msg;
					$uibModal.open({
						templateUrl : 'template/modal/alert.html',
						scope : modalScope
					});
				}
			});
		});
	}
	
	$scope.goList = function() {
	    $window.location.href = UrlUtil.transform('manager/managerList.do?pageNo='+$scope.pager.currentPage);
	  }
	$scope.$watch('pager.currentPage', $scope.query);

} ]);
