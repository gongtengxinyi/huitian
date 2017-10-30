var app = angular.module('app',// 
['ui.grid', 'ui.grid.edit', 'ui.grid.cellNav', 'ui.grid.validate', 'ui.bootstrap','ifu.util','ifu.form']);

app.controller('manageExceptionController', ['$scope', '$http', '$window', 'UrlUtil', '$uibModal',//
function($scope, $http, $window, UrlUtil, $uibModal) {

  $scope.contactsDatas = {};
  var pageNo=$("#pageNo").val();//将查看内容页面的PageNo传递回来，放入隐藏域，在这里取值

  // load
  $http.get('indentWorkerContact/findWorkerContact.do', {
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
      modalScope.title = "请输入回复内容";
      modalScope.message = "输入信息不完整，请核对后再保存！";
      $uibModal.open({
        templateUrl : 'template/modal/alert.html',
        scope : modalScope
      }); 
      return false;
    }
    
    $http.post('indentWorkerContact/updateContact.do', $scope.data).then(function(response) {
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
    window.location.href = UrlUtil.transform('indentWorkerContact/indentWorkerContactList.do?indentNodeId='+$scope.data.indentNodeId+"&&pageNo="+pageNo);
	 
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
  
 
  
  
  $scope.playAmr = function() {
	  
      playerAudio("http://192.168.1.15/2016/201609/20160914/2b3269d412274d63bd112a9dc3c5c219.amr");
  }
  
 
  
  $("#playerBtn").bind("click",function(e){ 
	  alert("aa");
      var playerUrl = e.target.getAttribute("playerUrl");  
      playerAudio(playerUrl);  
  });  
  function playerAudio(url){  
	  var playerQT = document.getElementById("playerQT");  
	  
      var html = '<embed width="1px" height="1px" name="plugin" src='+url+' type=audio/quicktime id=QT_EMB>';  
      
      console.log(html);
      playerQT.innerHTML = '<embed width="1px" height="1px" name="plugin" src='+url+' type=audio/amr id=QT_EMB>';  
  }  
  
}]);
