var app = angular.module('app', ['ui.bootstrap', 'ifu.util']);

app.controller('wkmgrListController',//
    [ '$scope', '$http', '$window', 'UrlUtil','$uibModal',//
     function($scope, $http, $window, UrlUtil, $uibModal) {
    var pageNo=$("#pageNo").val();//将查看内容页面的PageNo传递回来，放入隐藏域，在这里取值
   	 $scope.pager = { //初始化pager的各个属性，totalItems，itemsPerPage都不能少，直接设置currentPage一个属性不起作用。
   	      totalItems:100,
   	      itemsPerPage:10,
   	      currentPage : pageNo, //初始化当前页面为传递过来的页面值，确保返回的结果为查看记录内容前的页面
   	      maxSize : 10
   	  }
    
     

      $scope.query = function() {  
   		 
        $http.post('wkMgrPrice/dolist.do', $scope.sf || {}, {
          params : {
            page : $scope.pager.currentPage
          }
        }).then(function(response) {        	
          var data = response.data;          
          console.log(data);
          $scope.pager.totalItems = data.page.total;
          $scope.pager.itemsPerPage = data.page.pageSize;

          $scope.rows = data.rows;
         
        });
      }
    //FUJUAN ADD  回车键自动查询
    //Netscape/Firefox/Opera中不支持 window.event.keyCode,需要用event.which代替
    //IE用event.keCode方法获取当前被按下的键盘按键值，
    //而NetScape/FireFox/Opera用的则是event.which

      $scope.autoQuery = function(e){
    	  var keycode = window.event?e.keyCode:e.which;
          if(keycode==13){         
              $scope.query();
          }
      };
	  $scope.del=function(){ 
		  var modalScope = $scope.$new(true);
		  var id=this.data.id;
		  console.log(id);
		  modalScope.message = "亲！您确认要删除该工匠经理人报价吗？ ";
		    $uibModal.open({
		      templateUrl : 'template/modal/delete.html',
		      scope : modalScope
		    }).result.then(function() {
		      $http.get('wkMgrPrice/delwkMgrPrice.do', {
		        params : {
		          id : id
		        }
		      }).then(function(response) {	  
		    	 
		    	  $window.location.href = UrlUtil.transform('wkMgrPrice/wkMgrpriceList.do?pageNo='+$scope.pager.currentPage);
		          
		      });
		    });
	  } 
   
      $scope.$watch('pager.currentPage', $scope.query);

    }]);
