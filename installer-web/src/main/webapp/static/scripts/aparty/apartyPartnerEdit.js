var app = angular.module('app', ['ui.bootstrap', 'ifu.cityselect2','ifu.form', 'ifu.util']);

app.controller('apartyPartnerEditController',//
['$scope', '$http', '$window', 'UrlUtil','$uibModal',//
function($scope, $http, $window, UrlUtil, $uibModal) {
 $scope.save = function() {
        if (!$scope.form1.$valid) {
             return false;
        }
    
    $http.post('apartyPartner/doUpdateApartyPartner.do', $scope.data)//.then($scope.goBack);
    .then(function(response) {
        var data = response.data;
        if (data.success) {
          var modalScope = $scope.$new(true);
          modalScope.message = data.err_msg;
          UrlUtil.autoJump(modalScope, $scope.goBack);
        } else {      	
          var modalScope = $scope.$new(true);
          modalScope.title = "修改失败";
          modalScope.message = data.err_msg;
          $uibModal.open({
            templateUrl : 'template/modal/alert.html',
            scope : modalScope
          }); 
        }
      });
  }
  
  $scope.goBack = function() 
      {
	    $window.location.href = UrlUtil.transform('aparty/apartyPartnerList.do?apartyId='+$scope.data.apartyId);
	  }
 
  
}]);