var app = angular.module('app', ['ui.bootstrap', 'ifu.cityselect2', 'ifu.util']);

app.controller('WorkerListController',//
['$scope', '$http', '$uibModal','$window', 'UrlUtil',//
function($scope,$http, $uibModal, $window,UrlUtil) {
	// 将状态赋值给sf
	// 不采用ng-init直接赋值给sf.status，在于sf作用域的区别
	$scope.sf = {}; //FUJUAN ADD 开始不加的时候，省份不能查询
	  $scope.sf.indentType=null; 
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

    $scope.autoQuery = function(e){
  	  var keycode = window.event?e.keyCode:e.which;
        if(keycode==13){         
            $scope.query();
        }
    };
       
   
    
    
    $scope.query = function() {	 

    	 $("#pageNo").val=$scope.pager.currentPage;
		 var currentPage=$scope.pager.currentPage;//$scope.pager.currentPage;
		console.log($scope.sf);

		
	    $http.post('worker/dolist.do', $scope.sf||{}, {
	      params : {
	        page:$scope.pager.currentPage	       
	      }
	    }).then(function(response) {
	      var data = response.data;
	      $scope.pager.totalItems = data.page.total;
	      $scope.pager.itemsPerPage = data.page.pageSize;
	      $scope.data1 = data;
	      $scope.rows = data.rows;
	    });
  }
    
    
    

  //删除工匠
  $scope.delWorker =function(){ 
	  var modalScope = $scope.$new(true);
	  var id=this.data.id;
	  console.log(id);
	    modalScope.message = "您确认要删除该工匠吗？ ";

	    $uibModal.open({
	      templateUrl : 'template/modal/delete.html',
	      scope : modalScope
	    }).result.then(function() {
	      $http.get('worker/delWorker.do', {
	        params : {
	          id : id
	          
	        }
	      }).then(function(response) {	  
	    	  
	    	  $window.location.href = UrlUtil.transform('worker/workerList.do?pageNo='+$scope.pager.currentPage);
	          
	      });
	    });
  } 
  
  //甲方和工匠解除关系
  $scope.relieveWorker =function(){ 
	  var modalScope = $scope.$new(true);
	  var id=this.data.id;
	  console.log(id);
	    modalScope.message = "您确认要和该工匠解除关系吗？ ";

	    $uibModal.open({
	      templateUrl : 'template/modal/delete.html',
	      scope : modalScope
	    }).result.then(function() {
	      $http.get('worker/relieveWorker.do', {
	        params : {
	          id : id
	          
	        }
	      }).then(function(response) {	  
	    	  
	    	  $window.location.href = UrlUtil.transform('worker/workerList.do?pageNo='+$scope.pager.currentPage);
	          
	      });
	    });
  }
//导出报表
  $scope.export1 =function(){ 
	  $window.location.href = UrlUtil.transform('worker/exportExcel.do?pageNo='+$scope.pager.currentPage);
  }
  
  $scope.export = function() {	 
  	
	     $http({
		    url: 'worker/exportExcel.do',
		    method: "POST",		   
		    headers: {
		        'Content-type': 'application/json'
		     },
		    responseType: 'arraybuffer',
		    data:$scope.sf || {},
		})		 
	   .then(function(response) {//获取xls数据流，存入文件下载
	    	 var blob = new Blob([response.data], {type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"});
	    	 /*    var objectUrl = URL.createObjectURL(blob);
	    	    alert(objectUrl);
	    	    window.open(objectUrl);*/	   	
	    	
	    	 if (window.navigator.msSaveOrOpenBlob) {
	    	        navigator.msSaveBlob(blob, "worker.xls");
	    	    } else {
	    	        var link = document.createElement('a');
	    	        link.href = window.URL.createObjectURL(blob);
	    	        link.download = "worker.xls";
	    	        link.click();
	    	        window.URL.revokeObjectURL(link.href);
	    	    }
            
	     
	    });
	     
	  
	     
	  $scope.exportByDate =function(){ 
	   	 
	   	  
	   	   var registDateBeginstr=$scope.sf.registDateBegin;
	    	var registDateEndstr=$scope.sf.registDateEnd;
	    	var checkDateBeginstr=$scope.sf.checkDateBegin;
	    	var checkDateEndstr=$scope.sf.checkDateEnd;
	   	
	    	registDateBeginstr=registDateBeginstr.toJSON();
	    	registDateEndstr=registDateBeginstr.toJSON();
	    	checkDateBeginstr=registDateBeginstr.toJSON();
	    	checkDateEndstr=registDateBeginstr.toJSON();
	   	  console.log("aaa:"+datestr);
	   	  $window.location.href = UrlUtil.transform('worker/exportExcel.do?registDateBegin='+registDateEndstr+'&registDateEnd='+registDateEndstr
	   			+'&checkDateBegin='+checkDateBeginstr+'&checkDateEnd='+checkDateEndstr);
	     }
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
//LSS ADD  批量更换经理人****************BEGIN**************************
  $scope.changeManager=function(){	
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
	         modalScope.message ="请至少选择一个工匠！";
	         $uibModal.open({
	                 templateUrl : 'template/modal/alert.html',
	                 scope : modalScope
	               }); 
	         return false;
	    }
	    var workerIdList=idList;
	    $scope.post('worker/managerTransferWorkerList.do',workerIdList,'post');
	  	});
 }
  
    $scope.post = function(path, params, method) {
	    method = method || "post"; 
	    var form = document.createElement("form");
	    form.setAttribute("method", method);
	    form.setAttribute("action", path);
	    var worker="worker";
	            var hiddenField = document.createElement("input");
	            hiddenField.setAttribute("type", "hidden");
	            hiddenField.setAttribute("name", worker);
	            hiddenField.setAttribute("value", params);
	            form.appendChild(hiddenField);
	            document.body.appendChild(form);
	            form.submit();
	}
  
//LSS ADD  批量更换经理人****************END**************************
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
   //lss ADD  全选****************END**************************      
  
 $scope.$watch('pager.currentPage', $scope.query);
  
 
}]);
