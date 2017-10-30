var app = angular.module('app', ['ui.bootstrap', 'ifu.cityselect2','ifu.form', 'ifu.util']);

app.controller('webReportIncomeController',//
['$scope', '$http', '$window', 'UrlUtil','$uibModal',//
function($scope, $http, $window, UrlUtil, $uibModal) {
	var pageNo = $("#pageNo").val();//将查看内容页面的PageNo传递回来，放入隐藏域，在这里取值
	$scope.pager = { //初始化pager的各个属性，totalItems，itemsPerPage都不能少，直接设置currentPage一个属性不起作用。
		totalItems : 100,
		itemsPerPage : 10,
		currentPage : pageNo, //初始化当前页面为传递过来的页面值，确保返回的结果为查看记录内容前的页面
		maxSize : 10
	}
	$scope.crtDateBegin = {
		opened : false
	};

	$scope.crtDateEnd = {
		opened : false
	};

	$scope.openCrtDateBegin = function() {
		$scope.crtDateBegin.opened = true;
	}

	$scope.openCrtDateEnd = function() {
		$scope.crtDateEnd.opened = true;
	}

	$scope.beginDate = {
		opened : false
	};

	$scope.overDate = {
		opened : false
	};

	$scope.openBeginDate = function() {
		$scope.beginDate.opened = true;
	}

	$scope.openOverDate = function() {
		$scope.overDate.opened = true;
	}
	
	
	
	
	 $scope.save = function() {
	  
        if (!$scope.form1.$valid) {
             return false;
         }
  	  $("#btnSave").attr("disabled", true);
    	$http.post('repIncome/creatRep.do', $scope.sf || {}, {
			params : {
				page : $scope.pager.currentPage,
				reportName : $scope.reportName,
				startDate :$scope.startDate,
				endDate : $scope.endDate
			}
		}).then(function(response) {
			var data = response.data;
			 if (data.SUCCESS=='SUCCESS') { //这里的判断
		          var modalScope = $scope.$new(true);
		          modalScope.message = data.err_msg;
		          UrlUtil.autoJump(modalScope, $scope.goBack);
		        }
			 else {  
			  	  $("#btnSave").attr("disabled", false);

		          var modalScope = $scope.$new(true);
		          modalScope.title = "保存失败";
		          modalScope.message = data.err_msg;
		          $uibModal.open({
		            templateUrl : 'template/modal/alert.html',
		            scope : modalScope
		          }); 
		        }
		}); 
    	

  }
  
  $scope.goBack = function() {
    $window.location.href = UrlUtil.transform('repIncome/repList.do');
  }
  


}]);