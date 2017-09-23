
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

		<#if Session.USER_BEAN.apartyId==''>	<li class="drop-menu-effect"><a href="home/homepage.do"><span>管家首页</span></a></li>
     </#if>
			<li class="drop-menu-effect">
			 
			  <a href=""><span >业务中心<img src="static/images/redpoint.png"  ng-show="warnNum==1"></span></a>
				<div class="submenu">
					<div class="mj_menu_pro_bg">
						<div class="mj_menu_pro_main">
							<div class="mj_menu_pro_li">
								<div class="mj_menu_li_txt">
								<#if Session.USER_BEAN.apartyId==''>
									<font>甲方管理</font><br/> <a href="aparty/apartyList.do">全部甲方</a><br />
									<a href="aparty/apartyAdd.do">新增甲方</a><br /><a href="aparty/apartyList.do?status=1"> 已启用甲方</a><br />
									<a href="aparty/apartyList.do?status=0">已禁用甲方</a><br />
								</#if>
									<p>
										<font>项目管理</font><br /> <a href="item/itemList.do">全部项目</a><br />
										<a href="item/itemAdd.do">新增项目</a><br /> 已停项目<br />
									</p>
								</div>
							</div>
							<div class="mj_menu_pro_li" style="padding-left: 48px;">
								<div class="mj_menu_li_txt">
									<font>订单管理</font><br /> <a href="indent/indentList.do">全部订单</a><br />
									<a href="indent/indentAdd.do">新增订单</a><br /> <a
										href="indent/indentList.do?noScrab=1">超时未抢订单</a><br /> <a
										href="indent/indentList.do?excepOver=1">异常订单（已处理）</a><br /> <a
										href="indent/indentList.do?status=EXCEPTION">异常订单（未处理）</a><br />
										<a href="indent/indentList.do?needFollow=1">需要跟进</a><span class="badge"  ng-bind="needFollowCount"></span><br />
										<!-- <a href="indent/indentList.do?workerContact=1">信息沟通</a><span class="badge"  ng-bind="workerContactCount"></span><br /> -->
								</div>
							</div>
							 <div class="mj_menu_pro_li" style="padding-left: 48px;">
                <div class="mj_menu_li_txt">
                  <font>超时响应订单</font><br />
                   <a href="indent/indentList.do?noScrab=1">未抢单</a><span class="badge"  ng-bind="noScrabIndentCount"></span><br />
                   <a href="indent/indentList.do?appoint=1">未预约</a><span class="badge"  ng-bind="appointmentIndentCount"></span><br />
                   <a href="indent/indentList.do?signOverTime=1">未签到</a><span class="badge"  ng-bind="signOverTimeIndentCount"></span><br />
                  <!--  <a href="indent/indentList.do?overTime=1">未邀约评价</a><span class="badge"  ng-bind="overTimeIndentCount"></span><br /> -->
                   <!-- <a href="indent/indentList.do?ifLeft=1">待离开</a><span class="badge"  ng-bind="leftIndentCount"></span><br /> -->
                   
                </div>
              </div>
              
               <div class="mj_menu_pro_li" style="padding-left: 48px;">
                <div class="mj_menu_li_txt">
                  <font>异常订单</font><br />
                   <a href="indent/indentList.do?status=EXCEPTION">异常单</a><span class="badge"  ng-bind="exceptionIndentCount"></span><br />
                   <a href="indent/indentList.do?exceptionType=GOODSLATE">延时到货</a><span class="badge"  ng-bind="goodsLateCount"></span><br />
                   <a href="indent/indentList.do?exceptionType=NOCONDITION">无安装条件</a><span class="badge"  ng-bind="conditionCount"></span><br />
                   <a href="indent/indentList.do?exceptionType=CHECKEXCEPITON">货检异常</a><span class="badge"  ng-bind="checkCount"></span><br />
                   <a href="indent/indentList.do?exceptionType=GOODSLOST">缺漏少配</a><span class="badge"  ng-bind="goodsLostCount"></span><br />
                                  
                </div>
              </div>
              
               <div class="mj_menu_pro_li" style="padding-left: 48px;">
                <div class="mj_menu_li_txt">
                  <font>异常订单</font><br />
                   <a href="indent/indentList.do?exceptionType=GOODSBAD">货物破损</a><span class="badge"  ng-bind="goodsBadCount"></span><br />
                   <a href="indent/indentList.do?exceptionType=ERROROPERATE">设计错误</a><span class="badge"  ng-bind="errordesignCount"></span><br />
                   <a href="indent/indentList.do?exceptionType=ERROROPERATE">操作失误</a><span class="badge"  ng-bind="errorOperateCount"></span><br />
                   <a href="indent/indentList.do?exceptionType=ERRORINFO">消息不匹配</a><span class="badge"  ng-bind="errorInfoCount"></span><br />
                                     
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
									<font>合伙人管理</font><br /> <a href="manager/managerList.do">全部合伙人</a><br />
									<#if Session.USER_BEAN.apartyId==''>
									未审核合伙人<br /> 已审核合伙人<br /> 已启用合伙人<br /> 已停用合伙人<br />
									合伙人提报工匠列表
                  </#if>
								</div>
							</div>
							<div class="mj_menu_pro_li" style="padding-left: 48px;">
								<div class="mj_menu_li_txt">
									<p>
										<font>工匠管理</font><br /> <a href="worker/workerList.do">全部工匠</a><br /> <!-- virtualWorker/virtualWorkerAdd.do -->
										<#if Session.USER_BEAN.apartyId==''>
										未审核工匠<br /> 已审核工匠<br /> 已启用工匠<br /> 已停用工匠<br /> 推荐工匠列表<br /><a href="virtualWorker/virtualWorkerList.do"> 全部虚拟工匠</a><br /><a href="virtualWorker/virtualWorkerAdd.do"> 新增虚拟工匠</a>
										</#if>
									</p>
								</div>
							</div>
							<#if Session.USER_BEAN.apartyId==''>
							<div class="mj_menu_pro_li" style="padding-left: 48px;">
								<div class="mj_menu_li_txt">
									<p>
										<font>众联小秘账号</font><br /> 全部众联小秘账号<br /> 新增众联小秘账号<br /> <font>众联助手账号</font><br />
										全部众联助手账号<br /> 新增众联助手账号<br /> <font>众联现控账号</font><br />
										全部众联现控账号<br /> 新增众联现控账号
									</p>
								</div>
							</div>
							</#if>
							<div style="clear: both; height: 0px; overflow: hidden;"></div>
						</div>
					</div>
				</div></li>

   <#if Session.USER_BEAN.apartyId==''>
			<li class="drop-menu-effect"><a href=""><span>财务中心</span></a>
				<div class="submenu">
					<div class="mj_menu_pro_bg">
						<div class="mj_menu_pro_main">
							<div class="mj_menu_pro_li">
								<div class="mj_menu_li_txt">
									<font>财务信息</font><br /> 财务汇总<br /> 甲方财务信息<br /> <font>核算信息</font><br />
									合伙人核算列表<br /> 合伙人核算操作<br /> 工匠核算列表<br /> 工匠核算操作
								</div>
							</div>
							<div class="mj_menu_pro_li" style="padding-left: 48px;">
								<div class="mj_menu_li_txt">
									<p>
										<font>保证金</font><br /> 保证金汇总<br /> 保证金列表<br />
									<p>
										<font>提现</font><br /> 提现汇总<br /> 提现列表<br /> 提现审核<br />
								</div>
							</div>



							<div style="clear: both; height: 0px; overflow: hidden;"></div>
						</div>
					</div>
				</div></li>
