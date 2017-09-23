var app = angular.module('app', ['ui.bootstrap', 'ifu.util']);

app.controller('AdminChangePwdController',//
['$scope', '$http', '$window', 'UrlUtil','$uibModal',//
function($scope, $http, $window, UrlUtil, $uibModal) {
	$scope.doSave = function() {	 
	   
        if (!$scope.form1.$valid) {
        	 var modalScope = $scope.$new(true);
             modalScope.title = "提示";
             modalScope.message = "请输入完整信息！";
             $uibModal.open({
               templateUrl : 'template/modal/alert.html',
               scope : modalScope
             }); 
             return false;
        }   
        if($scope.data.newPwd!=$scope.data.confirmNewPwd)
		  {
		    alert("两次密码输入不一致，请重新输入！");
		    return false;
		  }
        $http.post('admin/changePwd.do', $scope.data).then(function(response) {
                var data = response.data
                console.log(data);
                if (data.success) {
                  var modalScope = $scope.$new(true);
                  modalScope.message = "密码修改成功！";
                  UrlUtil.autoJump(modalScope, function() {
                    $window.location.href = UrlUtil.transform('home/homepage.do');
                  });
                }
                else{
                	var modalScope = $scope.$new(true);
                	modalScope.title = "提示";
                    modalScope.message = "密码错误，请重新输入密码！";
                    $uibModal.open({
                        templateUrl : 'template/modal/alert.html',
                        scope : modalScope
                      }); 
                }
              });
            }
  
  $scope.goBack = function() {
    $window.location.href = UrlUtil.transform('home/homepage.do');
  }
 

}]);