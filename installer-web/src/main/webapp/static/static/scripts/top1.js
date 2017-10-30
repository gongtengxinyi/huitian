var app = angular.module('app');

app.controller('TopController',//
['$scope', '$http', '$interval',//
function($scope, $http, $interval) {

  $scope.exceptionIndentCount = 0;//初始化异常抢单数量为0
  $scope.noScrabIndentCount = 0;//初始化未抢单数量为0
  //exceptionIndentCount

  $http.get('adminAuth/hasIndentListAuth.do').then(function(response) {//如果有订单列表的权限
    var ret = response.data;
    if (ret.success && ret.data) {
     var indentRole=$("#indentRole").val();
     var adminRole=$("#adminRole").val();
     
     if(adminRole=="zhizhuang"){//
    	 $scope.updateSecondIndentCount(); //二次上门订单
    	 $scope.updateCancelIndentCount(); //已取消订单
    	 $scope.updateNoScrabIndentCount();//更新未抢单
    	 $scope.updateOverTimeScrabIndentCount();//超时未抢单
     }

     if(adminRole=="ruzhu"){//
         $scope.updateVerifyIndentCount(); //更新待核算订单
     }
     
     if(indentRole.indexOf("indentInsert")>-1){//接单员的权限
    	 $scope.updateSecondIndentCount(); //二次上门订单
    	 $scope.updateInsertIndentCount(); //更新待流转订单
    	 $scope.updateReturnMerchantIndentCount() ;//入驻商家退回订单
     }
     if(indentRole.indexOf("indentVerify")>-1){
    	 $scope.updateVerifyIndentCount(); //更新待核算订单
    	 $scope.updateNotIncomeBillIndentCount(); //更新未提交应收账单
    	 $scope.updateNotPayWorkerBillIndentCount();//更新未提交应付工人账单

    	 
    	 $scope.updateIncomeBillIndentCount(); //更新已提交应收账单
    	 $scope.updatePayWorkerBillIndentCount();//更新已提交应付工人账单

    	 
     }
     if(indentRole.indexOf("indentAssign")>-1){
    	 $scope.updateNoScrabIndentCount();//更新未抢单
    	 $scope.updateCancelIndentCount(); //已取消订单
    	 //$scope.updateAssignIndentCount();//未预约订单
    	 $scope.updateNoArriveIndentCount();//未到货订单
         $scope.updateWaitIndentCount(); //派单等通知订单
         $scope.updateConfirmIndentCount(); //派单已确定上门日期订单
         $scope.updateOverTimeScrabIndentCount();//超时未抢单
         $scope.updateHasConditionIndentCount();//台面具备条件
     }
     if(indentRole.indexOf("indentQA")>-1){
    	 $scope.updateExceptionIndentCount();//更新异常
    	 $scope.updateSignOverTimeIndentCount(); //更新未签到
         $scope.updateExceptionTypeCount(); //更新异常各类型
         $scope.updateInstallIndentCount(); //待货检订单
         $scope.updateReportIndentCount(); //待完工总结订单
         $scope.updateCheckIndentCount(); //待自检订单
         $scope.updateHexiaoIndentCount(); //待核销订单
        // $scope.updateQAIndentCount(); //更新已派订单
         $scope.updateQaJiesuanApplyIndentCount();//可结算订单
         $scope.updateNotAppointCount();//未约单订单
         $scope.updateContinueIndentCount();//继续上门订单
     }
     if(indentRole.indexOf("indentCaiwu")>-1){
    	 $scope.updateNotIncomeIndentCount();//更新待收款
    	 $scope.updateNotPayIndentCount();//更新待付款
    	 $scope.updateIncomeMarkIndentCount();//更新已标记收款订单
    	 $scope.updatePayMarkIndentCount();//更新已标记收款订单
     }
     
     $scope.updateAppointmentIndentCount();//更新待预约
      $scope.updateNeedFollowCount(); //更新需要跟进订单
      $scope.updateIfGoFloorCount(); //更新工匠提报了的需要上楼订单
   
     
      //如果没有任何提醒，则置warnNum=0,让前端区分是否显示红色圈圈
      if($scope.exceptionIndentCount==0 && $scope.noScrabIndentCount==0 &&  
    		  $scope.leftIndentCount==0 && $scope.overTimeIndentCount && 
    	   $scope.appointmentIndentCount==0 && $scope.signOverTimeIndentCount==0){    	  
    	  
    	  $scope.warnNum=0;
      }
      else{
    	  $scope.warnNum=1;
      }
      
      
    }
  });
//显示顶端异常订单数量提示按钮 
  $scope.getExceptionIndentCount = function() {
    $http.get('indent/exceptionIndentCount.do').then(function(response) {
      var ret = response.data;
      if (ret.success) {
        $scope.exceptionIndentCount = ret.data || 0;
      }
    });
  }

  $scope.updateExceptionIndentCount = function() {
    $scope.getExceptionIndentCount();
    $interval($scope.getExceptionIndentCount, 1000 * 1 * 60);//每1分钟取一次数据
  }
  
  //显示顶端未抢订单数量提示按钮  
  $scope.getNoScrabIndentCount = function() {
	    $http.get('indent/noScrabIndentCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.noScrabIndentCount = ret.data || 0;
	      }
	    });
  }

  $scope.updateNoScrabIndentCount = function() {
	    $scope.getNoScrabIndentCount();
	    $interval($scope.getNoScrabIndentCount, 1000 * 5 * 60); //每5分钟取一次数据
  }
  
 
  //显示顶端超时响应提示按钮  
  $scope.getOverTimeIndentCount = function() {
	    $http.get('indent/overTimeIndentCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.overTimeIndentCount = ret.data || 0;
	      }
	    });
  }

  $scope.updateOverTimeIndentCount = function() {
	    $scope.getOverTimeIndentCount();
	    $interval($scope.getOverTimeIndentCount, 1000 * 5 * 60); //每5分钟取一次数据
  }
  
  //显示未预约提示按钮  
  $scope.getAppointmentIndentCount = function() {
	    $http.get('indent/appointmentIndentCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.appointmentIndentCount = ret.data || 0;
	      }
	    });
  }

  $scope.updateAppointmentIndentCount = function() {
	    $scope.getAppointmentIndentCount();
	    $interval($scope.getAppointmentIndentCount, 1000 * 5 * 60); //每5分钟取一次数据
  }
  
  //显示约定上门时间1小时之内未签到  
  $scope.getSignOverTimeIndentCount = function() {
	    $http.get('indent/signOverTimeIndentCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.signOverTimeIndentCount = ret.data || 0;
	      }
	    });
  }

  $scope.updateSignOverTimeIndentCount = function() {
	    $scope.getSignOverTimeIndentCount();
	    $interval($scope.getSignOverTimeIndentCount, 1000 * 5 * 60); //每5分钟取一次数据
  }
  
  //显示各种异常类型的订单数量
  $scope.getExceptionTypeCount = function() {
	    $http.get('indent/excepitonTypeCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.goodsLateCount = ret.countGoodsLate || 0;   //延时到货
	        $scope.conditionCount = ret.countCondition || 0;  //不具备安装条件
	        $scope.checkCount = ret.countCheck || 0;       //货检异常
	        $scope.goodsLostCount = ret.countGoodsLost || 0;   //货物少件
	        $scope.goodsBadCount = ret.countGoodsBad || 0;    //货物破损
	        $scope.errordesignCount = ret.countErrorDesign || 0;    //设计错误
	        $scope.errorOperateCount = ret.countErrorOperate || 0; //操作失误
	        $scope.errorInfoCount = ret.countErrorInfo || 0;   //消息不匹配
	      }
	    });
  }

  $scope.updateExceptionTypeCount = function() {
	    $scope.getExceptionTypeCount();
	    $interval($scope.getExceptionTypeCount, 1000 * 1 * 60); //每1分钟取一次数据
  }
  

  
  //有联系记录需要跟进的订单
  $scope.getNeedFollowCount = function() {
	    $http.get('indent/needFollowCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.needFollowCount = ret.data || 0;
	      }
	    });
}
  
  $scope.updateNeedFollowCount = function() {
	    $scope.getNeedFollowCount();
	    $interval($scope.getNeedFollowCount, 1000 * 60 * 60); //每60分钟取一次数据
  }
  
