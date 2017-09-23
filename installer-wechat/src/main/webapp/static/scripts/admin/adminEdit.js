var app = angular.module('app', ['ui.bootstrap', 'ifu.template', 'ifu.util']);

app.controller('AdminEditController',//
['$scope', '$http', '$window', '$uibModal', 'UrlUtil',//
function($scope, $http, $window, $uibModal, UrlUtil) {
	
	
	
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

  var r = $http.get('admin/load.do', {
    params : {
      id : $scope.id
    }
  }).then(function(response) {
    $scope.data = response.data;
  });
  
  

  
  

  console.log(r);
  console.log(r.then());
  console.log(r.then().then());

  $scope.doSave = function() {
    if (!$scope.form1.$valid) {
      return false;
    }

    if ($scope.data.isSystem == 1) {
      return;
    }

    $http.post('admin/update.do', $scope.data).then($scope.goBack);
  };

  $scope.doDelete = function() {

    if ($scope.data.isSystem == 1) {
      return;
    }

    var id = $scope.data.id;

    $uibModal.open({
      templateUrl : 'template/modal/delete.html'
    }).result.then(function() {
      $http.get('admin/delete.do', {
        params : {
          id : id
        }
      }).then($scope.goBack);
    });
  };

  $scope.goBack = function() {
    $window.location.href = UrlUtil.transform('admin/adminList.do');
  };

}]);