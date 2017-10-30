<#include "/include/common.ftl" />
<title></title>
<#include "/include/common-entry-grid.ftl" />

<#include "/include/common-cityselect2.ftl" />
<script src="static/scripts/core/ifu-workerselect.js"></script>
<style type="text/css">
.grid {
  width: 100%;
  height: 140px;
}
</style>
<script type="text/javascript"
	src="static/scripts/indent/indentEditNoitem.js?randomId=<%=Math.random()%>"></script>
</head>
<body
	
	<ng-init="data.id='${indentId}';doUpdateAuth='${doUpdateAuth}';finishIndentAuth='${finishIndentAuth}';doDelAuth='${doDelAuth}';workerChangeAuth='${workerChangeAuth}';">
	<#include "/include/body-begin.ftl" />
	<div ng-controller="IndentController">
		<form id="inputForm" name="form1" class="form-horizontal" novalidate>
			<input type="hidden" id="pageNo" value="${pageNo}"
				ng-init="pageNo='${pageNo}'">
			<input type="hidden"  id="indentId" value='${indentId}' >
			<div class="panel panel-default">
				<div class="panel-heading">订单基本信息</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label required col-md-4">商家名称：</label>
								<div class="col-md-8">
									<input type="text" class="form-control" value="${apartyName1}"
										disabled> <input type="hidden" name="apartyId"
										ng-model="data.apartyId">
								</div>
							</div>
						</div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label required col-md-4">订单类型：</label>
                                <div class="col-md-8">
                                    <select id="sel" class="form-control" name="indentSource"
                                            ng-model="data.indentSource"> <#list indentSourceList
									as item>
                                        <option value="${item.value}">${item.text}</option> </#list>
                                    </select>
                                </div>
                            </div>
                        </div>
						<input type="hidden" ng-init="data.mainCode1=${mainCode1 }"
							ng-model="data.mainCode1">
						<!-- <div class="col-md-6">
							<div class="form-group">
								<label class="control-label required col-md-4">项目名称：</label>
								<div class="col-md-8">
									<input type="text" class="form-control" value="${itemName1}"
										disabled> <input type="hidden" name="itemId"
										ng-model="data.itemId">
								</div>
							</div>
						</div> -->
					</div>
					<#--<div class="row">
						<div class="col-md-6">
							<div class="form-group"
								ng-class="{'has-error' : form1.planDate.$invalid && (form1.$submitted || form1.planDate.$touched)}">
								<label class="control-label  col-md-4">预计完成日期：</label>
								<div class="col-md-8">
									<p class="input-group">
										<input type="text" class="form-control" uib-datepicker-popup
											ng-model="data.planDate" is-open="planDate.opened"
											datepicker-options="dateOptions" /> <span
											class="input-group-btn">
											<button type="button" class="btn btn-default"
												ng-click="openPlanDate()">
												<i class="glyphicon glyphicon-calendar"></i>
											</button>
										</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group"
								ng-class="{'has-error' : form1.durationTime.$invalid && (form1.$submitted || form1.durationTime.$touched)}">
								<label class="control-label required col-md-4">订单服务时长：</label>
								<div class="col-md-8">
									<input type="text" class="form-control" name="durationTime"
										ng-model="data.durationTime">
								</div>
							</div>
						</div>
					</div>-->
					<div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label col-md-4">计划上门日期：</label>
                                <div class="col-md-8">
                                    <p class="input-group">
                                        <!-- ng-class="{'has-error' : form1.planDoorDate.$invalid && (form1.$submitted || form1.planDoorDate.$touched)}" -->
                                        <input type="text" class="form-control" uib-datepicker-popup
                                               ng-model="data.planDoorDate" name="planDoorDate"
                                               is-open="planDoorDate.opened"
                                               datepicker-options="dateOptions" ng-required="false" />
                                        <span class="input-group-btn">
											<button type="button" class="btn btn-default"
                                                    ng-click="openPlanDoorDate()">
												<i class="glyphicon glyphicon-calendar"></i>
											</button>
										</span>
                                    </p>
                                </div>
                            </div>
                        </div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label required col-md-4">来单日期：</label>
								<div class="col-md-8">
									<p class="input-group"
										ng-class="{'has-error' : form1.receiveDate.$invalid && (form1.$submitted || form1.receiveDate.$touched)}">
										<input type="text" class="form-control" uib-datepicker-popup
											ng-model="data.receiveDate" name="receiveDate"
											is-open="receiveDate.opened" datepicker-options="dateOptions"
											ng-required="false" uib-tooltip="此项为必填项"
											tooltip-enable="form1.receiveDate.$invalid" /> <span
											class="input-group-btn">
											<button type="button" class="btn btn-default"
												ng-click="openReceiveDate()">
												<i class="glyphicon glyphicon-calendar"></i>
											</button>
										</span>
									</p>
								</div>
							</div>
						</div>
					</div>
                    <div class="row">
					<#if Session.USER_BEAN.adminRole!='ruzhu'>
                        <div class="col-md-6">
                            <div class="form-group" >
                                <label class="control-label text-nowrap col-md-4 required" >商家价格体系</label>
                                <div class="col-md-8">
                                    <select id="sel" class="form-control" name="priceNameIdJiafang"
                                            ng-model="data.priceNameIdJiafang" required > <#list
									priceNameJiafangList as item>
                                        <option value="${item.v}">${item.n}</option> </#list>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label text-nowrap col-md-4">工人价格体系</label>
                                <div class="col-md-8">
                                    <input type="hidden" id="priceNameId" value="${priceNameId}">
                                    <select id="sel" class="form-control"
                                            ng-model="data.priceNameId"> <#list priceNameList as
									item>
                                        <option value="${item.v}">${item.n}</option> </#list>
                                    </select>
                                </div>
                            </div>
                        </div>
					</#if>


                    </div>
					<div class="row">
						<#if Session.USER_BEAN.adminRole=='ruzhu'>
						<div class="col-md-6">
							<div class="form-group"
								ng-class="{ 'has-error': form1.remarksRuzhu.$invalid && (form1.$submitted || form1.remarksRuzhu.$touched)}">
								<label class="control-label  col-md-4">商家备注：</label>
								<div class="col-md-8">
									<textarea type="text" class="form-control" name="remarks"
										maxlength="500" ng-model="data.remarksRuzhu" uib-tooltip=""
										tooltip-enable="form1.remarksRuzhu.$invalid"></textarea>
								</div>
							</div>
						</div>
						</#if>
					</div>
					<#if Session.USER_BEAN.adminRole!='ruzhu'>

					<div class="row">
                        <div class="col-md-6">
                            <div class="form-group"
                                 ng-class="{'has-error' : form1.codeJiafang.$invalid && (form1.$submitted || form1.codeJiafang.$touched)}">
                                <label class="control-label  col-md-4">商家订单号：</label>
                                <div class="col-md-8">

                                    <textarea type="text" type="text" class="form-control" name="codeJiafang"
											  ng-model="data.codeJiafang" maxlength="500"></textarea>
                                </div>
                            </div>
                        </div>
						<div class="col-md-6">
							<div class="form-group"
								ng-class="{ 'has-error': form1.remarks.$invalid && (form1.$submitted || form1.remarks.$touched)}">
								<label class="control-label  col-md-4">备注：</label>
								<div class="col-md-8">
									<textarea type="text" class="form-control" name="remarks"
										maxlength="500" ng-model="data.remarks" uib-tooltip=""
										tooltip-enable="form1.remarks.$invalid"></textarea>
								</div>
							</div>
						</div>
					</div>
					</#if>


				<#if Session.USER_BEAN.adminRole=='normal'>
				<div class="row">
                    <div class="col-md-6">
                        <div class="form-group"
                             ng-class="{ 'has-error': form1.remarksRuzhu.$invalid && (form1.$submitted || form1.remarksRuzhu.$touched)}">
                            <label class="control-label  col-md-4">商家备注：</label>
                            <div class="col-md-8">
									<textarea type="text" class="form-control" name="remarks"
                                              maxlength="500" ng-model="data.remarksRuzhu" uib-tooltip=""
                                              tooltip-enable="form1.remarksRuzhu.$invalid"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
				</#if>

				</div>
			</div>


  <!-- 设计师面板begin -->
 <div class="panel panel-default">
        <div class="panel-heading">设计师</div>
        <div class="panel-body">
          <div class="form-group" ng-controller="DesignerController">
            <label class="control-label required col-md-2">联系人：
              <div
                class="glyphicon glyphicon-plus btn btn-warning btn-xs"
                uib-tooltip="添加" ng-click="addRow()"></div>
            </label>
            <div class="col-md-10">
              <div ui-grid="gridOptions" ui-grid-edit ui-grid-cellnav
                ui-grid-validate class="grid"></div>
            </div>
          </div>
