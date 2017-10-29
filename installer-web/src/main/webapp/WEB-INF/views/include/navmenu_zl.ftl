
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	list-style: none;
}

img {
	border: 0;
}

body {
	font-size: 12px;
	color: #555555;
}

.navboxZlyj {
	height: 40px;
	position: relative;
	z-index: 9;
	margin: auto;
	background: #554b4a;
	filter: alpha(opacity = 90);
	-moz-opacity: 0.90;
	opacity: 0.90;
	font-family: '微软雅黑';
	text-align: left;
}

.navZlyj {
	margin: 0 auto;
	height: 40px;
	list-style: none;
}

.navZlyj li {
	float: left;
	height: 40px;
	position: relative;
	list-style: none;
}

.navZlyj li.last {
	background: none;
}

.navZlyj li a {
	text-decoration: none;
}

.navZlyj li a span {
	float: left;
	display: block;
	line-height: 40px;
	font-size: 14px;
	color: #ffffff;
	cursor: pointer;
	width: 110px;
	text-align: center;
}

.mj_hover_menu {
	text-decoration: none;
	width: 110px;
	background: url(static/images/menu_hover.jpg);
	height: 40px;
	text-align: left;
}

.navZlyj li.selected .submenu {
	display: block;
}

.navZlyj li .submenu {
	display: none;
	position: absolute;
	top: 40px;
	left: -9pxpx; /*  -9px; */
}

.navZlyj li .submenu li {
	float: none;
	padding: 0;
	background: none;
	height: auto;
	border-bottom: dotted 0px #BEBEBE;
}

.mj_menu_pro_bg {
	width: 800px;   /* 625 */
	height: 335px;
	background: url(static/images/menu_pro_bg.png) no-repeat; 
}

.mj_menu_pro_main {
	width: 765px;   /* 665 */
	margin: auto;
	padding-top: 14px;
}

.mj_menu_pro_li {
	float: left;
}

.mj_menu_li_txt {
	line-height: 22px;
	font-size: 14px;
	color: #696969;
}

.mj_menu_li_txt font {
	font-size: 14px;
	color: #bb1721;
}

.mj_menu_li_txt a {
	color: #696969;
	text-decoration: none;
}

.mj_menu_li_txt a:hover {
	color: #696969;
	text-decoration: underline;
}

.mj_menu_news_bg {
	width: 480px;
	height: 185px;
	background: url(images/menu_news_bg.png) no-repeat;
}

.mj_menu_news_main {
	width: 480px;    /* 440px; */
	margin: auto;
	padding-top: 14px;
}

.mj_menu_news_li {
	padding: 0px 30px;
	margin-right: 30px;
	height: 150px;
	float: left;
	border-right: solid 1px #cccccc;
}

.mj_menu_news_img {
	float: left;
	text-align: left;
	color: #bb1721;
	line-height: 30px;
	font-size: 14px;
}

.mj_menu_news_li2 {
	padding: 0px 30px;
	height: 150px;
	float: right;
	border-left: solid 1px #cccccc;
}

.mj_menu_news_img2 {
	float: left;
	margin-left: 30px;
	text-align: left;
	color: #bb1721;
	line-height: 30px;
	font-size: 14px;
}

.mj_menu_news_li3 {
	padding: 0px 25px;
	height: 150px;
	float: right;
	border-left: solid 1px #cccccc;
}

