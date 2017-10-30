var app = angular.module('app', ['ui.bootstrap', 'ifu.util']);

app.controller('AdminAddController',//
['$scope', '$http', '$window', 'UrlUtil',//
function($scope, $http, $window, UrlUtil) {

	//在甲方名称上输入字符时，获取对应数据
	$scope.doTypeaheadApartys = function(q) {
		   
		    return $http.post('aparty/doTypeahead.do', {   //Zhizhuang
		      q : q
		    }).then(function(response) {   
		    			      
		      return response.data;
		    });
	};
    //选择不同数据时，取出apartyId
	$scope.onTypeaheadApartySelect = function($item, $model, $label) {
		  $scope.data.apartyId = $item.value;   
		 
	};
	
	
	$scope.save = function() {
	    //如果显示的甲方名称被清空，则清空id值	
	    if($scope.data.apartyIdDisp==""){
		    $scope.data.apartyId ="";
	    }
	    if($("#ifGeneralAdmin").prop('checked')==true){//如果选择首页提醒，字段置为YES
			  
			  $scope.data.ifGeneralAdmin="YES";		  
		}
		else{
			  $scope.data.ifGeneralAdmin="NO";
		}
	
        if (!$scope.form1.$valid) {
             return false;
        }
        $("#saveBtn").attr("disabled", true);
    $http.post('admin/doSave.do', $scope.data).then($scope.goBack);
  }
  
  $scope.goBack = function() {
    $window.location.href = UrlUtil.transform('admin/adminList.do');
  }

}]);