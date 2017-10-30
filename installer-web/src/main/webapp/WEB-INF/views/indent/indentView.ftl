<#include "/include/common.ftl" />
<title></title>
<#include "/include/common-entry-grid.ftl" />
<!--  -->
<#include "/include/common-cityselect2.ftl" /> <#include
"/include/photoswipe.ftl" />
<!--  -->
<script src="static/js/jwplayer.js"></script>
<link href="static/treegrid/treeGrid.css" rel="styleSheet" />
<style>
a {
	cursor: pointer;
}

.myText {
	width: 200px;
	height: 30px;
}

.myDiv {
	border: 1px solid #CE7E00;
	background: #FFF0D9;
	overflow: scroll;
	overflow-x: hidden;
	scrollbar-face-color: #FFF0D9;
	position: absolute;
	z-index: 10;
	font-size: 12px;
}

.myDiv a {
	text-decoration: none;
	display: block;
	height: 18px;
	line-height: 18px;
	text-indent: 4px;
	text-align: left;
}

.myDiv a:link, .myDiv a:visited {
	color: #2A1B00;
	background-color: #FFF0D9;
}

.myDiv a:hover, .myDiv a:active {
	background-color: #C2C660;
}

.chatBack {
	background-color: #F4F4F4;
}

.chat {
	margin-left: 12px;
	border-radius: 5px; /* 圆角 */
	margin-top: 5px;
}

.tongyi {
	margin-left: 12px;
	margin-top: 10px;
	vertical-align: middle; /* 居中对齐， */
	font-size: 16px;
}

.content {
	width: 50%;
	height: 500px;
	overflow: scroll;
}
</style>
<script src="static/treegrid/tree-grid-directive.js"
	type="text/javascript"></script>
<script src="static/scripts/core/ifu-workerselect.js"></script>
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="static/scripts/indent/indentView.js?randomId=<%=Math.random()%>">	
	</script>

</head>


<body
	ng-init="data.id='${data.id}';doUpdateAuth='${doUpdateAuth}';finishIndentAuth='${finishIndentAuth}';doDelAuth='${doDelAuth}';workerChangeAuth='${workerChangeAuth}';">
	<#include "/include/body-begin.ftl" />

	<!-- 设置默认tab页 -->
	<script>
	function showDiv(){
		var div = document.getElementById('sel');
		div.style.visibility = "visible";
	}
	function hideDiv(){
		var div = document.getElementById('sel');
		div.style.visibility="hidden";
	}
	function getValue(sourceObj){
	      var textValue=$("#text").val();
			document.getElementById("text").value = textValue+sourceObj;
			$("#text").focus();
			changeImage();
			hideDiv();
	}
    $(function () {
      var urlContent=  window.location.href;
     var arr= urlContent.split("#");
     var go=arr[0];
     var to=arr[1];
     if(to==null||to==""){

        }else{
        	window.location.href=go;
            }
     
        $('#indentTab li:eq(${tabIndex}) a').tab('show'); 
    });
