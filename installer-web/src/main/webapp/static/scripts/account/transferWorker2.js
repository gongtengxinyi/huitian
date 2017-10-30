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
			$scope.change2();
		}
	};
	$scope.change2 = function() {
		var workerIdList=$("#workerIdList").val();
		$http.post('manager/listTransferManager2.do', $scope.sf || {}, {
			params : {
				page : $scope.pager.currentPage,
				workerIdList:workerIdList
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
	
	// 工匠列表转移工匠
	$scope.transferWorker2 = function(id) {
		var modalScope = $scope.$new(true);
		var workerIdList=$("#workerIdList").val();
		var id = this.data.id;
		modalScope.message = "确认要转移工匠吗？ ";
		$uibModal.open({
			templateUrl : 'template/modal/confirm.html',
			scope : modalScope
		}).result.then(function() {
			$http.get('worker/transferWorker2.do', {
				params : {
					workerIdList:workerIdList,
					id:id
				}
			}).then(function(response) {
				var data = response.data;
				if (data.success) {
					var modalScope = $scope.$new(true);
					modalScope.message = data.err_msg;
					UrlUtil.autoJump(modalScope, $scope.goList2);
				} else {
					var modalScope = $scope.$new(true);
					modalScope.title = "提示";
					modalScope.message = data.err_msg;
					$uibModal.open({
						templateUrl : 'template/modal/alert.html',
						scope : modalScope
					});
				}
			})
		});
	}
	$scope.goList2 = function() {
	    $window.location.href = UrlUtil.transform('worker/workerList.do?pageNo='+$scope.pager.currentPage);
	  }
	$scope.$watch('pager.currentPage', $scope.query);

} ]);
