var app = angular.module('app',// 
    ['ui.grid', 'ui.grid.edit', 'ui.grid.cellNav', 'ui.grid.validate', 'ui.bootstrap', //
      'ifu.form', 'ifu.template', 'ifu.util']);

app.controller('webWkmgrCopyPriceController', ['$scope', '$http', '$window', '$uibModal', 'UrlUtil',//
                                  function($scope, $http, $window, $uibModal, UrlUtil) {
	var pageNo=$("#pageNo").val();//将查看内容页面的PageNo传递回来，放入隐藏域，在这里取值
 

  var count = 0;
  $scope.data.wkmgrPriceDetail=[];
 
  
  var wkmgrId=$("#wkmgrId").val();
  
  var error=0; //是否校验错误

  $scope.save = function() {
	  
	  $scope.data.wkmgrPriceDetail=[];
	  error=0;
	  $("input[type='hidden']").each(function(){
			var content=$(this).attr("id");
			content=content.substr(0,9);
			
			 if(content=="contentId"){
				 var id=$(this).val();
				
	  		    	if($("#baseQuote"+id).val()=="" || $("#baseQuote"+id).val()==null){		    		
	  		    		$("#baseQuote"+id).val(0);
	  		    	}
	  		    	
	  		    
	  		    	if($("#baseQuote"+id).val()!="" && $("#baseQuote"+id).val()!=null){
	  		    		if(isNaN( $("#baseQuote"+id).val() ))  {
	  		    			alert($("#serveContentName"+id).val()+"-"+$("#sortName"+id).val()+"-"+$("#name1"+id).val()+"-"+"基本报价输入错误，请输入正确的数值！"); 
	  		    			error=1;
	  		    			return false;
	  		    		}
	  		    	}
	  		    	
	  		    //将输入数据push到list中以提交   
	                $scope.data.wkmgrPriceDetail.push({'serveContentId':$("#contentId"+id).val(),
	      		        'serveContentName':$("#serveContentName"+id).val(),
	      		        'sortName':$("#sortName"+id).val(),
	      		        'sortId':$("#sortId"+id).val(),
	      		        'name1':$("#name1"+id).val(),
	      		        'unit':$("#unit"+id).val(),
	      		        'baseQuote':$("#baseQuote"+id).val(),
	      		     });
			 }
		 })
		
		//如果校验错误，返回		
	   	if(error==1){	    	
	    	return false;
	   	}
	  $("#btnSave").attr("disabled", true);	
    $http.post('wkMgrPrice/doCopy.do', $scope.data)
    .then($window.location.href = UrlUtil.transform('wkMgrPrice/wkMgrpriceList.do?pageNo='+pageNo)
     );
  }
 

  $scope.goBack = function() {
	
    $window.location.href = UrlUtil.transform('wkMgrPrice/wkMgrpriceList.do?pageNo='+pageNo);
  }
  
  //展开树
  $scope.expand_all = function() {
	  $("div").each(function(){//循环所有div	,取出id包含level字段的div,并展开	
		  if($(this).attr("id")!=null && $(this).attr("id")!=''){
			  
		  if($(this).attr("id").substr(0,5)=="level"){
			
			  $(this).collapse('show');
		  }
		  }
	  })
	  }
  
//折叠树
  $scope.collapse_all = function() {
	  $("div").each(function(){//循环所有div	,取出id包含level字段的div,并展开	
		  if($(this).attr("id")!=null && $(this).attr("id")!=''){
			  
		  if($(this).attr("id").substr(0,5)=="level"){
			
			  $(this).collapse('hide');
		  }
		  }
	  })
	  }

}]);




  
  
 
  
  
