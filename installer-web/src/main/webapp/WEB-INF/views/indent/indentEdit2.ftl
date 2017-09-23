<#include "/include/common.ftl" />
<title></title>
<#include "/include/common-entry-grid.ftl" />
<!--  -->
<#include "/include/common-cityselect2.ftl" />
<script src="static/scripts/core/ifu-workerselect.js"></script>

<script type="text/javascript" src="static/scripts/indent/indentEdit.js?randomId=<%=Math.random()%>"></script>
</head>
<body ng-init="data.id='${data.id}';doUpdateAuth='${doUpdateAuth}';finishIndentAuth='${finishIndentAuth}';doDelAuth='${doDelAuth}';workerChangeAuth='${workerChangeAuth}';">
  <#include "/include/body-begin.ftl" />
  <div ng-controller="IndentController">
    <form id="inputForm" name="form1" class="form-horizontal" novalidate >
    <input type="hidden" id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
      <div class="panel panel-default">
        <div class="panel-heading">订单基本信息</div>
        <div class="panel-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label required col-md-4">甲方名称：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control"
                    value="${apartyName1}" disabled> <input
                    type="hidden" name="apartyId"
                    ng-model="data.apartyId" >
                </div>
              </div>
            </div>
            <div class="col-md-6">   
             
              <div class="form-group">
                <label class="control-label required col-md-4">项目名称：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control"
                    value="${itemName1}" disabled> <input
                    type="hidden" name="itemId" ng-model="data.itemId" >
                    
                </div>
                    
            
                
              </div>
              </div>
              
             
               
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group"
                ng-class="{'has-error' : form1.planDate.$invalid && (form1.$submitted || form1.planDate.$touched)}">
                <label class="control-label  col-md-4">预计完成日期：</label>
                <div class="col-md-8">
                  <p class="input-group">
                    <input type="text" class="form-control"
                      uib-datepicker-popup ng-model="data.planDate"
                      is-open="planDate.opened"
                      datepicker-options="dateOptions"
                       /> <span
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
                  <input type="text" class="form-control"
                    name="durationTime" ng-model="data.durationTime" >
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label required col-md-4">订单类型：</label>
                <div class="col-md-8">
                  <select id="sel" class="form-control" name="indentSource"
                    ng-model="data.indentSource" >
                    <#list indentSourceList as item>
                    <option value="${item.value}">${item.text}</option>
                    </#list>
                  </select>
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
                      ng-required="true" uib-tooltip="此项为必填项"
                      tooltip-enable="form1.receiveDate.$invalid"  /> <span
                      class="input-group-btn">
                      <button type="button" class="btn btn-default"
                        ng-click="openReceiveDate()" >
                        <i class="glyphicon glyphicon-calendar"></i>
                      </button>
                    </span>
                  </p>
                </div>
              </div>
            </div>
          </div>
          
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label required col-md-4">计划上门日期：</label>
                <div class="col-md-8">
                  <p class="input-group"
                    ng-class="{'has-error' : form1.planDoorDate.$invalid && (form1.$submitted || form1.planDoorDate.$touched)}">
                    <input type="text" class="form-control" uib-datepicker-popup
                      ng-model="data.planDoorDate" name="planDoorDate"
                      is-open="planDoorDate.opened"
                      datepicker-options="dateOptions" ng-required="true"
                      uib-tooltip="此项为必填项"
                      tooltip-enable="form1.planDoorDate.$invalid" /> <span
                      class="input-group-btn">
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
                <label class="control-label  col-md-4">实际上门日期：</label>
                <div class="col-md-8">
                  <p class="input-group"
                    ng-class="{'has-error' : form1.realDoorDate.$invalid && (form1.$submitted || form1.realDoorDate.$touched)}">
                    <input type="text" class="form-control" uib-datepicker-popup
                      ng-model="data.realDoorDate" name="realDoorDate"
                      is-open="realDoorDate.opened"
                      datepicker-options="dateOptions"                       
                      tooltip-enable="form1.realDoorDate.$invalid" /> <span
                      class="input-group-btn">
                      <button type="button" class="btn btn-default"
                        ng-click="openRealDoorDate()">
                        <i class="glyphicon glyphicon-calendar"></i>
                      </button>
                    </span>
                  </p>
                </div>
              </div>

            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group"
                ng-class="{'has-error' : form1.designerMobile.$invalid && (form1.$submitted || form1.designerMobile.$touched)}">
                <label class="control-label required  col-md-4" >设计师电话：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control"
                    ng-pattern="/(^13\d{9}$)|(^14)[5,7]\d{8}$|(^15[0,1,2,3,5,6,7,8,9]\d{8}$)|(^17)[0,1,2,3,5,6,7,8,9]\d{8}$|(^18\d{9}$)/"
                    name="designerMobile" ng-model="data.designerMobile"
                    uib-tooltip="此项为必填项" tooltip-enable="form1.designerMobile.$invalid" required>
                  <div
                    ng-show="form1.designerMobile.$dirty && form1.designerMobile.$invalid">
                    <font size="2" color="red">电话格式不正确</font>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group"
                ng-class="{'has-error' : form1.indentPrice.$invalid && (form1.$submitted || form1.indentPrice.$touched)}">
                <label class="control-label  col-md-4" >订单价格（元）：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control"                    
                    name="indentPrice" ng-model="data.indentPrice" numeric decimals="2">
                  
                </div>
              </div>
            </div>
          </div>
          
          <div class="row">
            <div class="col-md-6">
              <div class="form-group"
                ng-class="{'has-error' : form1.workerRate.$invalid && (form1.$submitted || form1.workerRate.$touched)}">
                <label class="control-label  col-md-4" >工匠比例(%)：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control"                    
                    name="workerRate" ng-model="data.workerRate" numeric decimals="2" ng-pattern="/^-?(100|(([1-9]\d|\d)(\.\d{1,2})?))$/">
                  <div
                    ng-show="form1.workerRate.$dirty && form1.workerRate.$invalid">
                    <font size="2" color="red">请输入100以内的数值</font>
                  </div>
                </div>
                
              </div>
              </div>
             <div class="col-md-6">
              <div class="form-group"
                ng-class="{'has-error' : form1.managerRate.$invalid && (form1.$submitted || form1.managerRate.$touched)}">
                <label class="control-label  col-md-4" >合伙人比例(%)：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control"                    
                    name="managerRate" ng-model="data.managerRate" numeric decimals="2" ng-pattern="/^-?(100|(([1-9]\d|\d)(\.\d{1,2})?))$/">                  
                 <div
                    ng-show="form1.managerRate.$dirty && form1.managerRate.$invalid">
                    <font size="2" color="red">请输入100以内的数值</font>
                  </div>
                </div>
               
              </div>
            </div>
          </div>
           <div class="row">
            <div class="col-md-6">
            
           <div class="form-group">
              <label class="control-label text-nowrap col-md-4">价格体系</label>
              <div class="col-md-8">
              <input type="hidden" id="priceNameId" value="${priceNameId}">
                  <select id="sel" class="form-control" 
                    ng-model="data.priceNameId" required  > <#list
                    priceNameList as item>
                    <option value="${item.v}">${item.n}</option> </#list>
                  </select>
                </div>
          </div>
          </div>
           <div class="col-md-6">
          <div class="form-group"
            ng-class="{ 'has-error': form1.remarks.$invalid && (form1.$submitted || form1.remarks.$touched)}">
            <label class="control-label  col-md-4">备注：</label>
            <div class="col-md-8">
              <textarea type="text" class="form-control" name="remarks"
                ng-model="data.remarks" uib-tooltip=""
                tooltip-enable="form1.remarks.$invalid" ></textarea>
            </div>
          </div>
        </div>
        </div>
          
           </div>
      </div>
      <#if data??>
      
      <div class="panel panel-default">
        <div class="panel-heading">订单内容</div>
        <div class="panel-body">
          <#list serveTypeList as type> <#if type.code1==serveType>
          <div class="form-group">
            <label class="control-label col-md-3">${type.name1}</label>
            <div class="col-md-9">
              <table class="table table-border">
                <#list type.sortList as sort>
                <tr>
                  <td rowspan="${(sort.contentList.size()/3)?ceiling}">${sort.name1}</td>
                  <#list sort.contentList as content> <#if
                  sort.id==content.sctypeSortId>
                  <td><input type="checkbox"
                    ng-model="data.indentPriceDto.indentPrice_${content.id}_checked" >${content.desc1}<input
                    class="form-control" type="text" name="counts"
                    ng-model="data.indentPriceDto.indentPrice_${content.id}_counts"
                    style="width: 70px; display: inline-block; margin: 0 15px;" >${content.unitDisp}
                    <input type="hidden" name="code1"
                    ng-init="data.indentPriceDto.indentPrice_${content.id}_code1='${content.id}'">
                  </td> <#if (content_index+1)%3 == 0>
                </tr>
                <tr></#if> </#if> </#list>
                </tr>
                </#list>
              </table>
            </div>
          </div>
          </#if>
          </#list>
        </div>
      </div>
      </#if>
      
      
      
      
      
      
      <div class="panel panel-default" ng-if="data.serveType == 'T'">
        <div class="panel-heading">提货信息</div>
        <div class="panel-body">
          <div class="form-group" cityselect2>
            <label class="control-label col-md-2">提货地址：</label>
            <div class="col-md-2">
              <select class="form-control" name="regionProv"
                ng-model="data.indentFreight.regionProv"
                ng-options="prov.v as prov.n for prov in provs" >
              </select>
            </div>
            <div class="col-md-2" ng-hide="!cities">
              <select class="form-control" name="regionCity"
                ng-model="data.indentFreight.regionCity"
                ng-options="city.v as city.n for city in cities" >
              </select>
            </div>
            <div class="col-md-2" ng-hide="!dists">
              <select class="form-control" name="regionDist"
                ng-model="data.indentFreight.regionDist"
                ng-options="dist.v as dist.n for dist in dists" > 
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label required col-md-2">详细地址：</label>
            <div class="col-md-10">
              <textarea type="text" class="form-control" name="addr1"
                ng-model="data.indentFreight.addr1" >
                </textarea>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label required col-md-4">提货联系人：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control"
                    name="contacts" ng-model="data.indentFreight.contacts" >
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label required col-md-4">联系电话：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" name="mobile1"
                    ng-model="data.indentFreight.mobile" >
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
                    ng-model="data.indentFreight.code1" >
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label required col-md-4">件数：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control"
                    name="packageNum" ng-model="data.indentFreight.packageNum" >
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
                    ng-model="data.indentFreight.kgs" disabled>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label required col-md-4">要求车型：</label>
                <div class="col-md-8">
                   <select id="sel" class="form-control" name="carModel"
                    ng-model="data.indentFreight.carModel" >
                    <#list vehicleList as item>
                    <option value="${item.value}">${item.text}</option>
                    </#list>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-2">备注：</label>
            <div class="col-md-10">
              <textarea class="form-control" name="comment"
                ng-model="data.indentFreight.comment" ></textarea>
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
                    ng-model="data.contact.name1" required>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label required col-md-4">业主电话：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" name="mobile"
                    ng-model="data.contact.mobile" 
                    ng-pattern="/(^13\d{9}$)|(^14)[5,7]\d{8}$|(^15[0,1,2,3,5,6,7,8,9]\d{8}$)|(^17)[0,1,2,3,5,6,7,8,9]\d{8}$|(^18\d{9}$)/"
                    required>
                    <div ng-show="form1.mobile.$dirty && form1.mobile.$invalid">
                    <font size="2" color="red">电话格式不正确</font>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label required col-md-4">监理名称：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control"　name="supName1"
                     ng-model="data.contact.supName1"                    
                    required>
                   
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label required col-md-4">监理电话：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control"
                  　　 ng-pattern="/(^13\d{9}$)|(^14)[5,7]\d{8}$|(^15[0,1,2,3,5,6,7,8,9]\d{8}$)|(^17)[0,1,2,3,5,6,7,8,9]\d{8}$|(^18\d{9}$)/"
                    name="supMobile" ng-model="data.contact.supMobile" required>
                     <div ng-show="form1.supMobile.$dirty && form1.supMobile.$invalid">
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
                ng-options="city.v as city.n for city in cities" ng-click="showManager()">
              </select>
            </div>
            <div class="col-md-2" ng-hide="!dists">
              <select class="form-control" name="regionDist"
                ng-model="data.regionDist"
                ng-options="dist.v as dist.n for dist in dists" >
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label required col-md-2">详细地址：</label>
            <div class="col-md-6">
              <textarea type="text" class="form-control"
                name="detailAddr1" ng-model="data.contact.detailAddr1" required>
              </textarea>
            </div>
            <div class="col-md-3" ng-class="{'has-error' : form1.buildingNum.$invalid && (form1.$submitted || form1.buildingNum.$touched)}">
              <textarea type="text" class="form-control" name="buildingNum"
                ng-model="data.contact.buildingNum" uib-tooltip="此项为必填项"
                tooltip-enable="form1.buildingNum.$invalid" placeholder="这里输入楼号门牌号" >
              </textarea>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-2">特殊需求：</label>
            <div class="col-md-10">
              <textarea type="text" class="form-control" name="demand"
                ng-model="data.contact.demand" ></textarea>
            </div>
          </div> 
          <div class="form-group">
            <label class="control-label  col-md-2">特殊需求常用语：</label>
            <div class="col-md-10">
              <select id="sel" class="form-control" name="template"  ng-change="setTemplate()" ng-model="template">
                    <#list templateList as item>
                    <option value="${item.text}">${item.text}</option> </#list>
                  </select>
            </div>
          </div>
         <!--  FUJUAN ADD 0528
           <div class="form-group" >    ng-hide="!data.indentAssignSelected"
            <label class="control-label col-md-2"> 指派工匠：</label>
            <div class="col-md-1">
              <input type="checkbox" ng-model="data.indentAssignSelected" />
            </div>
            <div class="col-md-2">
              <input class="form-control" name="managerName1"
                ng-model="data.managerName1" >
            </div>
            <div class="col-md-2">
              <input class="form-control" name="workerName1"
                ng-model="data.workerName1" >
            </div>
          </div> 
          
          -->
          
          <div class="form-group" ng-show="data.regionDist" workerselect>
            <label class="control-label col-md-2"> 指派：</label>
            <div class="col-md-1">
              <input type="checkbox" id="assign" ng-model="data.indentAssignSelected" ng-click="showManager()"/>
            </div>
           <!--  <div class="col-md-2" ng-show="data.indentAssignSelected">
              <select class="form-control" name="managerId"
                ng-model="data.managerId"
                ng-options="manager.v as manager.n for manager in managers">
              </select>
            </div>
            <div class="col-md-2" ng-show="data.indentAssignSelected">
              <select class="form-control" name="workerId"
                ng-model="data.workerId"
                ng-options="worker.v as worker.n for worker in workers">
              </select>
            </div> -->
            <div class="col-md-1" >
              <select class="form-control" name="assignType" ng-model="data.assignType" ng-show="data.indentAssignSelected" >
                  <#list assignType as item>
                    <option value="${item.value}">${item.text}</option> </#list>
              
              </select>
            </div>
              <div class="col-md-2"  ng-show="data.indentAssignSelected && (data.assignType=='WORKER' || data.assignType=='MANAGER')">
                  <select id="sel" class="form-control" name="managerId"
                    ng-model="data.managerId"  ng-change="showWorker()" 
                    ng-options="manager.v as manager.n for manager in managers">
                  </select>
               
          </div>
          <div class="col-md-2" ng-show="data.indentAssignSelected && data.assignType=='WORKER'">
                <select class="form-control" name="workerId"
                   ng-model="data.workerId"
                   ng-options="worker.v as worker.n for worker in workers">
                </select>
               
          </div>
            
          </div>
          
          <div class="form-group" ng-show="data.serveType != 'C'">
            <!--   ng-class="{'has-error' : form1.imgFiles.$invalid && (form1.$submitted || form1.imgFiles.$touched)}"-->
          <!-- <label class="control-label required col-md-2">安装图纸：</label>
            <div class="col-md-10">
            <#list data.dwgImgList as item>
              
             
               <figure itemprop="associatedMedia" itemscope>
                      <a href="" itemprop="contentUrl"
                        data-size="${item.imgWidth}x${item.imgHeight}" target="_BLANK"><img
                        ng-src="${item.fileUrl}" itemprop="thumbnail"
                        alt="安装图纸" width="${item.imgWidthThumbnail}" height="${item.imgHeightThumbnail}" /> </a>
                    </figure>
               XHS END
            
              
          <img src="${item.fileUrl}" height="100" width="100"> 
            </#list>
            </div>  -->
             <div class="form-group">
            <label class="control-label required col-md-2">上传图纸：</label>

            <div class="col-md-10">
              <div class="row" ng-repeat="f in installImgFiles">
                <div class="col-md-4">
                  <span>{{f.fileName}}</span>
                </div>
                <div class="col-md-4">
                  <a href="fs/download.do?fileid={{f.id}}">【下载】</a><a
                    ng-click="delPact(f.id);">【删除】</a>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <input type="file" name="imgFiles" file-model="file.imgFiles"
                      accept="image/*" multiple />
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
          
          <div class="form-group">
         <div class="col-md-8">
                 
                   
                </div>
            <div class="col-md-10 col-md-offset-2">           
            <#if doUpdateAuth==true>
                <button type="submit" class="btn btn-primary" ng-click="update();"  >
                  <span class="glyphicon glyphicon-ok" >保存</span>                                                          
                </button>
              </#if>
             &nbsp;&nbsp;&nbsp;
              <#if doDelAuth==true>
              <button type="button" class="btn btn-danger"
                ng-click="doDelete();">
                <span class="glyphicon glyphicon-trash"></span>&nbsp;删除
              </button>
               </#if>
              &nbsp;&nbsp;&nbsp;
              <button type="button" class="btn btn-primary" ng-click="copy();">
                <span class="glyphicon glyphicon-plus"></span>复制
             </button>
             &nbsp;&nbsp;&nbsp;
              <button type="button" class="btn btn-success"
                ng-click="goBack();">
                <span class="glyphicon glyphicon-chevron-left"></span>&nbsp;返回
              </button>
               &nbsp;&nbsp;&nbsp;
             <!--    <#if finishIndentAuth==true>
              <button type="button" class="btn btn-primary pull-right" ng-if="data.executeStatus == 'CENTRE' "
                ng-click="finishIndent();">
                <span class="glyphicon glyphicon-ok" ></span>&nbsp;强制完成
              </button>
               </#if>
               &nbsp;&nbsp;&nbsp;
                <#if workerChangeAuth==true>
              <button type="button" class="btn btn-primary pull-right"
                ng-click="changeWorker();" ng-if="data.executeStatus == 'CENTRE' ">
                <span class="glyphicon glyphicon-ok" ></span>&nbsp;更换工匠
              </button>
                </#if>
                
                 &nbsp;&nbsp;&nbsp;
                <#if contactAuth==true>
              <button type="button" class="btn btn-primary pull-right"
                ng-click="indentContact();" >
                <span class="glyphicon glyphicon-plus" ></span>&nbsp;新增联系记录
              </button>
                </#if> -->
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>
  <#include "/include/body-end.ftl" />
</body>
</html>