var app = angular.module('app',// 
['ui.bootstrap','ifu.template','ifu.form','ifu.util']);

app.controller('IndentController',//
[ '$scope', '$http', '$window','$uibModal', 'UrlUtil',
  function($scope, $http, $window, $uibModal, UrlUtil) {
	var pageNo=$("#pageNo").val();
 
	$scope.data = {};
 
	//标记订单提报账单状态
	  $scope.commitBill =function(type){ 
				   var modalScope = $scope.$new(true);
				    modalScope.message = "您确认要标记该订单的账单提报状态吗？";
				    $uibModal.open({
				      templateUrl : 'template/modal/confirm.html',
				      scope : modalScope
				    }).result.then(function() {
				      $http.get('indent/commitBill.do', {
				        params : {
				          id : $scope.data.indentId,
				          type:type
				        }
				      }).then(function (response) {
				        var data = response.data;
				        if (data.success) {
				          var modalScope = $scope.$new(true);
				          modalScope.message = data.err_msg;
				          UrlUtil.autoJump(modalScope, $scope.goList);
				        } else {
				          var modalScope = $scope.$new(true);
				          modalScope.title = "标记失败";
				          modalScope.message = data.err_msg;
				          $uibModal.open({
				            templateUrl : 'template/modal/alert.html',
				            scope : modalScope
				          }); 
				        }
				      });
				    });
	  };
  
 
  
  $scope.goList=function(){
	 
	  $window.location.href = UrlUtil.transform('indent/indentCommitBill.do?pageNo='+pageNo+"&indentId="+$scope.data.indentId);
  }
  $scope.goBack=function(){
		  $window.location.href = UrlUtil.transform('indent/indentList.do?pageNo='+pageNo);
		 
	  }

}]);
