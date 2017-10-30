var app = angular.module('app', ['ui.bootstrap', 'ifu.cityselect2', 'ifu.template', 'ifu.util']);

app.controller('IndentListController',//
['$scope', '$http', '$uibModal', 'UrlUtil', '$window',//
function($scope, $http, $uibModal, UrlUtil, $window) {


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
//清空按钮
	
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
      console.log("aa:"+$scope.sf.contact.name1);

	    $http.post('indent/dolist.do', $scope.sf || {}, {
	      params : {
	        page : $scope.pager.currentPage
	      }
	    
	 }).then(function(response) {
      var data = response.data;
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

  
  
  $scope.goList = function() {
    $window.location.href = UrlUtil.transform('indent/indentListDel.do?pageNo='+$scope.pager.currentPage);
  }
  


  
//恢复删除
  $scope.indentDeleteRestore =function(id){ 
	  var modalScope = $scope.$new(true);	 
	  $window.location.href = UrlUtil.transform('indent/indentContact.do?type=deleteRestore&id='+id+'&pageNo='+$scope.pager.currentPage);
	    
  } 
  
  
//彻底删除
  $scope.indentDelete =function(id){ 
	  var modalScope = $scope.$new(true);
	    modalScope.message = "您确认要彻底删除该订单吗？删除后将无法恢复！";
	    $uibModal.open({
	      templateUrl : 'template/modal/confirm.html',
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
	    if(type=="DELETEALL"){
	    	$scope.sf.isAPI="DELETEALL";
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



  $scope.$watch('pager.currentPage', $scope.query);
}]);