</div>
<!-- 设计师面板  end-->
<!-- 订单内容 begin-->
			<div class="panel panel-default">
			
				<div class="panel-heading">
				
					订单内容&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox"
						name="ifSplit" id="ifSplit" ng-model="data.ifSplit">拆分订单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					<div ng-show="data.ifSplit" style="display: inline" id="split">
						<#list serveTypeList as type> <#if type.code1==serveType> <#list
						type.sortList as sort> ${sort.name1} <input
							style="width: 25px; height: 20px" type="text"
							id="sort_${sort.id}_split"
							ng-model="data.indentSortSplitDto.${sort.id}"
							ng-init="data.indentSortSplitDto.${sort.id}=''  "
							onkeyup="this.value=this.value.replace(/[^\d]/g,'');">
						&nbsp;&nbsp;&nbsp;&nbsp; </#list> </#if> </#list> (不同数字品类被拆分到不同订单)
					</div>


				</div>

				<div class="panel-body" id="serverType">
					<#list serveTypeList as type> <#if type.code1==serveType>
					<div class="form-group">
						<label for="" class="control-label required col-md-2">服务类别：</label>
						<div class="col-md-9" id="divServeType">
							<table class="table table-bordered">
								<tr>
									<!-- 判断该品类是不是存在于品类字符串中，如果存在，说明该品类中有订单内容，就选中该checkbox -->
									<td><#list type.sortList as sort> <#if
										sortIdStr.contains(sort.id)> <input type="checkbox"
										value="${sort.id}" id="sort_${sort.id}"
										ng-click="add('${sort.id}')" ng-model="sort_${sort.id}"
										ng-init="sort_${sort.id}=true">
										${sort.name1}&nbsp;&nbsp;&nbsp;&nbsp; </#if> <!-- 判断该品类是不是存在于品类字符串中，如果bu存在，说明该品类中没有订单内容，就取消选中该checkbox -->
										<#if !sortIdStr.contains(sort.id)> <input type="checkbox"
										value="${sort.id}" id="sort_${sort.id}"
										ng-click="add('${sort.id}')" ng-model="sort_${sort.id}"
										ng-init="sort_${sort.id}=false">
										${sort.name1}&nbsp;&nbsp;&nbsp;&nbsp; </#if> </#list>
									</td>

								</tr>
							</table>

						</div>
					</div>
				<!-- 	<div class="form-group">
						<label class="control-label col-md-2"></label> -->
						<div class="col-md-11" id="content">
							<#list type.sortList as sort>
							<!-- 判断该品类是不是存在于品类字符串中，如果不存在，说明该品类中没有订单内容，就隐藏该div -->
							<div class="form-group" id="offer_${sort.id}"
								<#if !sortIdStr.contains(sort.id)> style="display:none" </#if>>

								<table class="table table-border" width="100%">
								 
									<tr>
										<td width="50px" rowspan="${(sort.signSctypeDetailList.size()/3)?ceiling}">${sort.name1}</td>
										<#list sort.signSctypeDetailList as content> <#if
										sort.id==content.sctypeSortId>
										<td align="left">${content.desc1}<input class="form-control" type="hidden" name="code1"  ng-model="$parent.data.indentPriceDto.indentPrice_${content.countsCode}_code1"
											ng-init="$parent.data.indentPriceDto.indentPrice_${content.countsCode}_code1='${content.countsCode}'">
