var app = angular.module('app', ['ui.bootstrap', 'ifu.cityselect2', 'ifu.util']);

app.controller('WorkerListController',//
['$scope', '$http', '$uibModal','$window', 'UrlUtil',//
function($scope,$http, $uibModal, $window,UrlUtil) {
	var pageNo=$("#pageNo").val();
	var indentId=$("#indentId").val();
	
	  //将mworkerId写入隐藏域
	  $scope.onTypeaheadWorkerSelect = function($item, $model, $label) {
		    $scope.data.workerId = $item.value;
		  };
	//搜索工匠
	 $scope.doTypeaheadWorker = function(q) {
	    return $http.post('worker/doTypeaheadForChangeWorker.do', {
	  
	      city: $scope.data.city,
	      managerId: $scope.data.managerId,
	      q : q
	    }).then(function(response) {
	    	console.log(response.data);
	      return response.data;
	    });
	  };
	//经理人选择改变时，查询其名下的工匠
	$scope.showWorker=function(){
		
		 $http.get('worker/workerDataAll.do',
	      {
	         params :
	         {
	           managerId : $scope.data.managerId,
	          // serveType : $scope.data.serveType,
	           //regionDist : $scope.data.regionDist,
	         //  sorts : $scope.dataSort
	         }
	       }).then(function(response) 
	       {
	         //动态加载 符合条件的工匠信息
	         var WorkerData = response.data;
	         $scope.workers = WorkerData;
	       });
	}
	
	 $scope.goBack = function() {
   	    $window.location.href = UrlUtil.transform('indent/indentList.do?pageNo='+pageNo);
   	 
     }
	 //更换工匠
	 $scope.changeWorker = function() {
		  var modalScope = $scope.$new(true);
		  var id=this.data.workerId;
		    modalScope.message = "您确认要更换工匠吗？ ";
		    $uibModal.open({
		      templateUrl : 'template/modal/confirm.html',
		      scope : modalScope
		    }).result.then(function() {
		     /* $http.get('indent/workerChangeNew.do', {
		        params : {
		        	workerId : $scope.data.workerId,
		        	managerId: $scope.data.managerId,
		        	indentId :indentId
		        }*/
		    	$http.post('indent/workerChangeNew.do', $scope.data ||{},{
			        params : {
			                   // pageNo :pageNo
			                }
			        }).then(function(response) {		    	  
		    	  var modalScope = $scope.$new(true);
		          modalScope.title = "更换成功!";
		          modalScope.message = "更换工匠成功";
		          UrlUtil.autoJump(modalScope, $scope.goBack);
		    	//  $window.location.href = UrlUtil.transform('indent/indentList.do?pageNo='+pageNo);
		       
		      });
		    }); 	 
	    	 
	 }
	
}]);
