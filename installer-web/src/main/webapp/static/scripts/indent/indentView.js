var app = angular.module('app',// ,'ifu.workerselect'
[ 'treeGrid', 'ui.bootstrap', 'ifu.template', 'ifu.form', 'ifu.cityselect2',
		'ifu.util' ]);

app.controller('IndentController',//
[
		'$scope',
		'$http',
		'$window',
		'$uibModal',
		'UrlUtil',
		function($scope, $http, $window, $uibModal, UrlUtil) {
			var city;
			$scope.data = {};
			var pageNo = $("#pageNo").val();
			var dataId = $("#dataId").val();
			
			$http.get("indent/getIndentAllInfo.do", {
				params : {
					id : dataId
				}
			}).then(function(response) {
				$scope.data = response.data;
				console.log($scope.data);
				/********************FUJUAN0511 ADD END*********************************************************/
			});
			
			//加载文件
			  $http.get('indent/loadInstallImgFiles.do', {
			    params : {
			      id : dataId
			    }
			  }).then(function(data) {
			    $scope.installImgFiles = data.data;
			  });
			
			

			//播放aac视频；index为音频id,用来组合每个div的id值
			$scope.playAac = function(index, url) {

				var divName = "myElement_" + index;
				var n = 0;

				console.log(url);
				jwplayer(divName).setup({
					file : url,
					image : "",
					fontcolor : "#000",//播放器颜色

					width : 200,//播放器宽
					height : 30,//播放器高
					autostart : true
				//自动播放
				});

			}

			$scope.goBack = function() {
				$window.location.href = UrlUtil
						.transform('indent/indentList.do?pageNo=' + pageNo);
			}

			//新增工匠反馈
			$scope.indentExceptionAdd = function() {

				$window.open('indent/indentExceptionAdd.do?id=' + id
						+ '&pageNo=' + $scope.pager.currentPage);

			}

			$scope.finishHand = function(id) {
				var modalScope = $scope.$new(true);
				$http.get('indent/setIndentOffline.do', {
					params : {
						indentId : id
					}
				}).then(function(response) {
					var data = response.data;
					if (data.success) {
						var modalScope = $scope.$new(true);
						modalScope.title = "提示";
						modalScope.message = "完成成功";
						$uibModal.open({
							templateUrl : 'template/modal/alert.html',
							scope : modalScope
						});
						
					} else {
						var modalScope = $scope.$new(true);
						modalScope.title = "设置失败";
						modalScope.message = data.err_msg;
						$uibModal.open({
							templateUrl : 'template/modal/alert.html',
							scope : modalScope
						});
					}
				});

			}

			$scope.setIfExport = function(id) {
				var modalScope = $scope.$new(true);

				$http.get('indentExc/setIfExport.do', {
					params : {
						id : id
					}
				}).then(function(response) {
					var data = response.data;
					if (data.success) {
						var modalScope = $scope.$new(true);
						modalScope.title = "提示";
						modalScope.message = "设置成功";
						$uibModal.open({
							templateUrl : 'template/modal/alert.html',
							scope : modalScope
						});
					} else {
						var modalScope = $scope.$new(true);
						modalScope.title = "设置失败";
						modalScope.message = data.err_msg;
						$uibModal.open({
							templateUrl : 'template/modal/alert.html',
							scope : modalScope
						});
					}
				});

			}
		} ]);
