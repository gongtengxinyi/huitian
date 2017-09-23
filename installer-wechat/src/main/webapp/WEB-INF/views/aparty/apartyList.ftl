<#include "/include/common.ftl" />
<title>甲方管理查询</title>
<#include "/include/common-list.ftl" />
<!-- placeholder -->
<#include "/include/common-cityselect.ftl" />

<script src="static/scripts/aparty/apartyList.js?randomId=<%=Math.random()%>"></script>
</head>
<body>
  <#include "/include/body-begin.ftl" />

  <div ng-controller="ApartyListController">
  <p>
  <p align="right"> <a href="javascript:;" id="toggle_keleyi_com" target="_self">
    筛选面板收起&lt;&lt;</a>&nbsp;&nbsp;&nbsp;&nbsp;</p>
    <script type="text/javascript">
      $(function() {
        $("#toggle_kel" + "eyi_com").click(function() {
          $(this).text($("#content").is(":hidden") ? "筛选面板收起<<" : "筛选面板展开>>");
          $("#content").slideToggle();
        });
      });
    </script>
    <input type="hidden" id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
    <div class="panel panel-default form-horizontal" id="content"  style="display: yes;">
      <div class="panel-heading">甲方管理查询</div>
      <div class="panel-body">
        <!-- row1 begin -->
        <div class="row">
          <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">甲方名称</label>
              <div class="col-md-8">
                <input type="text" class="form-control" ng-keyup="autoQuery($event)"
                  ng-model="sf.name1">
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">联系人</label>
              <div class="col-md-8">
                <input type="text" class="form-control" ng-keyup="autoQuery($event)"
                  ng-model="sf.contacts1.name1">
              </div>
            </div>
          </div>

          <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">联系电话</label>
              <div class="col-md-8">
                <input type="text" class="form-control" ng-keyup="autoQuery($event)"
                  ng-model="sf.contacts1.mobile">
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">业务员</label>
              <div class="col-md-8">
                <input type="text" class="form-control" ng-keyup="autoQuery($event)"
                  ng-model="sf.contacts2.name1">
              </div>
            </div>
          </div>
        </div>
        <!-- row1 end -->

        <!-- row2 begin -->
        <div class="row">
          <!-- region begin -->
          <div class="col-md-6">
            <div class="form-group" cityselect>
              <label class="control-label text-nowrap col-md-4 col-lg-2">所在地区</label>
              <div class="col-md-8 col-lg-10">
                <div class="row">
                  <div class="col-md-4">
                    <select class="form-control" name="regionProv" ng-change="query()"
                      ng-model="sf.regionProv"
                      ng-options="prov.v as prov.n for prov in provs">
                    </select>
                  </div>
                  <div class="col-md-4" ng-hide="!cities">
                    <select class="form-control" name="regionCity" ng-change="query()"
                      ng-model="sf.regionCity"
                      ng-options="city.v as city.n for city in cities">
                    </select>
                  </div>
                  <div class="col-md-4" ng-hide="!dists">
                    <select class="form-control" name="regionDist" ng-change="query()"
                      ng-model="sf.regionDist"
                      ng-options="dist.v as dist.n for dist in dists">
                    </select>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- region end -->

          <!-- crtDate begin -->
          <div class="col-md-6">
            <div class="row">
              <label class="control-label text-nowrap col-md-4 col-lg-2">登记日期</label>
              <div class="col-md-8 col-lg-10">
                <div class="row">
                  <div class="col-md-6">

                    <div class="input-group">
                      <input type="text" class="form-control" ng-keyup="autoQuery($event)"
                        uib-datepicker-popup ng-model="sf.crtDateBegin"
                        is-open="crtDateBegin.opened" />
                      <!-- calendar btn -->
                      <span class="input-group-btn">
                        <button type="button" class="btn btn-default"
                          ng-click="openCrtDateBegin()">
                          <i class="glyphicon glyphicon-calendar"></i>
                        </button>
                      </span>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="input-group">
                      <input type="text" class="form-control" ng-keyup="autoQuery($event)"
                        uib-datepicker-popup ng-model="sf.crtDateEnd"
                        is-open="crtDateEnd.opened" />
                      <!-- calendar btn -->
                      <span class="input-group-btn">
                        <button type="button" class="btn btn-default"
                          ng-click="openCrtDateEnd()">
                          <i class="glyphicon glyphicon-calendar"></i>
                        </button>
                      </span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- crtDate end -->
        </div>
        <!-- row2 end -->

        <!-- row btn begin -->
       
        <div class="row">
        
         <div class="col-md-6 col-lg-3">
            <div class="form-group">
              <label class="control-label text-nowrap col-md-4">状态</label>
              <div class="col-md-8">
                <select class="form-control" ng-model="sf.apartyStatus" ng-change="query()" ng-init="sf.apartyStatus='${sf.apartyStatus}'">
                  <#list itemStatusList as s>
                  <option value="${s.value}"<#if
                    s.value=='${sf.apartyStatus}'>selected="true"</#if>
                    >${s.text}</option> </#list>
                </select>
              </div>
            </div>
          </div>
           <div class="col-md-6 col-lg-3">           
            
             <div class="col-md-6" class="form-group">
             
            
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="isZhizhuang" id="isZhizhuang" ng-model="sf.isZhizhuang">直装用户               
               
             </div>
           </div>
            <div class="col-md-6 col-lg-3">
           </div>
           <div class="col-md-6 col-lg-3">
               
           </div>
        
          <div class="col-md-6  col-lg-3" pull-right">
            <button class="btn btn-warning pull-right"
              ng-click="query()">
              <span class="glyphicon glyphicon-search"></span>&nbsp;筛选
            </button>
          </div>
        </div>
        <!-- row btn end -->
      </div>
      <!-- panel body end -->
    </div>
    <!-- panel end -->

    <div class="panel panel-default">
      <table class="table table-bordered table-striped">
        <thead>
          <tr>
            <th width="100px">甲方编码</th>
            <th width="200px">甲方名称</th>
            <th width="80px">联系人</th>
            <th width="100px">联系电话</th>
            <th width="100px">联系邮箱</th>
            <th width="80px">业务员</th>
            <th width="100px">累计充值</th>
            <th width="100px">当前余额</th>
            <th width="160px">操作</th>
          </tr>
        </thead>
        <tbody ng-repeat="data in rows">
          <tr>
            <td>{{data.code1}}</td>
            <td><a href="aparty/apartyEdit.do?id={{data.id}}&&pageNo={{pager.currentPage}}">{{data.name1}}</a></td>
            <td>{{data.contacts1.name1}}</td>
            <td>{{data.contacts1.mobile}}</td>
            <td>{{data.contacts1.email}}</td>
            <td>{{data.contacts2.name1}}</td>
            <td style="text-align:center">{{data.profitAmt}}</td>
            <td style="text-align:center">{{data.balance}}</td>
            <!-- tableA样式只针对 操作项 -->
            <td><span ng-if="data.apartyStatus == 'ENABLED'">
                <a class="btn btn-success btn-xs"
                href="item/itemAdd.do?apartyId={{data.id}}&&pageNo={{pager.currentPage}}"><span
                  class="glyphicon glyphicon-plus"></span>&nbsp;项目</a>&nbsp;
                <a ng-click="doClose(data.id);"
                class="btn btn-warning btn-xs" ng-if="${controlAparty}==true"><span
                  class="glyphicon glyphicon-pause" ></span>&nbsp;甲方</a>
            </span>
             <span ng-if="data.hasPrice == 'NO'"> <a  class="btn btn-success btn-xs" href="aparty/apartyPriceAdd.do?apartyId={{data.id}}&&pageNo={{pager.currentPage}}"><span
                  class="glyphicon glyphicon-plus"></span>&nbsp;新增报价</a>
            </span>
             <span ng-if="data.hasPrice == 'YES'"> <a  class="btn btn-success btn-xs" href="aparty/apartyPriceEdit.do?apartyId={{data.id}}&&pageNo={{pager.currentPage}}"><span
                  class="glyphicon glyphicon-eye-open"></span>&nbsp;查看报价</a>
            </span>
             <span ng-if="data.apartyStatus == 'DISABLED'"> <a
                ng-click="doOpen(data.id);"
                class="btn btn-warning btn-xs" ng-if="${controlAparty}==true"><span
                  class="glyphicon glyphicon-play-circle"></span>&nbsp;甲方</a>
            </span></td>
          </tr>
        </tbody>
      </table>
      <div class="panel-footer">
        <!--  -->
        <#include "/include/pagination.ftl" />
      </div>
    </div>

    <#include "/include/body-end.ftl" />
</body>
</html>