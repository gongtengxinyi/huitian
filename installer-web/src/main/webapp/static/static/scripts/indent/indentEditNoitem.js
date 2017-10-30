var app = angular.module('app',// ,'ifu.workerselect'
['ui.grid', 'ui.grid.edit', 'ui.grid.cellNav', 'ui.grid.validate','ui.bootstrap','ifu.template','ifu.form', 'ifu.cityselect2', 'ifu.util']);

//禁止模板缓存  
app.run(function($rootScope, $templateCache) {  
    $rootScope.$on('$routeChangeStart', function(event, next, current) {  
        if (typeof(current) !== 'undefined'){  
            $templateCache.remove(current.templateUrl);  
        }  
    });  
}); 

app.controller('IndentController',//
[ '$scope', '$http', '$window','$uibModal', 'UrlUtil',
  function($scope, $http, $window, $uibModal, UrlUtil) {
	
	var city;
	$scope.contactsDatas={};
	var pageNo=$("#pageNo").val();
	var indentId=$("#indentId").val();
  $scope.planDate = {
      opened : false
  };

  $scope.openPlanDate = function() {
    $scope.planDate.opened = true;
  }
 
  /********************FUJUAN0511 ADD BEGIN  日期控件点击处理*********************************************************/
  $scope.signDate = {
	      opened : false
	  };  
  $scope.openSignDate = function() {
	  
	    $scope.signDate.opened = true;
	  }
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
      id : indentId//$scope.data.id
    }
  }).then(function(response) {
	 
    $scope.data = response.data;
    console.log($scope.data);
    $scope.data.planDate = Date.parse($scope.data.planDate.replace());
    /********************FUJUAN0511 ADD BEGIN  日期控件加载处理*********************************************************/
    $scope.data.planDoorDate = Date.parse($scope.data.planDoorDate.replace());
   
    $scope.data.realDoorDate = Date.parse($scope.data.realDoorDate.replace());
    $scope.data.receiveDate = Date.parse($scope.data.receiveDate.replace());
    city=response.data.regionCity;
    $scope.data.priceNameId=$("#priceNameId").val();  
    /********************FUJUAN0511 ADD END*********************************************************/
  });

 
//load files
  $http.get('indent/loadInstallImgFiles.do', {
    params : {
      id : indentId//$scope.data.id
    }
  }).then(function(data) {
    $scope.installImgFiles = data.data;
  });
  
  
  //搜索经理人
  $scope.doTypeaheadManager = function(q) {
    return $http.post('manager/doTypeahead.do', {
      city: $scope.data.regionCity,
      q : q
    }).then(function(response) {
     
      return response.data;
    });
  };
  //将managerId写入隐藏域
  $scope.onTypeaheadManagerSelect = function($item, $model, $label) {
	    $scope.data.managerId = $item.value;
	  };
	  
	//搜索工匠
	 $scope.doTypeaheadWorker = function(q) {
	    return $http.post('worker/doTypeahead.do', {
	      city: $scope.data.regionCity,
	      managerId: $scope.data.managerId,
	      q : q
	    }).then(function(response) {
	      return response.data;
	    });
	  };
	  //将mworkerId写入隐藏域
	  $scope.onTypeaheadWorkerSelect = function($item, $model, $label) {
		    $scope.data.workerId = $item.value;
		  };
  
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
	  
	  for ( var d in $scope.contactsDatas) {
	      $scope.data[d] = $scope.contactsDatas[d];
	    }
	  //如果订单金额不为空，则校验工匠及经理人比例是否为空
	  var indentPrice=$scope.data.indentPrice;
	  var error1=0;
	   var error2=0;
	  if(indentPrice!=null && indentPrice!="" && indentPrice!=0){
		  var workerRate=$scope.data.workerRate;
		  var managerRate=$scope.data.managerRate;
		  
		  if(workerRate==null || workerRate=="" ){
			  var modalScope = $scope.$new(true);
		      modalScope.title = "信息不完整";
		      modalScope.message = "请输入工匠或者经理人的比例！";
		      $uibModal.open({
		        templateUrl : 'template/modal/alert.html',
		        scope : modalScope
		      }); 
		      return false;
		  }
		  
		  if (workerRate+managerRate >100){
			  var modalScope = $scope.$new(true);
		      modalScope.title = "输入错误";
		      modalScope.message = "请输入正确的比例！工匠与经理人的比例之和不能大于100";
		      $uibModal.open({
		        templateUrl : 'template/modal/alert.html',
		        scope : modalScope
		      }); 
		      return false;
		  }
		  
	  }
	 
	  if($scope.data.contact.name1==null || $scope.data.contact.name1==""){		  
		
		  var modalScope = $scope.$new(true);
	      modalScope.title = "信息不完整";
	      modalScope.message = "请输入业主名称！";
	      $uibModal.open({
	        templateUrl : 'template/modal/alert.html',
	        scope : modalScope
	      }); 
	      return false;
	  }
	  if($scope.data.contact.regionCity==null || $scope.data.regionCity=="" || $scope.data.contact.regionProv==null || $scope.data.regionProv==""
		  || $scope.data.contact.regionDist==null || $scope.data.regionDist=="" || $scope.data.contact.detailAddr1==null || $scope.data.detailAddr1==""){		  
			
		  var modalScope = $scope.$new(true);
	      modalScope.title = "信息不完整";
	      modalScope.message = "请输入业主地址！";
	      $uibModal.open({
	        templateUrl : 'template/modal/alert.html',
	        scope : modalScope
	      }); 
	      return false;
	  }
	 
	
	   /* if (!$scope.form1.$valid) {
	    	
	      var modalScope = $scope.$new(true);
	      modalScope.title = "信息不完整";
	      modalScope.message = "当前表单输入信息不完整，请补充完整后再保存！";
	      $uibModal.open({
	        templateUrl : 'template/modal/alert.html',
	        scope : modalScope
	      }); 
	      return false;
	    }*/
	    
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
	  var rl=$scope.sort_RL;
	  if (typeof (rl) == "undefined"){
		  rl=false;
	  }
	   var error3=0;
	     var checkbox1 = $("[type=checkbox]");
	    $scope.data.indentSort="";
		  $('#serverType input:checkbox').each(function(i) { 			  
			  var id=$(this).attr("id");
			  /*if($(this).is(':checked')&&rl&&id!='sort_RL'){
				  var modalScope = $scope.$new(true);
			      modalScope.title = "输入错误";
			      modalScope.message = "测量不能跟其他品类共存";
			      $uibModal.open({
			        templateUrl : 'template/modal/alert.html',
			        scope : modalScope
			      }); 
			      error3=1;
			      return false;
			  }*/
			 
			  if(id!='sort_RL'){
				  
			  }
			  if($(this).is(':checked')){
				  if(rl){
					  
				  }	
			  var sort_id=$(this).attr("value");
		
			if($scope.data.ifSplit)
			{
				var split=$("#"+id+'_split').val();
				  if(split==''|| split==null)
					  {
					  var modalScope = $scope.$new(true);
				      modalScope.title = "信息不正确";
				      modalScope.message = "拆分订单个数和所填数字不一样，请确认后保存！";
				      $uibModal.open({
				        templateUrl : 'template/modal/alert.html',
				        scope : modalScope
				      }); 
				      error1=1;
				      return false;   
					  }				
				}
				 $scope.data.indentSort +=sort_id+"_";
		  }
	  });
		  if(error3==1)
		  {
		  return false;
		  }
		  if(error1==1)
			  {
			  return false;
			  }
		  $('#split input:text').each(function(i){
			  if($(this).val()!='')
				  {
				  
				    var split_id=$(this).attr('id').split("_")[0]+"_"+$(this).attr('id').split("_")[1];
				    if(!$("#"+split_id).is(':checked')){
				    	  var modalScope = $scope.$new(true);
					      modalScope.title = "信息不正确";
					      modalScope.message = "拆分订单个数和所填数字不一样，请确认后保存！";
					      $uibModal.open({
					        templateUrl : 'template/modal/alert.html',
					        scope : modalScope
					      }); 
					      error2=1;
					      return false;
				    	}
					  }
			  
		  });
		 
		  if(error2==1)
			  {
			  return false;
			  }
		  
	    
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
	        ($scope.data.workerId == null || $scope.data.workerId=="")) {
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
		      modalScope.title = "指派经理人";
		      modalScope.message = "请指派经理人！";
		      $uibModal.open({
		        templateUrl : 'template/modal/alert.html',
		        scope : modalScope
		      }); 
		      return false;
		    }
	    console.log($scope.data)
	    $("#saveBtn").attr("disabled", true);
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
	    	  $("#saveBtn").attr("disabled", false);
	        var modalScope = $scope.$new(true);
	        modalScope.message = "添加订单失败";
	        modalScope.title =data.err_msg;// "您没有编辑订单的权限！";
	        $uibModal.open({
	          templateUrl : 'template/modal/alert.html',
	          scope : modalScope
	        }); 
	      }
	    });
	  
	  }
  
  //修改订单内容并保存（重新计算价格