</script>

	<div ng-controller="IndentController">
		<input type="hidden" id="dataId" value="${data.id}"> <input
			value="${identify}" type="hidden" id="identify" /> <input
			value="${indentId}" type="hidden" id="indentId" /> <input
			value="${userid}" type="hidden" id="userid" /> <input
			value="${chatUserName}" type="hidden" id="chatUseName" />
		<script type="text/javascript">
	
		/**
		录音文件正式上传
		**/
		  var chatUserName=$("#chatUseName").val();
          var staticurl=window.location.href;
		 function sendAudio(audio,fileSuffix){
	        var jsonObj = {};
	        jsonObj.uuid=UUID();
			jsonObj.indentId = indentId;
			jsonObj.messageMode = "INDENT_MESSAGE";
			jsonObj.messageType ="AUDIO";
			jsonObj.suffix =fileSuffix;
			jsonObj.imageBase64=audio;
			var messageJson=JSON.stringify(jsonObj);
			websocket.send(messageJson);
		    }
		/**
		发送二进制文件
		**/
		 function sendBinary(binary,fileSuffix){
		        var jsonObj = {};
		        jsonObj.uuid=UUID();
				jsonObj.indentId = indentId;
				jsonObj.messageMode = "INDENT_MESSAGE";
				jsonObj.messageType ="BINARY";
				jsonObj.suffix =fileSuffix;
				jsonObj.imageBase64=binary;
				var messageJson=JSON.stringify(jsonObj);
				websocket.send(messageJson);
			    }
		    function hiddenMessage(){
                  $("#someCallYou").hide();	
			    }
	    function  preView()    {    	 
	       	$("#imgShow").show();
	        var img = document.getElementById('img')
	                , imgShow = document.getElementById('imgShow')
	                var suffix=img.value;
	        var strs= new Array(); //定义一数组用来接收后缀
	        strs=suffix.split(".");
	        var fileSuffix=strs[1];
	        var imgFile = new FileReader();
	        imgFile.readAsDataURL(img.files[0]);       
	        imgFile.onload = function () {
	        	if(fileSuffix=='aac'){
	        		sendAudio(this.result,fileSuffix);
	        		return ;
	        		}
	        	else	if(fileSuffix=='GIF'||fileSuffix=='gif'||fileSuffix=='JPEG'||fileSuffix=='jpeg'||fileSuffix=='PNG'||fileSuffix=='png'||fileSuffix=='JPG'||fileSuffix=='jpg'){
	        		sendImageNo(this.result);	
	        		return ;
	        	}    else{
	        		sendBinary(this.result,fileSuffix);
	        	}         		        	       
	        }
	       }
	     function UUID()   {
	            var s = [];
	            var hexDigits = "0123456789abcdef";
	            for (var i = 0; i < 36; i++) {
	                s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
	            }
	            s[14] = "4";  // bits 12-15 of the time_hi_and_version field to 0010
	            s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);  // bits 6-7 of the clock_seq_hi_and_reserved to 01
	            s[8] = s[13] = s[18] = s[23] = "-";
	            var uuid = s.join("");
	            return uuid;
	    }
	    function sendImageNo(image)
	    {
	        var jsonObj = {};
			jsonObj.indentId = indentId;
			jsonObj.uuid=UUID();
			jsonObj.messageMode = "INDENT_MESSAGE";
			jsonObj.messageType ="IMAGE";		
			jsonObj.imageBase64=image;
			var messageJson=JSON.stringify(jsonObj);
			websocket.send(messageJson);
	    }
	    function changeImage(){

	    	  var textValue=$("#text").val();
              if(textValue.indexOf("@")>=0){
             showDiv();
             return;
                  }
              if(textValue.indexOf("@")<0){
            	  hideDiv();
                  }		    

	    	var text=$("#text").val();
	    	if(text==""|| text ==null){    		
	    		$("#addImage").attr({ "src": "static/images/addImge.jpg","onclick": "showSelectButton()" ,"style":'height: 30px; width: 30px' });
	    		}
	    	else{
	    		$("#addImage").attr({ "src": "static/images/send.jpg","onclick": "send()" ,"style":'height: 30px; width: 30px' });
	    	}
	    }
	    function showSelectButton()
	    {
	    	 $("#img").click();

	    }
	    function showDeleteImage(uuidAll){
		    var uuidarr=uuidAll.split("#");
		    var uuid=uuidarr[0];
		    var timetag=uuidarr[1];
		    var seperator1 = "-";
			var seperator2 = ":";				
		    var date = new Date();
		    var month = date.getMonth() + 1;
			var strDate = date.getDate();	
		    var currentdate = date.getFullYear() + seperator1 + month
			+ seperator1 + strDate + " " +timetag;
			var dt1 = new Date(Date.parse(currentdate)); 
		    var diff = parseInt((date.getTime() - dt1.getTime()) / (1000));
		    if(diff>120){
			    alert("超过两分钟不能撤回");
	         $("#"+uuid+"div").hide();  
            	return;
              }
	        var jsonObj = {};
            jsonObj.uuid=UUID();
			jsonObj.indentId = indentId;
			jsonObj.messageMode = "DELETE_MESSAGE";
			jsonObj.messageType = "IMAGE";
			jsonObj.message=uuid;
			var messageJson=JSON.stringify(jsonObj);        
			websocket.send(messageJson);
		   }
	    function showDelete(uuidAll){
		    var uuidarr=uuidAll.split("#");
		    var uuid=uuidarr[0];
		    var timetag=uuidarr[1];
		    var seperator1 = "-";
			var seperator2 = ":";				
		    var date = new Date();
		    var month = date.getMonth() + 1;
			var strDate = date.getDate();	
		    var currentdate = date.getFullYear() + seperator1 + month
			+ seperator1 + strDate + " " +timetag;
			var dt1 = new Date(Date.parse(currentdate)); 
		    var diff = parseInt((date.getTime() - dt1.getTime()) / (1000));
		    if(diff>120){
			    alert("超过两分钟不能撤回");
	         $("#"+uuid+"div").hide();  
            	return;
              }
	        var jsonObj = {};
            jsonObj.uuid=UUID();
			jsonObj.indentId = indentId;
			jsonObj.messageMode = "DELETE_MESSAGE";
			jsonObj.message=uuid;
			var messageJson=JSON.stringify(jsonObj);        
			websocket.send(messageJson);
		   }
	         function showDeletePre(uuidAll){
		    var uuidarr=uuidAll.split("#");
		    var uuid=uuidarr[0];		   
           $("#"+uuid+"div").show();     
		   }
            var imgData=null;
			var identify = $("#identify").val();
			var indentId = $("#indentId").val();
			var userid = $("#userid").val();
			var websocket = null;
			$(function() {
				var $li_1 = $("<div id='divtem'><span style='align='center''></span></div>");
				var $parent = $("#contentForm");
				$parent.append($li_1);
			});
			connectWebsocket();		
			  //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
		    window.onunload = function () {
		    	closeWebSocket();
		    }			  
			  //连接关闭的回调方法
		       websocket.onclose = function () {
		    		$("#no1").show();
					$("#yes1").hide();
					$("#send").attr("onclick","");//禁用发送的onclick事件 
		          //setMessageInnerHTML("WebSocket closed");		    
		       }	   
			//关闭WebSocket连接
			function closeWebSocket() {
				$("#no1").show();
				$("#yes1").hide();
				$("#send").attr("onclick","");//禁用发送的onclick事件 
				websocket.close();
			}		  
			$("#contentForm").scrollTop(100000000);
			//将消息显示在网页上
			function setMessageInnerHTML(jsonObj) {
				var senderName = jsonObj.senderName;
				var timeTag = jsonObj.timeTag;
				var message = jsonObj.message;
				var  uuid= jsonObj.uuid;
				var id=uuid+"call"
				if (typeof (senderName) == "undefined"
						|| typeof (timeTag) == "undefined"
						|| typeof (message) == "undefined") {
					return;
				}
            var date =new Date(timeTag);
               var tem=formatDateHMS(date);
               var uuid= jsonObj.uuid;
               var uuiddiv=uuid+"div";
           var uuidTim= jsonObj.uuid+"#"+tem;
				  if(message.indexOf('@'+chatUserName)>=0){			
					      $("#someCallYou a").attr("href",staticurl+"#"+id);					 
						var $li_1 = $("<div id='"+id+"' class='tongyi'><img src='static/images/touxiang.png'></img>&nbsp&nbsp<span>"
								+ senderName
								+ "&nbsp于"
								+ timeTag
								+ "&nbsp;说：</span></div><div class='chat'><span onmouseover=showDeletePre('"
								+uuid
								+"')  id='"
								+uuid
								+"' style='word-wrap:break-word;word-break:break-all;font-family:Microsoft YaHei UI;color:red'>"
								+ message + "  <button style='display: none' id='"+uuiddiv+"' onclick=showDelete('"+uuidTim+"') type='button' class='btn btn-danger btn-xs'>撤回</button></span></div>");
						 $("#someCallYou").show();
				  }
				  else{
						var $li_1 = $("<div class='tongyi'><img src='static/images/touxiang.png'></img>&nbsp&nbsp<span>"
								+ senderName
								+ "&nbsp于"
								+ timeTag
								+ "&nbsp;说：</span></div><div class='chat'><span onmouseover=showDeletePre('"
							+uuid
						     	+"')  id='"
								+uuid
								+"'>"
								+ message + "  <button style='display: none' id='"+uuiddiv+"' onclick=showDelete('"+uuidTim+"') type='button' class='btn btn-danger btn-xs'>撤回</button></span></div>");
					  }
			  
				var $parent = $("#contentForm");
				$parent.append($li_1);						
				if(senderName!=chatUserName){
                      $("#"+uuiddiv).remove();
					}
				
				
			}				  
			function setMessageInnerHTMLMore(jsonObj) {
				var senderName = jsonObj.senderName;
				var timeTag = jsonObj.timeTag;
				var message = jsonObj.message;
				var senderName = jsonObj.senderName;
				var timeTag = jsonObj.timeTag;
				var message = jsonObj.message;	
			var uuid= jsonObj.uuid;
				var id=uuid+"call"
				if (typeof (senderName) == "undefined"
						|| typeof (timeTag) == "undefined"
						|| typeof (message) == "undefined") {
					return; 
				}
				 var date =new Date(timeTag);
				  var uuid= jsonObj.uuid;
	               var tem=formatDateHMS(date);
	           var uuidTim= jsonObj.uuid+"#"+tem;
				  if(message.indexOf('@'+chatUserName)>=0){			
				      $("#someCallYou a").attr("href",staticurl+"#"+id);					 
					var $li_1 = $("<div id='"+id+"' class='tongyi'><img src='static/images/touxiang.png'></img>&nbsp&nbsp<span>"
							+ senderName
							+ "&nbsp于"
							+ timeTag
							+ "&nbsp;说：</span></div><div class='chat'><span onclick=showDelete('"
							+uuidTim
							+"')  id='"
							+uuid
							+"' style='word-wrap:break-word;word-break:break-all;font-family:Microsoft YaHei UI;color:red'>"
							+ message + "</span></div>");
					  $("#someCallYou").show();
			  }
				  else{
						var $li_1 = $("<div class='tongyi'><img src='static/images/touxiang.png'></img>&nbsp&nbsp<span>"
								+ senderName
								+ "&nbsp于"
								+ timeTag
								+ "&nbsp;说：</span></div><div class='chat'><span >"
								+ message + "</span></div>");
					  }
			
				var $parent = $("#contentForm");
				$parent.prepend($li_1);				
			}	
			function connectWebsocket() {
				//判断当前浏览器是否支持WebSocket
				if ('WebSocket' in window) {	        		         
			         <#include "/include/websocket.ftl" />
			 				strConn = strConn + "userid=" + userid;
			 				strConn = strConn + "&usertype=" + identify;
			 				strConn = strConn + "&TERMINALTYPE=WEB";
			 				strConn = strConn + "&INDENTID=" + indentId;
			 				strConn = strConn + "&V=2";
			 				websocket = new WebSocket(strConn);
			 				
				} else {
					alert('browser Not support websocket')
				}

				//连接发生错误的回调方法
				websocket.onerror = function() {
					$("#no1").show();
					$("#yes1").hide();
					$("#send").attr("onclick","");//禁用发送的onclick事件 
					setMessageInnerHTML("WebSocket error");
				};

				//连接成功建立的回调方法
				websocket.onopen = function() {
					
					$("#yes1").show();
					$("#contentForm").scrollTop(100000000);
					$("#no1").hide();
					$("#send").attr("onclick","send()");//设置发送的onclick事件
					setMessageInnerHTML("WebSocket open");
				}					             
				//接收到消息的回调方法
				websocket.onmessage = function(event) {
					
					var jsonObj = JSON.parse(event.data);
									
					if(jsonObj.messageMode=='SERVER_MESSAGE')
						{
						alert("没有更多消息了~");
						return;

						}
					
					if(jsonObj.messageMode=='BATCH_MESSAGE'){
						var JsonBatch = JSON.parse(jsonObj.message);

					    $.each(JsonBatch, function() {
					    	var create = new Date(this.createDate);
							var createDate = formatDate(create);
							var timeHidden = $("#timeShow").val();
							if (timeHidden == "" || timeHidden == null) {
								$("#timeShow").val(createDate);

							}
							var dateTime = createDate;
							if (timeHidden > dateTime) {
								$("#timeShow").val(dateTime);
							}
							if (this.history != 'YES') {

								setMessageInnerHTML(this);
								if(this.messageType=='IMAGE')
								{					
								showImage(this);
								$("#contentForm").scrollTop(0);
								return ;
								}

								//处理小视频
								if(this.messageType=='VIDEO')
								{					
								showVideo(this);
								$("#contentForm").scrollTop(0);
								return ;
								}						
								//处理文件
								if(this.messageType=='BINARY')
									{
									showBinary(this);
									$("#contentForm").scrollTop(0);
									return;
									}
								if(this.messageType=='AUDIO')
			                    {
									showAudio(this);
									$("#contentForm").scrollTop(0);
								}		
						$("#contentForm").scrollTop(0);
							} else {

								if(this.messageType=='VIDEO')
								{
								showVideoBefore(this);
								return;
								}

								//处理文件
								if(this.messageType=='BINARY')
									{
									showBinaryBefore(this);
									return;
									}
								if(this.messageType=='IMAGE')
								{					
								showImageBefore(this);
								$("#contentForm").scrollTop(0);
								return ;
								}	
								if(this.messageType=='AUDIO')
			                    {
									showAudioBefore(this);
									$("#contentForm").scrollTop(0);
								}		
								setMessageInnerHTMLMore(this);
  					$("#contentForm").scrollTop(0);
							}				    	
					     });		
					    return ;
					}
					 var uuid=jsonObj.message;   				
					if(jsonObj.messageMode=='DELETE_MESSAGE'){	
						if(jsonObj.messageType=='IMAGE'){
							$("#"+uuid+"span").children().remove();
	                        	var $li_1 = $("<span style='color: red;'>撤回一张图片</span>");
							  $("#"+uuid+"span").append($li_1);
							}
						if(jsonObj.messageType=='VIDEO'){
							$("#"+uuid+"span").children().remove();
	                        	var $li_1 = $("<span style='color: red;'>撤回一视频</span>");
							  $("#"+uuid+"span").append($li_1);
							}
						if(jsonObj.messageType=='AUDIO'){
							$("#"+uuid+"span").children().remove();
                        	var $li_1 = $("<span style='color: red;'>撤回一句语音</span>");
						  $("#"+uuid+"span").append($li_1);
							}                          
                      $("#"+uuid).attr("style","color: red;");
                       $("#"+uuid).text(" 撤回一条消息");                     
					}									
					if(jsonObj.messageMode=='CALL_NOTICE'){					
						var message = jsonObj.message;				
	                      var str = eval(message);
					     $.each(str, function() {
				            var name =this;
				          	var $li_1 = $("<a  onclick=getValue('"+name+"')>"+name+"</a>");
							$("#sel").append($li_1);
					     });				
						}				

					var create = new Date(jsonObj.createDate);
					var createDate = formatDate(create);
					var timeHidden = $("#timeShow").val();
					if (timeHidden == "" || timeHidden == null) {
						$("#timeShow").val(createDate);

					}
					var dateTime = createDate;
					if (timeHidden > dateTime) {
						$("#timeShow").val(dateTime);
					}
					if (jsonObj.history != 'YES') {

						setMessageInnerHTML(jsonObj);
						if(jsonObj.messageType=='IMAGE')
						{					
						showImage(jsonObj);
						$("#contentForm").scrollTop(100000000);
						return ;
						}

						//处理小视频
						if(jsonObj.messageType=='VIDEO')
						{					
						showVideo(jsonObj);
						$("#contentForm").scrollTop(100000000);
						return ;
						}
						

						//处理文件
						if(jsonObj.messageType=='BINARY')
							{
							showBinary(jsonObj);
							$("#contentForm").scrollTop(100000000);
							return;
							}
						if(jsonObj.messageType=='AUDIO')
	                    {
							showAudio(jsonObj);
							$("#contentForm").scrollTop(100000000);
						}		
						$("#contentForm").scrollTop(100000000);
					} else {

						if(jsonObj.messageType=='VIDEO')
						{
						showVideoBefore(jsonObj);
						return;
						}

						//处理文件
						if(jsonObj.messageType=='BINARY')
							{
							showBinaryBefore(jsonObj);
							return;
							}
						if(jsonObj.messageType=='IMAGE')
						{					
						showImageBefore(jsonObj);
						$("#contentForm").scrollTop(100000000);
						return ;
						}	
						if(jsonObj.messageType=='AUDIO')
	                    {
							showAudioBefore(jsonObj);
							$("#contentForm").scrollTop(100000000);
						}		
						setMessageInnerHTMLMore(jsonObj);
						$("#contentForm").scrollTop(0);

					}								
				}

				//连接关闭的回调方法
				websocket.onclose = function() {
					$("#no1").show();
					$("#yes1").hide();
					$("#send").attr("onclick","");//禁用发送的onclick事件 
					//setMessageInnerHTML("WebSocket closed");
				}
				//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
				window.onbeforeunload = function() {
					closeWebSocket();
				}
			}

			//发送消息
			function send() {
				var message = document.getElementById('text').value;
				if (message == "") {
					alert("不能发空串");
					return;
				}if(message.length>2000){
                      alert("超过发送的最大长度");
                     return;
				}
				if(message.length>2000){
                       alert("超过发送的最大长度");
                       return;
					}
				var chatMesage = createChatMessage();

				$("#text").val("");
				websocket.send(chatMesage);
				$("#addImage").attr({ "src": "static/images/addImge.jpg","onclick": "showSelectButton()" ,"style":'height: 30px; width: 30px' });
				
			}
			
			
		    /**
		     * 上传图片
		     * 使用FileReader对象将本地图片转换为base64发送给服务端
		     */

		    function uploadImage() {
		        var img = document.getElementById('img')
		                , imgShow = document.getElementById('imgShow')
		        var imgFile = new FileReader();
		        imgFile.readAsDataURL(img.files[0]);
		        imgFile.onload = function () {
		            imgData = this.result; 
		        }
		    }		    	
		     function createChatImageMessage() {
				var jsonObj = {};
				jsonObj.indentId = indentId;
				jsonObj.uuid=UUID();
				jsonObj.messageMode = "INDENT_MESSAGE";
				jsonObj.message = document.getElementById('text').value;
				return JSON.stringify(jsonObj);
			}			
			  /**
		     * 发送图片
		     */	
			  function sendImage(){
	            var jsonObj = {};
	            jsonObj.uuid=UUID();
				jsonObj.indentId = indentId;
				jsonObj.messageMode = "INDENT_MESSAGE";
				jsonObj.messageType ="IMAGE";		
 				jsonObj.imageBase64=imgData;
				console.log(imgData);
				var messageJson=JSON.stringify(jsonObj);
				websocket.send(messageJson);
			$("#imgShow").hide();	
			imgData=null;
			$("#img").val("");
			    }
			  /**
			  展示二进制文件
			  **/
			   function	  showBinaryBefore(jsonObj) {
				  
				  	var senderName = jsonObj.senderName;
					var timeTag = jsonObj.timeTag;	
					var suffix=jsonObj.suffix;
					if (typeof (senderName) == "undefined"
							|| typeof (timeTag) == "undefined") {
						return;
					}
					if(suffix=='DWG'||suffix=='dwg')
						{
						var $li_1 = $("<div class='tongyi'><img src='static/images/touxiang.png'></img>&nbsp&nbsp<span>"
								+ senderName
								+ "&nbsp于"
								+ timeTag
								+ "&nbsp;说：</span></div><div class='chat'><span >"
								+"<a target='view_window' href='"+ jsonObj.binaryAddress+"'>"
								+ "<img  class='img-show'  width='60'  height='60'  src='static/images/dwg.png'/>" 
								+	"</a>"
								+"</span></div>");
						}
					if(suffix=='PDF'||suffix=='pdf'){
						var $li_1 = $("<div class='tongyi'><img src='static/images/touxiang.png'></img>&nbsp&nbsp<span>"
								+ senderName
								+ "&nbsp于"
								+ timeTag
								+ "&nbsp;说：</span></div><div class='chat'><span >"
								+"<a target='view_window' href='"+ jsonObj.binaryAddress+"'>"
								+ "<img  class='img-show'  width='60'  height='60'  src='static/images/pdf.png'/>" 
								+	"</a>"
								+"</span></div>");
					}
					else{
						var $li_1 = $("<div class='tongyi'><img src='static/images/touxiang.png'></img>&nbsp&nbsp<span>"
								+ senderName
								+ "&nbsp于"
								+ timeTag
								+ "&nbsp;说：</span></div><div class='chat'><span >"
								+"<a target='view_window' href='"+ jsonObj.binaryAddress+"'>"
								+ "<img  class='img-show'  width='60'  height='60'  src='static/images/binary.png'/>" 
								+	"</a>"
								+"</span></div>");
					}
				
					var $parent = $("#contentForm");
					$parent.prepend($li_1);	
				  
				  
				  
			  }
			    function showBinary(jsonObj) {
			    	var senderName = jsonObj.senderName;
					var timeTag = jsonObj.timeTag;	
					var suffix=jsonObj.suffix;
					if (typeof (senderName) == "undefined"
							|| typeof (timeTag) == "undefined") {
						return;
					}
					if(suffix=='DWG'|| suffix=='dwg')
						{
						var $li_1 = $("<div class='tongyi'><img src='static/images/touxiang.png'></img>&nbsp&nbsp<span>"
								+ senderName
								+ "&nbsp于"
								+ timeTag
								+ "&nbsp;说：</span></div><div class='chat'><span >"
								+"<a target='view_window' href='"+ jsonObj.binaryAddress+"'>"
								+ "<img  class='img-show'  width='60'  height='60'  src='static/images/dwg.png'/>" 
								+	"</a>"
								+"</span></div>");
						}
					else if(suffix=='PDF'|| suffix=='pdf'){
						var $li_1 = $("<div class='tongyi'><img src='static/images/touxiang.png'></img>&nbsp&nbsp<span>"
								+ senderName
								+ "&nbsp于"
								+ timeTag
								+ "&nbsp;说：</span></div><div class='chat'><span >"
								+"<a target='view_window' href='"+ jsonObj.binaryAddress+"'>"
								+ "<img  class='img-show'  width='60'  height='60'  src='static/images/pdf.png'/>" 
								+	"</a>"
								+"</span></div>");
					}
					else{
						var $li_1 = $("<div class='tongyi'><img src='static/images/touxiang.png'></img>&nbsp&nbsp<span>"
								+ senderName
								+ "&nbsp于"
								+ timeTag
								+ "&nbsp;说：</span></div><div class='chat'><span >"
								+"<a target='view_window' href='"+ jsonObj.binaryAddress+"'>"
								+ "<img  class='img-show'  width='60'  height='60'  src='static/images/binary.png'/>" 
								+	"</a>"
								+"</span></div>");
					}				
					var $parent = $("#contentForm");
					$parent.append($li_1);		  
			    }
			  
			  /**
			     * 展示图片信息
			     */
			    function showImage(jsonObj) {
			    	var senderName = jsonObj.senderName;
					var timeTag = jsonObj.timeTag;	
				       var date =new Date(timeTag);
					var uuid = jsonObj.uuid;
					var uuidspan=uuid+"span";
					var uuiddiv=uuid+"div";
					   var tem=formatDateHMS(date);
			           var uuidTim= jsonObj.uuid+"#"+tem;
					if (typeof (senderName) == "undefined"
							|| typeof (timeTag) == "undefined") {
						return;
					}
					var $li_1 = $("<div class='tongyi'><img src='static/images/touxiang.png'></img>&nbsp&nbsp<span>"
							+ senderName
							+ "&nbsp于"
							+ timeTag
							+ "&nbsp;说：</span></div><div class='chat'><span id="+uuidspan+">"
							+"<a target='view_window' href='"+ jsonObj.binaryAddress+"'>"
							+ "<img  onmouseover=showDeletePre('"+uuid+"') id = "+uuid+" class='img-show'  width='250'  height='180'  src='" + jsonObj.binaryAddress +"'/>" 
							+	"</a>"
							+" <button style='display: none' id='"+uuiddiv+"' onclick=showDeleteImage('"+uuidTim+"') type='button' class='btn btn-danger btn-xs'>撤回</button></span></div>");
					var $parent = $("#contentForm");				
					$parent.append($li_1);		
					waitBinary(jsonObj);
					if(senderName!=chatUserName){
	                      $("#"+uuiddiv).remove();
						}
					
			    }
			 
			  function waitBinary(jsonObj){
				  var uuid = jsonObj.uuid;
		          	var binaryAddress	 = jsonObj.binaryAddress;
			        $("#"+uuid).load(function(){				        	
			        });
			        $("#"+uuid).error(function(){	
			        	  $("#"+uuid).attr("src","static/images/loading.gif");	
			        	 var ime= setTimeout(function(){
			        	  	  $("#"+uuid).attr("src",jsonObj.binaryAddress+"?"+Math.random());				        	  	  
			        	 },3000); 
			        });
			  }
	
			    function showImageBefore(jsonObj) {
			    	var senderName = jsonObj.senderName;
					var timeTag = jsonObj.timeTag;			
					if (typeof (senderName) == "undefined"
							|| typeof (timeTag) == "undefined") {
						return;
					}
					var $li_1 = $("<div class='tongyi'><img src='static/images/touxiang.png'></img>&nbsp&nbsp<span>"
							+ senderName
							+ "&nbsp于"
							+ timeTag
							+ "&nbsp;说：</span></div><div class='chat'><span >"
							+"<a target='view_window' href='"+ jsonObj.binaryAddress+"'>"
							+ "<img  class='img-show'  width='250'  height='180'  src='" + jsonObj.binaryAddress +"'/>" 
							+	"</a>"
							+"</span></div>");
					var $parent = $("#contentForm");
					$parent.prepend($li_1);		  
			    }
			  function putvalue(string)
			  {
				  var jsonObj = {};
				  jsonObj.uuid=UUID();
					jsonObj.indentId = indentId;
					jsonObj.messageMode = "INDENT_MESSAGE";
					jsonObj.message = '&'+string;
					var chatMesage= JSON.stringify(jsonObj);
					websocket.send(chatMesage);			  
			  }

			  //显示小视频
			   function showVideoBefore(jsonObj) {
			    	var senderName = jsonObj.senderName;
					var timeTag = jsonObj.timeTag;
					if (typeof (senderName) == "undefined"
							|| typeof (timeTag) == "undefined") {
						return;
					}
					var $li_1 = $("<div class='tongyi'><img src='static/images/touxiang.png'></img>&nbsp&nbsp<span>"
							+ senderName
							+ "&nbsp于"
							+ timeTag
							+ "&nbsp;说：</span></div><div class='chat'>"
							+ "<video width='300' height='280'  controls='controls'>"
							+" <source src="
							+ jsonObj.binaryAddress
							+" type='video/mp4'></video>"
							 + "</div>");
					var $parent = $("#contentForm");
					$parent.prepend($li_1);		  
			    }
    
			    function showAudioBefore(jsonObj) {
			    	var senderName = jsonObj.senderName;
					var timeTag = jsonObj.timeTag;
					if (typeof (senderName) == "undefined"
							|| typeof (timeTag) == "undefined") {
						return;
					}
					var $li_1 = $("<div class='tongyi'><img src='static/images/touxiang.png'></img>&nbsp&nbsp<span>"
							+ senderName
							+ "&nbsp于"
							+ timeTag
							+ "&nbsp;说：</span></div><div class='chat'>"
							+ "<audio src=" + jsonObj.binaryAddress + " controls='controls'/>" + "</div>");
					var $parent = $("#contentForm");
					$parent.prepend($li_1);		  
			    }
				  /**
			     * 展示l录音文件
			     */
			    function showAudio(jsonObj) {
			    	var senderName = jsonObj.senderName;
					var timeTag = jsonObj.timeTag;
					var uuid=jsonObj.uuid+"span";
					if (typeof (senderName) == "undefined"
							|| typeof (timeTag) == "undefined") {
						return;
					}
					var $li_1 = $("<div class='tongyi'><img src='static/images/touxiang.png'></img>&nbsp&nbsp<span>"
							+ senderName
							+ "&nbsp于"
							+ timeTag
							+ "&nbsp;说：</span></div><div class='chat' id="+uuid+">"
							+ "<audio src=" + jsonObj.binaryAddress + " controls='controls'/>" + "</div>");
					var $parent = $("#contentForm");
					$parent.append($li_1);	
                      waitBinary(jsonObj);	  

			    }

			    //显示小视频
			    function showVideo(jsonObj) {
			    	var senderName = jsonObj.senderName;
					var timeTag = jsonObj.timeTag;
					if (typeof (senderName) == "undefined"
							|| typeof (timeTag) == "undefined") {
						return;
					}
					var $li_1 = $("<div class='tongyi'><img src='static/images/touxiang.png'></img>&nbsp&nbsp<span>"
							+ senderName
							+ "&nbsp于"
							+ timeTag
							+ "&nbsp;说：</span></div><div class='chat'>"
							+ "<video width='300' height='240'  controls='controls'>"
							+" <source src="
							+ jsonObj.binaryAddress
							+" type='video/mp4'></video>"
							 + "</div>");
					var $parent = $("#contentForm");
					$parent.append($li_1);	
					waitBinary(jsonObj);	  

			    }

			    

			//发送消息
			function sendMore() {
				var chatMesage = createMoreChatMessage();
				websocket.send(chatMesage);
				$("#contentForm").scrollTop(0);
			}

			function createChatMessage() {
				var jsonObj = {};
				jsonObj.uuid=UUID();
				jsonObj.indentId = indentId;
				jsonObj.messageMode = "INDENT_MESSAGE";
				jsonObj.messageType = "TEXT";
				jsonObj.message = document.getElementById('text').value;
				return JSON.stringify(jsonObj);
			}
			function createMoreChatMessage() {

				var jsonObj = {};
				jsonObj.indentId = indentId;
				jsonObj.uuid=UUID();
				jsonObj.messageMode = "GET_MORE_CHATS";
				jsonObj.param1 = getNowFormatDate();
				jsonObj.param2 = "BEFORE";
				return JSON.stringify(jsonObj);
			}
			function formatDateHMS(date) {
				var seperator1 = "-";
				var seperator2 = ":";
				var month = date.getMonth() + 1;
				var strDate = date.getDate();
				var hours=date.getHours();
				var minutes=date.getMinutes();
				var seconds=date.getSeconds();
				if (month >= 1 && month <= 9) {
					month = "0" + month;
				}
				if (strDate >= 0 && strDate <= 9) {
					strDate = "0" + strDate;
				}
				if (hours >= 0 && hours <= 9) {
					hours = "0" + hours;
				}
				if (minutes >= 0 && minutes <= 9) {
					minutes = "0" + minutes;
				}
				if (seconds >= 0 && seconds <= 9) {
					seconds = "0" + seconds;
				}
				var currentdate = hours + seperator2
						+minutes + seperator2 +seconds;
				return currentdate;
			}
			function formatDate(date) {
				var seperator1 = "-";
				var seperator2 = ":";
				var month = date.getMonth() + 1;
				var strDate = date.getDate();
				var hours=date.getHours();
				var minutes=date.getMinutes();
				var seconds=date.getSeconds();
				if (month >= 1 && month <= 9) {
					month = "0" + month;
				}
				if (strDate >= 0 && strDate <= 9) {
					strDate = "0" + strDate;
				}
				if (hours >= 0 && hours <= 9) {
					hours = "0" + hours;
				}
				if (minutes >= 0 && minutes <= 9) {
					minutes = "0" + minutes;
				}
				if (seconds >= 0 && seconds <= 9) {
					seconds = "0" + seconds;
				}
				var currentdate = date.getFullYear() + seperator1 + month
						+ seperator1 + strDate + " " + hours + seperator2
						+minutes + seperator2 +seconds;
				return currentdate;
			}

			function getNowFormatDate() {
				var date1 = $("#timeShow").val();
				if (date1 == null || date1 == '') {
					var date = new Date();
					var seperator1 = "-";
					var seperator2 = ":";
					var month = date.getMonthf() + 1;
					var strDate = date.getDate();
					if (month >= 1 && month <= 9) {
						month = "0" + month;
					}
					if (strDate >= 0 && strDate <= 9) {
						strDate = "0" + strDate;
					}
					var currentdate = date.getFullYear() + seperator1 + month
							+ seperator1 + strDate + " " + date.getHours()
							+ seperator2 + date.getMinutes() + seperator2
							+ date.getSeconds();
					return currentdate;
				}
				return date1;
			}
			function sendMessage(){						
				var e = window.event || arguments.callee.caller.arguments[0];
		         if (e.keyCode == 13 ) {
		        	 $("#send").click();		        	
		              e.preventDefault();
		         }
			}
	</script>
		<p>
		<ul id="indentTab" class="nav nav-tabs">
			<li class="active"><a href="#home" data-toggle="tab"> 基本信息 </a>
			</li>
			<li><a href="#progress" data-toggle="tab">订单进程</a></li> 
			<#if Session.USER_BEAN.adminRole!='ruzhu'>
			<li><a href="#exception" data-toggle="tab">工匠反馈</a></li>
			<#if indentCostLists==true >
			<li><a href="#indentCost" data-toggle="tab"> 费用提报列表 </a></li>
			</#if>
			</#if>
			<li><a href="#sitong" data-toggle="tab">八爪鱼</a></li>



		</ul>
		<input type="hidden" id="timeShow" value="">
		<form id="inputForm" name="form1" class="form-horizontal" novalidate>
			<input type="hidden" id="pageNo" value="${pageNo}"
				ng-init="pageNo='${pageNo}'">
			<p>
			<div>
				<button type="button" class="btn btn-success" ng-click="goBack();">
					<span class="glyphicon glyphicon-chevron-left"></span>&nbsp;返回列表
				</button>

			</div>
			<div id="myTabContent" class="tab-content" ng-cloak>
				<!-- --------------------		订单基本信息begin -------------------------------------------------->
				<div class="tab-pane fade in active" id="home">
					<table class="table table-bordered table-striped">
						<tr>
							<br>
							<td>业主信息</td>
						</tr>
						<tr>
							<br>
							<td>业主姓名：{{data.contact.name1}}
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 业主电话 ：{{data.contact.mobile}}
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 业主地址：{{data.contactAddr}}</td>
						</tr>
					</table>
					<table class="table table-bordered table-striped">
						<tr>
							<br>
							<td>订单信息</td>
						</tr>
						<tr>
							<td>商家名称：${apartyName1} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <#if
								itemName!=''> 项目名称 ： ${itemName}
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</#if></span>监理姓名 ：
								${data.contact.supName1} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;监理电话 ：
								${data.contact.supMobile} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
						</tr>
						<#if Session.USER_BEAN.adminRole!='ruzhu'>
						<tr>
							<td><#if data.ifOffline!='YES'> 工匠姓名：{{data.workerName1}}
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 工匠电话 ： {{data.workerMobile}}
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </#if> <#if
								data.ifOffline=='YES'> 工匠姓名：{{data.workerNameOffLine}}
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 工匠电话 ：
								{{data.workerMobileOffLine}} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</#if> 金额（元） ： ￥{{data.workerFee}}
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

						</tr>
						<#if data.ifOffline !='YES'>
						<tr>

							<td>经理人姓名：{{data.managerName1}}
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 经理人电话 ： {{data.managerMobile}}
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;金额 （元）：￥ {{data.managerFee}}</td>
							</#if>
						</tr>
						</#if>
						<tr>
							</td>
						</tr>
					</table>

					<table class="table table-bordered table-striped">
						<tr>
							<br>
							<td>订单内容</td>
						</tr>
						<tr>
							<td><#list serveTypeList as type> <#if
								type.code1==serveType> <!-- <div class="form-group"> -->

								<div class="col-md-9" id="content">
									<#list type.sortList as sort>
									<!-- 判断该品类是不是存在于品类字符串中，如果不存在，说明该品类中没有订单内容，就隐藏该div -->
									<div class="form-group" id="offer_${sort.id}">

										<table>
											<!-- class="table table-border" -->
											<tr>
												<td>${sort.name1}:&nbsp;&nbsp;</td> <#list sort.contentList
												as content> <#if sort.id==content.sctypeSortId> <#if
												Session.USER_BEAN.adminRole!='ruzhu'>
												<td>${content.desc1}{{data.indentPriceDto.indentPrice_${content.id}_counts}}{{data.indentPriceDto.indentPrice_${content.id}_unit}}
													&nbsp;&nbsp;&nbsp;&nbsp; <input type="hidden" name="code1"
													ng-init="data.indentPriceDto.indentPrice_${content.id}_code1='${content.id}'">
												</td> </#if> <#if Session.USER_BEAN.adminRole=='ruzhu'>
												<td>${content.desc1}{{data.indentPriceDto.indentPrice_${content.id}_countsJiafang}}{{data.indentPriceDto.indentPrice_${content.id}_unitJiafang}}
													&nbsp;&nbsp;&nbsp;&nbsp; <input type="hidden" name="code1"
													ng-init="data.indentPriceDto.indentPrice_${content.id}_code1='${content.id}'">
												</td> </#if>
												<!-- <#if (content_index+1)%3 == 0>
                  </tr>
                  <tr></#if> -->
												</#if> </#list>
											</tr>
										</table>

									</div>
									</#list>
								</div> <!--  </div> --> </#if> </#list>

							</td>
						</tr>
						<#if report??>
						<tr>
							<td>上门内容：${report}</td>
						</tr>
						</#if>
						<tr>
							<td><p ng-repeat="f in installImgFiles">
									<span> <a href="fs/download.do?fileid={{f.id}}">{{f.fileName}}</a></span></td>
						</tr>
					</table>

					</p>
				</div>
				<!-- --------------------   订单基本信息end -------------------------------------------------->

				<!-- --------------------   订单进程begin -------------------------------------------------->
				<div class="tab-pane fade" id="progress">
					<br>
					<!--  <tree-grid tree-data="tree_data" col-defs="col_defs"
            tree-control="tree" expand-on="expanding_property"
            expand-level="2" icon-leaf="glyphicon glyphicon-cog"
            icon-expand="glyphicon glyphicon-plus"
            icon-collapse="glyphicon glyphicon-minus"></tree-grid> -->
					抢单日期：{{data.serviceDateString}} &nbsp;&nbsp;&nbsp;&nbsp;
					联系业主日期：{{data.callDateString}}&nbsp;&nbsp;&nbsp;&nbsp;
					预约上门日期：{{data.appointDateString}}
					<p>
					<div
						style="margin-top: 10px; margin-bottom: 10px; margin-left: 0px">

						<#if data.ifOffline=='YES'> <a class="btn btn-primary btn-xs"
							ng-click="finishHand(data.id);"> <span
							class="glyphicon glyphicon-hand-down"></span>&nbsp;一键完成核销+。。
						</a> </#if>
					</div>


					<table cellspacing="0" cellpadding="0">
						<!--     循环各节点node begin-->
						<#list nodeList as node>
						<tr>
							<!--  <td  width="100px">
                    ${node.name1}
                 </td> -->
							<td>
								<table class="table table-bordered" width="100%">
									<tr>

										<td colspan="4" bgcolor="#EFEFEF">${node.name1}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<#if (node.code1=='INSTALL') && node.stepStatus=='AFTER'> <a
											class="btn btn-primary btn-xs"
											href="fs/downloadZip.do?type=INSTALL&indentId={{data.id}}">
												<span class="glyphicon glyphicon-cloud-download"></span>&nbsp;导出照片
										</a> </#if> <#if (node.code1=='MEASURE') &&
											node.stepStatus=='AFTER'> <a class="btn btn-primary btn-xs"
											href="fs/downloadZip.do?type=MEASURE&indentId={{data.id}}">
												<span class="glyphicon glyphicon-cloud-download"></span>&nbsp;导出照片
										</a> </#if> <#if (node.code1=='ARRIVAL') &&
											node.stepStatus=='AFTER'> <a class="btn btn-primary btn-xs"
											href="fs/downloadZip.do?type=ARRIVAL&indentId={{data.id}}">
												</#if> <#if (node.code1=='TRANSPORT') &&
												node.stepStatus=='AFTER'> <a class="btn btn-primary btn-xs"
												href="fs/downloadZip.do?type=TRANSPORT&indentId={{data.id}}">
													<span class="glyphicon glyphicon-cloud-download"></span>&nbsp;导出照片
											</a> </#if> <#if (node.code1=='SELFCHECK') &&
												node.stepStatus!='BEFORE'> <a class="btn btn-primary btn-xs"
												href="fs/downloadZip.do?type=SELFCHECK&indentId={{data.id}}">
													<span class="glyphicon glyphicon-cloud-download"></span>&nbsp;导出照片
											</a> </#if> 
										</td>

									</tr>
									<#if node.code1=='APPOINTMENT'>
									<td width="200px">确认上门日期</td> <#if node.stepStatus=='AFTER'>
									<td width="100px" align="center"><img
										src="static/images/over.jpg"></td>
									<td width="500px">预约操作时间：${node.finishDateString}</td> <#else>
									<td width="100px" align="center"><img
										src="static/images/notover.jpg"></td>
									<td width="500px"></td> </#if> </#if> <#if
									node.code1=='HEXIAO'>

									<td width="200px">核销</td> <#if node.stepStatus=='AFTER'>
									<td width="100px" align="center"><img
										src="static/images/over.jpg"></td>
									<td width="500px">核销时间：${node.finishDateString} <#if
										data.evaluateStatus=='EVALUATED'><a target="_blank"
										class="btn btn-primary btn-xs"
										href="indentEvaluate/indentEvaluateMsg.do?indentId={{data.id}}">
											<span class="glyphicon glyphicon-eye-open"></span>&nbsp;查看评价
									</a> </#if>

									</td> <#else>
									<td width="100px" align="center"><img
										src="static/images/notover.jpg"></td>
									<td width="500px"></td> </#if> </#if>

									<!--     循环各子节点step begin-->
									<#list node.children as step>

									<tr>
										<td width="200px">${step.name1}</td>
										<td width="100px" align="center"><#if
											step.stepStatusDisp=='已完成'> <img src="static/images/over.jpg">
											<#else> <img src="static/images/notover.jpg"> </#if>
										</td>
										<td width="500px"><#if step.stepStatus=='FINISH'> <#if
											node.code1=='REPORT' > <!--   如果是完工总结 -->
											<p>
												${node.isQuestion} <#if updateExc==true> <a target="_blank"
													href="indentNode/reportEdit.do?id=${node.id}"
													class="btn btn-success btn-xs"><span
													class="glyphicon glyphicon-pencil">修改内容</span> </a> </#if>
											</p> <#if node.reportContentQA!="">
											<p>${node.reportContentQA}</p> <#else>
											<p>${node.reportContent}</p> </#if> </#if> <#if
											step.stepType=='SIGN' && (step.code1='INSTALL' ||<!--   如果是测量或入户签到 -->
											step.code1='MEASURE' )>
											<p>签到时间：{{data.signDateString}}
											<p>签到地址：{{data.signAddress}}
											<p>
												签到距离差：{{data.signDistance}}米 </#if>
												<!--   如果是物流签到 -->
												<#if step.stepType=='SIGN' && (step.code1='TRANSPORT' )>
											<p>签到时间：{{data.indentFreight.signDateString}}
											<p>签到地址：{{data.indentFreight.signAddress}}
											<p>
												签到距离差：{{data.indentFreight.signDistance}}米 </#if>
												<!--   如果是入场签到 -->
												<#if step.stepType=='SIGN' && (step.code1='ARRIVAL' )>
											<p>签到时间：{{data.indentFreight.signDateStringJinchang}}
											<p>签到地址：{{data.indentFreight.signAddressJinchang}}
											<p>
												签到距离差：{{data.indentFreight.signDistanceJinchang}}米 </#if>
												<#if step.stepType=='UPLOAD'> 完成时间：${step.finishDateString}
												<#if node.code1=='REPORT' && step.picCount!=0 > <a
													target="_blank" class="btn btn-primary btn-xs"
													href="indentNodeStep/findImgAll.do?id=${step.id}"> <span
													class="glyphicon glyphicon-eye-open"></span>&nbsp; 查看照片
													</#if> <#if node.code1!='REPORT'><a target="_blank"
													class="btn btn-primary btn-xs"
													href="indentNodeStep/findImgAll.do?id=${step.id}"> <span
														class="glyphicon glyphicon-eye-open"></span>&nbsp;
														查看照片</#if>
												</a> </#if> </#if> 
										</td> <#if data.ifOffline=='YES'>

										<td><#if node.code1=='REPORT' > <!--   如果是完工总结 --> <a
											class="btn btn-primary btn-xs" target="_blank"
											href="indent/indentReport.do?id=${step.id}&indentId=${data.id}">
												<span class="glyphicon glyphicon-plus"></span>&nbsp;新增完工总结
										</a> </#if> <#if step.stepType!='SIGN' && node.code1!='REPORT'
											&&step.stepType=='UPLOAD'> <a class="btn btn-primary btn-xs"
											target="_blank"
											href="indent/indentOffline.do?id=${step.id}&indentId=${data.id}">
												<span class="glyphicon glyphicon-arrow-up"></span>&nbsp;上传照片
										</a> </#if> <#if step.stepType=='SIGN'> <a
											class="btn btn-primary btn-xs" target="_blank"
											href="indent/indentSign.do?id=${step.id}&indentId=${data.id}">
												<span class="glyphicon glyphicon-pencil"></span>&nbsp;签到
										</a> </#if>

										</td> </#if>

									</tr>
									</#list>
									<!--     循环各子节点step end-->
								</table>

							</td>
							<td><#if node.remarks!=''> 工人备注：${node.remarks} </#if></td>
						</tr>
						</#list>
						<!--     循环各节点node end-->
					</table>
				</div>
				<!-- --------------------   订单进程end -------------------------------------------------->
				<!-- --------------------   订单提报 begin -------------------------------------------------->
				
				<div class="tab-pane fade" id="indentCost">
					<table class="table table-bordered table-striped">
						<tr>
							<td colspan="9">
							<center>
								<h5>订单费用提报列表</h5>
							</center>
							</td>
						</tr>
						<tr>
							<td>提报人姓名</td>
							<td>费用</td>
							<td>提报原因</td>
							<td>提报日期</td>
							<td>审核结果</td>
							<td>审核意见</td>
						</tr>
						 <#list indentCostList as indentCost>
						<tr>
							<td>${indentCost.raiserName1 }</td>
							<td>${indentCost.cost }</td>
							<td>${indentCost.reason }</td>
							<td>${indentCost.createDate }</td>
							<td>${indentCost.auditResultDisp }</td>
							<td>${indentCost.auditMsg }</td>
						</tr>
						</#list>
					</table>
				</div>
				<!-- --------------------   订单订单提报end -------------------------------------------------->
				
				<!-- --------------------   异常反馈begin -------------------------------------------------->
				<div class="tab-pane fade" id="exception">
					<#if exceptionList.size()==0>
					<p>
					<p>
					<p>
					<p>
						<br> <font size="4">该订单还没有工匠反馈！</font> </#if> <br> <#if
						ExceptPic=="YES"> <a class="btn btn-primary btn-xs"
							href="fs/downloadZip.do?type=EXCEPTION&indentId={{data.id}}">
							<span class="glyphicon glyphicon-cloud-download"> 导出异常图片</span>
						</a> </#if> <a class="btn btn-primary btn-xs" target="_blank"
							href="indent/indentExceptionAdd.do?id=${data.id}"> <span
							class="glyphicon glyphicon-plus"></span>&nbsp;新增反馈
						</a> <#list exceptionList as exception>
					<table class="table table-bordered">
						<tr>
							<td width="100px" bgcolor="#EFEFEF">反馈内容
								<p>
								<p>
									<#if updateExc==true>不导出 <#if exception.ifExport=="YES"> <input
										type="checkbox" ng-checked=true name="ifExport" id="ifExport"
										ng-click="setIfExport('${exception.id}')"> <#else> <input
										type="checkbox" name="ifExport" id="ifExport"
										ng-click="setIfExport('${exception.id}')"
										ng-model="data.ifExport${exception.id}"
										ng-init="data.ifExport${exception.id}=false"> </#if>
									</#if>
								</p>
							</td>
							<p>
							<td><font size="3">${exception.content}</font>
								<p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;反馈日期：${exception.createDateString}

								</td>
						</tr>
						<!------------------ 如果是管家端录入，显示录入人--------------------- -->
						<#if exception.ifZlyj=="YES">
						<tr>
							<td width="100px" bgcolor="#EFEFEF">录入人员</td>
							<td>
								<div class="my-gallery" itemscope>
									<div class="col-md-12">${exception.createBy}</div>
								</div>
							</td>
						</tr>
						</#if>
						<!------------------ 如果有图片，显示图片行 begin--------------------- -->
						<#if exception.imgUrlList>
						<tr>
							<td width="100px" bgcolor="#EFEFEF">图片</td>
							<td>
								<div class="my-gallery" itemscope>
									<div class="col-md-12">
										<!-- XHS20160526 -->
										<#list exception.imgUrlList as imgUrl>
										<figure>
											<a href="${imgUrl.fileUrl}" itemprop="contentUrl"
												data-size="${imgUrl.imgWidth}x${imgUrl.imgHeight}"> <img
												ng-src="${imgUrl.fileUrl}" itemprop="thumbnail" alt="提报照片"
												width="${imgUrl.imgWidthThumbnail}"
												height="${imgUrl.imgHeightThumbnail}" target="_blank" />
											</a>
										</figure>
										</#list>
									</div>
								</div>
							</td>
						</tr>
						</#if>
						<!------------------ 如果有图片，显示图片行 end--------------------- -->

						<!------------------ 如果有音频，显示音频行 begin--------------------- -->
						<#if exception.amrUrlList>
						<tr>
							<td width="100px" bgcolor="#EFEFEF">音频</td>
							<td><#list exception.amrUrlList as amrUrl>
								<div class="col-md-10"
									onload="playAac('${amrUrl.id}','${amrUrl.fileUrl}'')">
									<button class="icon-audio" id="playerBtn"
										style="margin: 0 5px; cursor: pointer;"
										ng-click="playAac('${amrUrl.id}','${amrUrl.fileUrl}')">播放</button>
									<div id="myElement_${amrUrl.id}" bgcolor="black"></div>


								</div> </#list>
							</td>
						</tr>
						</#if>
						<!------------------ 如果有音频，显示音频行 end--------------------- -->

						<!------------------ 如果有处理结果，显示处理结果begin--------------------- -->
						<#if exception.result>
						<tr>
							<td width="100px" bgcolor="#EFEFEF">处理结果</td>

							<td>${exception.resultDisp}&nbsp;&nbsp;&nbsp;&nbsp;<#if
								exception.result=='OVER'>终止类型：${exception.partDisp}</#if></td>

						</tr>
						</#if>
						<!------------------ 如果有处理结果，显示处理结果 end--------------------- -->

						<!------------------ 如果有处理意见，显示意见，否则显示回复按钮 begin--------------------- -->

						<tr>
							<td width="100px" bgcolor="#EFEFEF">处理意见</td>
							<td><#if exception.idea> <font size="3">${exception.idea}</font>
								<p>
								<p>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									处理人：${exception.adminName1}
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;处理时间：${exception.finishDateString}
									<#else>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<#if updateExc==true> <a
										target="_blank"
										href="indentExc/manageException.do?id=${exception.id}"
										class="btn btn-success "><span
										class="glyphicon glyphicon-pencil">&nbsp;回复</span></a></#if>
									</#if></td>
						</tr>

						<!------------------ 如果有处理意见，显示意见 end--------------------- -->
						<!-- <tr>
							<td width="100px" bgcolor="#EFEFEF">回复内容</td>
							<td><#if userContact.answer> ${userContact.answer}
								<p>
								<p>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									回复人：${userContact.adminName1}
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回复时间：${userContact.modifyDateStr}
									<#else>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a target="_blank"
										href="userContact/manageUserContact.do?id=${userContact.id}"
										class="btn btn-success "><span
										class="glyphicon glyphicon-pencil">&nbsp;回复</span></a> </#if>
							</td>
						</tr> -->


						<!------------------ 如果有处理意见，显示意见 end--------------------- -->
					</table>


					</#list>
				</div>

				<!-- --------------------   八爪鱼begin -------------------------------------------------->
				<div class="tab-pane fade " id="sitong">
					<div>
						<div class="row">
							<div class="col-md-6">
								<span class="input-group-addon" onclick="sendMore()">获取更多信息</span>
							</div>
						</div>
						<div id="someCallYou" class="row" style="display: none;">
							<div class="col-md-6">
								<a id="someCallYoua" class="input-group-addon"
									onclick="hiddenMessage()">有人@你</a>
							</div>
						</div>
						<div class="content  chatBack" id="contentForm"></div>
						<p>
						<div>
							<table width="50%">
								<tr>
									<td width="4%"><img id="yes1"
										style="display: none; height: 30px; width: 30px"
										src="static/images/sign-check-icon.png" alt=""
										class="img-responsive"> <img id="no1"
										style="display: none; height: 30px; width: 30px"
										src="static/images/sign-error-icon.png" alt=""
										class="img-responsive" id="errorImage"
										onclick="connectWebsocket();"></td>

									<td width="60%">
										<div class="input-group">

											<!-- <input style="width: 500px;" type="text" class="form-control myTxt"  -->
											<!-- 										id="text" onkeydown="sendMessage();" oninput="changeImage()"  />  -->

											<input style="width: 500px;" type="text"
												class="form-control myTxt" id="text"
												onkeydown="sendMessage();" oninput="changeImage();" />

											<!-- 
											实现select下拉框的效果
											 -->
											<div id='sel' class='myDiv'
												style="left: 0px; top: 40px; width: 500px; height: 100px; visibility: hidden;">


											</div>
										</div>
									</td>
									<td width="4%"><img id="addImage"
										style="height: 30px; width: 30px"
										src="static/images/addImge.jpg" alt=""
										onclick="showSelectButton()" class="img-responsive"></td>
									<td width="2%"><span style="display: none"
										class="input-group-addon" id="send"></span></td>



								</tr>
							</table>
						</div>
						<div class="" style="float: left;">
							<input type="file" id="img" onchange="preView()"
								style="display: none">
						</div>
						<!-- --------------------   八爪鱼end -------------------------------------------------->
					</div>
					<div style="width: 400px; height: 400px; display: none">
						<table class="table">
							<caption>表情</caption>
							<tbody>
								<tr>
									<td><span onclick="putvalue('#x1F604')">&#x1F604</span></td>
									<td><span onclick="putvalue('#x1F60A')">&#x1F60A</span></td>
									<td><span onclick="putvalue('#x1F603')">&#x1F603</span></td>
								</tr>
								<tr>
									<td><span onclick="putvalue('#x1F612')">&#x1F612</span></td>
									<td><span onclick="putvalue('#x1F613')">&#x1F613</span></td>
									<td><span onclick="putvalue('#x1F614')">&#x1F614</span></td>
								</tr>
								<tr>
									<td><span onclick="putvalue('#x1F623')">&#x1F623</span></td>
									<td><span onclick="putvalue('#x1F631')">&#x1F631</span></td>
									<td><span onclick="putvalue('#x1F632')">&#x1F632</span></td>
								</tr>
								<tr>
									<td><span onclick="putvalue('#x1F623')">&#x1F60C</span></td>
									<td><span onclick="putvalue('#x1F631')">&#x1F60D</span></td>
									<td><span onclick="putvalue('#x1F632')">&#x1F630</span></td>
								</tr>
								<tr>
									<td><span onclick="putvalue('#x1F623')">&#x1F628</span></td>
									<td><span onclick="putvalue('#x1F631')">&#x1F61E</span></td>
									<td><span onclick="putvalue('#x1F632')">&#x1F622</span></td>
								</tr>
								<tr>
									<td><span onclick="putvalue('#x1F623')">&#x1F637</span></td>
									<td><span onclick="putvalue('#x1F631')">&#x1F44D</span></td>
									<td><span onclick="putvalue('#x1F632')">&#x1F44A</span></td>
								</tr>
								<tr>
									<td><span onclick="putvalue('#x1F623')">&#x1F60A</span></td>
									<td><span onclick="putvalue('#x1F631')">&#x1263A</span></td>
									<td><span onclick="putvalue('#x1F632')">&#x1F61A</span></td>
								</tr>

							</tbody>
						</table>

					</div>

				</div>
			</div>



		</form>

		<!-- photoswip 代码 -->
		<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="pswp__bg"></div>
			<div class="pswp__scroll-wrap">
				<div class="pswp__container">
					<div class="pswp__item"></div>
					<div class="pswp__item"></div>
					<div class="pswp__item"></div>
				</div>
				<div class="pswp__ui pswp__ui--hidden">
					<div class="pswp__top-bar">
						<div class="pswp__counter"></div>
						<button class="pswp__button pswp__button--close"
							title="Close (Esc)"></button>
						<button class="pswp__button pswp__button--zoom"
							title="Zoom in/out"></button>
						<div class="pswp__preloader">
							<div class="pswp__preloader__icn">
								<div class="pswp__preloader__cut">
									<div class="pswp__preloader__donut"></div>
								</div>
							</div>
						</div>
					</div>
					<div
						class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
						<div class="pswp__share-tooltip"></div>
					</div>
					<button class="pswp__button pswp__button--arrow--left"
						title="Previous (arrow left)"></button>
					<button class="pswp__button pswp__button--arrow--right"
						title="Next (arrow right)"></button>
					<div class="pswp__caption">
						<div class="pswp__caption__center"></div>
					</div>
				</div>
			</div>
		</div>
		<#include "/include/body-end.ftl" />
</body>
</html>