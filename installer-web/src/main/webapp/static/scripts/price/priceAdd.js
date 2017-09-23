var app = angular
.module('app',// 
    ['ui.grid', 'ui.grid.edit', 'ui.grid.cellNav', 'ui.grid.validate', 'ui.bootstrap',
     'ifu.cityselect2', 'ifu.form', 'ifu.util']);

app.controller('ItemAddController', ['$scope', '$http', '$window', 'UrlUtil', '$uibModal',
                                     function($scope, $http, $window, UrlUtil, $uibModal) {
	$scope.data = {};
	  
	$scope.rt = {};

    $scope.data.priceList=[];
    
    
	//添加所有品类项及其数据
	 $http.post('sctypeSort/typeListAll.do')//
	      .then(function(response) {
	    	  console.log(response.data);
	    	  var index = 0;
	          $("#offer tbody").empty();
	          for (var i = 0; i < response.data.length; i++) {
	            var type = response.data[i];
	            for (var j = 0; j < type.sortList.length; j++) {
	              var sort = type.sortList[j];
	              for (var k = 0; k < sort.contentList.length; k++) {
	                var content = sort.contentList[k];
	                var flag = false;
	                angular.forEach($scope.rt.itemPriceList1, function(data) {
	                  if (data.serveContentId == content.id) {
	                      $("#offer tbody").append('<tr><td id="typeName'+index+'">'+type.name1
	                        +'</td><td id="sortName'+index+'">'+sort.name1
	                        +'<input type="hidden" id="sortId'+index+'" value="'+sort.id+'"/>'
	                        +'<input type="hidden" id="serveContentId'+index+'" value="'+content.id+'"/>'
	                        +'<input type="hidden" id="baseQuote'+index+'" value="'+content.baseQuote+'"/>'
	                        +'<input type="hidden" id="numerationPrice'+index+'" value="'+content.numerationPrice+'"/>'
	                        +'<input type="hidden" id="sequence'+index+'" value="'+content.sequence+'"/>'
	                        +'</td><td><input type="hidden" id="name1'+index+'" value="'+content.desc1+'">'+content.desc1
	                        +'</td><td><input type="hidden" id="unit'+index+'" value="'+content.unit+'">'+content.unitDisp
	                      /*  +'</td><td>￥<input type="text" id="actualPrice'+index+'" value="'+data.actualPrice*/
	                        +'</td><td><input  type="text" id="workerRate'+index+'"  value="'+data.workerRate+'"/>'
	                        +'</td><td><input type="text" id="managerRate'+index+'"  value="'+data.managerRate+'"/>'
	                       /* +'</td><td><input type="text" id="profitRate'+index+'" disabled value="'+data.profitRate+'"/>%'   onblur="jian('+index+');"*/
	                        +' </td></tr>');
	                       
	                	index++;
	                    flag = true;
	                  }
	                })
	                if (flag) {
	                  continue;
	                }	               
	                  $("#offer tbody").append('<tr><td id="typeName'+index+'">'+type.name1
	                    +'</td><td id="sortName'+index+'">'+sort.name1
	                    +'<input type="hidden" id="sortId'+index+'" value="'+sort.id+'"/>'
	                    +'<input type="hidden" id="serveContentId'+index+'" value="'+content.id+'"/>'
	                    +'<input type="hidden" id="baseQuote'+index+'" value="'+content.baseQuote+'"/>'
	                    +'<input type="hidden" id="numerationPrice'+index+'" value="'+content.numerationPrice+'"/>'
	                    +'<input type="hidden" id="sequence'+index+'" value="'+content.sequence+'"/>'
	                    +'</td><td><input type="hidden" id="name1'+index+'" value="'+content.desc1+'">'+content.desc1
	                    +'</td><td><input type="hidden" id="unit'+index+'" value="'+content.unit+'">'+content.unitDisp
	                   /* +'</td><td>￥<input type="text" id="actualPrice'+index+'" value="'+content.actualPrice*/
	                    +'</td><td><input type="text" id="workerRate'+index+'"  value="0"/>'
	                    +'</td><td><input type="text" id="managerRate'+index+'"  value="0"/>'
	                 /*   +'</td><td><input type="text" id="profitRate'+index+'" disabled value="100"/>%'  onblur="jian('+index+');"*/
	                    +'</td></tr>');
	               
	                index++;
	              }
	            }
	          }
	          $("#offer tbody input").css({'width':'100px','border':'1px solid #ccc'});
	          count = index;
	        
	      });
	 
	 
	 
	 $scope.save = function() {
		 
		 //如果工匠或合伙人比例为空，默认置为0
		 for (var int = 0; int < count; int++) {	
			 
		    	if($("#workerRate"+[int]).val()==""){		    		
		    		$("#workerRate"+[int]).val(0);
		    	}
		    	if($("#managerRate"+[int]).val()==""){		    		
		    		$("#managerRate"+[int]).val(0);
		    	}
		  }
		   
		 if (!$scope.form1.$valid) {
		       var modalScope = $scope.$new(true);
		       modalScope.title = "当前信息填写不完整，请完善";
		       modalScope.message = "当前信息填写不完整，请完善！";
		       $uibModal.open({
		         templateUrl : 'template/modal/alert.html',
		         scope : modalScope
		       }); 
		      return false;
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
		    		   
		    for (var int = 0; int < count; int++) {
		      $scope.data.priceList.push({'serveContentId':$("#serveContentId"+[int]).val(),
		        'typeName':$("#typeName"+[int]).text(),
		        'sortName':$("#sortName"+[int]).text(),
		        'sortId':$("#sortId"+[int]).val(),
		        'name1':$("#name1"+[int]).val(),
		        'unit':$("#unit"+[int]).val(),
		     /*   'actualPrice':$("#actualPrice"+[int]).val(),*/
		        'basePrice' :$("#baseQuote"+[int]).val(),
		        'numerationPrice' :$("#numerationPrice"+[int]).val(),
		        'workerRate':$("#workerRate"+[int]).val(),
		        'managerRate':$("#managerRate"+[int]).val(),
		      /*  'profitRate':$("#profitRate"+[int]).val(),*/
		        'sequence':$("#sequence"+[int]).val()
		      });
		    };
		    
		    console.log($scope.data.priceList);
        

		 $http.post('price/doSave.do', $scope.data)
		    .then(function(response) {
		      var data = response.data
		      console.log(data);
		      if (data.success) {
		        var modalScope = $scope.$new(true);
		        modalScope.message = "成功录入价格信息，返回价格体系列表";
		        UrlUtil.autoJump(modalScope, function() {
		          $window.location.href = UrlUtil.transform('price/priceList.do');
		        });
		      }
		    });
		  }

 
  
}]);