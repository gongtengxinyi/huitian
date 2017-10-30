var app = angular.module('app', ['ui.bootstrap','ifu.cityselect', 'ifu.util']);

app.controller('PartnerListController',//
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
   		 
        $http.post('apartyPartner/dolist.do', $scope.sf || {}, {
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
   	 
   	 
   	 
   	 $scope.autoQuery = function(e){
   	  var keycode = window.event?e.keyCode:e.which;
         if(keycode==13){         
             $scope.query();
         }
     };
     
	  //删除报表项
	  $scope.delApartyPartner=function(){ 
		  var modalScope = $scope.$new(true);
		  var id=this.data.id;
		  var apartyId=this.data.apartyId;
		  console.log(id);
		    modalScope.message = "亲！您确认要删除该商家合作伙伴吗？ ";
		    $uibModal.open({
		      templateUrl : 'template/modal/delete.html',
		      scope : modalScope
		    }).result.then(function() {
		      $http.get('apartyPartner/delApartyPartner.do', {
		        params : {
		          id : id
		          
		        }
		      }).then(function(response) {	  
		    	 
		    	  $window.location.href = UrlUtil.transform('aparty/apartyPartnerList.do?pageNo='+$scope.pager.currentPage+'&apartyId='+apartyId);
		          
		      });
		    });
	  } 
    
      $scope.addApartyPartner=function(id){
    	  $window.location.href = UrlUtil.transform('aparty/apartyPartnerAdd.do?pageNo='+$scope.pager.currentPage+'&apartyId='+id);
      }
     
      $scope.goBack = function() {
  		
  	    $window.location.href = UrlUtil.transform('aparty/apartyList.do?pageNo='+pageNo);
  	  }
      $scope.$watch('pager.currentPage', $scope.query);

    }]);
