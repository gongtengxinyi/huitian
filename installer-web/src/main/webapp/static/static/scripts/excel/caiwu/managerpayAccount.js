var app = angular.module('app', ['ui.bootstrap', 'ifu.cityselect2','ifu.template', 'ifu.util']);

app.controller('managerpayaccountController',//
['$scope', '$http', 'UrlUtil','$uibModal', '$window',//
function($scope, $http, UrlUtil, $uibModal, $window) {
	
	
	
	$scope.sf = {}; //FUJUAN ADD 开始不加的时候，省份不能查询
	 var i=0;
	
	$scope.registDateBegin = {
		    opened : false
		  };

  $scope.registDateEnd = {
		    opened : false
		  };
//注册开始时间控件
  $scope.openRegistDateBegin = function() {
    $scope.registDateBegin.opened = true;
  }
//注册结束时间控件
  $scope.openRegistDateEnd = function() {
    $scope.registDateEnd.opened = true;
  }
  
  $scope.checkDateBegin = {
		    opened : false
		  };

  $scope.checkDateEnd = {
		    opened : false
		  };
//审核开始时间控件
  $scope.openCheckDateBegin = function() {
    $scope.checkDateBegin.opened = true;
  }
//审核结束时间控件
  $scope.openCheckDateEnd = function() {
    $scope.checkDateEnd.opened = true;
  }
  $scope.sf.registDateBegin=Date.parse($("#registBegin").val());//将存储在隐藏域的日期显示在日期控件
  $scope.sf.registDateEnd=Date.parse($("#registEnd").val());
  $scope.sf.checkDateBegin=Date.parse($("#checkBegin").val());
  $scope.sf.checkDateEnd=Date.parse($("#checkEnd").val());
	
	var pageNo=$("#pageNo").val();//将查看内容页面的PageNo传递回来，放入隐藏域，在这里取值
	 $scope.pager = { //初始化pager的各个属性，totalItems，itemsPerPage都不能少，直接设置currentPage一个属性不起作用。
	      totalItems:100,
	      itemsPerPage:10,
	      currentPage : pageNo, //初始化当前页面为传递过来的页面值，确保返回的结果为查看记录内容前的页面
	      maxSize : 10
	  }
	
	 $scope.pager.currentPage=pageNo;
      $scope.autoQuery = function(e){
	  var keycode = window.event?e.keyCode:e.which;
      if(keycode==13){         
          $scope.query();
       }
  };
  
  $scope.query = function() {
	     $("#pageNo").val=$scope.pager.currentPage;
		 var currentPage=$scope.pager.currentPage;//$scope.pager.currentPage;
		
	     $http.post('citymanagerPayReport/managerPayAccountRepList.do', $scope.sf || {}, {
	      params : {
	        page : $scope.pager.currentPage,
	       
	      }
    }).then(function(response) {
      var data1 = response.data;
      $scope.pager.totalItems = data1.page.total;
      $scope.pager.itemsPerPage = data1.page.pageSize;
      $scope.data1=data1;
      $scope.rows = data1.rows;
      console.log($scope.data1);
    });
  }
 
  $scope.$watch('pager.currentPage', $scope.query);
  
  //搜索经理人
  $scope.doTypeaheadManager = function(q) {
    return $http.post('manager/doTypeahead.do', {
      city: $scope.sf.regionCity,
      q : q
    }).then(function(response) {
      return response.data;
    });
  };
	//将managerId写入隐藏域
  $scope.onTypeaheadManagerSelect = function($item, $model, $label) {
	    $scope.sf.managerId = $item.value;
	  };

	  $scope.selectOne = function() {  //选择按钮点击事件
			
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
			 if(checkArry.length=count && !$('#selectAll1').is(':checked')){
				 $('#selectAll1').attr('checked', true);
			 }
				  i=0;
		}
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
  
	//FUJUAN   批量处理订单****************BEGIN**************************
	  $scope.exportBatsetManagerRep=function(){	
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
		
		    if (idList.length == 0) {  //
		    	 var modalScope = $scope.$new(true);	         
		       
		         modalScope.title ="提示";
		         modalScope.message ="请至少选择一个订单！";
		         $uibModal.open({
		                 templateUrl : 'template/modal/alert.html',
		                 scope : modalScope
		               }); 
		         return false;
		     }
		    var indentIdList=idList;
		    $window.location.href = UrlUtil.transform('reportIndent/batchExportManagerRep.do?indentIdList='+ indentIdList);
	  });
	 }
  
  $scope.export = function() {	 
	  $("#btnExport").attr("disabled", true);
	     $http({
		    url: 'reportIndent/exportManagerPayAccount.do',
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
	    	 if (window.navigator.msSaveOrOpenBlob) {
	    	        navigator.msSaveBlob(blob, "城市经理人支出报表.xls");
	    	 } else {
	    	        var link = document.createElement('a');
	    	        link.href = window.URL.createObjectURL(blob);
	    	        link.download = "城市经理人支出报表.xls";
	    	        link.click();
	    	        window.URL.revokeObjectURL(link.href);
	    	    }
	    });
	   
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
		  };

}]);
