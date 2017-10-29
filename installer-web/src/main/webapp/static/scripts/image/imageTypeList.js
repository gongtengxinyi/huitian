var app = angular.module('app', ['ui.bootstrap', 'ifu.cityselect2','ifu.template', 'ifu.util']);

app.controller('ImageListController',//
['$scope', '$http', 'UrlUtil','$uibModal', '$window',//
function($scope, $http, UrlUtil, $uibModal, $window) {
	$scope.sf = {}; //FUJUAN ADD 开始不加的时候，省份不能查询

	var pageNo=$("#pageNo").val();//将查看内容页面的PageNo传递回来，放入隐藏域，在这里取值
	 $scope.pager = { //初始化pager的各个属性，totalItems，itemsPerPage都不能少，直接设置currentPage一个属性不起作用。
	      totalItems:100,
	      itemsPerPage:10,
	      currentPage : pageNo, //初始化当前页面为传递过来的页面值，确保返回的结果为查看记录内容前的页面
	      maxSize : 10
	  }
	 $scope.pager.currentPage=pageNo;
  $scope.autoQuery = function(e){
	  var keycode = window.event?e.keyCode:e.which;
      if(keycode==13){         
          $scope.query();
      }
  };
  
  $scope.query = function() {
	     $("#pageNo").val=$scope.pager.currentPage;
		 var currentPage=$scope.pager.currentPage;//$scope.pager.currentPage;		 
	     $http.post('manager/dolist.do', $scope.sf || {}, {
	      params : {
	        page : $scope.pager.currentPage,
	       
	      }
    }).then(function(response) {
      var data1 = response.data;
      $scope.pager.totalItems = data1.page.total;
      $scope.pager.itemsPerPage = data1.page.pageSize;
      $scope.data1=data1;
      $scope.rows = data1.rows;
      console.log($scope.data2);
     
    /*  if(data1.apartyIdDisp!="" && data1.apartyIdDisp!=null){    	  
    	  $("#linkAddManager").css("display","");    	 
      }
      else{
    	  $("#linkAddManager").css("display","none");    	 
      }*/
    });
  }
 
  $scope.$watch('pager.currentPage', $scope.query);
  
  //甲方解除与经理人关系
  $scope.delJfManager =function(){ 
	  var modalScope = $scope.$new(true);
	  var id=this.data.id;
	    modalScope.message = "您确认要删除该经理人吗？ ";
	    $uibModal.open({
	      templateUrl : 'template/modal/delete.html',
	      scope : modalScope
	    }).result.then(function() {
	      $http.get('manager/deletemanagerJoinJf.do', {
	        params : {
	          id : id	          
	        }
	      }).then(function(response) {
	    	 /* var data=response.data;
	    	  var modalScope = $scope.$new(true);
	          modalScope.title = "发布订单成功!";
	          modalScope.message = data.err_msg;
	          UrlUtil.autoJump(modalScope, $scope.goList);
	    	 */
	    	  $window.location.href = UrlUtil.transform('manager/managerList.do?pageNo='+$scope.pager.currentPage);
	       
	      });
	    });
  } 
  
//删除经理人
  $scope.delManager =function(){ 
	  var modalScope = $scope.$new(true);
	  var id=this.data.id;
	    modalScope.message = "您确认要删除该经理人吗？ ";
	    $uibModal.open({
	      templateUrl : 'template/modal/delete.html',
	      scope : modalScope
	    }).result.then(function() {
	      $http.get('manager/delManager.do', {
	        params : {
	          id : id	          
	        }
	      }).then(function(response) {
	    	  var data=response.data;
	    	  if(data.success==true){
	    	     $window.location.href = UrlUtil.transform('manager/managerList.do?pageNo='+$scope.pager.currentPage);
	    	  }else{
	    		 alert("当前经理人名下还有工匠，不能删除！");
	    	  }
	       
	      });
	    });
  } 
  
  $scope.goList = function() {
	    $window.location.href = UrlUtil.transform('manager/managerList.do?pageNo='+$scope.pager.currentPage);
	  }
	    

}]);
