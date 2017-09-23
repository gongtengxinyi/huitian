var app = angular.module('app',// 
    ['ui.grid', 'ui.grid.edit', 'ui.grid.cellNav', 'ui.grid.validate', 'ui.bootstrap', //
      'ifu.form', 'ifu.template', 'ifu.util']);

app.controller('ItemController', ['$scope', '$http', '$window', '$uibModal', 'UrlUtil',//
                                  function($scope, $http, $window, $uibModal, UrlUtil) {
	var pageNo=$("#pageNo").val();//将查看内容页面的PageNo传递回来，放入隐藏域，在这里取值
 

  var count = 0;
 var apartyId=$("#apartyId").val();

  // load
  $http.get('aparty/doLoadPrice.do', {
    params : {
      id : apartyId
    
    }
  }).then(function(response) {
    $scope.data = response.data.data;
    
    console.log($scope.data);
    
    var itemPriceList1 = $scope.data.apartyPriceList;
    var index = 0;
    for (var int = 0; int < itemPriceList1.length; int++) {
      var itemPrice = itemPriceList1[int];
      $("#offer tbody").append('<tr><td id="typeName'+index+'">'+itemPrice.typeName
          +'</td><td id="sortName'+index+'">'+itemPrice.sortName
          +'<input type="hidden" id="sortId'+index+'" value="'+itemPrice.sortId+'"/>'
          +'<input type="hidden" id="serveContentId'+index+'" value="'+itemPrice.serveContentId+'"/>'
          +'<input type="hidden" id="sequence'+index+'" value="'+itemPrice.sequence+'"/>'
          +'</td><td><input type="hidden" id="name1'+index+'" value="'+itemPrice.name1+'">'+itemPrice.name1
          +'</td><td><input type="hidden" id="unit'+index+'" value="'+itemPrice.unit+'">'+itemPrice.unitDisp
          
          +'</td><td>￥<input type="text" id="actualPrice'+index+'" value="'+itemPrice.actualPrice
         +'"></td></tr>');
      $("#offer tbody input").css({'width':'100px','border':'1px solid #ccc'});
      index++;
    }
    count = index;

  });
  
 
  
 




  $scope.save = function() {
	  //如果工匠或合伙人比例为空，默认置为0
	  for (var int = 0; int < count; int++) {	
			 
	    	
	    	if($("#actualPrice"+[int]).val()==""){		    		
	    		$("#actualPrice"+[int]).val(0);
	    	}
	  }
	  
	for (var int = 0; int < count; int++) {
	    	if($("#actualPrice"+[int]).val()==""){
	    		//alert($("#name1"+[int]).val()+"的报价信息不完整，请输入报价!");
	    	  var modalScope = $scope.$new(true);
	   	      modalScope.title = "信息不完整";
	   	      modalScope.message = $("#name1"+[int]).val()+"的报价信息不完整，请输入报价!";
	   	      $uibModal.open({
	   	        templateUrl : 'template/modal/alert.html',
	   	        scope : modalScope
	   	      }); 
	   	      return false;
	    	  break;
	    	}
	}
	
    if (!$scope.form1.$valid) {
      return false;
    }
    $scope.data.apartyPriceList = [];
    for (var int = 0; int < count; int++) {
      $scope.data.apartyPriceList.push({'serveContentId':$("#serveContentId"+[int]).val(),
        'typeName':$("#typeName"+[int]).text(),
        'sortName':$("#sortName"+[int]).text(),
        'sortId':$("#sortId"+[int]).val(),
        'name1':$("#name1"+[int]).val(),
        'unit':$("#unit"+[int]).val(),
        'actualPrice':$("#actualPrice"+[int]).val(),
        'basePrice' :$("#baseQuote"+[int]).val(),
        'numerationPrice' :$("#numerationPrice"+[int]).val(),       
        'sequence':$("#sequence"+[int]).val()
      });
    };

    console.log($scope.data);
    
    $http.post('aparty/doUpdateApartyPrice.do', $scope.data)
    .then(function(response) {
      var data = response.data
      
      if (data.success) {
        var modalScope = $scope.$new(true);
        modalScope.message = "保存成功，返回列表";
        UrlUtil.autoJump(modalScope, function() {
          $window.location.href = UrlUtil.transform('aparty/apartyList.do?pageNo='+pageNo);
        });
      }
    });
  }

 

  $scope.goBack = function() {
	
    $window.location.href = UrlUtil.transform('aparty/apartyList.do?pageNo='+pageNo);
  }

}]);




  
  
 
  
  
