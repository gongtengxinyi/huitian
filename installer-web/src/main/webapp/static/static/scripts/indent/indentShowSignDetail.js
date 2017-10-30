var app = angular.module('app',// 
['ui.bootstrap', 'ifu.util']);

app.controller('indentEvaluateMsgController', ['$scope', '$http', '$window', 'UrlUtil',
    function($scope, $http, $window, UrlUtil) {
	$scope.goBack = function() {
	    $window.location.href = UrlUtil.transform('indentNode/indentNodeTree.do?id='+$scope.id);
	  }

    }]);
