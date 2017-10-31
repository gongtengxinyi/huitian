var app = angular.module('app', ['ui.bootstrap', 'ifu.cityselect3','ifu.template', 'ifu.util']);

app.controller('wordblankListController',//
['$scope', '$http', 'UrlUtil','$uibModal', '$window',//
function($scope, $http, UrlUtil, $uibModal, $window) {
	
	
	
	$scope.sf = {}; //FUJUAN ADD 开始不加的时候，省份不能查询
	$scope.registDateBegin = {
		    opened : false
		  };

  $scope.registDateEnd = {
		    opened : false
		  };
//注册开始时间控件
  $scope.openRegistDateBegin = function() {
    $scope.registDateBegin.opened = true;
  }
//注册结束时间控件
  $scope.openRegistDateEnd = function() {
    $scope.registDateEnd.opened = true;
  }
  
  $scope.checkDateBegin = {
		    opened : false
		  };

  $scope.checkDateEnd = {
		    opened : false
		  };
//审核开始时间控件
  $scope.openCheckDateBegin = function() {
    $scope.checkDateBegin.opened = true;
  }
//审核结束时间控件
  $scope.openCheckDateEnd = function() {
    $scope.checkDateEnd.opened = true;
  }
  $scope.sf.registDateBegin=Date.parse($("#registBegin").val());//将存储在隐藏域的日期显示在日期控件
  $scope.sf.registDateEnd=Date.parse($("#registEnd").val());
  $scope.sf.checkDateBegin=Date.parse($("#checkBegin").val());
  $scope.sf.checkDateEnd=Date.parse($("#checkEnd").val());
	
	var pageNo=$("#pageNo").val();//将查看内容页面的PageNo传递回来，放入隐藏域，在这里取值
	 $scope.pager = { //初始化pager的各个属性，totalItems，itemsPerPage都不能少，直接设置currentPage一个属性不起作用。
	      totalItems:1000000,
	      itemsPerPage:10,
	      currentPage : pageNo, //初始化当前页面为传递过来的页面值，确保返回的结果为查看记录内容前的页面
	      maxSize : 10
	  }
	// $scope.pager.currentPage=pageNo;
  $scope.autoQuery = function(e){
	  var keycode = window.event?e.keyCode:e.which;
      if(keycode==13){         
          $scope.query();
      }
  };
  
  $scope.query = function() {
      $("#pageNo").val=$scope.pager.currentPage;
      var currentPage=$scope.pager.currentPage;//$scope.pager.currentPage;
		
		
		
       /* if($("#isHelper").prop('checked')==true){//如果选择首页提醒，字段置为YES
			
			  $scope.sf.isHelper="1";		  
		  }
		  else{
			 
			  $scope.sf.isHelper="0";
		  }*/
		 
	     $http.post('manager/dolist.do', $scope.sf || {}, {
	      params : {
	        page : $scope.pager.currentPage,
	       
	      }
    }).then(function(response) {
      var data1 = response.data;
      $scope.pager.totalItems = data1.page.total;
      $scope.pager.itemsPerPage = data1.page.pageSize;
	  $scope.pager.currentPage=data1.page.page;
      $scope.data1=data1;
      $scope.rows = data1.rows;

     
      /*if($scope.sf.isHelper=="1"){//如果是首页提醒，复选框为选中状态
    	  alert("1");
    	  $("#isHelper").attr('checked',true); 
      }
      else {
    	  alert("0");
    	$("#isHelper").attr('checked',false); 
      }*/
    });
  }
 
  $scope.$watch('pager.currentPage', $scope.query);
  
  //甲方解除与经理人关系
  $scope.delJfManager =function(){ 
	  var modalScope = $scope.$new(true);
	  var id=this.data.id;
	    modalScope.message = "您确认要和该经理人解除关系吗？ ";
	    $uibModal.open({
	      templateUrl : 'template/modal/delete.html',
	      scope : modalScope
	    }).result.then(function() {
	      $http.get('manager/deletemanagerJoinJf.do', {
	        params : {
	          id : id	          
	        }
	      }).then(function(response) {
	    	     var data = response.data;
	 	        if (data.success) {
	 	          var modalScope = $scope.$new(true);
	 	          modalScope.message = data.err_msg;
 		    	  //$window.location.href = UrlUtil.transform('manager/managerList.do?pageNo='+$scope.pager.currentPage);
	 	          UrlUtil.autoJump(modalScope, $scope.goList);
	 	        } else {
	 	        	 var modalScope = $scope.$new(true);	         
	 		         modalScope.title ="提示";
	 		         modalScope.message =data.err_msg ;
	 		         $uibModal.open({
	 		                 templateUrl : 'template/modal/alert.html',
	 		                 scope : modalScope
	 		               }); 
	 	        }
	       
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
  
  $scope.export = function() {	 
	  	
	     $http({
		    url: 'manager/exportExcel.do',
		    method: "POST",		   
		    headers: {
		        'Content-type': 'application/json'
		     },
		    responseType: 'arraybuffer',
		    data:$scope.sf || {},
		})		 
	   .then(function(response) {//获取xls数据流，存入文件下载
	    	 var blob = new Blob([response.data], {type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"});
	    	 /*    var objectUrl = URL.createObjectURL(blob);
	    	    alert(objectUrl);
	    	    window.open(objectUrl);*/	   	
	    	
	    	 if (window.navigator.msSaveOrOpenBlob) {
	    	        navigator.msSaveBlob(blob, "manager.xls");
	    	    } else {
	    	        var link = document.createElement('a');
	    	        link.href = window.URL.createObjectURL(blob);
	    	        link.download = "manager.xls";
	    	        link.click();
	    	        window.URL.revokeObjectURL(link.href);
	    	    }
      
	     
	    });}
	   
  
  		//筛选导出报表
     $scope.export = function() {	 
	  	
	     $http({
		    url: 'manager/exportExcel.do',
		    method: "POST",		   
		    headers: {
		        'Content-type': 'application/json'
		     },
		    responseType: 'arraybuffer',
		    data:$scope.sf || {},
		})		 
	   .then(function(response) {//获取xls数据流，存入文件下载
	    	 var blob = new Blob([response.data], {type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"}); 	
	    	 
	    	 if (window.navigator.msSaveOrOpenBlob) {
	    	        navigator.msSaveBlob(blob, "manager.xls");
	    	    } else {
	    	        var link = document.createElement('a');
	    	        link.href = window.URL.createObjectURL(blob);
	    	        link.download = "manager.xls";
	    	        link.click();
	    	        window.URL.revokeObjectURL(link.href);
	    	    }
	    });}
     
	  
		//搜索甲方
		  $scope.doTypeaheadApartys = function(q) {
		    return $http.post('aparty/doTypeahead.do', {
		      q : q
		    }).then(function(response) {
		      return response.data;
		    });
		  };
		 
		  $scope.onTypeaheadApartySelect = function($item, $model, $label) {
		    $scope.data.apartyId = $item.value;
		  };

}]);
