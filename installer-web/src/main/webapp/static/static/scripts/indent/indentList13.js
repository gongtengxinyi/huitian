var app = angular.module('app', ['ui.bootstrap', 'ifu.cityselect2', 'ifu.template', 'ifu.util']);

app.controller('IndentListController',//
['$scope', '$http', '$uibModal', 'UrlUtil', '$window',//
function($scope, $http, $uibModal, UrlUtil, $window) {

		/*$("#clearButton").click(function(){
			alert("ddd");
		});*/
	$scope.sf = {};
	  var i=0;
	  var j=0;
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

 


//查询日期
$scope.queryDateBegin = {
		    opened : false
		  };

$scope.queryDateEnd = {
		    opened : false
		  };
$scope.openQueryDateBegin = function() {
	  $scope.queryDateBegin.opened = true;
	}
$scope.openQueryDateEnd = function() {
$scope.queryDateEnd.opened = true;
}

  $scope.sf.queryDateBegin=Date.parse($("#queryDateBegin").val());//将存储在隐藏域的日期显示在日期控件  实际上门日期
  $scope.sf.queryDateEnd=Date.parse($("#queryDateEnd").val()); 
  $scope.sf.indentType=null; 

  //查询
  $scope.query = function() {
	 
	  $('#indentType').selectpicker({
		    'selectedText': 'cat',
		    actionsBox:true, //在下拉选项添加选中所有和取消选中的按钮
		  });
    /*if ($scope.itemId != "") {
      $scope.sf.itemId = $scope.itemId;
      
      $http.get('item/load.do', {
        params : {
          id : $scope.itemId
        }
      })//
      .then(function(response) {
        $scope.sf.item = response.data;
        
      });
    }*/
    if ($scope.mark == "1") {
      $scope.sf.executeStatusList.push('AFTER');
      $scope.sf.executeStatusList.push('CENTRE');
    }
  
    $("#pageNo").val=$scope.pager.currentPage;
    
	    if ($scope.ifLeft=="NO") {
	    	$scope.sf.ifLeft="NO";
	    }
	    
	    if($("#indentType").val()!=null){
	    	  var indentType=new String($("#indentType").val());
	    	  $scope.sf.indentType=indentType;
	    }else{
	    	var indentType=new String($("#indentType").val());
	    	  $scope.sf.indentType="";
	    }
	    
	    $http.post('indent/dolist.do', $scope.sf || {}, {
	      params : {
	        page : $scope.pager.currentPage
	      }
	    
	 }).then(function(response) {
      var data = response.data;
      console.log(data);
      $scope.pager.totalItems = data.page.total;
      $scope.pager.itemsPerPage = data.page.pageSize;
    
      $scope.rows = data.rows;
     
    
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
//FUJUAN ADD  批量处理订单****************BEGIN**************************
  $scope.releaseIndent=function(type){	
	  var modalScope = $scope.$new(true);
	  modalScope.message = "确认要批量操作吗？ ";
	  $uibModal.open({
	    templateUrl : 'template/modal/confirm.html',
	    scope : modalScope
	  }).result.then(function() {	
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
	         modalScope.message ="请至少选择一个订单！";
	         $uibModal.open({
	                 templateUrl : 'template/modal/alert.html',
	                 scope : modalScope
	               }); 
	         return false;
	    }
	     //'indent/indentPushList.do'	    
	    if(type=="transfer"){
	    	$scope.sf.isAPI="RELEASE";
	    }
	    $http.get("indent/batchSet.do",  {
	    	params : {
	        indentIdList : idList,
	        isAPI:$scope.sf.isAPI
	      }}).then(function(response) {
	        var data = response.data;
	        if (data.success) {
	          var modalScope = $scope.$new(true);
	          modalScope.message = data.err_msg;
	          UrlUtil.autoJump(modalScope, $scope.goList);
	          //$scope.query();
	        } else {
	        	 var modalScope = $scope.$new(false);	         
	  	       
		         modalScope.title ="提示";
		         modalScope.message =data.err_msg ;
		         $uibModal.open({
		                 templateUrl : 'template/modal/alert.html',
		                 scope : modalScope
		               }); 
	        }
	        
	      
	      });
	  
  });
 }
//FUJUAN ADD  批量处理订单****************END**************************
  
  
//FUJUAN ADD  批量处理订单****************BEGIN**************************
  $scope.pushIndentList=function(){	
	  var modalScope = $scope.$new(true);
	  modalScope.message = "确认要批量操作吗？ ";
	  $uibModal.open({
	    templateUrl : 'template/modal/confirm.html',
	    scope : modalScope
	  }).result.then(function() {	
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
	         modalScope.message ="请至少选择一个订单！";
	         $uibModal.open({
	                 templateUrl : 'template/modal/alert.html',
	                 scope : modalScope
	               }); 
	         return false;
	    }
	    $http.get("indent/indentPushList.do",  {

	    	params : {
	        indentIdList : idList,
	     
	      }}).then(function(response) {
	        var data = response.data;
	        if (data.success) {
	          var modalScope = $scope.$new(true);
	          modalScope.message = data.err_msg;
	          
	          UrlUtil.autoJump(modalScope, $scope.goList);
	          //$scope.query();
	        } else {
	        	 var modalScope = $scope.$new(false);	         
	  	       
		         modalScope.title ="提示";
		         modalScope.message =data.err_msg ;
		         $uibModal.open({
		                 templateUrl : 'template/modal/alert.html',
		                 scope : modalScope
		               }); 
		         
	        }
	        
	      
	      });
	  
  });
 }

 //lss add 单选****************BEGIN**************************
 $scope.selectOne = function() {  //选择按钮点击事件
	 j=5;
	 if($('#selectAll1').is(':checked') && $('.one').not($(this)).filter(':not(:checked)').size()==0){
		  $('#selectAll1').attr('checked', false);
	 }
	 var checkArry = document.getElementsByName("checkboxOne");
	 var count=0;
     for (var x = 0; x < checkArry.length; x++) { 
         if(checkArry[x].checked == true){
        	 count++;
         }
     }
	 if(checkArry.length==count && !$('#selectAll1').is(':checked')){
		 $('#selectAll1').attr('checked', true);
	 }
		  i=0;
}
//lss ADD  单选****************END**************************    
//lss ADD  全选****************BEGIN**************************    

 $scope.selectClick = function() {
	 var rows=$scope.rows;
	 var checkArry = document.getElementsByName("checkboxOne");
	 if(i==0){
		 for (var x = 0; x < checkArry.length; x++) { 
	         if(checkArry[x].checked == false){
	        	 checkArry[x].checked=true;
	        	 rows[x].checked=true;
	         }
	     }
		 i++;
	 }else{
		 for (var x = 0; x < checkArry.length; x++) { 
	         if(checkArry[x].checked == true){
	        	 checkArry[x].checked=false;
	        	 rows[x].checked=false;
	         }
	     }
		 i--;
	 }
 }

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
  
  //取消二次上门
  $scope.cancelExtraIndent =function(id){ 	
	  var modalScope = $scope.$new(true);
  modalScope.message = "确认取消二次上门吗？ ";
  $uibModal.open({
    templateUrl : 'template/modal/confirm.html',
    scope : modalScope
  }).result.then(function() {
  $window.location.href = UrlUtil.transform('indent/cancelExtraIndent.do?id='+id+'&pageNo='+$scope.pager.currentPage);
  	
      }
    );
}
	  
  
  //发布订单
  $scope.pushIndent = function(id) {
	  var modalScope = $scope.$new(true);
	  modalScope.message = "确认要发布订单吗？ ";
	  $uibModal.open({
	    templateUrl : 'template/modal/confirm.html',
	    scope : modalScope
	  }).result.then(function() {	
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
	  });
  }
  
  
  //订单流转到下一流程
  $scope.transferIndent = function(id,type) {
	  var modalScope = $scope.$new(true);
	    modalScope.message = "您确认要转单吗？";
	    $uibModal.open({
	      templateUrl : 'template/modal/confirm.html',
	      scope : modalScope
	    }).result.then(function() {
	      $http.get('indent/indentTransfer.do', {
	        params : {
	        	indentId : id,
	        	transferProgress:type,
	          pageNo : $scope.pager.currentPage
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
	  }
  
  //确认取消
  $scope.confirmCancelIndent = function(id,type) {
	  var modalScope = $scope.$new(true);
	    modalScope.message = "确认取消会自动生成一个新订单，您确认取消吗？";
	    $uibModal.open({
	      templateUrl : 'template/modal/confirm.html',
	      scope : modalScope
	    }).result.then(function() {
	      $http.get('indent/createNewIndentForCancel.do', {
	        params : {
	        	indentId : id,	        	
	          pageNo : $scope.pager.currentPage
	        }
	      }).then(function (response) {
	        var data = response.data;
	        if (data.success) {
	          var modalScope = $scope.$new(true);
	          modalScope.message = data.err_msg;
	          UrlUtil.autoJump(modalScope, $scope.goList);
	        } else {
	          var modalScope = $scope.$new(true);
	          modalScope.title = "取消失败";
	          modalScope.message = data.err_msg;
	          $uibModal.open({
	            templateUrl : 'template/modal/alert.html',
	            scope : modalScope
	          }); 
	        }
	      });
	    });
	  }
	  
  
  //入驻商家提交订单，管家便可以看见
  $scope.commitIndent = function(id) {
	    $http.get('indent/indentCommit.do', {
	      params : {
	        indentId : id,
	        pageNo : $scope.pager.currentPage
	      }
	    })//
	    .then(function(response) {
	      var data = response.data;
	      if (data.success) {
	        var modalScope = $scope.$new(true);
	        modalScope.title = "提交订单成功!";
	        modalScope.message = data.err_msg;
	        UrlUtil.autoJump(modalScope, $scope.goList);
	      } else {
	        var modalScope = $scope.$new(true);
	        
	        if (data.err_msg!="" && data.err_msg!=null){
	        	modalScope.title = "提交订单失败!";
	           modalScope.message = data.err_msg;
	        }
	        else {//FUJUAN ADD
	        	modalScope.title = "提示";
	            modalScope.message = "您没有提交订单的权限！";
	        }
	        $uibModal.open({
	          templateUrl : 'template/modal/alert.html',
	          scope : modalScope
	        }); 
	      }
	    });
	  }
//确认工匠可以离开现场
  $scope.leftIndent =function(id){ 	  var modalScope = $scope.$new(true);
	 
	 
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
  $scope.changeWorker = function(id,city) {
   
 /*   var modalScope = $scope.$new(true);
    modalScope.message = "您确认要更换工匠吗？";
    $uibModal.open({
      templateUrl : 'template/modal/confirm.html',
      scope : modalScope
    }).result.then(function(){*/
    	 $window.location.href = UrlUtil.transform('indent/workerChange.do?id='+id+'&pageNo='+pageNo+'&city='+city);
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
  
//取消订单
  $scope.cancelIndent =function(id){ 
	  var modalScope = $scope.$new(true);
	    modalScope.message = "确定要取消此订单吗？ ";
	    $uibModal.open({
	      templateUrl : 'template/modal/confirm.html',
	      scope : modalScope
	    }).result.then(function() {
	    	$window.location.href = UrlUtil.transform('indent/indentCancel.do?id='+id+'&pageNo='+pageNo);
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
	  
	//标记订单派单状态
	  $scope.markIndent =function(id,type){ 
		   var modalScope = $scope.$new(true);
		    modalScope.message = "您确认要标记该订单吗？";
		    $uibModal.open({
		      templateUrl : 'template/modal/confirm.html',
		      scope : modalScope
		    }).result.then(function() {
		      $http.get('indent/markIndent.do', {
		        params : {
		          id : id,
		          type:type
		          
		        }
		      }).then(function (response) {
		        var data = response.data;
		        if (data.success) {
		          var modalScope = $scope.$new(true);
		          modalScope.message = data.err_msg;
		          UrlUtil.autoJump(modalScope, $scope.goList);
		        } else {
		          var modalScope = $scope.$new(true);
		          modalScope.title = "标记失败";
		          modalScope.message = data.err_msg;
		          $uibModal.open({
		            templateUrl : 'template/modal/alert.html',
		            scope : modalScope
		          }); 
		        }
		      });
		    });
		  };
		//标记订单到货
		  $scope.markGoodsArrive =function(id){ 
			   var modalScope = $scope.$new(true);
			    modalScope.message = "您确认要标记该订单吗？";
			    $uibModal.open({
			      templateUrl : 'template/modal/confirm.html',
			      scope : modalScope
			    }).result.then(function() {
			      $http.get('indent/markGoodsArrive.do', {
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
			          modalScope.title = "标记失败";
			          modalScope.message = data.err_msg;
			          $uibModal.open({
			            templateUrl : 'template/modal/alert.html',
			            scope : modalScope
			          }); 
			        }
			      });
			    });
			  };	  
		//标记订单提报账单状态
  $scope.commitBill =function(id,type){ 
			   var modalScope = $scope.$new(true);
			    modalScope.message = "您确认要标记该订单的账单提报状态吗？";
			    $uibModal.open({
			      templateUrl : 'template/modal/confirm.html',
			      scope : modalScope
			    }).result.then(function() {
			      $http.get('indent/commitBill.do', {
			        params : {
			          id : id,
			          type:type
			        }
			      }).then(function (response) {
			        var data = response.data;
			        if (data.success) {
			          var modalScope = $scope.$new(true);
			          modalScope.message = data.err_msg;
			          UrlUtil.autoJump(modalScope, $scope.goList);
			        } else {
			          var modalScope = $scope.$new(true);
			          modalScope.title = "标记失败";
			          modalScope.message = data.err_msg;
			          $uibModal.open({
			            templateUrl : 'template/modal/alert.html',
			            scope : modalScope
			          }); 
			        }
			      });
			    });
  };
  

  
//标记订单收款付款状态
  $scope.incomeAndPay =function(id,type){ 
			   var modalScope = $scope.$new(true);
			   if (type=='INCOME'){
			      modalScope.message = "您确认要标记该订单为已收款吗？";
               }else if (type=='PAY'){
            	   modalScope.message = "您确认要标记该订单为已付款吗？";
                }
			    $uibModal.open({
			      templateUrl : 'template/modal/confirm.html',
			      scope : modalScope
			    }).result.then(function() {
			      $http.get('indent/incomeAndPay.do', {
			        params : {
			          id : id,
			          type:type
			        }
			      }).then(function (response) {
			        var data = response.data;
			        if (data.success) {
			          var modalScope = $scope.$new(true);
			          modalScope.message = data.err_msg;
			          UrlUtil.autoJump(modalScope, $scope.goList);
			        } else {
			          var modalScope = $scope.$new(true);
			          modalScope.title = "标记失败";
			          modalScope.message = data.err_msg;
			          $uibModal.open({
			            templateUrl : 'template/modal/alert.html',
			            scope : modalScope
			          }); 
			        }
			      });
			    });
  }
  
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
	  
  
		//撤销终止订单
		  $scope.recallOver =function(id){ 
			  var modalScope = $scope.$new(true);
			    modalScope.message = "您确认要撤回终止状态吗？";
			    $uibModal.open({
			      templateUrl : 'template/modal/confirm.html',
			      scope : modalScope
			    }).result.then(function() {
			      $http.get('indent/indentRecallOver.do', {
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
		  } 
		  
//新增联系记录
  $scope.indentContact =function(id){ 
	  var modalScope = $scope.$new(true);	 
	  $window.location.href = UrlUtil.transform('indent/indentContact.do?type=contact&id='+id+'&pageNo='+$scope.pager.currentPage);
	    
  } 
  
//删除订单
  $scope.indentDelete =function(id){ 
	  var modalScope = $scope.$new(true);	 
	  $window.location.href = UrlUtil.transform('indent/indentContact.do?type=delete&id='+id+'&pageNo='+$scope.pager.currentPage);
	    
  } 
  
//修改业主信息
  $scope.changeAddress =function(id){ 
	  
	  var modalScope = $scope.$new(true);	 
	  $window.location.href = UrlUtil.transform('indent/changeAddress.do?id='+id+'&pageNo='+$scope.pager.currentPage);
	    
  } 
  
  //退回订单
$scope.returnIndent =function(id){ 
	  
	  var modalScope = $scope.$new(true);
	  
	  $window.location.href = UrlUtil.transform('indent/returnIndent.do?id='+id+'&pageNo='+$scope.pager.currentPage);
	    
} 

//退回商家
$scope.returnMerchant =function(id){ 
	  var modalScope = $scope.$new(true);
	  
	  $window.location.href = UrlUtil.transform('indent/returnMerchant.do?id='+id+'&pageNo='+$scope.pager.currentPage);
	    
} 

//修改执行中订单的计划上门日期
  $scope.changeDoorDate =function(id){ 
	  
	  var modalScope = $scope.$new(true);	 
	  $window.location.href = UrlUtil.transform('indent/changeDoorDate.do?id='+id+'&pageNo='+$scope.pager.currentPage);
	    
  } 
//新增工匠反馈
  $scope.indentExceptionAdd =function(id){ 
	  var modalScope = $scope.$new(true);
	 
	  $window.location.href = UrlUtil.transform('indent/indentExceptionAdd.do?id='+id+'&pageNo='+$scope.pager.currentPage);
	    
  }
  
  //已收到流转表
  $scope.flowTable=function(id){
	  var modalScope = $scope.$new(true);
	  modalScope.message = "您确认已收到流转表了吗？";
	  $uibModal.open({
	      templateUrl : 'template/modal/confirm.html',
	      scope : modalScope
	    }).result.then(function() {
	      $http.get('indent/flowTable.do', {
	        params : {
	          id : id,
	        }
	      }).then(function (response) {
	        var data = response.data;
	        if (data.success) {
	          var modalScope = $scope.$new(true);
	          modalScope.message = data.err_msg;
	          UrlUtil.autoJump(modalScope, $scope.goList);
	        } else {
	          var modalScope = $scope.$new(true);
	          modalScope.title = "标记失败";
	          modalScope.message = data.err_msg;
	          $uibModal.open({
	            templateUrl : 'template/modal/alert.html',
	            scope : modalScope
	          }); 
	        }
	      });
	    }); 
  }
  
  //导出excel
  $scope.exportExcel =function(){ 
	 /* alert("aaa");
	  
	  $http.get('indent/exportExcel.do').then(function(response) {
      });*/
	  $window.location.href = UrlUtil.transform('indent/exportExcel.do');
  }
  
  $scope.export = function() {	 
	  $("#btnExport").attr("disabled", true);
	     $http({
		    url: 'reportIndent/exportIndentNew.do',
		    method: "POST",		   
		    headers: {
		        'Content-type': 'application/json'
		     },
		    responseType: 'arraybuffer',
		    data:$scope.sf || {},
		})		 
	   .then(function(response) {//获取xls数据流，存入文件下载
		   $("#btnExport").attr("disabled", false);
	    	 var blob = new Blob([response.data], {type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"});
	    	 /*    var objectUrl = URL.createObjectURL(blob);
	    	    alert(objectUrl);
	    	    window.open(objectUrl);*/	   	
	    	
	    	 if (window.navigator.msSaveOrOpenBlob) {
	    	        navigator.msSaveBlob(blob, "订单流水.xls");
	    	 } else {
	    	        var link = document.createElement('a');
	    	        link.href = window.URL.createObjectURL(blob);
	    	        link.download = "订单流水.xls";
	    	        link.click();
	    	        window.URL.revokeObjectURL(link.href);
	    	    }
	    });
	   
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
	  
	  //标记已具备安装条件
	  $scope.hasCondition = function(id) {
		  var modalScope = $scope.$new(true);
		    modalScope.message = "您确认要该订单的台面已具备安装条件吗？";
		    $uibModal.open({
		      templateUrl : 'template/modal/confirm.html',
		      scope : modalScope
		    }).result.then(function() {
		    $http.get('indent/hasCondition.do', {
		      params : {
		        indentId : id,
		        pageNo : $scope.pager.currentPage
		      }
		    })//
		    .then(function(response) {
		      var data = response.data;
		      if (data.success) {
		        var modalScope = $scope.$new(true);
		        modalScope.title = "设置成功!";
		        modalScope.message = data.err_msg;
		        UrlUtil.autoJump(modalScope, $scope.goList);
		      } else {
		        var modalScope = $scope.$new(true);
		        
		        if (data.err_msg!="" && data.err_msg!=null){
		        	modalScope.title = "提示";
		           modalScope.message = data.err_msg;
		        }
		        else {//FUJUAN ADD
		        	modalScope.title = "提示";
		            modalScope.message = "您没有相关权限！";
		        }
		        $uibModal.open({
		          templateUrl : 'template/modal/alert.html',
		          scope : modalScope
		        }); 
		      }
		    }); });
		  }  
	//品控申请结算
	  $scope.qaJiesuan =function(id){ 
		   var modalScope = $scope.$new(true);
		    modalScope.message = "您确认要提报结算吗？";
		    $uibModal.open({
		      templateUrl : 'template/modal/confirm.html',
		      scope : modalScope
		    }).result.then(function() {
		      $http.get('indent/qaJiesuan.do', {
		        params : {
		          indentId : id,
		          pageNo : $scope.pager.currentPage
		        }
		      }).then(function (response) {
		        var data = response.data;
		        if (data.success) {
		          var modalScope = $scope.$new(true);
		          modalScope.message = data.err_msg;
		          UrlUtil.autoJump(modalScope, $scope.goList);
		        } else {
		          var modalScope = $scope.$new(true);
		          modalScope.title = "提报失败";
		          modalScope.message = data.err_msg;
		          $uibModal.open({
		            templateUrl : 'template/modal/alert.html',
		            scope : modalScope
		          }); 
		        }
		      });
		    });
		  };
		  //已收到流转表
		  $scope.flowTable11=function(id){
			  var modalScope = $scope.$new(true);
			  modalScope.message = "您确认已收到流转表了吗1111122？";
			  $uibModal.open({
			      templateUrl : 'template/modal/confirm.html',
			      scope : modalScope
			    }).result.then(function() {
			      $http.get('indent/flowTable.do', {
			        params : {
			          id : id,
			        }
			      }).then(function (response) {
			        var data = response.data;
			        if (data.success) {
			          var modalScope = $scope.$new(true);
			          modalScope.message = data.err_msg;
			          UrlUtil.autoJump(modalScope, $scope.goList);
			        } else {
			          var modalScope = $scope.$new(true);
			          modalScope.title = "标记失败";
			          modalScope.message = data.err_msg;
			          $uibModal.open({
			            templateUrl : 'template/modal/alert.html',
			            scope : modalScope
			          }); 
			        }
			      });
			    }); 
		  }

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
		
	

  $scope.$watch('pager.currentPage', $scope.query);
}]);