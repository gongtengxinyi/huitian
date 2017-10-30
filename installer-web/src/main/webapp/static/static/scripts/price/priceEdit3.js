var app = angular.module('app',// 
    ['ui.grid', 'ui.grid.edit', 'ui.grid.cellNav', 'ui.grid.validate', 'ui.bootstrap', //
      'ifu.form', 'ifu.template', 'ifu.util']);

app.controller('ItemController', ['$scope', '$http', '$window', '$uibModal', 'UrlUtil',//
                                  function($scope, $http, $window, $uibModal, UrlUtil) {
	var pageNo=$("#pageNo").val();//将查看内容页面的PageNo传递回来，放入隐藏域，在这里取值
 

  var count = 0;
  $scope.data.priceList=[];
 
  var priceId=$("#priceId").val();
  

  var error=0; //是否校验错误

  $scope.save = function() {
	  if (!$scope.form1.$valid) {
	       var modalScope = $scope.$new(true);
	       modalScope.title = "当前信息填写不完整，请完善";
	       modalScope.message = "请输入价格名称！";
	       $uibModal.open({
	         templateUrl : 'template/modal/alert.html',
	         scope : modalScope
	       }); 
	      return false;
	    }

	  $scope.data.priceList=[];
	  error=0;
	  $("input[type='hidden']").each(function(){
			var content=$(this).attr("id");
			content=content.substr(0,9);
			
			 if(content=="contentId"){
				 var id=$(this).val();
				 if($("#workerRate"+id).val()=="" || $("#workerRate"+id).val()==null){		    		
	  		    		$("#workerRate"+id).val(0);
	  		    	}
	  		    	if($("#managerRate"+id).val()=="" || $("#managerRate"+id).val()==null){		    		
	  		    		$("#managerRate"+id).val(0);
	  		    	}
	  		    	
	  		    	//校验输入数据是否合法
	  		    	if($("#workerRate"+id).val()!="" && $("#workerRate"+id).val()!=null){
	  		    		if(isNaN( $("#workerRate"+id).val() ))  {	  		    			 
	  			  		   alert($("#typeName"+id).val()+"-"+$("#sortName"+id).val()+"-"+$("#name1"+id).val()+"-"+"工人报价输入错误，请输入正确的数值！");
	  			  		   error=1;
	  			  		   return false;
	  		    		}
	  		    	}
	  		    	if($("#managerRate"+id).val()!="" && $("#managerRate"+id).val()!=null){
	  		    		if(isNaN( $("#managerRate"+id).val() ))  {
	  		    			alert($("#typeName"+id).val()+"-"+$("#sortName"+id).val()+"-"+$("#name1"+id).val()+"-"+"经理人报价输入错误，请输入正确的数值！"); 
	  		    			error=1;
	  		    			return false;
	  		    		}
	  		    	}
	  		    	
	  		    //将输入数据push到list中以提交   
	                $scope.data.priceList.push({'serveContentId':$("#contentId"+id).val(),
	      		        'typeName':$("#typeName"+id).val(),
	      		        'sortName':$("#sortName"+id).val(),
	      		        'sortId':$("#sortId"+id).val(),
	      		        'name1':$("#name1"+id).val(),
	      		        'unit':$("#unit"+id).val(),
	      		     /*   'actualPrice':$("#actualPrice"+[int]).val(),*/
	      		      /*  'basePrice' :$("#baseQuote"+id).val(),
	      		        'numerationPrice' :$("#numerationPrice"+id).val(),*/
	      		        'workerRate':$("#workerRate"+id).val(),
	      		        'managerRate':$("#managerRate"+id).val(),
	      		      /*  'profitRate':$("#profitRate"+[int]).val(),*/
	      		      'apartyId':$("#apartyId"+id).val(),
	      		    'apartyName':$("#apartyName"+id).val(),
	      		        'sequence':$("#sequence"+id).val()
	      		     });
			 }
		 })
		
		//如果校验错误，返回		
	   	if(error==1){	    	
	    	return false;
	   	}
	  $("#btnSave").attr("disabled", true);	
    $http.post('price/doUpdate.do', $scope.data)
    .then(function(response) {
      var data = response.data
      $("#btnSave").attr("disabled", false);
      if (data.success) {
        var modalScope = $scope.$new(true);
        modalScope.message = "保存成功，返回列表";
        UrlUtil.autoJump(modalScope, function() {
          $window.location.href = UrlUtil.transform('price/priceList.do?pageNo='+pageNo);
        });
      }
    });
  }

 

  $scope.goBack = function() {
	
    $window.location.href = UrlUtil.transform('price/priceList.do?pageNo='+pageNo);
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




  
  
 
  
  
