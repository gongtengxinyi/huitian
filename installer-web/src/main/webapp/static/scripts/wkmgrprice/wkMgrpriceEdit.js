var app = angular.module('app',// 
    ['ui.grid', 'ui.grid.edit', 'ui.grid.cellNav', 'ui.grid.validate', 'ui.bootstrap', //
      'ifu.form', 'ifu.template', 'ifu.util']);

app.controller('webWkmgrEditPriceController', ['$scope', '$http', '$window', '$uibModal', 'UrlUtil',//
                                  function($scope, $http, $window, $uibModal, UrlUtil) {
	var pageNo=$("#pageNo").val();//将查看内容页面的PageNo传递回来，放入隐藏域，在这里取值
 

  var count = 0;
  $scope.data.wkmgrPriceDetail=[];
 
  var priceId=$("#priceId").val();
  
  var wkmgrId=$("#wkmgrId").val();
  
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
	    $http.post('wkMgrPrice/submitWkMgrPrice.do', $scope.data)
	    .then(function(response){
	    	 var data = response.data;
	         if (data.success) {
	           var modalScope = $scope.$new(true);
	           modalScope.message = data.err_msg;
	           UrlUtil.autoJump(modalScope, $scope.goBack);
	         } else {      	
	           var modalScope = $scope.$new(true);
	           modalScope.title = "审核失败";
	           modalScope.message = data.err_msg;
	           $uibModal.open({
	             templateUrl : 'template/modal/alert.html',
	             scope : modalScope
	           }); 
	         }
	    }
	     );
	  }
	  $scope.goBack = function() {
		    $window.location.href = UrlUtil.transform('wkMgrPrice/wkMgrpriceList.do?');
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
 /* $scope.test=function(wkmgrId,priceId,id,baseQuote)
  {
	    var baseQuote=document.getElementById(baseQuote).value;
	  $window.location.href = UrlUtil.transform('wkMgrPrice/wkMgrPriceEditContent.do?wkmgrId='+wkmgrId+'&priceId='+priceId+'&id='+id+'&baseQuote='+baseQuote+'&pageNo='+pageNo)
  }*/
  $scope.ajax=function(wkmgrId,priceId,id,baseQuote)
  {
	  $.ajax({
		  type:"POST",
          //提交的网址
          url:"wkMgrPrice/wkMgrPriceEditContent.do",
          //提交的数据
          data:{"wkmgrId":wkmgrId,"priceId":priceId,"id":id,"baseQuote":document.getElementById(baseQuote).value},
          //返回数据的格式
          datatype: "json"//"xml", "html", "script", "json", "jsonp", "text".
	  })
  }
}]);




  
  
 
  
  