$scope.updateCounts = function() {
	  
	 
	  
	    return $http({
	    	 method : 'POST',
	         url : 'indent/doUpdateIndentCounts.do', 
	         headers : {
	           'Content-Type' : undefined
	         },
	         transformRequest : function(data) {
	           var formData = new FormData();
	           
	           formData.append("data", angular.toJson(data.data));
	           
	          
	          
	           return formData;
	         },
	         data : {
	           data : $scope.data,
	        
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
	        modalScope.message =data.err_msg;// "您没有编辑订单的权限！";
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
	    	  $("#copyBtn").attr("disabled", true);
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
  
//选择区域时，列出服务区域的经理人
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
//加载设计师
app.controller('DesignerController', ['$scope', '$http', function($scope, $http) {
	var indentId=$("#indentId").val();
	  $scope.gridOptions = {
	    /***/
	    enableColumnMenus : false,
	    /***/
	    enableSorting : false,
	    /***/
	    enableCellEditOnFocus : true,
	    /***/
	    enableCellEdit : true
	  };

	  $scope.gridOptions.columnDefs = [{
	    displayName : '姓名',
	    name : 'name1',
	    width : 90,
	    validators : {
	      required : true
	    },
	    cellTemplate : 'ui-grid/cellTooltipValidator'

	  }, {
	    displayName : '电话',
	    name : 'mobile',
	    width : 190
	  }, {

		    displayName : '备注',
		    name : 'remark',
		    width : 400
		  }, {
	    displayName : '操作',
	    name : 'operator',
	    width : 60,
	    enableCellEdit : false,
	    cellTemplate : '<button class="glyphicon glyphicon-remove btn btn-xs btn-danger"'//
	        + 'ng-click="grid.appScope.deleteRow(row)">移除</button>'//
	  }];
	  
	  
	  $http.get('indentDesigner/loadDesignerList.do', {
		    params : {
		      indentId : indentId//$scope.data.id
		    }
		  }).then(function(response) {
			
		    $scope.gridOptions.data = $scope.contactsDatas.designerList= response.data;
		   
		   
		  });
	
	

	  $scope.addRow = function() {
	    $scope.gridOptions.data.push({});
	  }

	  $scope.deleteRow = function(row) {
	    var index = $scope.gridOptions.data.indexOf(row.entity);
	    $scope.gridOptions.data.splice(index, 1);
	  };
	}]);

	






