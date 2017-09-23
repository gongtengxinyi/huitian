<#include "/include/common.ftl" /> <#include "/include/common-entry.ftl"
/>
<!--  -->
<#include "/include/common-cityselect.ftl" />
<title>签到详情</title>
<#include "/include/photoswipe.ftl" />
<script type="text/javascript"
  src="static/scripts/indent/indentShowSignDetail.js?randomId=<%=Math.random()%>"></script>
</head>
<body ng-init="id='${id}'">
  <#include "/include/body-begin.ftl" />
  <div ng-controller="indentEvaluateMsgController">
    <form id="inputForm" name="form1" class="form-horizontal" novalidate
      enctype="multipart/form-data">
      <input type="hidden" id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
      <div class="panel panel-default">
        <div class="panel-heading">签到详情</div>
        <div class="panel-body">
 <#if flag=="sign">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label col-md-4">业主姓名：</label>
                <div class="col-md-8">
                  <p class="form-control-static" >${data.contact.name1}</p>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label col-md-4">业主地址：</label>
                <div class="col-md-8">
                  <p class="form-control-static">${data.contact.districtDisp}${data.contact.detailAddr1}</p>
                </div>
              </div>
            </div>
          </div>


          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label col-md-4">签到地址：</label>
                <div class="col-md-8">
                  <p class="form-control-static">${data.signAddress}</p>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label col-md-4">签到位置差：</label>
                <div class="col-md-8">
                  <p class="form-control-static">${data.signDistance}米</p>
                </div>
              </div>
            </div>
          </div>
          
          
           <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label col-md-4">签到时间：</label>
                <div class="col-md-8">
                  <p class="form-control-static">${data.signDate}</p>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                
              </div>
            </div>
          </div>
 </#if>
 <#if flag=="goods">  <!--  产品入场 -->
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label col-md-4">业主姓名：</label>
                <div class="col-md-8">
                  <p class="form-control-static" >${data.contact.name1}</p>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label col-md-4">业主地址：</label>
                <div class="col-md-8">
                  <p class="form-control-static">${data.contact.districtDisp}${data.contact.detailAddr1}</p>
                </div>
              </div>
            </div>
          </div>


          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label col-md-4">入场签到地址：</label>
                <div class="col-md-8">
                  <p class="form-control-static">${data.indentFreight.signAddressJinchang}</p>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label col-md-4">签到位置差：</label>
                <div class="col-md-8">
                  <p class="form-control-static">${data.indentFreight.signDistanceJinchang}米</p>
                </div>
              </div>
            </div>
          </div>
          
          
           <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label col-md-4">签到时间：</label>
                <div class="col-md-8">
                  <p class="form-control-static">${data.indentFreight.signDateJinchang}</p>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                
              </div>
            </div>
          </div>
 </#if>
 <#if flag=="logistic">  <!--  物流提货 -->
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label col-md-4">业主姓名：</label>
                <div class="col-md-8">
                  <p class="form-control-static" >${data.contact.name1}</p>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label col-md-4">提货地址：</label>
                <div class="col-md-8">
                  <p class="form-control-static">${data.indentFreight.districtDisp}${data.indentFreight.addr1}</p>
                </div>
              </div>
            </div>
          </div>


          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label col-md-4">签到地址：</label>
                <div class="col-md-8">
                  <p class="form-control-static">${data.indentFreight.signAddress}</p>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label col-md-4">签到位置差：</label>
                <div class="col-md-8">
                  <p class="form-control-static">${data.indentFreight.signDistance}米</p>
                </div>
              </div>
            </div>
          </div>
          
          
           <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label col-md-4">签到时间：</label>
                <div class="col-md-8">
                  <p class="form-control-static">${data.indentFreight.signDate}</p>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                
              </div>
            </div>
          </div>
 </#if>
          

          <div class="form-group">
            <div class="col-md-4 col-md-offset-2">
              <button type="button" class="btn btn-success"
                ng-click="goBack();">
                <span class="glyphicon glyphicon-chevron-left"></span>&nbsp;返回
              </button>
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>

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