//有工人提报了需要上楼的订单
  $scope.getIfGoFloorCount = function() {
	    $http.get('indent/ifGoFloorCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.ifGoFloor = ret.data || 0;
	      }
	    });
}
  
  $scope.updateIfGoFloorCount = function() {
	    $scope.getIfGoFloorCount();
	    $interval($scope.getIfGoFloorCount, 1000 * 60 * 60); //每60分钟取一次数据
  }
  

//显示顶端待核算订单数量提示按钮 
  $scope.getVerifyIndentCount = function() {
    $http.get('indent/transferIndentCount.do?type=VERIFY').then(function(response) {
      var ret = response.data;
      if (ret.success) {
        $scope.verifyIndentCount = ret.data || 0;
      }
    });
  }

  $scope.updateVerifyIndentCount = function() {
    $scope.getVerifyIndentCount();
    $interval($scope.getVerifyIndentCount, 1000 * 1 * 60);//每1分钟取一次数据
  }
  
/*//显示顶端待派订单数量提示按钮 
  $scope.getAssignIndentCount = function() {
   // $http.get('indent/transferIndentCount.do?type=ASSIGN').then(function(response) {
	  $http.get('indent/waitIndentCount.do?type=NOAPPOINT').then(function(response) {
      var ret = response.data;
      if (ret.success) {
        $scope.assignIndentCount = ret.data || 0;
      }
    });
  }

  $scope.updateAssignIndentCount = function() {
    $scope.getAssignIndentCount();
    $interval($scope.getAssignIndentCount, 1000 * 1 * 60);//每1分钟取一次数据
  }*/
  
