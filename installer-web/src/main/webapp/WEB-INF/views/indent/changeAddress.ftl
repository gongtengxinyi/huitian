<#include "/include/common.ftl" />
<title></title>
<#include "/include/common-entry-grid.ftl" />
<#include "/include/common-cityselect2.ftl" />
<!--  -->


<script type="text/javascript" src="static/scripts/indent/changeAddress.js?randomId=<%=Math.random()%>"></script>
</head>
<body ng-init="data.indentId='${id}'">
  <#include "/include/body-begin.ftl" />
  <div ng-controller="IndentController">
    <form id="inputForm" name="form1" class="form-horizontal" novalidate enctype="multipart/form-data">
    <input type="hidden" id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
    <input type="hidden" id="indentId" ng-model="data.indentId" value="${id}" ng-init="data.indentId='${id}'">
      <div class="panel panel-default">
        <div class="panel-heading">修改业主地址</div>
        <div class="panel-body">
        
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label required col-md-4">业主名称：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" name="name1"
                    maxlength="60" ng-model="data.name1" required>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label required col-md-4">业主电话：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" name="mobile"
                    maxlength="11" ng-model="data.mobile"
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
                <label class="control-label  col-md-4">工长名称：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" name="headName"
                    maxlength="60" ng-model="data.headName">
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label  col-md-4">工长电话：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" name="headMobile"
                    maxlength="11" ng-model="data.headMobile"
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
                <label class="control-label required col-md-4">监理名称：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" 　name="supName1"
                    maxlength="60" ng-model="data.supName1">

                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label required col-md-4">监理电话：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" maxlength="11"
                    　　 ng-pattern="/(^13\d{9}$)|(^14)[5,7]\d{8}$|(^15[0,1,2,3,5,6,7,8,9]\d{8}$)|(^17)[0,1,2,3,5,6,7,8,9]\d{8}$|(^18\d{9}$)/"
                    name="supMobile" ng-model="data.supMobile">
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
                maxlength="200" ng-model="data.detailAddr1" required>
              </textarea>
            </div>
            <div class="col-md-3"
              ng-class="{'has-error' : form1.buildingNum.$invalid && (form1.$submitted || form1.buildingNum.$touched)}">
              <textarea type="text" class="form-control" name="buildingNum"
                maxlength="100" ng-model="data.buildingNum"
                uib-tooltip="此项为必填项" tooltip-enable="form1.buildingNum.$invalid"
                placeholder="这里输入楼号门牌号">
              </textarea>
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
                  <!--   <a href="fs/download.do?fileid={{f.id}}">【下载】</a> -->
                    <a href=""  ng-click="delPact(f.id);">【删除】</a>
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

          
          
      
     <div class="form-group">
            <div class="col-md-10 col-md-offset-2">
            <button type="submit" class="btn btn-primary" ng-click="update();">
                <span class="glyphicon glyphicon-ok"></span>保存
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