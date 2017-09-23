var app = angular.module('app', ['ui.bootstrap', 'ifu.cityselect2', 'ifu.template', 'ifu.util']);

app.controller('IndentListController',//
['$scope', '$http', '$uibModal', 'UrlUtil', '$window',//
function($scope, $http, $uibModal, UrlUtil, $window) {

		
	$scope.sf = {};
  // 将状态赋值给sf
  // 不采用ng-init直接赋值给sf.status，在于sf作用域的区别
	var pageNo=$("#pageNo").val();//将查看内容页面的PageNo传递回来，放入隐藏域，在这里取值
	 $scope.pager = { //初始化pager的各个属性，totalItems，itemsPerPage都不能少，直接设置currentPage一个属性不起作用。
	      totalItems:100,
	      itemsPerPage:10,
	      currentPage : pageNo, //初始化当前页面为传递过来的页面值，确保返回的结果为查看记录内容前的页面
	      maxSize : 10
	  }
  
	  if ($scope.status) {
	    $scope.sf.status = $scope.status;
	  }
	  else{
		  $scope.sf.status = $scope.sf.status;
	  }
		 
	 
	 if ($scope.progress) {
		    $scope.sf.progress = $scope.progress;
		  }
		  else{
			  $scope.sf.progress = $scope.sf.progress;
		  }
   console.log("aa:"+$scope.sf.progress);
  $scope.sf.executeStatusList = [];

 

  $scope.comitDateBegin = {
    opened : false
  };

  $scope.comitDateEnd = {
    opened : false
  };
  $scope.releaseDateBegin = {
		    opened : false
		  };

  $scope.releaseDateEnd = {
		    opened : false
		  };
//提交开始时间控件
  $scope.openComitDateBegin = function() {
    $scope.comitDateBegin.opened = true;
  }
//提交结束时间控件
  $scope.openComitDateEnd = function() {
    $scope.comitDateEnd.opened = true;
  }

  $scope.gotDateBegin = {
    opened : false
  };

  $scope.gotDateEnd = {
    opened : false
  };

  $scope.openGotDateBegin = function() {
    $scope.gotDateBegin.opened = true;
  }

  $scope.openGotDateEnd = function() {
    $scope.gotDateEnd.opened = true;
  }
  
  //发布开始时间控件
  $scope.openReleaseDateBegin = function() {
	    $scope.releaseDateBegin.opened = true;
	  }
  //发布结束时间控件
  $scope.openReleaseDateEnd = function() {
	    $scope.releaseDateEnd.opened = true;
	  }
  
 
  $scope.query = function() {
    if ($scope.itemId != "") {
      $scope.sf.itemId = $scope.itemId;
      $http.get('item/load.do', {
        params : {
          id : $scope.itemId
        }
      })//
      .then(function(response) {
        $scope.sf.item = response.data;
        
      });
    }
    if ($scope.mark == "1") {
      $scope.sf.executeStatusList.push('AFTER');
      $scope.sf.executeStatusList.push('CENTRE');
    }
   /* if ($scope.noScrab == "1") { //显示超过24小时未抢单列表        
    	console.log($scope.noScrab);
        $scope.sf.isAPI='noScrab';
    }*/
    
    //如果选择了测试订单
    if($("#testIndent").prop('checked')==true){  
    	  
		  $scope.sf.remarks="TEST";	//赋值为TEST,以供后台筛选（备注为TEST的订单默认为测试订单）		  
	  }
	  else{
		  $scope.sf.remarks="";		  
	  }
    $("#pageNo").val=$scope.pager.currentPage;
    
    if ($scope.ifLeft=="NO") {
    	$scope.sf.ifLeft="NO";
    }
    
    $http.post('indent/dolist.do', $scope.sf || {}, {
      params : {
        page : $scope.pager.currentPage
      }
    }).then(function(response) {
      var data = response.data;
      $scope.pager.totalItems = data.page.total;
      $scope.pager.itemsPerPage = data.page.pageSize;
      
      $scope.rows = data.rows;
     
     console.log(data);
      //FUJUAN0514 ADD ,只有当选择未发布时，才显示发布订单的按钮
      if($scope.sf.releaseStatus=="UNRELEASED"){
    	  $scope.release=true;
    	  $scope.selectAll=true;
    	  $scope.text=true;
      }
      else{
    	  $scope.release=false;
    	  $scope.selectAll=false;
    	  $scope.text=false;
      } 
    //如果是甲方用户，初始化甲方名称          
      
      if(data.apartyIdDisp!="" && data.apartyIdDisp!=null ){
    	  $scope.sf.aparty.name1=data.apartyIdDisp;
         $("#apartyIdDisp").attr('disabled', true);
      }
    });
  }
//FUJUAN ADD  回车键自动查询
//Netscape/Firefox/Opera中不支持 window.event.keyCode,需要用event.which代替
//IE用event.keCode方法获取当前被按下的键盘按键值，
//而NetScape/FireFox/Opera用的则是event.which

  $scope.autoQuery = function(e){
	  var keycode = window.event?e.keyCode:e.which;
      if(keycode==13){         
          $scope.query();
      }
  };
//FUJUAN ADD  批量发布订单****************BEGIN**************************
  $scope.releaseIndent=function(){	
		
	    var idList=[];
	    angular.forEach($scope.rows, function(row) { //遍历行数据，选择的行将id写入变量
	      if (row.checked) {	      
	    	  idList.push(row.id);		    	 
	    	  return;
	      }
	    });
	
	    if (idList.length == 0) {  //如果没选择，提示
	    	 var modalScope = $scope.$new(true);	         
	       
	         modalScope.title ="提示";
	         modalScope.message ="请选择待发布的订单！";
	         $uibModal.open({
	                 templateUrl : 'template/modal/alert.html',
	                 scope : modalScope
	               }); 
	         return false;
	    }
	    $http.get('indent/indentPushList.do',  {params : {
	        indentIdList : idList
	      }}).then(function(response) {
	        var data = response.data;
	        if (data.success) {
	          var modalScope = $scope.$new(true);
	          modalScope.message = data.err_msg;
	          UrlUtil.autoJump(modalScope, $scope.goBack);
	          $scope.query();
	        } else {
	          
	          $scope.alert('保存失败', data.err_msg || '批量发布订单保存失败');
	        }
	      });
 }
//FUJUAN ADD  批量发布订单****************END************************** 
  
  
//FUJUAN ADD  全选****************BEGIN**************************   
  $scope.selectClick = function() {  //选择按钮点击事件
//	  var checkbox1 =$("[type=checkbox]");
//	  checkbox1.each(function(i) {	    	  //遍历checkbox  
//	  $(this).prop('checked', !$(this).prop('checked'));	 
//	
//	  });
	  angular.forEach($scope.rows, function(row) { //遍历行数据，选择的行将id写入变量
	      row.checked=!row.checked;
	    });
     
  }
//FUJUAN ADD  全选****************END**************************     
  $scope.goList = function() {
    $window.location.href = UrlUtil.transform('indent/indentList.do?pageNo='+$scope.pager.currentPage);
  }
  
  $scope.extraIndent = function(id) {
    $http.get('indent/doExtraIndentAdd.do', {
      params : {
        indentId : id,
        pageNo:$scope.pager.currentPage
      }
    })//
    .then(function(response) {
      var data = response.data;
      if (!data.success) {
        var modalScope = $scope.$new(true);
        modalScope.title = "添加二次上门单失败!";
        modalScope.message = data.err_msg;
        $uibModal.open({
          templateUrl : 'template/modal/alert.html',
          scope : modalScope
        }); 
      } else {
        $window.location.href = UrlUtil.transform('indent/extraIndentAdd.do?indentId='+ id+"&&pageNo="+$scope.pager.currentPage);
      }
    });
  }
  $scope.pushIndent = function(id) {
    $http.get('indent/indentPush.do', {
      params : {
        indentId : id,
        pageNo : $scope.pager.currentPage
      }
    })//
    .then(function(response) {
      var data = response.data;
      if (data.success) {
        var modalScope = $scope.$new(true);
        modalScope.title = "发布订单成功!";
        modalScope.message = data.err_msg;
        UrlUtil.autoJump(modalScope, $scope.goList);
      } else {
        var modalScope = $scope.$new(true);
        
        if (data.err_msg!="" && data.err_msg!=null){
        	modalScope.title = "发布订单失败!";
           modalScope.message = data.err_msg;
        }
        else {//FUJUAN ADD
        	modalScope.title = "提示";
            modalScope.message = "您没有发布订单的权限！";
        }
        $uibModal.open({
          templateUrl : 'template/modal/alert.html',
          scope : modalScope
        }); 
      }
    });
  }
  
 

//确认工匠可以离开现场
  $scope.leftIndent =function(id){ 
	  var modalScope = $scope.$new(true);
	 
	  console.log(id);
	    modalScope.message = "确认工匠可以离开现场吗？ ";

	    $uibModal.open({
	      templateUrl : 'template/modal/confirm.html',
	      scope : modalScope
	    }).result.then(function() {
	    $window.location.href = UrlUtil.transform('indent/indentConfirmLeft.do?id='+id+'&pageNo='+$scope.pager.currentPage);
	    	
	        }
	      );
  } 
  
  //更改工匠
  $scope.changeWorker = function(id) {
   
 /*   var modalScope = $scope.$new(true);
    modalScope.message = "您确认要更换工匠吗？";
    $uibModal.open({
      templateUrl : 'template/modal/confirm.html',
      scope : modalScope
    }).result.then(function(){*/
    	 $window.location.href = UrlUtil.transform('indent/workerChange.do?id='+id+'&pageNo='+pageNo);
    //})
   
    
  };
  
//设置订单为完成
  $scope.finishIndent =function(id){ 
	  var modalScope = $scope.$new(true);
	
	
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
  
//重新发送核销码
  $scope.sendCode =function(id){ 
	   var modalScope = $scope.$new(true);
	    modalScope.message = "您确认要重新发送核销码吗？";
	    $uibModal.open({
	      templateUrl : 'template/modal/confirm.html',
	      scope : modalScope
	    }).result.then(function() {
	      $http.get('indent/resendCode.do', {
	        params : {
	          id : id
	        }
	      }).then(function (response) {
	        var data = response.data;
	        if (data.success) {
	          var modalScope = $scope.$new(true);
	          modalScope.message = data.err_msg;
	          UrlUtil.autoJump(modalScope, $scope.goList);
	        } else {
	          var modalScope = $scope.$new(true);
	          modalScope.title = "发送失败";
	          modalScope.message = data.err_msg;
	          $uibModal.open({
	            templateUrl : 'template/modal/alert.html',
	            scope : modalScope
	          }); 
	        }
	      });
	    });
	  };
  
	//撤回订单
	  $scope.recallIndent =function(id){ 
		   var modalScope = $scope.$new(true);
		    modalScope.message = "您确认要撤回订单吗？";
		    $uibModal.open({
		      templateUrl : 'template/modal/confirm.html',
		      scope : modalScope
		    }).result.then(function() {
		      $http.get('indent/indentRecall.do', {
		        params : {
		          id : id
		        }
		      }).then(function (response) {
		        var data = response.data;
		        if (data.success) {
		          var modalScope = $scope.$new(true);
		          modalScope.message = data.err_msg;
		          UrlUtil.autoJump(modalScope, $scope.goList);
		        } else {
		          var modalScope = $scope.$new(true);
		          modalScope.title = "撤回失败";
		          modalScope.message = data.err_msg;
		          $uibModal.open({
		            templateUrl : 'template/modal/alert.html',
		            scope : modalScope
		          }); 
		        }
		      });
		    });
		  };
	  
  
//新增联系记录
  $scope.indentContact =function(id){ 
	  var modalScope = $scope.$new(true);
	 
	  $window.location.href = UrlUtil.transform('indent/indentContact.do?id='+id+'&pageNo='+$scope.pager.currentPage);
	    
  } 
  
  //导出excel
  $scope.exportExcel =function(){ 
	 /* alert("aaa");
	  
	  $http.get('indent/exportExcel.do').then(function(response) {
      });*/
	  $window.location.href = UrlUtil.transform('indent/exportExcel.do');
  }
  
  //删除订单
  $scope.doDelete = function(id) {
	  
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
	          UrlUtil.autoJump(modalScope, $scope.goList);
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
  $scope.$watch('pager.currentPage', $scope.query);
}]);