//显示顶端已派订单数量提示按钮 
  $scope.getQAIndentCount = function() {
    $http.get('indent/transferIndentCount.do?type=QA').then(function(response) {
      var ret = response.data;
      if (ret.success) {
        $scope.QAIndentCount = ret.data || 0;
      }
    });
  }

  $scope.updateQAIndentCount = function() {
    $scope.getQAIndentCount();
    $interval($scope.getQAIndentCount, 1000 * 1 * 60);//每1分钟取一次数据
  }
  
//显示顶端待流转订单数量提示按钮 
  $scope.getInsertIndentCount = function() {
    $http.get('indent/transferIndentCount.do?type=INSERT').then(function(response) {
      var ret = response.data;
      if (ret.success) {
        $scope.insertIndentCount = ret.data || 0;
      }
    });
  }

  $scope.updateInsertIndentCount = function() {
    $scope.getInsertIndentCount();
    $interval($scope.getInsertIndentCount, 1000 * 1 * 60);//每1分钟取一次数据
  }
  
//显示顶端二次上门订单数量提示按钮 
  $scope.getSecondIndentCount = function() {
    $http.get('indent/secondIndentCount.do').then(function(response) {
      var ret = response.data;
      if (ret.success) {
        $scope.secondIndentCount = ret.data || 0;
      }
    });
  }

  $scope.updateSecondIndentCount = function() {
    $scope.getSecondIndentCount();
    $interval($scope.getSecondIndentCount, 1000 * 1 * 600);//每10分钟取一次数据
  }
  
//显示顶端待安装总结订单数量提示按钮 
  $scope.getReportIndentCount = function() {
    $http.get('indent/reportIndentCount.do?type=report').then(function(response) {
      var ret = response.data;
      if (ret.success) {
        $scope.reportIndentCount = ret.data || 0;
      }
    });
  }

  $scope.updateReportIndentCount = function() {
    $scope.getReportIndentCount();
    $interval($scope.getReportIndentCount, 1000 * 1 * 600);//每10分钟取一次数据
  }
  
//显示顶端待自检订单数量提示按钮 
  $scope.getCheckIndentCount = function() {
    $http.get('indent/checkHexiaoIndentCount.do?progStatus=REPORT').then(function(response) {
      var ret = response.data;
      if (ret.success) {
        $scope.checkIndentCount = ret.data || 0;
      }
    });
  }

  $scope.updateCheckIndentCount = function() {
    $scope.getCheckIndentCount();
    $interval($scope.getCheckIndentCount, 1000 * 1 * 600);//每10分钟取一次数据
  }
  
//显示顶端待货检订单数量提示按钮 
  $scope.getInstallIndentCount = function() {
    $http.get('indent/reportIndentCount.do?type=install').then(function(response) {
      var ret = response.data;
      if (ret.success) {
        $scope.installIndentCount = ret.data || 0;
      }
    });
  }

  $scope.updateInstallIndentCount = function() {
    $scope.getInstallIndentCount();
    $interval($scope.getInstallIndentCount, 1000 * 1 * 600);//每10分钟取一次数据
  }
  
//显示顶端核销订单数量提示按钮 
  $scope.getHexiaoIndentCount = function() {
    $http.get('indent/checkHexiaoIndentCount.do?progStatus=SELFCHECK').then(function(response) {
      var ret = response.data;
      if (ret.success) {
        $scope.hexiaoIndentCount = ret.data || 0;
      }
    });
  }

  $scope.updateHexiaoIndentCount = function() {
    $scope.getHexiaoIndentCount();
    $interval($scope.getHexiaoIndentCount, 1000 * 1 * 600);//每10分钟取一次数据
  }
  
