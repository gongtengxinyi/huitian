
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
        width: 800px; /* 625 */
        height: 335px;
        background: url(static/images/menu_pro_bg.png) no-repeat;
    }

    .mj_menu_pro_main {
        width: 765px; /* 665 */
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
        width: 480px; /* 440px; */
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
<table width="100%" border="0">
    <input type="hidden" id="indentRole"
           value='${Session.USER_BEAN.indentRole}'>
    <input type="hidden" id="adminRole"
           value='${Session.USER_BEAN.adminRole}'>
    <tr>
        <td width="80%" bgcolor="#FFFFFF" height="120"><#if
		Session.USER_BEAN.adminRole=='zhizhuang'> <img
                    src="static/images/logoZhizhuang.jpg"> <#else> <img
                src="static/images/logo.jpg"> </#if>
        </td>
        <td bgcolor="#FFFFFF"><font size=2>Hi，欢迎&nbsp;${Session.USER_BEAN.name1}</font></td>
    </tr>
    <tr>
        <td width="80%" colspan="2" align="right">
            <!-- 入驻商家提醒 begin --> <#if Session.USER_BEAN.adminRole=='ruzhu'> <!--  入驻商家才能显示     -->
            <a class="btn btn-warning"
               href="indent/indentList.do?isAPI=RETURNMI">退回订单<span
                    class="badge" ng-bind="returnMerchantIndentCount"></span></a> <a
                    class="btn btn-warning" href="indent/indentList.do?isAPI=second" title="已被终止，需要二次上门">待二次上门<span
                    class="badge" ng-bind="secondIndentCount"></span></a> <a
                    class="btn btn-warning"
                    href="indent/indentList.do?transferProgress=INSERT" title="接单环节，需要流转到核算环节">待流转<span
                    class="badge" ng-bind="insertIndentCount"></span></a> <a
                    class="btn btn-warning"
                    href="indent/indentList.do?transferProgress=VERIFY" title="接单员已经录入完毕，等待核算">待核算<span
                    class="badge" ng-bind="verifyIndentCount"></span></a> <a
                    class="btn btn-warning"
                    href="indent/indentList.do?isAPI=WAIT&&paidanType=CONFIRM" title="派单环节已确认了计划上门日期">已确认上门日期<span
                    class="badge" ng-bind="confirmIndentCount"></span></a><a
                    class="btn btn-warning" href="indent/indentList.do?isAPI=NOARRIVE" title="派单环节，尚未到货">未到货<span
                    class="badge" ng-bind="noArriveIndentCount"></span></a> <!-- <a
				class="btn btn-warning"
				href="indent/indentList.do?isAPI=WAIT&paidanType=NOAPPOINT">已到货<span
					class="badge" ng-bind="assignIndentCount"></span></a> --> <a
                    class="btn btn-warning"
                    href="indent/indentList.do?isAPI=WAIT&paidanType=WAIT" title="派单环节，等商家通知">等通知<span
                    class="badge" ng-bind="waitIndentCount"></span></a> <a
                    class="btn btn-danger" href="indent/indentList.do?isAPI=noScrab" title="自计划上门日期前一天尚未抢单">未抢单<span
                    class="badge" ng-bind="noScrabIndentCount"></span></a> <a
                    class="btn btn-danger"
                    href="indent/indentList.do?isAPI=overTimeScrab" title="计划上门日期当天尚未抢单">当日未抢单<span
                    class="badge" ng-bind="overTimeScrabIndentCount"></span></a> </#if> <!-- 入驻商家提醒 end -->
		<#if Session.USER_BEAN.adminRole=='zhizhuang'> <a
                class="btn btn-warning" href="indent/indentList.do?isAPI=second" title="已被终止，需要二次上门">待二次上门<span
                class="badge" ng-bind="secondIndentCount"></span></a> <a
                class="btn btn-warning" href="indent/indentList.do?isAPI=CANCEL" title="工匠取消订单">工匠已取消<span
                class="badge" ng-bind="cancelIndentCount"></span></a> <a
                class="btn btn-danger" href="indent/indentList.do?isAPI=noScrab" title="自计划上门日期前一天尚未抢单">未抢单<span
                class="badge" ng-bind="noScrabIndentCount"></span></a> <a
                class="btn btn-danger"
                href="indent/indentList.do?isAPI=overTimeScrab" title="计划上门日期当天尚未抢单">当日未抢单<span
                class="badge" ng-bind="overTimeScrabIndentCount"></span></a> </#if>
		<#if Session.USER_BEAN.adminRole=='normal'> <!--  管家用户才能显示     -->
			<#if Session.USER_BEAN.indentRole?contains('indentInsert')> <a
                    class="btn btn-warning" href="indent/indentList.do?isAPI=second" title="已被终止，需要二次上门">待二次上门<span
                    class="badge" ng-bind="secondIndentCount"></span></a> <a
                    class="btn btn-warning"
                    href="indent/indentList.do?transferProgress=INSERT" title="接单环节，需要流转到核算环节">待流转<span
                    class="badge" ng-bind="insertIndentCount"></span></a> </#if> <#if
		Session.USER_BEAN.indentRole?contains('indentVerify')><a
                    class="btn btn-warning"
                    href="aparty/apartyList.do?isAPI=chongzhiCount" title="充值余额不足的商家">待充值<span
                    class="badge" ng-bind="apartyCount"></span></a> <a
                    class="btn btn-warning"
                    href="indent/indentList.do?transferProgress=VERIFY" title="接单员已经录入完毕，等待核算">待核算<span
                    class="badge" ng-bind="verifyIndentCount"></span></a> <a
                    class="btn btn-warning"
                    href="indent/indentList.do?isAPI=NOTINCOMEBILL" title="">未提报应收账单<span
                    class="badge" ng-bind="notIncomeBillIndentCount"></span></a> <a
                    class="btn btn-warning"
                    href="indent/indentList.do?isAPI=NOTPAYWORKERBILL" title="已申请核算尚未确认应付账单">未提报应付账单<span
                    class="badge" ng-bind="notPayWorkerBillIndentCount"></span></a> <!-- <a
				class="btn btn-warning"
				href="indent/indentList.do?isAPI=NOTPAYMANAGERBILL">未提报经理人应付账单<span
					class="badge" ng-bind="notPayManagerBillIndentCount"></span></a> -->
            <a class="btn btn-warning"
               href="indent/indentList.do?isAPI=INCOMEBILL" title="标记了提报应收账单">已提报应收账单<span
                    class="badge" ng-bind="incomeBillIndentCount"></span></a> <a
                    class="btn btn-warning"
                    href="indent/indentList.do?isAPI=PAYWORKERBILL" title="标记了提报应付账单">已提报应付账单<span
                    class="badge" ng-bind="payWorkerBillIndentCount"></span></a> <!--  <a
				class="btn btn-warning"
				href="indent/indentList.do?isAPI=PAYMANAGERBILL">已提报经理人应付账单<span
					class="badge" ng-bind="payManagerBillIndentCount"></span></a> -->
		</#if> <#if Session.USER_BEAN.indentRole?contains('indentAssign')><a
                class="btn btn-warning"
                href="indent/indentList.do?isAPI=WAIT&&paidanType=CONFIRM" title="派单环节已确认了计划上门日期">已确认上门日期<span
                class="badge" ng-bind="confirmIndentCount"></span></a> <a
                class="btn btn-warning" href="indent/indentList.do?isAPI=NOARRIVE" title="派单环节，尚未到货">未到货<span
                class="badge" ng-bind="noArriveIndentCount"></span></a> <!--  <a
				class="btn btn-warning"
				href="indent/indentList.do?isAPI=WAIT&paidanType=NOAPPOINT">已到货<span
					class="badge" ng-bind="assignIndentCount"></span></a> --> <a
                class="btn btn-warning"
                href="indent/indentList.do?isAPI=WAIT&paidanType=WAIT" title="派单环节，等商家通知">等通知<span
                class="badge" ng-bind="waitIndentCount"></span></a> <a
                class="btn btn-warning"
                href="indent/indentList.do?isAPI=hasCondition" title="品控标记了已经具备条件的台面单">具备条件台面单<span
                class="badge" ng-bind="hasConditionIndentCount"></span><a
                class="btn btn-danger" href="indent/indentList.do?isAPI=noScrab" title="自计划上门日期前一天尚未抢单">未抢单<span
                class="badge" ng-bind="noScrabIndentCount"></span></a> <a
                class="btn btn-danger"
                href="indent/indentList.do?isAPI=overTimeScrab" title="计划上门日期当天尚未抢单">当日未抢单<span
                class="badge" ng-bind="overTimeScrabIndentCount"></span></a> <a
                class="btn btn-warning" href="indent/indentList.do?isAPI=CANCEL" title="工匠取消订单">工匠已取消<span
                class="badge" ng-bind="cancelIndentCount"></span></a>
        </a> </#if> </#if> <#if
		Session.USER_BEAN.indentRole?contains('indentQA')>
			<#if Session.USER_BEAN.adminRole!='ruzhu'><a
                    class="btn btn-danger" href="indent/indentList.do?isAPI=COST">费用提报<span
                    class="badge" ng-bind="costIndentCount"></span></a>
			</#if><a
                    class="btn btn-danger" href="indent/indentList.do?isAPI=CONTINUE">继续上门订单<span
                    class="badge" ng-bind="continueIndentCount"></span></a><a
                    class="btn btn-danger" href="indent/indentList.do?status=EXCEPTION&page=1" title="工人提报了反馈信息">异常订单<span
                    class="badge" ng-bind="exceptionIndentCount"></span></a> <a
                    class="btn btn-danger" href="indent/indentList.do?isAPI=NOTAPPOINT" title="已抢单，计划上门日期前一天尚未联系业主">未约单<span
                    class="badge" ng-bind="notAppointCount"></span></a> <a
                    class="btn btn-warning"
                    href="indent/indentList.do?isAPI=signOverTime" title="已抢单，约定上门时间1小时之内未签到">超时未签到 <span
                    class="badge" ng-bind="signOverTimeIndentCount"></span>
            </a> <!--  <a class="btn btn-warning" href="indent/indentList.do?progStatus=INSTALL">待货检
         <span class="badge"  ng-bind="installIndentCount"></span></a><br /> -->
            <a class="btn btn-warning" href="indent/indentList.do?isAPI=install">待场检货检
                <span class="badge" ng-bind="installIndentCount"></span>
            </a> <a class="btn btn-warning" href="indent/indentList.do?isAPI=report">待总结
                <span class="badge" ng-bind="reportIndentCount"></span>
            </a> <a class="btn btn-warning"
                    href="indent/indentList.do?progStatus=REPORT">待自检 <span
                    class="badge" ng-bind="checkIndentCount"></span></a> <a
                    class="btn btn-warning"
                    href="indent/indentList.do?progStatus=SELFCHECK">待核销 <span
                    class="badge" ng-bind="hexiaoIndentCount"></span></a> <#if
			Session.USER_BEAN.adminRole=='normal'><a class="btn btn-warning"
                                                     href="indent/indentList.do?isAPI=QAJIESUAN&qaJiesuantype=" title="订单执行完毕，品控可以申请结算">申请结算
                    <span class="badge" ng-bind="qaJiesuanApplyIndentCount"></span>
                </a></#if> </#if> <#if
		Session.USER_BEAN.indentRole?contains('indentCaiwu')> <a
                    class="btn btn-warning" href="indent/indentList.do?isAPI=NOTINCOME" title="账务标记了提报应收账单到财务">待收款<span
                    class="badge" ng-bind="notIncomeIndentCount"></span></a> <a
                    class="btn btn-warning" href="indent/indentList.do?isAPI=NOTPAY" title="账务标记了提报应付账单到财务">待付款<span
                    class="badge" ng-bind="notPayIndentCount"></span></a> <a
                    class="btn btn-warning" href="indent/indentList.do?isAPI=INCOMEMARK" title="财务标记了已收款">已标记收款<span
                    class="badge" ng-bind="incomeMarkIndentCount"></span></a> <a
                    class="btn btn-warning" href="indent/indentList.do?isAPI=PAYMARK" title="财务标记了已付款">已标记付款<span
                    class="badge" ng-bind="payMarkIndentCount"></span></a> </#if>
        </td>
        <td></td>
    </tr>
</table>


<div class="navboxZlyj" align="left">
    <div class="navZlyj">

	<#if Session.USER_BEAN.apartyId==''>
        <li class="drop-menu-effect"><a href="home/homepage.do"><span>管家首页</span></a></li>
	</#if>
        <li class="drop-menu-effect"><a href=""><span>业务中心<img
                src="static/images/redpoint.png" ng-show="warnNum==1"></span></a>
            <div class="submenu">
                <div class="mj_menu_pro_bg">
                    <div class="mj_menu_pro_main">
                        <div class="mj_menu_pro_li">
                            <div class="mj_menu_li_txt">
							<#if Session.USER_BEAN.apartyId==''> <font>商家管理</font><br /> <a
                                    href="aparty/apartyList.do">全部商家</a><br /> <a
                                    href="aparty/apartyAdd.do">新增商家</a><br /> <a
                                    href="aparty/apartyList.do?status=1"> 已启用商家</a><br /> <a
                                    href="aparty/apartyList.do?status=0">已禁用商家</a><br /> </#if>
                                <!-- <p>
                                    <font>项目管理</font><br /> <a href="item/itemList.do">全部项目</a><br />
                                    <a href="item/itemAdd.do">新增项目</a>
                                    <br /> 已停项目<br />
                                </p> -->
                            </div>
                        </div>
                        <div class="mj_menu_pro_li" style="padding-left: 48px;">
                            <div class="mj_menu_li_txt">
                                <font>订单管理</font><br /> <a href="indent/indentList.do">全部订单</a><br />
                                <a href="indent/indentAddNoitem.do">新增订单</a><br /> <#if
							Session.USER_BEAN.isAdmin==true ||
							Session.USER_BEAN.adminRole=='ruzhu' ||
							Session.USER_BEAN.adminRole=='zhizhuang'> <a
                                        href="indent/indentListDel.do">已删除订单</a><br /></#if>
                                <!-- <a
                                    href="indent/indentList.do?noScrab=1">超时未抢订单</a><br /> -->
                                <!-- <a
                                    href="indent/indentList.do?excepOver=1">异常订单（已处理）</a><br /> -->
                                <a href="indent/indentList.do?isAPI=excepOver">异常订单（已处理）</a><br />
                                <a href="indent/indentList.do?status=EXCEPTION">异常订单（未处理）</a><br />
							<#if Session.USER_BEAN.adminRole!='ruzhu'>
                                <!-- 入驻商家不需要跟进，需要上楼提醒 -->
                                <a href="indent/indentList.do?isAPI=needFollow">需要跟进</a><span
                                    class="badge" ng-bind="needFollowCount"></span><br />
                                <!-- <a
                                    href="indent/indentList.do?ifGoFloor=1">需要上楼</a><span
                                    class="badge" ng-bind="ifGoFloor"></span><br /> -->
							</#if>
                                <!-- 入驻商家不需要跟进，需要上楼提醒  end -->
                                <!-- <a href="indent/indentList.do?ifSpeak=1">业主留言</a><span
                                    class="badge" ng-bind="ifSpeak"></span><br /> -->
                                <!-- <a href="indent/indentList.do?workerContact=1">信息沟通</a><span class="badge"  ng-bind="workerContactCount"></span><br /> -->
                            </div>
                        </div>
					<#if Session.USER_BEAN.indentRole?contains('indentQA')>
                        <!-- <div class="mj_menu_pro_li" style="padding-left: 48px;">
                            <div class="mj_menu_li_txt">
                                <font>超时响应订单</font><br /> <a
                                    href="indent/indentList.do?isAPI=appoint">未预约</a><span
                                    class="badge" ng-bind="appointmentIndentCount"></span><br />

                                 <a href="indent/indentList.do?overTime=1">未邀约评价</a><span class="badge"  ng-bind="overTimeIndentCount"></span><br />


                            </div>
                        </div> -->
						<#if Session.USER_BEAN.apartyId==''>
                            <div class="mj_menu_pro_li" style="padding-left: 48px;">
                                <div class="mj_menu_li_txt">
                                    <font>异常订单</font><br />
                                    <!--    <a href="indent/indentList.do?status=EXCEPTION">异常单</a><span class="badge"  ng-bind="exceptionIndentCount"></span><br /> -->
                                    <a href="indent/indentList.do?exceptionType=GOODSLATE">延时到货</a><span
                                        class="badge" ng-bind="goodsLateCount"></span><br /> <a
                                        href="indent/indentList.do?exceptionType=NOCONDITION">无安装条件</a><span
                                        class="badge" ng-bind="conditionCount"></span><br /> <a
                                        href="indent/indentList.do?exceptionType=CHECKEXCEPITON">货检异常</a><span
                                        class="badge" ng-bind="checkCount"></span><br /> <a
                                        href="indent/indentList.do?exceptionType=GOODSLOST">缺漏少配</a><span
                                        class="badge" ng-bind="goodsLostCount"></span><br />

                                </div>
                            </div>

                            <div class="mj_menu_pro_li" style="padding-left: 48px;">
                                <div class="mj_menu_li_txt">
                                    <font></font><br /> <a
                                        href="indent/indentList.do?exceptionType=GOODSBAD">货物破损</a><span
                                        class="badge" ng-bind="goodsBadCount"></span><br /> <a
                                        href="indent/indentList.do?exceptionType=ERROROPERATE">设计错误</a><span
                                        class="badge" ng-bind="errordesignCount"></span><br /> <a
                                        href="indent/indentList.do?exceptionType=ERROROPERATE">操作失误</a><span
                                        class="badge" ng-bind="errorOperateCount"></span><br /> <a
                                        href="indent/indentList.do?exceptionType=ERRORINFO">消息不匹配</a><span
                                        class="badge" ng-bind="errorInfoCount"></span><br />

                                </div>
                            </div>
                            <div style="clear: both; height: 0px; overflow: hidden;"></div></#if>
					</#if>
                    </div>
                </div>
            </div></li>
	<#if Session.USER_BEAN.adminRole!='ruzhu'>
        <!-- 入驻商家不显示CRM中心 -->
        <li class="drop-menu-effect"><a href=""><span>CRM中心</span></a>
            <div class="submenu">
                <div class="mj_menu_pro_bg">
                    <div class="mj_menu_pro_main">
                        <div class="mj_menu_pro_li">
                            <div class="mj_menu_li_txt">
                                <font>经理人管理</font><br /> <a href="manager/managerList.do">全部经理人</a><br />
								<#if Session.USER_BEAN.apartyId==''> 未审核经理人<br /> 已审核经理人<br />
                                    已启用经理人<br /> 已停用经理人<br /> 经理人提报工匠列表 <br/></#if>
                                <a href="wkMgrPrice/wkMgrpriceList.do">工匠经理人报价列表</a>
                            </div>
                        </div>
                        <div class="mj_menu_pro_li" style="padding-left: 48px;">
                            <div class="mj_menu_li_txt">
                                <p>
                                    <font>工匠管理</font><br /> <a href="worker/workerList.do">全部工匠</a><br />
                                    <!-- virtualWorker/virtualWorkerAdd.do -->
									<#if Session.USER_BEAN.apartyId==''> 未审核工匠<br /> 已审核工匠<br />
                                        <!-- 已启用工匠<br /> 已停用工匠<br /> -->
                                        推荐工匠列表<br /> <a href="virtualWorker/virtualWorkerList.do">
                                        全部线下工匠</a><br /> <a href="virtualWorker/virtualWorkerAdd.do">
                                        新增线下工匠</a><br /> <a href="virtualWorker/workerRegist.do">
                                        工匠注册</a><br /> <a href="workerGrab/workerGrabList.do">

                                        工匠抢单记录</a> </#if>
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

        <li class="drop-menu-effect"><a href=""><span>财务中心</span></a>
            <div class="submenu">
                <div class="mj_menu_pro_bg">
                    <div class="mj_menu_pro_main">
						<#if Session.USER_BEAN.apartyId==''>
							<#if Session.USER_BEAN.indentRole?contains('indentVerify') || Session.USER_BEAN.indentRole?contains('indentCaiwu')>
                                <div class="mj_menu_pro_li">
                                    <div class="mj_menu_li_txt">
                                        <font>财务信息</font><br /> <a href="repIncome/appointrepAdd.do">应收应付账款汇总表</a><br />
                                        财务汇总&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 商家财务信息<br /> <a
                                            href="citymanagerPayReport/managerPayAccountRep.do">城市经理人支出账单</a><br />
                                        <font>核算信息</font><br /> 经理人核算列表<br /> 经理人核算操作<br /> 工匠核算列表<br />
                                        工匠核算操作
                                    </div>
                                </div>
							</#if>
                            <div class="mj_menu_pro_li" style="padding-left: 48px;">
                                <div class="mj_menu_li_txt">
                                    <p>
                                        <font>保证金</font><br /> 保证金汇总<br /> 保证金列表<br />
                                    <p>
                                        <font>提现</font><br /> 提现汇总<br /> 提现列表<br />提现审核<br />
                                </div>
                            </div>
						</#if>
						<#if Session.USER_BEAN.adminRole=='normal'||Session.USER_BEAN.adminRole=='zhizhuang'>
                            <div class="mj_menu_pro_li" style="padding-left: 48px;">
                                <div class="mj_menu_li_txt">
                                    <p>
                                        <font>提报费用</font><br /><a href="indentCost/indentCostList.do"> 提报费用列表</a><br />
                                    </p>
                                </div>
                            </div>
						</#if>
                        <div style="clear: both; height: 0px; overflow: hidden;"></div>
                    </div>
                </div>
            </div></li>
	</#if>
        <!-- 入驻商家不显示CRM中心   END-->
        <li class="drop-menu-effect"><a href=""><span>报表中心</span></a>
            <div class="submenu">
                <div class="mj_menu_pro_bg">
                    <div class="mj_menu_pro_main">
                    <div class="mj_menu_pro_li">
                    <div class="mj_menu_li_txt">
                        <font>日报</font> <#if Session.USER_BEAN.apartyId==''> <br /> <a
                            href="workerDailylog/workerDailyReportListlog.do">工匠注册日报</a> <br />
                        <a href="managerDailylog/managerDailyReportListlog.do">经理人注册日报</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
					<#--<a href="reportIndent/dayIndent.do">订单日报</a> &nbsp;&nbsp;<br/>--></#if>
					<#if Session.USER_BEAN.apartyId==''>
                        <p>
                            <font>周报</font><br /> <a
                                href="workerDailylog/workerWeeklyReportListlog.do">工匠注册周报
                            <br /> <a
                                    href="managerDailylog/managerWeeklyReportListlog.do">经理人注册周报
                                <br /> <a href="reportIndent/dayIndent.do"> 订单周报
                        </p>
                    </div>
                    </div>

                        <div class="mj_menu_pro_li">
                            <div class="mj_menu_li_txt">
                                <font>月报</font><br /> <a href="workerDailylog/workerMonthlyReportListlog.do">
                                工匠注册月报</a><br />
                                <a href="managerDailylog/managerMonthlyReportListlog.do">
                                    经理人注册月报</a><br />
                                <a href="">	 订单月报</a><br />
                                <a href="">	 甲方月度对账单</a><br />
                                <a href="">经理人月度对账单&nbsp;&nbsp;</a><br />
                                <a href=""> 工匠月度对账单 </a>
                            </div>
                        </div>
                        <div class="mj_menu_pro_li">
                            <div class="mj_menu_li_txt">
                                <p>
                                    <font>季报</font><br />
                                    <a	href="workerDailylog/workerQuarterlyReportListlog.do">工匠注册季报</a><br />
                                    <a href="managerDailylog/managerMonthlyReportListlog.do">经理人注册季报</a><br />
                                    <a href="">	订单季报</a><br />
                                    <a href="">	甲方季度对账单 </a><br />
                                    <a href="">	经理人季度对账单&nbsp;&nbsp;&nbsp;&nbsp;</a><br />
                                    <a href="">	工匠季度对账单</a><br />
                                    <a href="indent/goCountInformation.do">首装成功率</a>

                            </div>
                        </div>
                        <div class="mj_menu_pro_li">
                            <div class="mj_menu_li_txt">
                                <p>
                                    <font>服务报</font><br />
                                    <a
                                            href="reportIndent/serviceReport.do">订单服务力报表</a><br />
                                    <a
                                            href="reportIndent/nationServiceReport.do">全国区域服务力报表</a><br />
                                </p>
                                <p>
                                    <font>维度报</font><br />
                                    <a href="operationPanel/operationPanelList.do">运营节点表</a><br/>
                                    <a href="apartyIndent/apartyIndentList.do">商家订单日表</a><br/>
									<#if Session.USER_BEAN.isAdmin=='true' || !Session.USER_BEAN.indentRole?contains('indentQA') >
                                        <a href="apartyIndent/apartyAdjustReport.do">商家调整表 </a><br/>

                                        <a href="apartyIndent/workerAdjustReport.do">工匠调整表</a><br/>
									</#if>
                                </p>
                            </div>
                        </div>
					</#if>

                        <div style="clear: both; height: 0px; overflow: hidden;"></div>
                    </div>
                </div>

            </div></li> <#if Session.USER_BEAN.apartyId==''>

        <li class="drop-menu-effect"><a href=""><span>审计中心</span></a>
            <div class="submenu">
                <div class="mj_menu_pro_bg">
                    <div class="mj_menu_pro_main">
                        <div class="mj_menu_pro_li">
                            <div class="mj_menu_li_txt">
                                <a href="scheduleLog/scheduleLogShow.do">定时计划日志</a><br /> <a
                                    href="adminLog/adminLogShow.do">内勤操作日志</a><br />
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
                                <font>消息</font><br />
                                系统消息<br /> 众联消息<br /> 即时通讯消息<br />
                                <font>公告管理</font><br />
                                <a href="noticeCat/noticeCatList.do">公告类别列表</a><br />
                                <a href="notice/noticeList.do">公告列表</a><br />
                                
                                 <a href="message/messagePush.do">系统推送中心</a><br />
                            </div>
                        </div>

                        <div class="mj_menu_pro_li">
                            <div class="mj_menu_li_txt">
                                <font>链装新闻中心</font><br /> <a
                                    href="news/newsList.do">发布新闻内容<br />
                                <a  href="newsCat/newsCatList.do">链装新闻栏目<br />
                            </div>
                        </div>

                        <div class="mj_menu_pro_li" style="padding-left: 48px;">
                            <div class="mj_menu_li_txt">
                                <font>消息板管理</font><br />
                                <a href="bulletinCat/bulletinCatList.do">消息板类别列表</a><br />
                                <a href="bulletin/bulletinList.do">消息板列表</a><br />
                            </div>
                        </div>
                        <div style="clear: both; height: 0px; overflow: hidden;"></div>
                    </div>
                </div>
            </div></li>
	</#if>
	<#if Session.USER_BEAN.adminRole=='normal'>
        <li class="drop-menu-effect"><a href=""><span>广告中心</span></a>
            <div class="submenu">
                <div class="mj_menu_pro_bg">
                    <div class="mj_menu_pro_main">
                        <div class="mj_menu_pro_li">
                            <div class="mj_menu_li_txt">
                                <a href="advs/advsList.do">广告管理</a><br />
                                <a href="advs/advsRequestList.do">广告请求列表</a><br />
                                <a href="advs/advsClickList.do">广告点击列表</a><br />
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
                                <font>系统参数设置</font>&nbsp;&nbsp;&nbsp;&nbsp;<br /> <a
                                    href="prov/provList.do">城市设置</a><br /> <a
                                    href="scnode/scnodeTree.do">服务节点</a><br />
								<#if	Session.USER_BEAN.isAdmin=='true'><a
                                        href="sctype/goSctypeNodeTree.do">订单节点管理</a> <br /> </#if><a
                                    href="sctype/sctypeList.do">签约品类</a><br /> <a
                                    href="sctype/sctypeTree.do">服务类别</a>
								<#if Session.USER_BEAN.adminRole=='normal'><br /> <a
                                        href="vCode/vCodeList.do">验证码查看</a><br />
								</#if><#if
							Session.USER_BEAN.isAdmin=='true'>
                                <a
                                        href="spendTime/spendTimeList.do">系统耗时查看</a><br>
                                <a
                                        href="systemConfig/systemConfigList.do">系统配置管理</a>
							</#if>
                            </div>
                        </div>
					</#if> <#if Session.USER_BEAN.adminRole=='zhizhuang'>
                        <div class="mj_menu_pro_li">
                            <div class="mj_menu_li_txt">
                                <font>系统参数设置</font>&nbsp;&nbsp;&nbsp;&nbsp;<br /> <a
                                    href="sctype/sctypeJiafangTree.do">服务类别</a><br /> <#if
							Session.USER_BEAN.adminRole=='zhizhuang'> <a
                                        href="sctype/sctypeList.do">签约内容</a><br /> </#if>

                            </div>

                        </div>
					</#if>
					<#if Session.USER_BEAN.apartyId==''>
                        <div class="mj_menu_pro_li">
                            <div class="mj_menu_li_txt">
                                <p>
                                    <font>定时计划设置</font>&nbsp;&nbsp;&nbsp;&nbsp;<br /> <a
                                        href="schedule/scheduleList.do">定时计划列表</a><br /> <a href="#">新增定时计划</a><br />
                                </p>


                            </div>

                        </div>
					</#if> <#if Session.USER_BEAN.adminRole!='ruzhu'>
                        <!-- 入驻商家不显示价格体系-->
                        <div class="mj_menu_pro_li">
                            <div class="mj_menu_li_txt">
                                <p>
                                    <font>工人价格体系</font><br /> <a href="price/priceList.do">全部价格体系</a>&nbsp;&nbsp;<br />
                                    <a href="price/priceAdd.do">新增价格体系</a><br />
                                </p>
								<#if Session.USER_BEAN.adminRole!='zhizhuang'>
                                    <!-- 直装用户不显示客服小组-->
                                    <p>
                                        <font>客服小组管理</font><br /> <a
                                            href="adminTeam/adminTeamList.do">全部小组</a>&nbsp;&nbsp;<br />
                                        <a href="adminTeam/adminTeamAdd.do">新增小组</a><br />
                                        <a href="adminTeam/adminTeamConnect.do">联系客服</a><br />

                                    </p>
								</#if>
                            </div>
                        </div>
					</#if>
					<#if Session.USER_BEAN.adminRole=='zhizhuang'>
                        <div class="mj_menu_pro_li">
                            <div class="mj_menu_li_txt">
                                <p>
                                    <font>商家价格体系</font><br /> <a href="aparty/apartyPriceList.do">全部价格体系</a>&nbsp;&nbsp;<br />
                                    <a href="aparty/apartyPriceAdd.do.do">新增价格体系</a><br />
                                </p>

                            </div>
                        </div>
					</#if>
                        <!-- 非众联用户不显示账号管理 end-->
					<#if Session.USER_BEAN.apartyId==''>
                        <div class="mj_menu_pro_li">
                            <div class="mj_menu_li_txt">
                                <font>账号管理</font><br /> <a href="admin/adminList.do">账号列表</a>&nbsp;&nbsp;&nbsp;&nbsp;<br />
                                <a href="admin/adminAdd.do">新增账号</a><br /> <font>角色管理</font><br />
                                <a href="role/roleList.do">角色列表</a><br /> <a
                                    href="role/roleAdd.do">新增角色</a>


                            </div>
                        </div>
					</#if> <#if Session.USER_BEAN.adminRole=='zhizhuang'>
                        <!-- 直装用户自定义设置-->
                        <div class="mj_menu_pro_li">
                            <div class="mj_menu_li_txt">
                                <font>自定义设置</font><br /> <a href="aparty/apartySetting.do">订单录入设置</a>&nbsp;&nbsp;<br />


                            </div>
                        </div>
					</#if>
                        <div class="mj_menu_pro_li">
                            <div class="mj_menu_li_txt">
                                <font>账号操作</font><br /> <a href="admin/adminChangePwd.do">修改密码</a>&nbsp;&nbsp;<br />
                                <a href="logout.do">退出登录</a><br /> <#if
							Session.USER_BEAN.adminRole=='normal'>
                                <!-- 入驻商家不显示价格体系-->
                                <font>需求/反馈</font><br /> <a href="demand/demandList.do">全部需求/反馈</a>&nbsp;&nbsp;<br />
                                <a target="_blank" href="demand/demandAdd.do">新增需求/反馈</a><br />
							</#if>
                            </div>
                        </div>

                        <div style="clear: both; height: 0px; overflow: hidden;"></div>
                    </div>
                </div>
            </div></li>
        <div>

            <!--   <#if Session.USER_BEAN.indentRole?contains('indentQA')>
       <a class="btn btn-warning"
          href="indent/indentList.do?status=EXCEPTION">异常订单<span class="badge"
          ng-bind="exceptionIndentCount"></span></a> &nbsp;&nbsp;
  </#if> -->
            <!-- <#if Session.USER_BEAN.adminRole=='normal'>      管家用户才能显示
    <#if Session.USER_BEAN.indentRole?contains('indentInsert')>
      <a class="btn btn-warning"
          href="indent/indentList.do?transferProgress=INSERT">待流转订单<span class="badge"
          ng-bind="insertIndentCount"></span></a> &nbsp;&nbsp;
      <a class="btn btn-warning"
          href="indent/indentList.do?second=1">待二次上门订单<span class="badge"
          ng-bind="secondIndentCount"></span></a> &nbsp;&nbsp;
   </#if>
   <#if Session.USER_BEAN.indentRole?contains('indentVerify')>
      <a class="btn btn-warning"
          href="indent/indentList.do?transferProgress=VERIFY">待核算订单<span class="badge"
          ng-bind="verifyIndentCount"></span></a> &nbsp;&nbsp;
   </#if>
   <#if Session.USER_BEAN.indentRole?contains('indentAssign')>
      <a class="btn btn-warning"
          href="indent/indentList.do?transferProgress=ASSIGN">待派单<span class="badge"
          ng-bind="assignIndentCount"></span></a> &nbsp;&nbsp;
       <a class="btn btn-warning"
           href="indent/indentList.do?noScrab=1">未抢单<span class="badge"  ng-bind="noScrabIndentCount"></span></a><br />
   </#if>
  <#if Session.USER_BEAN.indentRole?contains('indentQA')>
      <a class="btn btn-warning"
          href="indent/indentList.do?transferProgress=QA">已抢单<span class="badge"
          ng-bind="QAIndentCount"></span></a> &nbsp;&nbsp;
      <a class="btn btn-warning" href="indent/indentList.do?signOverTime=1">未签到
         <span class="badge"  ng-bind="signOverTimeIndentCount"></span></a>
      <a class="btn btn-warning" href="indent/indentList.do?progStatus=INSTALL">待货检
         <span class="badge"  ng-bind="installIndentCount"></span></a><br />
      <a class="btn btn-warning" href="indent/indentList.do?progStatus=INSTALL">待总结
         <span class="badge"  ng-bind="reportIndentCount"></span></a>
      <a class="btn btn-warning" href="indent/indentList.do?progStatus=REPORT">待自检
         <span class="badge"  ng-bind="checkIndentCount"></span></a>
       <a class="btn btn-warning" href="indent/indentList.do?progStatus=SELFCHECK">待核销
         <span class="badge"  ng-bind="hexiaoIndentCount"></span></a>
   </#if>

 </#if> -->
        </div>
    </div>

</div>
<#include "/include/messageNotice.ftl" />
<input type="hidden" id="identify" name="identify" value="${identify}">
<input type="hidden" id="userid" name="userid" value="${userid}">

<#include "/include/allstaticC.ftl" />

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