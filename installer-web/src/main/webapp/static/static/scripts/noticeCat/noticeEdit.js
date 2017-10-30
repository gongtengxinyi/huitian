var app = angular
    .module('app',// 
    ['ui.grid', 'ui.grid.edit', 'ui.grid.cellNav', 'ui.grid.validate', 'ui.bootstrap',
        'ifu.cityselect', 'ifu.form', 'ifu.util']);

app.controller('noticeEditController',//
['$scope', '$http', '$window', '$uibModal', 'UrlUtil',//
function($scope, $http, $window, $uibModal, UrlUtil) {

  $scope.data = {};
  
  $scope.save = function() {
	
    if (!$scope.form1.$valid) {
      var modalScope = $scope.$new(true);
      modalScope.title = "信息不完整";
      modalScope.message = "当前表单输入信息不完整，请补充完整后再保存！";
      $uibModal.open({
        backdrop : 'static',
        templateUrl : 'template/modal/alert.html',
        scope : modalScope
      });  
      return false;
    }
   
    return $http({
        method : 'POST',
        url : 'notice/doEdit.do', 
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
          modalScope.message = data.err_msg;
          $window.location.href = UrlUtil.transform('notice/noticeList.do');
        } else {
      	  $("#saveBtn").attr("disabled", false);
          var modalScope = $scope.$new(true);
          modalScope.title = data.err_msg;
          modalScope.message = "公告保存失败";
          $uibModal.open({
            templateUrl : 'template/modal/alert.html',
            scope : modalScope
          }); 
        }
      });
  }

  $scope.goBack = function() {
    $window.location.href = UrlUtil.transform('notice/noticeList.do');
  }
}]);