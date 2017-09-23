var app = angular.module('app');

app.controller('TopController',//
['$scope', '$http', '$interval',//
function($scope, $http, $interval) {

  $scope.exceptionIndentCount = 0;//初始化异常抢单数量为0
  $scope.noScrabIndentCount = 0;//初始化未抢单数量为0

  $http.get('adminAuth/hasIndentListAuth.do').then(function(response) {//如果有订单列表的权限
    var ret = response.data;
    if (ret.success && ret.data) {
      
     $scope.updateExceptionIndentCount();//更新异常
      $scope.updateNoScrabIndentCount();//更新未抢单
    /*  $scope.updateLeftIndentCount();//更新待离开
*/    /*  $scope.updateOverTimeIndentCount();//更新超时响应      
*/      $scope.updateAppointmentIndentCount();//更新待预约
      $scope.updateSignOverTimeIndentCount(); //更新未签到
      $scope.updateExceptionTypeCount(); //更新异常各类型
      $scope.updateNeedFollowCount(); //更新需要跟进订单
    /*  $scope.updateWorkerContactCount(); //更新x信息沟通
*/    
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
  
  //显示顶端待离开订单数量提示按钮  
  $scope.getLeftIndentCount = function() {
	    $http.get('indent/leftIndentCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.leftIndentCount = ret.data || 0;
	      }
	    });
  }

  $scope.updateLeftIndentCount = function() {
	    $scope.getLeftIndentCount();
	    $interval($scope.getLeftIndentCount, 1000 * 2 * 60); //每2分钟取一次数据
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
  
//工人提交信息沟通的订单数量
  $scope.getWorkerContactCount = function() {
	    $http.get('indent/workerContactCount.do').then(function(response) {
	      var ret = response.data;
	      if (ret.success) {
	        $scope.workerContactCount = ret.data || 0;
	      }
	    });
  }

  $scope.updateWorkerContactCount = function() {
	    $scope.getWorkerContactCount();
	    $interval($scope.getWorkerContactCount, 1000 * 5 * 60); //每5分钟取一次数据
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
}]);
