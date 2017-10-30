var app = angular
.module('app',// 
    ['ui.grid', 'ui.grid.edit', 'ui.grid.cellNav', 'ui.grid.validate', 'ui.bootstrap',
     'ifu.cityselect2', 'ifu.form', 'ifu.util']);

app.controller('ItemAddController', ['$scope', '$http', '$window', 'UrlUtil', '$uibModal',
                                     function($scope, $http, $window, UrlUtil, $uibModal) {
	
	var pageNo=$("#pageNo").val();//将查看内容页面的PageNo传递回来，放入隐藏域，在这里取值
  $scope.beginDate = {
      opened : false
  };

  $scope.overDate = {
      opened : false
  };

  $scope.openBeginDate = function() {
    $scope.beginDate.opened = true;
  }

  $scope.openOverDate = function() {
    $scope.overDate.opened = true;
  }
  $scope.data = {}; 

  var count = 0;
  
  $scope.doTypeaheadApartys = function(q) {
   
    return $http.post('aparty/doTypeahead.do', {
      q : q
    }).then(function(response) {      	      
      return response.data;
    });
  };
  $scope.prevent=function(sortId){
	
	  var modalScope = $scope.$new(true);
      modalScope.title = "不能取消签约品类";
      modalScope.message = "已经存在这个品类的订单，不能取消签约！";
      $uibModal.open({
        templateUrl : 'template/modal/alert.html',
        scope : modalScope
      }); 
      $("#"+sortId).attr("checked",true);
      return false;
  };
  
//改变服务模式时，重新取签约品类
  $scope.changeServeType1 = function() {  
	  
    $window.location.href = UrlUtil.transform('sctype/sctypeList.do?'+ 'serveType=' + $scope.data.serveType
    		+ '&sortId=' + $scope.data.sortId+"&apartyId="+$scope.data.apartyId);
  }; 
  //改变品类时，重新取签约品类
  $scope.changeSort = function() {  
	  
	    $window.location.href = UrlUtil.transform('sctype/sctypeList.do?'+ 'serveType=' + $scope.data.serveType
	    		+ '&sortId=' + $scope.data.sortId+"&apartyId="+$scope.data.apartyId);
	  }; 
  
  $scope.onTypeaheadApartySelect = function($item, $model, $label) {
	 
    $scope.data.apartyId = $item.value;   

    $window.location.href = UrlUtil.transform('sctype/sctypeList.do?'+ 'serveType=' + $scope.data.serveType+"&apartyId="+$scope.data.apartyId);
  };
  //保存
  $scope.save = function() {
	  $("#btnSave").attr("disabled", true);  
    return $http({
      method : 'POST',
      url : 'sctype/doSave.do', 
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
    	 $("#btnSave").attr("disabled", false);
      var data = response.data
      if (data.success) {
        var modalScope = $scope.$new(true);
        modalScope.message = "成功预约品类";
        UrlUtil.autoJump(modalScope, function() {
          $window.location.href = UrlUtil.transform('sctype/sctypeList.do?'+ 'serveType=' + $scope.data.serveType+"&apartyId="+$scope.data.apartyId);
        });
      }
    });
  }

  $scope.goBack = function() {
    var apartyId = $("#apartyId").val();
    var adminAparty = $("#adminAparty").val();
    if (apartyId != "" && adminAparty !="YES") {
      $window.location.href = UrlUtil.transform('aparty/apartyList.do');
    } else {
      $window.location.href = UrlUtil.transform('item/itemList.do?pageNo='+pageNo);
    }
  }




}]);