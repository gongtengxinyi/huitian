var app = angular.module('app',// 
['ui.grid', 'ui.grid.edit', 'ui.grid.cellNav', 'ui.grid.validate', 'ui.bootstrap','ifu.util','ifu.form']);

app.controller('manageExceptionController', ['$scope', '$http', '$window', 'UrlUtil', '$uibModal',//
function($scope, $http, $window, UrlUtil, $uibModal) {

  $scope.contactsDatas = {};
  var pageNo=$("#pageNo").val();//将查看内容页面的PageNo传递回来，放入隐藏域，在这里取值

  // load
  $http.get('indentExc/findException.do', {
    params : {
      id : $scope.data.id
    }
  }).then(function(response) {
    $scope.data = response.data;
   console.log($scope.data);
  });

  $scope.save = function() {   
  
    if (!$scope.form1.$valid) {
      var modalScope = $scope.$new(true);
      modalScope.title = "处理异常不完整";
      modalScope.message = "当前异常处理信息不完整，请核对后再保存！";
      $uibModal.open({
        templateUrl : 'template/modal/alert.html',
        scope : modalScope
      }); 
      return false;
    }
    
    $http.post('indentExc/updateExc.do', $scope.data).then(function(response) {
      var data = response.data;
      if (data.success) {
        var modalScope = $scope.$new(true);
        modalScope.message = "操作成功";
        UrlUtil.autoJump(modalScope, $scope.goBack);
      } else {
        var modalScope = $scope.$new(true);
        modalScope.title = "操作失败";
        modalScope.message = data.err_msg;
        $uibModal.open({
          templateUrl : 'template/modal/alert.html',
          scope : modalScope
        }); 
      }
    });
  }
  
  $scope.goBack = function() {
    window.location.href = UrlUtil.transform('indentExc/indentExcList.do?indentNodeId='+$scope.data.indentNodeId+"&&pageNo="+pageNo);
	 
  }
  
  //播放aac视频；index为音频id,用来组合每个div的id值
  $scope.playAac=function(index,url){		  
	
	  var divName="myElement_"+index;
	  var n=0;
	 	 	
	  console.log(url);
	  jwplayer(divName).setup({
	      file: url,
	      image: "",
	      fontcolor :"#000",//播放器颜色
	      
	      width: 200,//播放器宽
	      height: 30,//播放器高
	      autostart:true//自动播放
	  });
	  
  }
  
}]);
