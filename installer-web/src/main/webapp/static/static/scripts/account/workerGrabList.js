var app = angular.module('app', ['ui.bootstrap', 'ifu.cityselect2', 'ifu.util']);

app.controller('WorkerListController',//
['$scope', '$http', '$uibModal','$window', 'UrlUtil',//
function($scope,$http, $uibModal, $window,UrlUtil) {
	// 将状态赋值给sf
	// 不采用ng-init直接赋值给sf.status，在于sf作用域的区别
	$scope.sf = {}; //FUJUAN ADD 开始不加的时候，省份不能查询
	$scope.grabDate = {
		    opened : false
		  };

	$scope.openGrabDate = function() {
	    $scope.grabDate.opened = true;
	  }
	
	 var pageNo=$("#pageNo").val();//将查看内容页面的PageNo传递回来，放入隐藏域，在这里取值
	 $scope.pager = { //初始化pager的各个属性，totalItems，itemsPerPage都不能少，直接设置currentPage一个属性不起作用。
	      totalItems:100,
	      itemsPerPage:10,
	      currentPage : pageNo, //初始化当前页面为传递过来的页面值，确保返回的结果为查看记录内容前的页面
	      maxSize : 10
	  }

    $scope.autoQuery = function(e){
  	  var keycode = window.event?e.keyCode:e.which;
        if(keycode==13){         
            $scope.query();
        }
    };
       
   
    
    
    $scope.query = function() {	 
    	
    	 $("#pageNo").val=$scope.pager.currentPage;
		 var currentPage=$scope.pager.currentPage;//$scope.pager.currentPage;
		
		 
	     $http.post('workerGrab/dolist.do', $scope.sf || {}, {
	      params : {
	        page : $scope.pager.currentPage,
	       
	      }
	    }).then(function(response) {
	      var data = response.data;
	      $scope.pager.totalItems = data.page.total;
	      $scope.pager.itemsPerPage = data.page.pageSize;
	      $scope.data1 = data;
	      $scope.rows = data.rows;
	      
	     
	    });
  }
    
    
    

  
//导出报表
  $scope.export =function(){ 
	  $window.location.href = UrlUtil.transform('worker/exportExcel.do?pageNo='+$scope.pager.currentPage);
  }
  
 $scope.$watch('pager.currentPage', $scope.query);
  
 
}]);
