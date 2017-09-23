var app = angular.module('app',// 
    ['ui.bootstrap', 'ifu.cityselect2','ifu.form', 'ifu.util']);

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
  var datNext=new Date();
  $scope.data.planDoorDate=datNext.setDate(datNow.getDate()+1);
  
  
  /********************FUJUAN0511 ADD END*********************************************************/
  $scope.save = function() {
  
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
	  
	  
    
    
   
	//FUJUAN ADD 判断是否填写订单内容
    //遍历checkbox，如果没有被选中的，则提示
     var checkbox1 = $("[type=checkbox]");
     var n=0;	
    /* //判断服务类型是否为空
       $('#serverType input:checkbox').each(function(i) { 
		  if($(this).is(':checked')){		
			  n=n+1;  //如果有被选中的，则+1
			  console.log(":"+n);
		  }
	  });
	  if(n==0){
		  var modalScope = $scope.$new(true);
	      modalScope.title = "信息不完整";
	      modalScope.message = "请选择服务类型！";
	      $uibModal.open({
	        templateUrl : 'template/modal/alert.html',
	        scope : modalScope
	      }); 
	      return false;
	  }
	  n=0;*/
	 /* //判断订单内容是否为空
	  $('#content input:checkbox').each(function(i) { 
		  if($(this).is(':checked')){
		//  if ($(this).attr('checked')) {
			  n=n+1;  //如果有被选中的，则+1
			  console.log(":"+n);
		  }
	  });
	  if(n==0){
		  var modalScope = $scope.$new(true);
	      modalScope.title = "信息不完整";
	      modalScope.message = "订单内容为空，请输入订单内容！";
	      $uibModal.open({
	        templateUrl : 'template/modal/alert.html',
	        scope : modalScope
	      }); 
	      return false;
	  }*/
	  $scope.data.indentSort="";
	//将服务类型写入$scope.data.indentSortDto
	  $('#serverType input:checkbox').each(function(i) { 
		  if($(this).is(':checked')){
			  var id=$(this).attr("id");
			  var sort_id=$(this).attr("value");
			 
			  
		      $scope.data.indentSort +=sort_id+"_";
		  }
	  });
	  
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

  $scope.doTypeaheadApartys = function(q) {
    return $http.post('aparty/doTypeahead.do', {
      q : q
    }).then(function(response) {
      return response.data;
    });
  };

  $scope.onTypeaheadApartySelect = function($item, $model, $label) {
    $scope.data.apartyId = $item.value;
  };

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
    $window.location.href = UrlUtil.transform('indent/indentAdd.do?id='+ $item.value);
  };
  
  $scope.changeTarget = function($event) {
  //  console.log($scope.data);
    $window.location.href = UrlUtil.transform('indent/indentAdd.do?id='+ $scope.data.itemId + '&serveType=' + $scope.data.serveType);
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
			$scope.data.managerId="";
			$scope.data.workerId="";
			$scope.data.assignType="";
		}
	}
  
}]);




