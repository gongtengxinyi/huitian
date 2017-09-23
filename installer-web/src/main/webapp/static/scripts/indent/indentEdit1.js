var app = angular.module('app',// ,'ifu.workerselect'
['ui.bootstrap','ifu.template','ifu.form', 'ifu.cityselect2', 'ifu.util']);

app.controller('IndentController',//
[ '$scope', '$http', '$window','$uibModal', 'UrlUtil',
  function($scope, $http, $window, $uibModal, UrlUtil) {
	
	var city;
	
  var pageNo=$("#pageNo").val();
  $scope.planDate = {
      opened : false
  };

  $scope.openPlanDate = function() {
    $scope.planDate.opened = true;
  }

  /********************FUJUAN0511 ADD BEGIN  日期控件点击处理*********************************************************/
  $scope.receiveDate = {
	      opened : false
	  };  
  $scope.openReceiveDate = function() {
	    $scope.receiveDate.opened = true;
	  }
  $scope.planDoorDate = {
	      opened : false
	  };  
  $scope.openPlanDoorDate = function() {
	    $scope.planDoorDate.opened = true;
	  }
  $scope.realDoorDate = {
	      opened : false
	  };  
  $scope.openRealDoorDate = function() {
	    $scope.realDoorDate.opened = true;
	  }
  /********************FUJUAN0511 ADD END*********************************************************/
  $http.get("indent/load.do", {
    params : {
      id : $scope.data.id
    }
  }).then(function(response) {
    $scope.data = response.data;
    console.log(response.data);
    $scope.data.planDate = Date.parse($scope.data.planDate.replace());
    /********************FUJUAN0511 ADD BEGIN  日期控件加载处理*********************************************************/
    $scope.data.planDoorDate = Date.parse($scope.data.planDoorDate.replace());
    $scope.data.realDoorDate = Date.parse($scope.data.realDoorDate.replace());
    $scope.data.receiveDate = Date.parse($scope.data.receiveDate.replace());
    city=response.data.regionCity;
    $scope.data.priceNameId=$("#priceNameId").val();  
    /********************FUJUAN0511 ADD END*********************************************************/
  });
  //初始化经理人列表
  $http.get('manager/managerData.do',
		  {
      params : {           
        indentId : $scope.data.id //$scope.data.regionCity           
      }
    } 
  ).then(function(response) 
   {
     //动态加载 符合条件的工匠信息
     var managerData = response.data;	       
     $scope.managers = managerData;
     console.log(managerData);
   });
  
//初始化工匠列表
  $http.get('worker/workerDataAll.do',
	      {
	         params :
	         {
	        	 indentId : $scope.data.id
	        
	         }
	       }).then(function(response) 
	       {
	         //动态加载 符合条件的工匠信息
	         var WorkerData = response.data;
	         $scope.workers = WorkerData;
	       });
 
//load files
  $http.get('indent/loadInstallImgFiles.do', {
    params : {
      id : $scope.data.id
    }
  }).then(function(data) {
    $scope.installImgFiles = data.data;
  });
  
  

  
 //删除安装图纸
  $scope.delPact = function(id) {

	    var modalScope = $scope.$new(true);
	    modalScope.message = "您确认要删除该图纸吗？";

	    $uibModal.open({
	      templateUrl : 'template/modal/delete.html',
	      scope : modalScope
	    }).result.then(function() {
	      $http.get('indent/delPact.do', {
	        params : {
	          id : id
	        }
	      }).then(function(response) {
	        var data = response.data;
	        if (data.success) {
	          alert("成功删除该合同信息！");
	          $http.get('indent/loadInstallImgFiles.do', {
	            params : {
	              id : $scope.data.id
	            }
	          }).then(function(data) {
	            $scope.installImgFiles = data.data;
	          });
	        } else {
	          alert("删除失败");
	        }

	      });
	    });

	  }
  
  $scope.update = function() {
	  
	  //如果订单金额不为空，则校验工匠及合伙人比例是否为空
	  var indentPrice=$scope.data.indentPrice;
	  if(indentPrice!=null && indentPrice!="" && indentPrice!=0){
		  var workerRate=$scope.data.workerRate;
		  var managerRate=$scope.data.managerRate;
		  
		  if(workerRate==null || workerRate=="" ){
			  var modalScope = $scope.$new(true);
		      modalScope.title = "信息不完整";
		      modalScope.message = "请输入工匠或者合伙人的比例！";
		      $uibModal.open({
		        templateUrl : 'template/modal/alert.html',
		        scope : modalScope
		      }); 
		      return false;
		  }
		  
		  if (workerRate+managerRate >100){
			  var modalScope = $scope.$new(true);
		      modalScope.title = "输入错误";
		      modalScope.message = "请输入正确的比例！工匠与合伙人的比例之和不能大于100";
		      $uibModal.open({
		        templateUrl : 'template/modal/alert.html',
		        scope : modalScope
		      }); 
		      return false;
		  }
		  
	  }
	  
	    if (!$scope.form1.$valid) {
	      var modalScope = $scope.$new(true);
	      modalScope.title = "信息不完整";
	      modalScope.message = "当前表单输入信息不完整，请补充完整后再保存！";
	      $uibModal.open({
	        templateUrl : 'template/modal/alert.html',
	        scope : modalScope
	      }); 
	      return false;
	    }
	    
	   /* if ($scope.data.serveType != 'C' && ($scope.file == null || $scope.file.imgFiles.length == 0)) {
	      var modalScope = $scope.$new(true);
	      modalScope.title = "图纸不正确";
	      modalScope.message = "请上传安装图纸！";
	      $uibModal.open({
	        templateUrl : 'template/modal/alert.html',
	        scope : modalScope
	      }); 
	      return false;
	    }*/
	    
	    if ($scope.data.indentAssignSelected == true && $scope.data.assignType == "" ) {
		      var modalScope = $scope.$new(true);
		      modalScope.title = "指派";
		      modalScope.message = "请选择指派对象！";
		      $uibModal.open({
		        templateUrl : 'template/modal/alert.html',
		        scope : modalScope
		      }); 
		      return false;
		    }
	    
	    if ($scope.data.indentAssignSelected == true && $scope.data.assignType == "WORKER" &&
	        (($scope.data.managerId == null || $scope.data.managerId=="") ||
	        ($scope.data.workerId == null || $scope.data.workerId==""))) {
	      var modalScope = $scope.$new(true);
	      modalScope.title = "指派工匠";
	      modalScope.message = "请指派工匠！";
	      $uibModal.open({
	        templateUrl : 'template/modal/alert.html',
	        scope : modalScope
	      }); 
	      return false;
	    }
	    
	    if ($scope.data.indentAssignSelected == true && $scope.data.assignType == "MANAGER" &&
		        (($scope.data.managerId == null || $scope.data.managerId=="") )) {
		      var modalScope = $scope.$new(true);
		      modalScope.title = "指派合伙人";
		      modalScope.message = "请指派合伙人！";
		      $uibModal.open({
		        templateUrl : 'template/modal/alert.html',
		        scope : modalScope
		      }); 
		      return false;
		    }
	   
	    return $http({
	    	 method : 'POST',
	         url : 'indent/doUpdateIndent.do', 
	         headers : {
	           'Content-Type' : undefined
	         },
	         transformRequest : function(data) {
	           var formData = new FormData();
	           
	           formData.append("data", angular.toJson(data.data));
	           
	           for ( var f in data.file) {	        	   
	             var items = data.file[f];
	             for (var i in items) {
	               formData.append(f, items[i]);
	             }
	           }
	           return formData;
	         },
	         data : {
	           data : $scope.data,
	           file : $scope.file
	         }
	    }).then(function(response) {
	      var data = response.data;
	      if (data.success) {
	        var modalScope = $scope.$new(true);
	        modalScope.message = data.err_msg;
	        UrlUtil.autoJump(modalScope, $scope.goBack);
	      } else {
	        var modalScope = $scope.$new(true);
	        modalScope.title = "添加订单失败";
	        modalScope.message = data.err_msg;
	        $uibModal.open({
	          templateUrl : 'template/modal/alert.html',
	          scope : modalScope
	        }); 
	      }
	    });
	  
	  }
  
  $scope.copy = function() {
	  var id = $scope.data.id;
	    var modalScope = $scope.$new(true);
	    modalScope.title="提示";
	    modalScope.message = "您确实要复制该订单吗？";
	    $uibModal.open({
	      templateUrl : 'template/modal/confirm.html',
	      scope : modalScope
	    }).result.then(function() {
	      $http.get('indent/indentCopy.do', {
	        params : {
	          id : id
	        }
	      }).then(function (response) {
	        var data = response.data;
	        if (data.success) {
	          var modalScope = $scope.$new(true);
	          modalScope.message = data.err_msg;
	          UrlUtil.autoJump(modalScope, $scope.goBack);
	        } else {
	          var modalScope = $scope.$new(true);
	          modalScope.title = "复制订单失败";
	          modalScope.message = data.err_msg;
	          $uibModal.open({
	            templateUrl : 'template/modal/alert.html',
	            scope : modalScope
	          }); 
	        }
	      });
	    });
	  
  }

  $scope.goBack = function() {
    $window.location.href = UrlUtil.transform('indent/indentList.do?pageNo='+pageNo);
  }
  
  $scope.doDelete = function() {
    var id = $scope.data.id;
    var modalScope = $scope.$new(true);
    modalScope.message = "您确认要删除该订单吗？";
    $uibModal.open({
      templateUrl : 'template/modal/delete.html',
      scope : modalScope
    }).result.then(function() {
      $http.get('indent/indentDelete.do', {
        params : {
          id : id
        }
      }).then(function (response) {
        var data = response.data;
        if (data.success) {
          var modalScope = $scope.$new(true);
          modalScope.message = data.err_msg;
          UrlUtil.autoJump(modalScope, $scope.goBack);
        } else {
          var modalScope = $scope.$new(true);
          modalScope.title = "删除订单失败";
          modalScope.message = data.err_msg;
          $uibModal.open({
            templateUrl : 'template/modal/alert.html',
            scope : modalScope
          }); 
        }
      });
    });
  };
  
  
 
  
  //更改工匠
  $scope.changeWorker = function() {
    var id = $scope.data.id;
    var modalScope = $scope.$new(true);
    modalScope.message = "您确认要更换工匠吗？";
    $uibModal.open({
      templateUrl : 'template/modal/confirm.html',
      scope : modalScope
    }).result.then(function(){
    	 $window.location.href = UrlUtil.transform('indent/workerChange.do?id='+id+'&pageNo='+pageNo);
    })
   
    
  };
  
//设置订单为完成
  $scope.finishIndent =function(){ 
	  var modalScope = $scope.$new(true);
	  var id=this.data.id;
	
	    modalScope.message = "确认要将此订单设置为已完成吗？ ";

	    $uibModal.open({
	      templateUrl : 'template/modal/confirm.html',
	      scope : modalScope
	    }).result.then(function() {
	     /* $http.get('indent/indentFinish.do', {
	        params : {
	          id : id,
	          pageNo:pageNo
	          
	        }
	      })*/
	    	$window.location.href = UrlUtil.transform('indent/indentFinish.do?id='+id+'&pageNo='+pageNo);
	    });
  } 
  
//新增联系记录
  $scope.indentContact =function(){ 
	  var modalScope = $scope.$new(true);
	  var id=this.data.id;
	  $window.location.href = UrlUtil.transform('indent/indentContact.do?id='+id+'&pageNo='+pageNo);
	    
  } 
  
  //常用语改变时，将数据写入备注框
  $scope.setTemplate=function(){
	  $scope.data.contact.demand = $scope.template;
  }
  
//选择区域时，列出服务区域的合伙人
	$scope.showManager=function(){
		
		if($("#assign").is(':checked')){
			 $http.get('manager/managerData.do',
		    		  {
		          params : {           
		            city : $scope.data.regionCity           
		          }
		        } 
		      ).then(function(response) 
		       {
		         //动态加载 符合条件的工匠信息
		         var managerData = response.data;
		       
		         $scope.managers = managerData;
		       });
			}
			else{
				
				
				$scope.data.assignType="";
				$scope.data.managerId="";
				$scope.data.workerId="";
				
			}
		
	}
	
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
	
	/*************************************FUJUAN ADD 点击服务类型checkbox,然后下面显示相应的订单内容明细*******************************************************/ 
	  $scope.add=function(id){
		  var name1="sort_"+id;
		  var checkbox1 = $("[type=checkbox]");
		     var n=0;
			  checkbox1.each(function(i) {     //遍历选中哪一个品类，然后根据sort_id遍历出该品类下的内容，并显示出来
				  if($(this).attr("id")==name1)//
					  if($(this).is(":checked")){	//显示内容		
						  
						  $('#content div').each(function(i){
							  if($(this).attr("id")=="offer_"+id){ //根据ID找到该品类的div，并显示
								  $(this).show();
							  }
						  });	

					
					  }
					  else{				//隐藏内容,同时在隐藏时，清空里面的数据
						  $('#content div').each(function(i){
							  if($(this).attr("id")=="offer_"+id){
								  var name1="offer_"+id;
								  $('#'+name1+' input:checkbox').each(function(i){		
									 var name_content=$(this).attr("id");
									
									 var content_id=name_content.split("_")[1];
									 var name_ng="indentPrice_"+content_id+"_checked";
									 var count_ng="indentPrice_"+content_id+"_counts";
									 $(this).attr("checked",false);					 
									
								  });
								  $(this).hide();
							  }
						  });
					  }
				  
			  });
	  }
  
}]);