</#if>

			<li class="drop-menu-effect"><a href=""><span>报表中心</span></a>
				<div class="submenu">
					<div class="mj_menu_pro_bg">
						<div class="mj_menu_pro_main">
							<div class="mj_menu_pro_li">
								<div class="mj_menu_li_txt">
									<font>日报</font>
						 <#if Session.USER_BEAN.apartyId==''><br /> 工匠注册日报<br />
									合伙人注册日报&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</#if>
									<br /><a href="reportIndent/dayIndent.do">订单日报</a>
						  <#if Session.USER_BEAN.apartyId==''>	<p>
										<font>周报</font><br /> 工匠注册周报<br /> 合伙人注册周报<br /> 订单周报
									</p>
								</div>
							</div>
				
							<div class="mj_menu_pro_li">
								<div class="mj_menu_li_txt">
									<font>月报</font><br /> 工匠注册<br /> 合伙人注册<br /> 订单月报<br />
									甲方月度对账单<br /> 合伙人月度对账单&nbsp;&nbsp;<br /> 工匠月度对账单
								</div>
							</div>
							<div class="mj_menu_pro_li">
								<div class="mj_menu_li_txt">
									<p>
										<font>季报</font><br /> 工匠注册季报<br /> 合伙人注册季报<br /> 订单季报<br />
										甲方季度对账单<br /> 合伙人季度对账单&nbsp;&nbsp;&nbsp;&nbsp;<br /> 工匠季度对账单
									
								</div>
							</div>
