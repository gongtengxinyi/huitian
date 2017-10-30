var app = angular.module('app', ['ui.bootstrap','ifu.util']);


app.controller('IndentNodeImgController',//
['$scope', '$window', 'UrlUtil','$http',//
function($scope, $window, UrlUtil,$http) {

  $scope.pager = {
    currentPage : 1,
    maxSize : 10
  }
  var nodeId=$("#nodeId").val();
  console.log("AA:"+nodeId);
  $scope.data={};
  
  
 /* $http.get("indentNodeStep/getImgUrl.do", {
	    params : {
	      id : nodeId
	    }
	  }).then(function(response) {
	    $scope.data.rows=response.data.data;
	  
	    console.log($scope.data.rows);
	    
	  });*/
  

  $scope.$watch('pager.currentPage', $scope.query);
  
  $scope.goBack = function() {
    $window.location.href = UrlUtil.transform('indentNode/indentNodeTree.do?id='+$scope.id);
  }
  
}]);
