<#include "/include/common.ftl" />
<title></title>
<#include "/include/common-entry-grid.ftl" />
<!--  -->
<#include "/include/common-cityselect2.ftl" /> <#include
"/include/photoswipe.ftl" />
<!--  -->
<script src="static/js/jwplayer.js"></script>
<link href="static/treegrid/treeGrid.css" rel="styleSheet" />

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
	src="static/scripts/indent/indentView.js?randomId=<%=Math.random()%>"></script>
</head>

<body
	ng-init="data.id='${data.id}';doUpdateAuth='${doUpdateAuth}';finishIndentAuth='${finishIndentAuth}';doDelAuth='${doDelAuth}';workerChangeAuth='${workerChangeAuth}';">
	<#include "/include/body-begin.ftl" />

	<div ng-controller="IndentController">


		<form id="inputForm" name="form1" class="form-horizontal" novalidate>

			<div id="myTabContent">
				<!-- --------------------		订单基本信息begin -------------------------------------------------->
				<div id="home">
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

							<td>商家名称：${apartyName1} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 项目名称
								： ${itemName1} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;监理姓名 ：
								${data.contact.supName1} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;监理电话 ：
								${data.contact.supMobile} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<#if Session.USER_BEAN.adminRole!='ruzhu'>
						<tr>

							<td>工匠姓名：{{data.workerName1}} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								工匠电话 ： {{data.workerMobile}} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;金额（元）
								： ￥{{data.workerFee}} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>经理人姓名：{{data.managerName1}}
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 经理人电话 ： {{data.managerMobile}}
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;金额 （元）：￥ {{data.managerFee}}</td>
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
												as content> <#if sort.id==content.sctypeSortId>
												<td>${content.desc1}{{data.indentPriceDto.indentPrice_${content.id}_counts}}${content.unitDisp}
													&nbsp;&nbsp;&nbsp;&nbsp; <input type="hidden" name="code1"
													ng-init="data.indentPriceDto.indentPrice_${content.id}_code1='${content.id}'">
												</td>
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
					</table>

					</p>
				</div>
				<!-- --------------------   订单基本信息end -------------------------------------------------->
			</div>
		</form>


	</div>
	<#include "/include/body-end.ftl" />
</body>
</html>