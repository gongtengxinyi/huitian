var app = angular.module('app', ['ui.bootstrap','ifu.form',  'ifu.template', 'ifu.util']);

app.controller('IndentListController',//
['$scope', '$http', '$uibModal', 'UrlUtil', '$window',//
function($scope, $http, $uibModal, UrlUtil, $window) {

  
	 
  $scope.serviceDate = {
    opened : false
  };

  
  //发布开始时间控件
  $scope.openServiceDate = function() {	
	    $scope.serviceDate.opened = true;
  }

  
  
  $scope.exportToday =function(){ 
	  var datestr=new Date();
	  datestr=datestr.toJSON();
	  $window.location.href = UrlUtil.transform('reportIndent/exportIndent.do?date='+datestr);
  }
  
  $scope.exportOtherday =function(){ 
	  if (!$scope.form1.$valid) {
	      var modalScope = $scope.$new(true);
	      modalScope.title = "提示";
	      modalScope.message = "请输入日期！";
	      $uibModal.open({
	        templateUrl : 'template/modal/alert.html',
	        scope : modalScope
	      }); 
	      return false;
	    }
	  
	  var datestr=$scope.data.serviceDate;
	
	  datestr=datestr.toJSON();
	  console.log("aaa:"+datestr);
	  $window.location.href = UrlUtil.transform('reportIndent/exportIndent.do?date='+datestr);
  }
  
}]);