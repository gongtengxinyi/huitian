var app = angular.module('app',// 
['ui.grid', 'ui.grid.edit', 'ui.grid.cellNav', 'ui.grid.validate', 'ui.bootstrap','ifu.util','ifu.form']);

app.controller('manageExceptionController', ['$scope', '$http', '$window', 'UrlUtil', '$uibModal',//
function($scope, $http, $window, UrlUtil, $uibModal) {

  $scope.contactsDatas = {};
  var pageNo=$("#pageNo").val();//将查看内容页面的PageNo传递回来，放入隐藏域，在这里取值

  // load
  $http.get('userContact/findUserContact.do', {
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
    
    $http.post('userContact/updateUserContact.do', $scope.data).then(function(response) {
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
   // window.location.href = UrlUtil.transform('userContact/userContactList.do?indentId='+$scope.data.indentId+"&&pageNo="+pageNo);
	  window.opener.location.reload();//刷新父页面
	  window.close();
  }
  
  
  
}]);
