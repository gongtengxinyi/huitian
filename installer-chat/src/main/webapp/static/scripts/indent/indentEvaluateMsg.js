var app = angular.module('app',// 
['ui.bootstrap', 'ifu.util']);

app.controller('indentEvaluateMsgController', ['$scope', '$http', '$window', 'UrlUtil',
    function($scope, $http, $window, UrlUtil) {
	 var pageNo=$("#pageNo").val();//将查看内容页面的PageNo传递回来，放入隐藏域，在这里取值
	 var indentId=$("#indentId").val();
      $http.get("indentEvaluate/findByIndentId.do", {
        params : {
          indentId : $scope.data.id
        }
      }).then(function(response) {
        $scope.data = response.data;
        console.log($scope.data);
      
      });
      console.log(pageNo);
      
      $scope.goBack = function() {
    	 
    	if(pageNo==null || pageNo==""){
           
           $window.location.href = UrlUtil.transform('indentNode/indentNodeTree.do?id='+indentId);
        }
        else{    	  
        	$window.location.href = UrlUtil.transform('indent/indentList.do?pageNo='+pageNo);
       }
      }

    }]);
