var app = angular.module('app', ['ui.bootstrap', 'ifu.util']);

app.controller('AdminAddController',//
['$scope', '$http', '$window', 'UrlUtil',//
function($scope, $http, $window, UrlUtil) {
	
	 // load
	  $http.get('aparty/doLoadSetting.do').then(function(response) {
	    $scope.data = response.data.data;  
	    console.log($scope.data);
	   
	   /* if($scope.data.ifAssign=="YES"){
	    	
	    	  $("#ifAssign").attr('checked',true); 
	    }
	    else {
	    	$("#ifAssign").attr('checked',false); 
	    }
	    
	    if($scope.data.ifUploadPic=="YES"){
	  	  $("#ifUploadPic").attr('checked',true); 
	    }
	    else {
	  	  $("#ifUploadPic").attr('checked',false); 
	    }
	    */
	    
	       
	  });
	
	$scope.save = function() {
		 if($("#ifAssign").prop('checked')==true){
			  
			  $scope.data.ifAssign="YES";		  
		  }
		  else{
			  $scope.data.ifAssign="NO";
		  }
		     
	     if($("#ifUploadPic").prop('checked')==true){
			  
			  $scope.data.ifUploadPic="YES";		 
			 
		  }
		  else{
			  $scope.data.ifUploadPic="NO";
			 
		  }
	     if($("#ifContactSitong").prop('checked')==true){
			  
			  $scope.data.ifContactSitong="YES";		 
			 
		  }
		  else{
			  $scope.data.ifContactSitong="NO";
			 
		  }
	     /*if($("#ifReleaseSendSms").prop('checked')==true){
			  
			  $scope.data.ifReleaseSendSms="YES";		 
			 
		  }
		  else{
			  $scope.data.ifReleaseSendSms="NO";
			 
		  }*/
	
        if (!$scope.form1.$valid) {
             return false;
        }
    
    $http.post('aparty/doSaveSetting.do', $scope.data).then($scope.goBack);
  }
  
  $scope.goBack = function() {
    $window.location.href = UrlUtil.transform('indent/indentList.do');
  }

}]);