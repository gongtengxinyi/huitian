var app = angular.module('app',// 
    ['ui.grid', 'ui.grid.edit', 'ui.grid.cellNav', 'ui.grid.validate','ui.bootstrap', 'ifu.cityselect2','ifu.form', 'ifu.util']);

app.controller('IndentController', ['$scope', '$http', '$window', 'UrlUtil', '$uibModal',
function($scope, $http, $window, UrlUtil, $uibModal) {
	var pageNo=$("#pageNo").val();//将查看内容页面的PageNo传递回来，放入隐藏域，在这里取值			 	
   $scope.dataSort = '';
  $scope.data = {};
  $scope.data.contact = {};  
  $scope.data.priceNameId=$("#priceNameId").val();  //默认价格体系为项目的价格体系
 
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
  $scope.signDate = {
	      opened : false
	  };  
  $scope.openSignDate = function() {
	  
	    $scope.signDate.opened = true;
	  }
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
  var datNow=new Date();
  $scope.data.receiveDate=datNow;
  /* var datNext=new Date();
  $scope.data.planDoorDate=datNext.setDate(datNow.getDate()+1);
  */
  
  /********************FUJUAN0511 ADD END*********************************************************/
  $scope.save = function() {
  
      //如果订单金额不为空，则校验工匠及经理人比例是否为空
	  var indentPrice=$scope.data.indentPrice;
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
	  var rl=$scope.sort_RL;
	  if (typeof (rl) == "undefined"){
		  rl=false;
	  }
	//FUJUAN ADD 判断是否填写订单内容
    //遍历checkbox，如果没有被选中的，则提示
     var checkbox1 = $("[type=checkbox]");
     var n=0;	
   var error1=0;
   var error2=0;
   var error3=0;
	  $scope.data.indentSort="";
	//将服务类型写入$scope.data.indentSortDto
	  $('#serverType input:checkbox').each(function(i) { 			  
			  var id=$(this).attr("id");
			 /* if($(this).is(':checked')&&rl&&id!='sort_RL'){
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
  
    if ($scope.data.indentAssignSelected == true &&
        (($scope.data.managerId == null || $scope.data.managerId.length < 0) ||
        ($scope.data.workerId == null || $scope.data.workerId.length < 0))) {
      var modalScope = $scope.$new(true);
      modalScope.title = "指派工匠";
      modalScope.message = "请指派工匠！";
      $uibModal.open({
        templateUrl : 'template/modal/alert.html',
        scope : modalScope
      }); 
      return false;
    }
    $("#saveBtn").attr("disabled", true);
    return $http({
      method : 'POST',
      url : 'indent/doSave.do', 
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
        UrlUtil.autoJump(modalScope, $scope.goList);
      } else {
    	  $("#saveBtn").attr("disabled", false);
        var modalScope = $scope.$new(true);
        modalScope.title = data.err_msg;
        modalScope.message = "添加订单失败";
        $uibModal.open({
          templateUrl : 'template/modal/alert.html',
          scope : modalScope
        }); 
      }
    });
  
  }
  
  
  $scope.checkContent = function() {  //选择按钮点击事件
	  var checkbox1 = $("[type=checkbox]");
	  var n;
	  checkbox1.each(function(i) {    	  //遍历checkbox   
		  if($(this).prop('checked','checked'))
			  n=n+1;
	  });
      if (n==0){
    	  var modalScope = $scope.$new(true);
          modalScope.title = "添加订单失败";
          modalScope.message = "订单内容为空！请选择相应内容！";
          $uibModal.open({
            templateUrl : 'template/modal/alert.html',
            scope : modalScope
          });
          return false;
      }
   
      return true;
  }
  
  
  $scope.goBack = function() {
    $window.location.href = UrlUtil.transform('item/itemList.do?pageNo='+pageNo);
  }
  $scope.goList = function() {
    $window.location.href = UrlUtil.transform('indent/indentList.do');
  }

  //搜索甲方
  $scope.doTypeaheadApartys = function(q) {
    return $http.post('aparty/doTypeahead.do', {
      q : q
    }).then(function(response) {
      return response.data;
    });
  };
 
  $scope.onTypeaheadApartySelect = function($item, $model, $label) {
    $scope.data.apartyId = $item.value;
    $window.location.href = UrlUtil.transform('indent/indentAddNoitem.do?apartyId='+ $item.value);
  };
  //搜索项目
  $scope.doTypeaheadItems = function(q) {
    return $http.post('item/doTypeahead.do', {
      id: $scope.data.apartyId,
      q : q
    }).then(function(response) {
      return response.data;
    });
  };

  $scope.onTypeaheadItemSelect = function($item, $model, $label) {
    $scope.data.itemId = $item.value;
    $scope.data.apartyIdDisp = $item.value2;
    $window.location.href = UrlUtil.transform('indent/indentAddNoitem.do?id='+ $item.value);
  };
  
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
	    	console.log(response);
	      return response.data;
	    });
	  };
	  //将mworkerId写入隐藏域
	  $scope.onTypeaheadWorkerSelect = function($item, $model, $label) {
		    $scope.data.workerId = $item.value;
		  };
  
		  
		  $scope.changeTarget = function($event) {
		  //  console.log($scope.data);
		    $window.location.href = UrlUtil.transform('indent/indentAddNoitem.do?serveType=R' +"&apartyId="+$scope.data.apartyId);
		  }
 //点击订单内容复选框事件
  $scope.judge_drawing_top_limit= function(id) {
	  
	  var name1="data.indentPriceDto.indentPrice_"+id+"_checked";
	  var checkbox1 = $("[type=checkbox]");
	     var n=0;
		  checkbox1.each(function(i) {    	  //遍历checkbox   
			  if($(this).attr("ng-model")==name1)//如果ng-model值为选定值，并且选中状态，则将品类写入
				  if($(this).is(":checked")){				    
				     $scope.dataSort += id + "_";		
				   
				  }
			  
		  });
   }
  
  //常用语改变时，将数据写入备注框
  $scope.setTemplate=function(){
	  $scope.data.contact.demand = $scope.template;
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
								 var countJiafang_ng="indentPrice_"+content_id+"_countsJiafang";
								 $(this).attr("checked",false);					 
								
							  });
							  $(this).hide();
						  }
					  });
				  }
			  
		  });
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
			$scope.data.managerId="";
			$scope.data.workerId="";
			$scope.data.assignType="";
		}
	}
}]);	
	app.controller('DesignerController', ['$scope', '$http', function($scope, $http) {

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

		  $scope.gridOptions.data = $scope.data.designerList = [{}];

		  $scope.addRow = function() {
		    $scope.gridOptions.data.push({});
		  }

		  $scope.deleteRow = function(row) {
		    var index = $scope.gridOptions.data.indexOf(row.entity);
		    $scope.gridOptions.data.splice(index, 1);
		  };
		}]);

		
  