//显示顶端已取消订单数量提示按钮 
  $scope.getCancelIndentCount = function() {
    $http.get('indent/cancelIndentCount.do').then(function(response) {
      var ret = response.data;
      if (ret.success) {
        $scope.cancelIndentCount = ret.data || 0;
      }
    });
  }

  $scope.updateCancelIndentCount = function() {
    $scope.getCancelIndentCount();
    $interval($scope.getCancelIndentCount, 1000 * 1 * 600);//每10分钟取一次数据
  }
  
//显示顶端等通知订单数量提示按钮 
  $scope.getWaitIndentCount = function() {
    $http.get('indent/waitIndentCount.do?type=WAIT').then(function(response) {
      var ret = response.data;
      if (ret.success) {
        $scope.waitIndentCount = ret.data || 0;
      }
    });
  }

  $scope.updateWaitIndentCount = function() {	 
    $scope.getWaitIndentCount();
    $interval($scope.getWaitIndentCount, 1000 * 1 * 60);//每1分钟取一次数据
  }
  
//显示顶端已确认上门日期订单数量提示按钮 
  $scope.getConfirmIndentCount = function() {
	
    $http.get('indent/waitIndentCount.do?type=CONFIRM').then(function(response) {
      var ret = response.data;
      if (ret.success) {
        $scope.confirmIndentCount = ret.data || 0;
      }
    });
  }

  $scope.updateConfirmIndentCount = function() {
	
	    $scope.getConfirmIndentCount();
	    $interval($scope.getConfirmIndentCount, 1000 * 1 * 60);//每1分钟取一次数据
	  }
//显示顶端退回商家提示按钮 
  $scope.getReturnMerchantIndentCount = function() {
    $http.get('indent/returnMerchantIndentCount.do').then(function(response) {
      var ret = response.data;
      if (ret.success) {
        $scope.returnMerchantIndentCount = ret.data || 0;
      }
    });
  }
  
  $scope.updateReturnMerchantIndentCount = function() {
    $scope.getReturnMerchantIndentCount();
    $interval($scope.getReturnMerchantIndentCount, 1000 * 1 * 60);//每1分钟取一次数据
  }
  
//显示顶端超时未抢订单数量提示按钮  
  $scope.getOverTimeScrabIndentCount = function() {
	    $http.get('indent/overTimeScrabIndentCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.overTimeScrabIndentCount = ret.data || 0;
	      }
	    });
  }

  $scope.updateOverTimeScrabIndentCount = function() {
	    $scope.getOverTimeScrabIndentCount();
	    $interval($scope.getOverTimeScrabIndentCount, 1000 * 5 * 60*60); //每60分钟取一次数据
  }
  
//显示顶端超时未抢订单数量提示按钮  
  $scope.getNoArriveIndentCount = function() {
	    $http.get('indent/noArriveIndentCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.noArriveIndentCount = ret.data || 0;
	      }
	    });
  }

  $scope.updateNoArriveIndentCount = function() {
	    $scope.getNoArriveIndentCount();
	    $interval($scope.getNoArriveIndentCount, 1000 * 5 * 60); //每5分钟取一次数据
  }
  
//显示顶端台面提示按钮  
  $scope.getHasConditionIndentCount = function() {
	    $http.get('indent/hasConditionIndentCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.hasConditionIndentCount = ret.data || 0;
	      }
	    });
  }

  $scope.updateHasConditionIndentCount = function() {
	    $scope.getHasConditionIndentCount();
	    $interval($scope.getHasConditionIndentCount, 1000 * 60 * 60); //每60分钟取一次数据
  }
  
//显示顶端未提交应收账单提示按钮  
  $scope.getNotIncomeBillIndentCount = function() {
	    $http.get('indent/notIncomeBillIndentCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.notIncomeBillIndentCount = ret.data || 0;
	      }
	    });
  }

  $scope.updateNotIncomeBillIndentCount = function() {
	    $scope.getNotIncomeBillIndentCount();
	    $interval($scope.getNotIncomeBillIndentCount, 1000 * 60 * 60); //每60分钟取一次数据
  }
  
