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
  
  $scope.rt = {};

  
  $scope.data.itemSortList=[];
  var count = 0;
  
  $scope.doTypeaheadApartys = function(q) {
   
    return $http.post('aparty/doTypeahead.do', {
      q : q
    }).then(function(response) {    
    	
      
      return response.data;
    });
  };

  $scope.onTypeaheadApartySelect = function($item, $model, $label) {
    $scope.data.apartyId = $item.value;   
    //FUJUAN ADD 为了带出甲方下的联系人信息，重新刷一下页面
    var url=$scope.data.apartyId;
    $window.location.href=UrlUtil.transform('item/itemAdd1.do?apartyId='+url);
    
  };
  /*******************FUJUAN0508 BEGIN*******************************/
  /*对服务类型进行全选和取消全选*********************/
  $scope.select=true; //初始化全选按钮为可见
  $scope.cancel=false;//初始化取消全选按钮为不可见
  $scope.selectAll = function() {  //选择按钮点击事件
	  var checkbox1 = $("[type=checkbox]");
	  checkbox1.each(function(i) {	    	  //遍历checkbox  	 
		 
		  $(this).prop('checked','checked');   //设置checked属性为checked
	  });
      $scope.select=false;  //全选按钮为不可见
      $scope.cancel=true;   //取消按钮为可见
  }
  $scope.cancelSelect = function() {  //取消按钮点击事件
	  var checkbox1 = $("[type=checkbox]");
	  checkbox1.each(function(i) {	    	    	 
		  $(this).prop('checked',!'cheked');	//设置checke属性为不checked
	  });
      $scope.select=true;
      $scope.cancel=false;
  }
  /*******************FUJUAN0508 END*******************************/  
 
  $scope.save = function() {
	  $scope.data.itemSortList=[];
	  var checkbox1 = $("[type=checkbox]");
	  var n=0;
	  checkbox1.each(function(i) {    	  //遍历checkbox   
		  if($(this).is(':checked'))
			  n=n+1;
	  });
	 
      if (n==0){
    	  var modalScope = $scope.$new(true);
          modalScope.title = "添加项目失败";
          modalScope.message = "请选择至少一项服务类型！";
          $uibModal.open({
            templateUrl : 'template/modal/alert.html',
            scope : modalScope
          });
          return false;
      }
   
      var checkbox1 = $("[type=checkbox]");
      var sortIds = [];
      checkbox1.each(function(i) {
        if ($(this).prop('checked')) {
        	
        	$scope.data.itemSortList.push({
        		'sctypeSortId':$(this).val(),  //将选中的品类放入到sortIds
                'serveType':$('#serveType_'+$(this).val()).val(),
                'name1':$('#sortName_'+$(this).val()).val(),
                
        	});        	
        }
      });
   
   
	  $("#btnSave").attr("disabled", true);

    return $http({
      method : 'POST',
      url : 'item/doSave.do', 
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
      var data = response.data
      if (data.success) {
        var modalScope = $scope.$new(true);
        modalScope.message = "成功录入项目信息，返回项目列表";
        UrlUtil.autoJump(modalScope, function() {
          $window.location.href = UrlUtil.transform('item/itemList.do');
        });
      }
      else{
    	  $("#btnSave").attr("disabled", false);

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

app.controller('Contact1Controller', ['$scope', '$http', function($scope, $http) {

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
    displayName : '职务',
    name : 'duty',
    width : 90
  }, {
    displayName : '微信',
    name : 'linellae',
    width : 90
  }, {
    displayName : '手机',
    name : 'mobile',
    width : 90
  }, {
    displayName : '邮箱',
    name : 'email',
    width : 90
  }, {
    displayName : 'QQ',
    name : 'qq',
    width : 80
  }, {
    displayName : '座机',
    name : 'telePhone',
    width : 90
  }, {
    displayName : '传真',
    name : 'fax',
    width : 90
  }, {
    displayName : '操作',
    name : 'operator',
    width : 60,
    enableCellEdit : false,
    cellTemplate : '<button class="glyphicon glyphicon-remove btn btn-xs btn-danger"'//
      + 'ng-click="grid.appScope.deleteRow(row)">移除</button>'//
  }];


  var apartyId = $("#apartyId").val();
  
  if (apartyId != "") {
    $http.get('apartyContacts/queryContactsList.do', {
      params : {
        apartyId : apartyId,
        stamp : 'APARTY'
      }
    }).then(function(response) {
      $scope.gridOptions.data = $scope.data.contacts1List = response.data;
    });
  } else {
    $scope.gridOptions.data = $scope.data.contacts1List = [{}];
  }


  $scope.addRow = function() {
    $scope.gridOptions.data.push({});
  }


  $scope.deleteRow = function(row) {
    var index = $scope.gridOptions.data.indexOf(row.entity);
    $scope.gridOptions.data.splice(index, 1);
  };
}]);

app.controller('Contact2Controller', ['$scope', '$http', function($scope, $http) {

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
    displayName : '职务',
    name : 'duty',
    width : 90
  }, {
    displayName : '微信',
    name : 'linellae',
    width : 90
  }, {
    displayName : '手机',
    name : 'mobile',
    width : 90
  }, {
    displayName : '邮箱',
    name : 'email',
    width : 90
  }, {
    displayName : 'QQ',
    name : 'qq',
    width : 80
  }, {
    displayName : '座机',
    name : 'telePhone',
    width : 90
  }, {
    displayName : '传真',
    name : 'fax',
    width : 90
  }, {
    displayName : '操作',
    name : 'operator',
    width : 60,
    enableCellEdit : false,
    cellTemplate : '<button class="glyphicon glyphicon-remove btn btn-xs btn-danger"'//
      + 'ng-click="grid.appScope.deleteRow(row)">移除</button>'//
  }];

  $scope.addRow = function() {
    $scope.gridOptions.data.push({});
  }

  var apartyId = $("#apartyId").val();
  
  if (apartyId != "") {
    $http.get('apartyContacts/queryContactsList.do', {
      params : {
        apartyId : apartyId,
        stamp : 'BPARTY'
      }
    }).then(function(response) {
      $scope.gridOptions.data = $scope.data.contacts2List = response.data;
    });
  } else {
    $scope.gridOptions.data = $scope.data.contacts2List = [{}];
  }


  $scope.deleteRow = function(row) {
    var index = $scope.gridOptions.data.indexOf(row.entity);
    $scope.gridOptions.data.splice(index, 1);
  };
}]);