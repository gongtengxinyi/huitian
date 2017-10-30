<#include "/include/common.ftl" /> <#include "/include/common-entry.ftl"
/>
<!--  -->
<#include "/include/common-cityselect.ftl" />
<title>订单评价详情</title>
<#include "/include/photoswipe.ftl" />
<script type="text/javascript"
  src="static/scripts/indent/indentEvaluateMsg.js?randomId=<%=Math.random()%>"></script>
</head>
<body ng-init="data.id='${indentId}'">
  <#include "/include/body-begin.ftl" />
  <div ng-controller="indentEvaluateMsgController">
    <form id="inputForm" name="form1" class="form-horizontal" novalidate
      enctype="multipart/form-data">
     <input type="hidden" id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
     <input type="hidden" id="indentId" value="${indentId}" ng-init="indentId='${indentId}'">
      <div class="panel panel-default">
        <div class="panel-heading">订单评价详情</div>
        <div class="panel-body">

          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label col-md-4">业主姓名：</label>
                <div class="col-md-8">
                  <p class="form-control-static">{{data.indentContact.name1}}</p>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label col-md-4">业主地址：</label>
                <div class="col-md-8">
                  <p class="form-control-static">{{data.indentContact.detailAddr1}}</p>
                </div>
              </div>
            </div>
          </div>


          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label col-md-4">安装技能评分：</label>
                <div class="col-md-8">
                  <p class="form-control-static">{{data.skillScore}}分</p>
                </div>
              </div>
            </div>
            
           <!--  <div class="col-md-6">
              <div class="form-group">
                <label class="control-label col-md-4">服务态度评分：</label>
                <div class="col-md-8">
                  <p class="form-control-static">{{data.serveScore}}分</p>
                </div>
              </div>
            </div>
          </div> -->

          <div class="form-group">
            <label class="control-label col-md-2">业主评价：</label>
            <div class="col-md-10">
              <textarea type="text" class="form-control" disabled>{{data.content}}</textarea>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-2">业主上传照片：</label>
            <div class="my-gallery" itemscope>
              <div class="col-md-10">
                <figure ng-repeat="imgUrl in data.imgUrlList">
                  <a href="{{imgUrl}}" itemprop="contentUrl"
                    data-size="600x800"><img ng-src="{{imgUrl}}"
                    itemprop="thumbnail" alt="业主上传照片" width="250"
                    height="120" target="_blank"/> </a>
                    
                </figure>
               
               
              </div>
            </div>
          </div>
          
           <div class="row">
           <!--  <div class="col-md-6">
              <div class="form-group">
                <label class="control-label col-md-4">工人邀请评价时间：</label>
                <div class="col-md-8">
                  <p class="form-control-static">{{data.workerInviteDate}}</p>
                </div>
              </div>
            </div> -->
            <div class="col-md-6">
              <div class="form-group">
                <label class="control-label col-md-4">业主评价时间：</label>
                <div class="col-md-8">
                  <p class="form-control-static">{{data.createDate}}</p>
                </div>
              </div>
            </div>
          </div>

          <div class="form-group">
            <div class="col-md-4 col-md-offset-2">
              <button type="button" class="btn btn-success" onclick="window.close()"
                ><!-- ng-click="goBack();" -->
                <span class="glyphicon glyphicon-chevron-left"></span>&nbsp;关闭
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