//显示顶端未提交应付工匠账单提示按钮  
  $scope.getNotPayWorkerBillIndentCount = function() {
	    $http.get('indent/notPayWorkerBillIndentCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.notPayWorkerBillIndentCount = ret.data || 0;
	      }
	    });
  }

  $scope.updateNotPayWorkerBillIndentCount = function() {
	    $scope.getNotPayWorkerBillIndentCount();
	    $interval($scope.getNotPayWorkerBillIndentCount(), 1000 * 60 * 60); //每60分钟取一次数据
  }

  
//显示顶端待收款提示按钮  
  $scope.getNotIncomeIndentCount = function() {
	    $http.get('indent/notIncomeIndentCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.notIncomeIndentCount = ret.data || 0;
	      }
	    });
  }

  $scope.updateNotIncomeIndentCount = function() {
	    $scope.getNotIncomeIndentCount();
	    $interval($scope.getNotIncomeIndentCount(), 1000 * 60 * 60); //每60分钟取一次数据
  }
  
//显示顶端待付款提示按钮  
  $scope.getNotPayIndentCount = function() {
	    $http.get('indent/notPayIndentCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.notPayIndentCount = ret.data || 0;
	      }
	    });
  }

  $scope.updateNotPayIndentCount = function() {
	    $scope.getNotPayIndentCount();
	    $interval($scope.getNotPayIndentCount(), 1000 * 60 * 60); //每60分钟取一次数据
  }
  
//显示顶端品控处的可结算订单查询
  $scope.getQaJiesuanApplyIndentCount = function() {
	    $http.get('indent/qaJiesuanIndentCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.qaJiesuanApplyIndentCount = ret.data || 0;
	      }
	    });
  }

  $scope.updateQaJiesuanApplyIndentCount = function() {
	    $scope.getQaJiesuanApplyIndentCount();
	    $interval($scope.getQaJiesuanApplyIndentCount(), 1000 * 60 * 60); //每60分钟取一次数据
  }
  
//显示顶端已标记收款订单
  $scope.getIncomeMarkIndentCount = function() {
	    $http.get('indent/incomeMarkIndentCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.incomeMarkIndentCount = ret.data || 0;
	      }
	    });
  }

 
  $scope.updateIncomeMarkIndentCount = function() {
	    $scope.getIncomeMarkIndentCount();
	    $interval($scope.getIncomeMarkIndentCount(), 1000 * 60 * 60); //每60分钟取一次数据
  }
  
//显示顶端已标记付款订单
  $scope.getPayMarkIndentCount = function() {
	    $http.get('indent/payMarkIndentCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.payMarkIndentCount = ret.data || 0;
	      }
	    });
  }

 
  $scope.updatePayMarkIndentCount = function() {
	    $scope.getPayMarkIndentCount();
	    $interval($scope.getPayMarkIndentCount(), 1000 * 60 * 60); //每60分钟取一次数据
  }
  
  
  
//显示顶端已提交应收账单提示按钮  
  $scope.getIncomeBillIndentCount = function() {
	    $http.get('indent/incomeBillIndentCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.incomeBillIndentCount = ret.data || 0;
	      }
	    });
  }

  $scope.updateIncomeBillIndentCount = function() {
	 
	    $scope.getIncomeBillIndentCount();
	    $interval($scope.getIncomeBillIndentCount, 1000 * 60 * 60); //每60分钟取一次数据
  }
  
//显示顶端未提交应付工匠账单提示按钮  
  $scope.getPayWorkerBillIndentCount = function() {
	    $http.get('indent/payWorkerBillIndentCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.payWorkerBillIndentCount = ret.data || 0;
	      }
	    });
  }

  $scope.updatePayWorkerBillIndentCount = function() {
	    $scope.getPayWorkerBillIndentCount();
	    $interval($scope.getPayWorkerBillIndentCount(), 1000 * 60 * 60); //每60分钟取一次数据
  }

//显示顶端未约单提示按钮  
  $scope.getNotAppointCount = function() {
	    $http.get('indent/notAppointCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.notAppointCount = ret.data || 0;
	      }
	    });
  }

  $scope.updateNotAppointCount = function() {
	    $scope.getNotAppointCount();
	    $interval($scope.getNotAppointCount(), 1000 * 60 * 60); //每60分钟取一次数据
  }
//显示顶端继续上门提示按钮  
  $scope.getContinueCount = function() {
	    $http.get('indent/continueIndentCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.continueIndentCount = ret.data || 0;
	      }
	    });
  }

  $scope.updateContinueIndentCount = function() {
	    $scope.getContinueCount();
	    $interval($scope.getContinueCount(), 1000 * 60 * 60); //每60分钟取一次数据
  }
  
}]);
