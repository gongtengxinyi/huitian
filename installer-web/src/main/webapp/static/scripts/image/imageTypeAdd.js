var app = angular
    .module('app',// 
    ['ui.grid', 'ui.grid.edit', 'ui.grid.cellNav', 'ui.grid.validate', 'ui.bootstrap',
        'ifu.cityselect', 'ifu.form', 'ifu.util']);

app.controller('imageTypeAddController', ['$scope', '$http', '$window', 'UrlUtil', '$uibModal',
function($scope, $http, $window, UrlUtil, $uibModal) {
  $scope.data = {};
  $scope.goList = function() {
	    $window.location.href = UrlUtil.transform('image/addImageType.do');
	  }
  $scope.save = function() {
	
    return $http({
      method : 'POST',
      url : 'image/saveImageType.do', 
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
        modalScope.message ="添加图片类别成功";
        UrlUtil.autoJump(modalScope, $scope.goList);
      } else {
    	  $("#saveBtn").attr("disabled", false);
        var modalScope = $scope.$new(true);
        modalScope.title = "添加图片类别失败";
        modalScope.message = "添加图片类别失败";
        $uibModal.open({
          templateUrl : 'template/modal/alert.html',
          scope : modalScope
        }); 
      }
    }); 
  }
}]);	
	