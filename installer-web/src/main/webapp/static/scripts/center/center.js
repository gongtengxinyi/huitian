var app = angular
    .module('app',// 
    ['ui.grid', 'ui.grid.edit', 'ui.grid.cellNav', 'ui.grid.validate', 'ui.bootstrap',
        'ifu.cityselect', 'ifu.form', 'ifu.util']);

app.controller('centerAddController',//
['$scope', '$http', '$window', '$uibModal', 'UrlUtil',//
function($scope, $http, $window, $uibModal, UrlUtil) {

  $scope.data = {};
  
  $scope.save = function() {
    return $http({
      method : 'POST',
      url : 'center/saveCenter.do', 
      headers : {
        'Content-Type' : undefined
      },
      transformRequest : function(data) {
        var formData = new FormData();        
        formData.append("data", angular.toJson(data.data));        
        for ( var f in data.file) {
          var items = data.file[f];
          for (var i in items) {
            formData.append(f, items[i]);
          }
        }
        return formData;
      },
      data : {
        data : $scope.data,
        file : $scope.file
      }
    }).then(function(response) {
      var data = response.data;
      if (data.success) {
        var modalScope = $scope.$new(true);
        modalScope.message = "添加加工中心成功";
        UrlUtil.autoJump(modalScope, $scope.goList);
      } else {
        var modalScope = $scope.$new(true);
        modalScope.title = "添加加工中心失败";
        modalScope.message =" 添加加工中心失败";
        $uibModal.open({
          templateUrl : 'template/modal/alert.html',
          scope : modalScope
        }); 
      }
    });
  
  }
  $scope.goList = function() {
	    $window.location.href = UrlUtil.transform('center/addcenter.do');
	  }
  $scope.goBack = function() {
    $window.location.href = UrlUtil.transform('center/centerList.do');
  }

}]);