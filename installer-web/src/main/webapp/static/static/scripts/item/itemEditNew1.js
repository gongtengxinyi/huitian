var app = angular.module('app',// 
    ['ui.grid', 'ui.grid.edit', 'ui.grid.cellNav', 'ui.grid.validate', 'ui.bootstrap', //
     'ifu.cityselect2', 'ifu.form', 'ifu.template', 'ifu.util']);

app.controller('ItemController', ['$scope', '$http', '$window', '$uibModal', 'UrlUtil',//
                                  function($scope, $http, $window, $uibModal, UrlUtil) {
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
  
 
  $scope.contactsDatas = {};

  var count = 0;

  // load
  $http.get('item/load.do', {
    params : {
      id : $scope.data.id
    }
  }).then(function(response) {
    $scope.data = response.data;

    $scope.data.beginDate = Date.parse($scope.data.beginDate.replace());
    $scope.data.overDate = Date.parse($scope.data.overDate.replace());


  });
  
 //load files
  $http.get('item/loadContractFiles.do', {
    params : {
      id : $scope.data.id
    }
  }).then(function(data) {
    $scope.contractFiles = data.data;
  });
  
  
  var serveSortIds = $("#serveSortIds").val();
  var ids = serveSortIds.substring(1, serveSortIds.length-1)
  var serveSortIdss = ids.split(", ");

  angular.forEach(serveSortIdss, function(data) {
    $("[type=checkbox]").each(function (){
      if($(this).val() == data) {
        $(this).attr("checked", true);
      }
    })
  })

 

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
          modalScope.title = "保存项目失败";
          modalScope.message = "请选择至少一项服务类型！";
          $uibModal.open({
            templateUrl : 'template/modal/alert.html',
            scope : modalScope
          });
          return false;
      }
	  
	
	
    if (!$scope.form1.name1.$valid) {
    	 var modalScope = $scope.$new(true);
         modalScope.title = "当前信息填写不完整，请完善";
         modalScope.message = "当前信息填写不完整，请完善！";
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

    for ( var d in $scope.contactsDatas) {
      $scope.data[d] = $scope.contactsDatas[d];
    }
    
    $http({
      method : 'POST',
      url : 'item/doUpdateItem.do', 
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
        UrlUtil.autoJump(modalScope, $scope.goBack);
      }
      else{
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

  $scope.doDelete = function() {


    var id = $scope.data.id;

    var modalScope = $scope.$new(true);
    modalScope.message = "您确认要删除该项目信息吗？如果该项目已发布订单，将不能删除! ";

    $uibModal.open({
      templateUrl : 'template/modal/delete.html',
      scope : modalScope
    }).result.then(function() {
      $http.get('item/deleteItem.do', {
        params : {
          id : id
        }
      }).then(function(response) {
        var data = response.data;
        if (data.success) {
          var modalScope = $scope.$new(true);
          modalScope.message = data.err_msg;
          UrlUtil.autoJump(modalScope, $scope.goBack);
        } else {
          alert(data.err_msg);
        }
      });
    });

  }
  
  $scope.copy = function() {
	  var id = $scope.data.id;
	    var modalScope = $scope.$new(true);
	    modalScope.title="提示";
	    modalScope.message = "您确实要复制该项目吗？";
	    $uibModal.open({
	      templateUrl : 'template/modal/confirm.html',
	      scope : modalScope
	    }).result.then(function() {
	      $http.get('item/copyItem.do', {
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
	          modalScope.title = "复制项目失败";
	          modalScope.message = data.err_msg;
	          $uibModal.open({
	            templateUrl : 'template/modal/alert.html',
	            scope : modalScope
	          }); 
	        }
	      });
	    });
	  
  }
  
  
  $scope.delPact = function(id) {

    var modalScope = $scope.$new(true);
    modalScope.message = "您确认要删除该合同信息吗？";

    $uibModal.open({
      templateUrl : 'template/modal/delete.html',
      scope : modalScope
    }).result.then(function() {
      $http.get('item/delPact.do', {
        params : {
          id : id
        }
      }).then(function(response) {
        var data = response.data;
        if (data.success) {
          alert("成功删除该合同信息！");
          $http.get('item/loadContractFiles.do', {
            params : {
              id : $scope.data.id
            }
          }).then(function(data) {
            $scope.contractFiles = data.data;
          });
        } else {
          alert("删除失败");
        }

      });
    });

  }

  $scope.goBack = function() {
    $window.location.href = UrlUtil.transform('item/itemList.do?pageNo='+pageNo);
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

  $http.get('itemContacts/queryContactsList.do', {
    params : {
      itemId : $scope.data.id,
      stamp : 'APARTY'
    }
  }).then(function(response) {
    $scope.gridOptions.data = $scope.contactsDatas.contacts1List = response.data;
  });

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

  $http.get('itemContacts/queryContactsList.do', {
    params : {
      itemId : $scope.data.id,
      stamp : 'BPARTY'
    }
  }).then(function(response) {
    $scope.gridOptions.data = $scope.contactsDatas.contacts2List = response.data;
  });

  $scope.addRow = function() {
    $scope.gridOptions.data.push({});
  }

  $scope.deleteRow = function(row) {
    var index = $scope.gridOptions.data.indexOf(row.entity);
    $scope.gridOptions.data.splice(index, 1);
  };
  
  
 
  
  
}]);