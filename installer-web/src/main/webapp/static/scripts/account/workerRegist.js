var app = angular.module('app', ['ui.bootstrap', 'ifu.cityselect2','ifu.form', 'ifu.util']);

app.controller('AdminAddController',//
['$scope', '$http', '$window', 'UrlUtil','$uibModal',//
function($scope, $http, $window, UrlUtil, $uibModal) {
	
	//在甲方名称上输入字符时，获取对应数据
	$scope.doTypeaheadApartys = function(q) {
		   
		    return $http.post('aparty/doTypeaheadZhizhuang.do', {
		      q : q
		    }).then(function(response) {   
		    			      
		      return response.data;
		    });
	};
    //选择不同数据时，取出apartyId
	$scope.onTypeaheadApartySelect = function($item, $model, $label) {
		  $scope.data.apartyId = $item.value;   
		 
	};
	
	 //搜索经理人
	  $scope.doTypeaheadManager = function(q) {
		if($scope.data.apartyId=="" || $scope.data.apartyId==null){
			alert("请先输入甲方名称");
			return;
		}
	    return $http.post('manager/doTypeahead.do', {
	      apartyId: $scope.data.apartyId,
	      q : q
	    }).then(function(response) {
	      return response.data;
	    });
	  };
	  //将managerId写入隐藏域
	  $scope.onTypeaheadManagerSelect = function($item, $model, $label) {
		    $scope.data.managerId = $item.value;
		  };
		  
	
 $scope.save = function() {
	  
	
        if (!$scope.form1.$valid) {
             return false;
        }
    
    $http.post('virtualWorker/doSaveRegist.do', $scope.data)//.then($scope.goBack);
    .then(function(response) {
        var data = response.data;
        if (data.success) {
          var modalScope = $scope.$new(true);
          modalScope.message = data.err_msg;
          UrlUtil.autoJump(modalScope, $scope.goBack);
        } else {      	
          var modalScope = $scope.$new(true);
          modalScope.title = "保存失败";
          modalScope.message = data.err_msg;
          $uibModal.open({
            templateUrl : 'template/modal/alert.html',
            scope : modalScope
          }); 
        }
      });
  }
  
  $scope.goBack = function() {
    $window.location.href = UrlUtil.transform('worker/workerList.do');
  }

}]);