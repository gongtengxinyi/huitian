var app = angular.module('app', ['ui.bootstrap', 'ifu.cityselect', 'ifu.template']);

app.controller('ApartyListController',//
['$scope', '$http', '$uibModal',//
function($scope, $http, $uibModal) {
  
  $scope.sf = {};
  
  
  var pageNo=$("#pageNo").val();//将查看内容页面的PageNo传递回来，放入隐藏域，在这里取值
  $scope.pager = { //初始化pager的各个属性，totalItems，itemsPerPage都不能少，直接设置currentPage一个属性不起作用。
	      totalItems:100,
	      itemsPerPage:10,
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

  

  $scope.query = function() {
	  
	  //如果选择了直装
	    if($("#isZhizhuang").prop('checked')==true){  
	    	
			  $scope.sf.isZhizhuang="是";	//赋值,以供后台筛选（）		  
		}
	    else{
	    	 $scope.sf.isZhizhuang="否";	//赋值,以供后台筛选（）		
	    }
	    //如果选择了入驻商家
	    if($("#isRuzhu").prop('checked')==true){  
	    	
			  $scope.sf.isRuzhu="是";	//赋值,以供后台筛选（）		  
		}else{
			 $scope.sf.isRuzhu="否";	//赋值,以供后台筛选（）	
		}
		 
	 
    $http.post('aparty/dolist.do', $scope.sf || {}, {
      params : {
        page : $scope.pager.currentPage
      }
    }).then(function(response) {
      var data = response.data;
      $scope.pager.totalItems = data.page.total;
      $scope.pager.itemsPerPage = data.page.pageSize;

      $scope.rows = data.rows;
    });
  }
  
  $scope.doClose = function(id) {
    var modalScope = $scope.$new(true);
    modalScope.message = "您确认要停用该甲方吗？";
    $uibModal.open({
      templateUrl : 'template/modal/confirm.html',
      scope : modalScope
    }).result.then(function() {
      $http.get('aparty/controlAparty.do', {
        params : {
          id : id,
          mark : '1'
        }
      }).then(function(response) {
        var data = response.data;
        if (data.success) {
          location.replace(location);
        }
      });
    });
  }

  $scope.doOpen = function(id) {
    var modalScope = $scope.$new(true);
    modalScope.message = "您确认要启用该甲方吗？";
    $uibModal.open({
      templateUrl : 'template/modal/confirm.html',
      scope : modalScope
    }).result.then(function() {
      $http.get('aparty/controlAparty.do', {
        params : {
          id : id,
          mark : '2'
        }
      }).then(function(response) {
        var data = response.data;
        if (data.success) {
          location.replace(location);
        }
      });
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
  
  $scope.$watch('pager.currentPage', $scope.query);

}]);
