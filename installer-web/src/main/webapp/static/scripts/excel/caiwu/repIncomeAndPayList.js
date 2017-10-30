var app = angular.module('app', [ 'ui.bootstrap', 'ifu.util' ]);

app.controller('webReportIncomeController',//
[ '$scope', '$http', '$window', 'UrlUtil','$uibModal',//
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

	//正常页面显示分页
	$scope.query = function() {		
		$http.post('repIncome/doRepList.do', $scope.sf || {}, {
			params : {
				page : $scope.pager.currentPage,
				startDate : $scope.startDate,
				endDate : $scope.endDate
			}
		}).then(function(response) {
			var data = response.data;
		
			$scope.pager.totalItems = data.page.total;
			$scope.pager.itemsPerPage = data.page.pageSize;

			$scope.rows = data.rows;
		});
	}
	//FUJUAN ADD  回车键自动查询
	//Netscape/Firefox/Opera中不支持 window.event.keyCode,需要用event.which代替
	//IE用event.keCode方法获取当前被按下的键盘按键值，
	//而NetScape/FireFox/Opera用的则是event.which

	$scope.autoQuery = function(e) {
		var keycode = window.event ? e.keyCode : e.which;
		if (keycode == 13) {
			$scope.query();
		}
	};
	
	  //删除报表项
	  $scope.delFinanceReport=function(){ 
		  var modalScope = $scope.$new(true);
		  var id=this.data.id;
		  console.log(id);
		    modalScope.message = "亲！您确认要删除该报表项吗？ ";
		    $uibModal.open({
		      templateUrl : 'template/modal/delete.html',
		      scope : modalScope
		    }).result.then(function() {
		      $http.get('repIncome/delReport.do', {
		        params : {
		          id : id
		          
		        }
		      }).then(function(response) {	  
		    	 
		    	  $window.location.href = UrlUtil.transform('repIncome/repList.do?pageNo='+$scope.pager.currentPage);
		          
		      });
		    });
	  } 

	 $scope.exportRep =function(id){ 
		 
		  $window.location.href = UrlUtil.transform('repIncome/exportR.do?id='+id);
	  }
	
	$scope.$watch('pager.currentPage', $scope.query);

} ]);
