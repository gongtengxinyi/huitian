var app = angular.module('app', ['ui.bootstrap','ifu.util']);

app.controller('AdminListController',
['$scope', '$http','$uibModal','$window','UrlUtil',
function($scope, $http,$uibModal,$window,UrlUtil) {
	var pageNo=$("#pageNo").val();
  $scope.pager = {
    currentPage : 1,
    maxSize : 10
  }

  $scope.query = function() {
    $http.post('indentAction/list.do', $scope.sf || {}, {
      params : {
        page : $scope.pager.currentPage
      }
    }).then(function(response) {
      var data = response.data;
      $scope.pager.totalItems = data.page.total;
      $scope.pager.itemsPerPage = data.page.pageSize;

      $scope.rows = data.rows;
    });
  }

  $scope.$watch('pager.currentPage', $scope.query);
  
  $scope.goBack = function() {
	    $window.location.href = UrlUtil.transform('indent/indentList.do?pageNo='+pageNo);
  }

//删除工匠
  $scope.delContact =function(){ 
	  var modalScope = $scope.$new(true);
	  var id=this.data.id;
	
	    modalScope.message = "您确认要删除该记录吗？ ";

	    $uibModal.open({
	      templateUrl : 'template/modal/delete.html',
	      scope : modalScope
	    }).result.then(function() {
	      $http.get('indentAction/delContact.do', {
	        params : {
	          id : id
	          
	        }
	      }).then(function(response) {	  
	    	
	    	  $window.location.href = UrlUtil.transform('indentAction/indentActionList.do?pageNo='+$scope.pager.currentPage+'&id='+$scope.sf.indentId);
	          
	      });
	    });
  } 
}]);