.mj_menu_news_img3 {
	float: left;
	margin-left: 10px;
	text-align: left;
	color: #bb1721;
	line-height: 30px;
	font-size: 14px;
}
</style>
</head>
<body>
	<table width="100%" border="0" >
		<tr >
			<td width="80%" bgcolor="#FFFFFF" height="120" >
			 <img src="static/images/logo.jpg">
			 
			 </td>
			<td bgcolor="#FFFFFF"><font size=2>Hi，欢迎&nbsp;${Session.USER_BEAN.name1}</font></td>
		</tr>
	</table>
	

	<div class="navboxZlyj" align="left">
		<div class="navZlyj">
			<li class="drop-menu-effect">
  <a href=""><span >业务中心
  <img src="static/images/redpoint.png"  ng-show="warnNum==1"></span></a>
				<div class="submenu">
					<div class="mj_menu_pro_bg">
						<div class="mj_menu_pro_main">
							<div class="mj_menu_pro_li">
								<div class="mj_menu_li_txt">			
									<p>
										<font>图片管理</font><br />
										 <a href="image/addImage.do">添加图片
										 </a><br />
										<a href="item/itemAdd.do">新增项目</a><br /> 已停项目<br />
									</p>
								</div>
							</div>
							<div style="clear: both; height: 0px; overflow: hidden;"></div>
						</div>
					</div>
				</div></li>

			<li class="drop-menu-effect"><a href=""><span>CRM中心</span></a>
				<div class="submenu">
					<div class="mj_menu_pro_bg">
						<div class="mj_menu_pro_main">
							<div class="mj_menu_pro_li">
								<div class="mj_menu_li_txt">
									<font>合伙人管理</font><br /> 
									<a href="manager/managerList.do">全部合伙人</a><br />
									<#if Session.USER_BEAN.apartyId==''>
									未审核合伙人<br /> 已审核合伙人<br /> 已启用合伙人<br /> 已停用合伙人<br />
									合伙人提报工匠列表
                  </#if>
								</div>
							</div>
							<div style="clear: both; height: 0px; overflow: hidden;"></div>
						</div>
					</div>
				</div></li>
			<li class="drop-menu-effect"><a href=""><span>报表中心</span></a>
				<div class="submenu">
					<div class="mj_menu_pro_bg">
						<div class="mj_menu_pro_main">
							<div class="mj_menu_pro_li">
								<div class="mj_menu_li_txt">
									<font>日报</font>
						<br /> 工匠注册日报<br />
									合伙人注册日报&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
									<br /><a href="reportIndent/dayIndent.do">订单日报</a>
 工匠注册周报<br /> 合伙人注册周报<br /> 订单周报
									</p>
								</div>
							</div>

							<div style="clear: both; height: 0px; overflow: hidden;"></div>
						</div>
					</div>
				</div></li>

			<li class="drop-menu-effect"><a href=""><span>审计中心</span></a>
				<div class="submenu">
					<div class="mj_menu_pro_bg">
						<div class="mj_menu_pro_main">
							<div class="mj_menu_pro_li">
								<div class="mj_menu_li_txt">								
									 <a href="scheduleLog/scheduleLogShow.do">定时计划日志</a><br />																	
                   <a href="adminLog/adminLogShow.do">内勤操作日志</a><br />
								</div>
							</div>



							<div style="clear: both; height: 0px; overflow: hidden;"></div>
						</div>
					</div>
				</div></li>


			<li class="drop-menu-effect"><a href=""><span>消息中心</span></a>
				<div class="submenu">
					<div class="mj_menu_pro_bg">
						<div class="mj_menu_pro_main">
							<div class="mj_menu_pro_li">
								<div class="mj_menu_li_txt">
									系统消息<br /> 众联消息<br /> 即时通讯消息<br />
								</div>
							</div>

							<div style="clear: both; height: 0px; overflow: hidden;"></div>
						</div>
					</div>
				</div></li>
       <div>
       </div>
		</div>
		    
	</div>

      
	<script>
		$(function() {
			lanrenzhijia(".drop-menu-effect");
		});
		function lanrenzhijia(_this) {
			$(_this).each(function() {
				var $this = $(this);
				var theMenu = $this.find(".submenu");
				var tarHeight = theMenu.height();
				theMenu.css({
					height : 0
				});
				$this.hover(function() {
					$(this).addClass("mj_hover_menu");
					theMenu.stop().show().animate({
						height : tarHeight
					}, 400);
				}, function() {
					$(this).removeClass("mj_hover_menu");
					theMenu.stop().animate({
						height : 0
					}, 400, function() {
						$(this).css({
							display : "none"
						});
					});
				});
			});
		}
	</script>