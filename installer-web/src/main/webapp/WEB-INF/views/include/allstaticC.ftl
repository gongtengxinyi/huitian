<script src="static/js/jquery-1.11.1.min.js"></script>
<script src="static/js/bootstrap-select.js"></script>
<script src="static/js/bootstrap-select.min.js"></script>
<script src="static/js/jquery.editable-select.js"></script>

<script type="text/javascript">
	var identify = $("#identify").val();
	var userid = $("#userid").val();
	var mobile = $("#mobile").val();
	var websocket = null;

	connectWebsocket();

	//连接关闭的回调方法
	websocket.onclose = function() {
		setMessageInnerHTML("WebSocket closed");
	}

	//关闭WebSocket连接
	function closeWebSocket() {
		websocket.close();
	}
	function connectWebsocket() {
		if ('WebSocket' in window) {
		<#include "/include/websocket.ftl" /> 
		strConn = strConn + "userid=" + userid;
		strConn = strConn + "&usertype=" + identify;
		strCon = strConn + "&TERMINALTYPE=WEB";
		websocket = new WebSocket(strConn);		

		} else {
			alert('browser Not support websocket')
		}

		//连接发生错误的回调方法
		websocket.onerror = function() {
                 
			setMessageInnerHTML("WebSocket error");
		};

		//连接成功建立的回调方法
		websocket.onopen = function() {
		

			$("#yes").show();
			$("#contentForm").scrollTop(100000000);
			$("#no").hide();
		}

		//接收到消息的回调方法
		websocket.onmessage = function(event) {
		

			var jsonObj = JSON.parse(event.data);
			if(jsonObj.messageMode=='DELETE_MESSAGE'){
				return ;
								}
			if(jsonObj.messageMode=='MESSAGE_REMIND_INDENT_V2'){
			var jsonObj2 = JSON.parse(jsonObj.message);	
	
			$("#messageNotice").show();
   	            $.each( jsonObj2,function(indentId,value) {                   
		       	var $parent = $("#contentBa");
		       	if($("#" + indentId + "_div a").length>0){
		       		$("#" + indentId + "_div a").remove();
					$("#" + indentId + "_div").remove();	
		       	}			
				var $li = $("<div id='"+indentId+"_div' align='center' style='margin-left: 14px;margin-top: 14px;font-size: 14px;'><input type='hidden'  id='"+indentId+"'  value='"+indentId+"' ></input><a href='indent/indentView.do?indentId="
						+ indentId
						+ "&&pageNo=1'>"
						+ value
						+ "</a></div>");
				var $parent = $("#contentBa");
				$parent.append($li);   
		           });  
		}
			return ;
		}
		//连接关闭的回调方法
		websocket.onclose = function() {
			$("#no").show();
			$("#yes").hide();
		}

		//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
		window.onunload = function() {
			closeWebSocket();
		}
		//关闭WebSocket连接
		function closeWebSocket() {
			websocket.close();
		}

	}
	//将消息显示在网页上
	function setMessageInnerHTML(innerHTML) {
	}
	//发送消息
	function send() {
		var message = document.getElementById('text').value;
		var chatMesage = createChatMessage();

		websocket.send(chatMesage);
	}
	function createChatMessage() {
		var jsonObj = {};
		jsonObj.indentId = "8a9820695833de0d01583dfcd7e4289d";
		jsonObj.messageMode = "INDENT_MESSAGE";
		jsonObj.message = document.getElementById('text').value;
		return JSON.stringify(jsonObj);
	}
</script>