<#if (Session.USER_BEAN.adminRole=='normal'   && !Session.USER_BEAN.indentRole.contains("indentQA")) 
  || Session.USER_BEAN.isAdmin=='true' ||  Session.USER_BEAN.adminRole=='ruzhu' || Session.USER_BEAN.adminRole=='zhizhuang'> <!-- 管家用户的非品控角色，管理员，入驻商家才能看
数量输入框 -->
                          
											<input
                    class="form-control" type="text" name="counts" ng-model="data.indentPriceDto.indentPrice_${content.countsCode}_countsJiafang"
                   
                    style="width: 60px; display: inline-block; "

                    numeric decimals="3" placeholder="商家"  <#if enableInput=='enabled'>enabled<#else>disabled</#if>>
                    <select style="width:65px;height:30px" name="unitJiafang"
                    ng-model="data.indentPriceDto.indentPrice_${content.countsCode}_unitJiafang" >

                    <#list uomList as data>
                    <option value="${data.value}">${data.text}</option>
                    </#list>
                  </select></#if>

                  <#if Session.USER_BEAN.adminRole!='ruzhu'>
                   <input  numeric decimals="3"  
                   <#if enableInput=='enabled'>enabled<#else>disabled</#if>

											class="form-control" type="text" name="counts"
											ng-model="data.indentPriceDto.indentPrice_${content.countsCode}_counts"
											style="width: 70px; display: inline-block; "<#if Session.USER_BEAN.adminRole=='normal'> placeholder="工匠"</#if>>
				 </#if><!-- ${content.unitDisp} -->
							<#if Session.USER_BEAN.adminRole!='ruzhu'>
											<select style="width:65px;height:30px" name="unit"

                    ng-model="data.indentPriceDto.indentPrice_${content.countsCode}_unit"  >

                    <#list uomList as data>
                    <option value="${data.value}">${data.text}</option>
                    </#list>
                  </select></#if>
               <#--<#if Session.USER_BEAN.adminRole=='zhizhuang'>
                   ${content.unitDisp}
               </#if>-->

											<!-- <input  type="text" name="code1"  ng-model="data.indentPriceDto.indentPrice_${content.countsCode}_code1"
											ng-init="data.indentPriceDto.indentPrice_${content.countsCode}_code1='${content.countsCode}'"> -->

										</td> <#if (content_index+1)%3 == 0>
									</tr>
									<tr></#if> </#if> </#list>
									</tr>
								</table>

							</div>
							</#list>
						</div>
					<!-- </div> -->
					</#if> </#list>
				</div>
			</div>
	</div>
	<!-- 订单内容 end-->
		<div class="panel panel-default" ng-show="sort_RY">
				<div class="panel-heading">提货信息</div>
				<div class="panel-body">
					<div class="form-group" cityselect2>
						<label class="control-label col-md-2">提货地址：</label>
						<div class="col-md-2">
							<select class="form-control" name="regionProv"
								ng-model="data.indentFreight.regionProv"
								ng-options="prov.v as prov.n for prov in provs">
							</select>
						</div>
						<div class="col-md-2" ng-hide="!cities">
							<select class="form-control" name="regionCity"
								ng-model="data.indentFreight.regionCity"
								ng-options="city.v as city.n for city in cities">
							</select>
						</div>
						<div class="col-md-2" ng-hide="!dists">
							<select class="form-control" name="regionDist"
								ng-model="data.indentFreight.regionDist"
								ng-options="dist.v as dist.n for dist in dists">
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label required col-md-2">详细地址：</label>
						<div class="col-md-6">
							<textarea type="text" class="form-control" name="addr1"
								maxlength="100" ng-model="data.indentFreight.addr1">
                </textarea>
						</div>
						<div class="col-md-3">
							<textarea type="text" class="form-control" name="addr2"
								maxlength="100" ng-model="data.indentFreight.buildingNum"
								uib-tooltip="此项为必填项" tooltip-enable="form1.addr2.$invalid"
								placeholder="这里输入楼号门牌号">
              </textarea>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label required col-md-4">提货联系人：</label>
								<div class="col-md-8">
									<input type="text" class="form-control" name="contacts"
										maxlength="60" ng-model="data.indentFreight.contacts">
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label required col-md-4">联系电话：</label>
								<div class="col-md-8">
									<input type="text" class="form-control" name="mobile1"
										maxlength="11" ng-model="data.indentFreight.mobile">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label required col-md-4">货运单号：</label>
								<div class="col-md-8">
									<input type="text" class="form-control" name="code1"
										maxlength="60" ng-model="data.indentFreight.code1">
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label required col-md-4">件数：</label>
								<div class="col-md-8">
									<input type="text" class="form-control" name="packageNum"
										ng-model="data.indentFreight.packageNum">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label required col-md-4">毛重：</label>
								<div class="col-md-8">
									<input type="text" class="form-control" name="kgs"
										ng-model="data.indentFreight.kgs">
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label required col-md-4">要求车型：</label>
								<div class="col-md-8">
									<select id="sel" class="form-control" name="carModel"
										ng-model="data.indentFreight.carModel"> <#list
										vehicleList as item>
										<option value="${item.value}">${item.text}</option> </#list>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2">备注：</label>
						<div class="col-md-10">
							<textarea class="form-control" name="comment" maxlength="100"
								ng-model="data.indentFreight.comment"></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">业主联系信息</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label required col-md-4">业主名称：</label>
								<div class="col-md-8">
									<input type="text" class="form-control" name="name1"
										maxlength="60" ng-model="data.contact.name1" required>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label required col-md-4">业主电话：</label>
								<div class="col-md-8">
									<input type="text" class="form-control" name="mobile"
										maxlength="11" ng-model="data.contact.mobile"
										ng-pattern="/(^13\d{9}$)|(^14)[5,7]\d{8}$|(^15[0,1,2,3,5,6,7,8,9]\d{8}$)|(^17)[0,1,2,3,5,6,7,8,9]\d{8}$|(^18\d{9}$)/">
									<div ng-show="form1.mobile.$dirty && form1.mobile.$invalid"
										ng-cloak>
										<font size="2" color="red">电话格式不正确</font>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label required col-md-4">工长名称：</label>
								<div class="col-md-8">
									<input type="text" class="form-control" name="headName"
										maxlength="60" ng-model="data.contact.headName">
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label required col-md-4">工长电话：</label>
								<div class="col-md-8">
									<input type="text" class="form-control" name="headMobile"
										maxlength="11" ng-model="data.contact.headMobile"
										ng-pattern="/(^13\d{9}$)|(^14)[5,7]\d{8}$|(^15[0,1,2,3,5,6,7,8,9]\d{8}$)|(^17)[0,1,2,3,5,6,7,8,9]\d{8}$|(^18\d{9}$)/">
									<div
										ng-show="form1.headMobile.$dirty && form1.headMobile.$invalid"
										ng-cloak>
										<font size="2" color="red">电话格式不正确</font>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label  col-md-4">监理名称：</label>
								<div class="col-md-8">
									<input type="text" class="form-control" 　name="supName1"
										maxlength="60" ng-model="data.contact.supName1">

								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label  col-md-4">监理电话：</label>
								<div class="col-md-8">
									<input type="text" class="form-control" maxlength="11"
										　　 ng-pattern="/(^13\d{9}$)|(^14)[5,7]\d{8}$|(^15[0,1,2,3,5,6,7,8,9]\d{8}$)|(^17)[0,1,2,3,5,6,7,8,9]\d{8}$|(^18\d{9}$)/"
										name="supMobile" ng-model="data.contact.supMobile">
									<div
										ng-show="form1.supMobile.$dirty && form1.supMobile.$invalid"
										ng-cloak>
										<font size="2" color="red">电话格式不正确</font>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="form-group" cityselect2>
						<label class="control-label col-md-2">服务地址：</label>
						<div class="col-md-2">
							<select class="form-control" name="regionProv"
								ng-model="data.regionProv"
								ng-options="prov.v as prov.n for prov in provs" required>
							</select>
						</div>
						<div class="col-md-2" ng-hide="!cities">
							<select class="form-control" name="regionCity"
								ng-model="data.regionCity"
								ng-options="city.v as city.n for city in cities">
								<!-- ng-click="showManager()" -->
							</select>
						</div>
						<div class="col-md-2" ng-hide="!dists">
							<select class="form-control" name="regionDist"
								ng-model="data.regionDist"
								ng-options="dist.v as dist.n for dist in dists">
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label required col-md-2">详细地址：</label>
						<div class="col-md-6">
							<textarea type="text" class="form-control" name="detailAddr1"
								maxlength="200" ng-model="data.contact.detailAddr1" required>
              </textarea>
						</div>
						<div class="col-md-3"
							ng-class="{'has-error' : form1.buildingNum.$invalid && (form1.$submitted || form1.buildingNum.$touched)}">
							<textarea type="text" class="form-control" name="buildingNum"
								maxlength="100" ng-model="data.contact.buildingNum"
								uib-tooltip="此项为必填项" tooltip-enable="form1.buildingNum.$invalid"
								placeholder="这里输入楼号门牌号">
              </textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2">特殊需求：</label>
						<div class="col-md-10">
							<textarea type="text" class="form-control" name="demand"
								maxlength="500" ng-model="data.contact.demand"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label  col-md-2">特殊需求常用语：</label>
						<div class="col-md-10">
							<select id="sel" class="form-control" name="template"
								ng-change="setTemplate()" ng-model="template"> <#list
								templateList as item>
								<option value="${item.text}">${item.text}</option> </#list>
							</select>
						</div>
					</div>
						<div class="form-group" ng-show="data.serveType != 'C'">
					
						<div class="form-group">
							<label class="control-label required col-md-2">上传图纸：</label>

							<div class="col-md-10">
								<div class="row" ng-repeat="f in installImgFiles">
									<div class="col-md-4">
										<span>{{f.fileName}}</span>
									</div>
									<div class="col-md-4">
										<a href="fs/download.do?fileid={{f.id}}">【下载】</a><a href=""
											ng-click="delPact(f.id);">【删除】</a>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<input type="file" name="imgFiles" file-model="file.imgFiles"
											accept="image/jpeg,image/png,image/gif,image/jpg" multiple />
									</div>
								</div>
								<div class="row" ng-repeat="f in file.imgFiles">
									<div class="col-md-12">
										<span>{{f.name}} 
									</div>
								</div>

							</div>

						</div>
					</div>
					<#if Session.USER_BEAN.adminRole!='ruzhu'>
					<!-- 入驻商家不输入工匠比例这些项目 -->
					<div class="form-group" ng-show="data.regionDist" workerselect>
						<label class="control-label col-md-2"> 指派：</label>
						<div class="col-md-1">
							<input type="checkbox" id="assign"
								ng-model="data.indentAssignSelected" ng-click="showManager()" />
						</div>

                     

						<div class="col-md-1">
							<select class="form-control" name="assignType"
								ng-model="data.assignType" ng-show="data.indentAssignSelected">
								<#list assignType as item>
								<option value="${item.value}">${item.text}</option> </#list>

							</select>
						</div>
						<div class="col-md-2"
							ng-show="data.indentAssignSelected && ( data.assignType=='MANAGER')">
							<!-- <select id="sel" class="form-control" name="managerId"
								ng-model="data.managerId" ng-change="showWorker()"
								ng-options="manager.v as manager.n for manager in managers">
							</select> -->
							<input type="hidden" name="managerId" ng-model="data.managerId"
								ng-init="data.managerId='${data.managerId}'" /> <input
								type="text" ng-model="data.managerName1"
								placeholder="请输入姓名或者电话号码检索" name="managerName1"
								class="form-control"
								uib-typeahead="pair.text as pair.text for pair in doTypeaheadManager($viewValue)"
								typeahead-on-select="onTypeaheadManagerSelect($item, $model, $label)"
								typeahead-min-length="1" typeahead-loading="loadingTest"
								typeahead-no-results="noResultsmanager" uib-tooltip="此项为必填项"
								tooltip-enable="form1.managerName1.$invalid"
								ng-init="data.managerName1='${data.managerName1}'"> <i
								ng-show="loadingTest1" class="glyphicon glyphicon-refresh"></i>
							<div ng-show="noResultsmanager">
								<i class="glyphicon glyphicon-remove"></i>没有找到相关信息
							</div>
						</div>
						<div class="col-md-5"
							ng-show="data.indentAssignSelected && data.assignType=='WORKER'">
							<!-- <select class="form-control" name="workerId"
								ng-model="data.workerId"
								ng-options="worker.v as worker.n for worker in workers">
							</select> -->
							<input type="hidden" name="workerId" ng-model="data.workerId"
								ng-init="data.workerId='${data.workerId}'" />
							<div class="col-md-5">
								<input type=text ng-model="data.workerName1" name="workerName1"
									class="form-control" placeholder="请输入姓名或者电话号码检索"
									uib-typeahead="pair.text as pair.text for pair in doTypeaheadWorker($viewValue)"
									typeahead-on-select="onTypeaheadWorkerSelect($item, $model, $label)"
									typeahead-min-length="1" typeahead-loading="loadingTest"
									typeahead-no-results="noResultsworker" uib-tooltip="此项为必填项"
									tooltip-enable="form1.workerName1.$invalid"
									ng-init="data.workerName1='${data.workerName1}'"> <i
									ng-show="loadingTest1" class="glyphicon glyphicon-refresh"></i>
							</div>
							<div ng-show="noResultsworker">
								<i class="glyphicon glyphicon-remove"></i>没有找到相关信息
							</div>
						
							<#if Session.USER_BEAN.adminRole=='normal'>
							<!--  管家用户才能显示     -->
							<div class="col-md-3">
								暗派<input type="checkbox" id="assignSecret"
									ng-checked="data.ifSecretAssign=='YES'"
									ng-model="data.ifSecretAssign" />
							</div>
							</#if>

						</div>
  
					</div>
					</#if>

				<#if Session.USER_BEAN.adminRole=='normal'>
					 <div class="form-group" >
					    <label class="control-label col-md-2"> 线下：</label>
						<div class="col-md-1">  
							<input type="checkbox" id="ifOffline" ng-checked="data.ifOfflineShow"  
							
							ng-model="data.ifOfflineShow"  />
						</div>
						<div ng-show="data.ifOfflineShow">
						<div class="col-md-2" >
                  <input type="hidden" class="form-control"  maxlength="40" placeholder="请输入工匠姓名" 
                    name="workerNameOffLine" ng-model="data.workerNameOffLine" /></div>
                  <div
                    ng-show="form1.workerNameOffLine.$invalid && form1.workerNameOffLine.$dirty" >
                    <font size="2" color="red">姓名格式不正确</font>
                  </div>
                </div>
               		
									  <div class="col-md-2" >
                  <input type="hidden" class="form-control"  maxlength="11" placeholder="请输入工匠手机号" 
                    ng-pattern="/(^13\d{9}$)|(^14)[5,7]\d{8}$|(^15[0,1,2,3,5,6,7,8,9]\d{8}$)|(^17)[0,1,2,3,5,6,7,8,9]\d{8}$|(^18\d{9}$)/"
                    name="workerMobileOffLine" ng-model="data.workerMobileOffLine"
                    uib-tooltip="此项为必填项" tooltip-enable="form1.workerMoblieOffLine.$invalid" >
                  <div
                    ng-show="form1.workerMobileOffLine.$dirty && form1.workerMobileOffLine.$invalid" ng-cloak>
                    <font size="2" color="red">电话格式不正确</font>
                  </div>
                </div>
              </#if>
               </div>
					
					
				

					<div class="form-group">
						<div class="col-md-8"></div>
						<div class="col-md-10 col-md-offset-2">
							<#if doUpdateAuth==true && Session.USER_BEAN.adminRole!='ruzhu'
							&& hasAuth==true>
							<!-- 如果是管家用户进来并且有更新订单权限，并且该订单允许被操作，则显示保存按钮 -->
							<button type="submit" id="saveBtn" class="btn btn-primary"
								ng-click="update();">
								<span class="glyphicon glyphicon-ok">保存</span>
							</button>
							<#if doUpdateIndentCounts==true>
							<button type="submit" id="saveBtn" class="btn btn-primary"
                ng-click="updateCounts();">
                <span class="glyphicon glyphicon-ok">修改订单内容数量</span>
              </button></#if>
							</#if> &nbsp;&nbsp;&nbsp; <#if
							Session.USER_BEAN.adminRole=='ruzhu'>
							<!-- 如果是入驻商家用户进来，并且订单尚未提交，则显示保存按钮 -->
							<button type="submit" id="saveBtn" class="btn btn-primary"
								ng-click="update();" ng-if="data.ifCommit!='YES'">
								<span class="glyphicon glyphicon-ok">保存</span>
							</button>
							</#if> &nbsp;&nbsp;&nbsp; <#if doDelAuth==true &&
							Session.USER_BEAN.adminRole!='ruzhu' && hasAuth==true>
							<!-- 如果是管家用户进来并且有删除订单权限，并且该订单允许被操作，则显示删除按钮 -->
							<button type="button" class="btn btn-danger"
								ng-click="doDelete();">
								<span class="glyphicon glyphicon-trash"></span>&nbsp;删除
							</button>
							</#if> &nbsp;&nbsp;&nbsp; <#if
							Session.USER_BEAN.adminRole=='ruzhu'>
							<!-- 如果是入驻商家用户进来，并且订单尚未提交，则显示删除按钮 -->
							<button type="button" class="btn btn-danger"
								ng-click="doDelete();" ng-if="data.ifCommit!='YES'">
								<span class="glyphicon glyphicon-trash"></span>&nbsp;删除
							</button>
							</#if> &nbsp;&nbsp;&nbsp;

							<button type="button" id="copyBtn" class="btn btn-primary"
								ng-click="copy();">
								<span class="glyphicon glyphicon-plus"></span>复制
							</button>
							&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-success"
								ng-click="goBack();">
								<span class="glyphicon glyphicon-chevron-left"></span>&nbsp;返回
							</button>
							&nbsp;&nbsp;&nbsp;

						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<#include "/include/body-end.ftl" />
</body>
</html>