</#if>

							<div style="clear: both; height: 0px; overflow: hidden;"></div>
						</div>
					</div>
				</div></li>

<#if Session.USER_BEAN.apartyId==''>
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
</#if>

			<li class="drop-menu-effect"><a href=""><span>系统设置</span></a>
				<div class="submenu">
					<div class="mj_menu_pro_bg">
						<div class="mj_menu_pro_main">
						  <#if Session.USER_BEAN.apartyId==''>
							<div class="mj_menu_pro_li">
								<div class="mj_menu_li_txt">
									<font>系统参数设置</font>&nbsp;&nbsp;&nbsp;&nbsp;<br />
									 <a
										href="prov/provList.do">城市设置</a><br /> <a
										href="scnode/scnodeTree.do">服务节点</a><br /> <a
										href="sctype/sctypeTree.do">服务类别</a>
									<p>
										<font>定时计划设置</font><br /> <a href="schedule/scheduleList.do">定时计划列表</a><br />
										<a href="#">新增定时计划</a><br />
									</p>
								</div>
							</div>
            </#if>
							<div class="mj_menu_pro_li">
								<div class="mj_menu_li_txt">

									<p>
										<font>价格体系管理</font><br /> <a href="price/priceList.do">全部价格体系</a>&nbsp;&nbsp;<br />
										<a href="price/priceAdd.do">新增价格体系</a><br />
									</p>
								</div>
							</div>
<#if Session.USER_BEAN.apartyId==''>
							<div class="mj_menu_pro_li">
								<div class="mj_menu_li_txt">
									<font>账号管理</font><br /> <a href="admin/adminList.do">账号列表</a>&nbsp;&nbsp;&nbsp;&nbsp;<br />
									<a href="admin/adminAdd.do">新增账号</a><br /> <font>角色管理</font><br />
									<a href="role/roleList.do">角色列表</a><br /> <a
										href="role/roleAdd.do">新增角色</a>


								</div>
							</div>
</#if>
							<div class="mj_menu_pro_li">
								<div class="mj_menu_li_txt">
                  <font>账号操作</font><br /> 
                  <a href="admin/adminChangePwd.do">修改密码</a>&nbsp;&nbsp;<br />
									<a href="logout.do">退出登录</a><br />
									
								</div>


							</div>
             
							<div style="clear: both; height: 0px; overflow: hidden;"></div>
						</div>
					</div>
				</div></li>
       <div>
       <a class="btn btn-warning"
          href="indent/indentList.do?status=EXCEPTION">异常订单<span class="badge"
          ng-bind="exceptionIndentCount"></span></a> &nbsp;&nbsp;
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