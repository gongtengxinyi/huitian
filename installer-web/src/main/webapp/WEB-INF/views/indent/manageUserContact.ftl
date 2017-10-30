<#include "/include/common.ftl" />
<style type="text/css">
.grid {
  width: 100%;
  height: 140px;
}
</style>
<title>订单异常信息</title>

<#include "/include/common-entry-grid.ftl" />
<#include "/include/photoswipe.ftl" />
<!--  -->
<script src="static/js/jwplayer.js"></script>
<script src="static/scripts/indent/manageUserContact.js?randomId=<%=Math.random()%>"></script>

</head>

<body ng-init="data.id='${id}'">
  <#include "/include/body-begin.ftl" />

  <div ng-controller="manageExceptionController">

    <form name="form1" class="form-horizontal" novalidate>
    <input type="hidden" id="pageNo" value="${pageNo}" ng-init="pageNo='${pageNo}'">
      <div class="panel panel-default">
        <div class="panel-heading">留言信息</div>
        <div class="panel-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="code1"
                  class="control-label col-md-4">业主姓名：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="code1"
                    name="data.name1" ng-model="data.name1"
                    disabled>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="name1"
                  class="control-label col-md-4">业主电话：</label>
                <div class="col-md-8">
                  <input type="text" class="form-control" id="name1"
                    name="data.mobile" ng-model="data.mobile" disabled>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="form-group">
              <label class="control-label col-md-2">留言内容：</label>
              <div class="col-md-10">
                <textarea type="text" class="form-control"
                  name="content" ng-model="data.speak" disabled></textarea>
              </div>
            </div>
          </div>
         <!--  <div class="row" ng-if="data.imgUrlList != ''">
            <div class="form-group">
              <label class="control-label col-md-2">提报图片：</label>
              
              <div class="col-md-10">
             
                <div class="row">
                  
                  <div class="col-md-10" >
                 
                    <div class="row">
                     <div class="my-gallery" itemscope>
                      <div class="col-md-12">                     
                      XHS20160526                       
                        <figure  ng-repeat="imgUrl in data.imgUrlList"  >
                          <a href="{{imgUrl.fileUrl}}" itemprop="contentUrl" data-size="{{imgUrl.imgWidth}}x{{imgUrl.imgHeight}}">
                          <img
                            ng-src="{{imgUrl.fileUrl}}" itemprop="thumbnail"
                            alt="提报照片" width="{{imgUrl.imgWidthThumbnail}}"
                            height="{{imgUrl.imgHeightThumbnail}}" target="_blank"/> </a>
                        </figure>                      
                      </div>                   
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row" ng-repeat="imgUrl in data.amrUrlList">
            <div class="form-group">
              <label class="control-label col-md-2">音频：</label>
              <div class="col-md-10" onload="playAac(imgUrl.id,imgUrl.fileUrl)">
                <button class="icon-audio" id="playerBtn"
                  style="margin: 0 5px; cursor: pointer;"
                  ng-click="playAac(imgUrl.id,imgUrl.fileUrl)">播放</button>
                <div id="myElement_{{imgUrl.id}}" bgcolor="black"></div>


              </div>

            </div>

          </div> -->
         
          
          <div class="row">
            <div class="form-group">
              <label class="control-label col-md-2">回复内容：</label>
              <div class="col-md-10">
                <textarea type="text" class="form-control" name="idea"
                  ng-model="data.answer" required></textarea>
                 
              </div>
            </div>
          </div>
           <#if result!="">
           <div class="row">
            <div class="form-group"
              ng-class="{'has-error' : form1.adminName1.$invalid && (form1.$submitted || form1.adminName1.$touched)}">
              <label class="control-label col-md-2">处理人：</label>
              <div class="col-md-10">
                <input type="text" class="form-control" name="adminName1"
                  ng-model="data.adminName1" disabled>
              </div>
            </div>
          </div>
          </#if>
          <div class="row">
            <div class="col-md-10 col-md-offset-2">
             <#if updateExc==true>
              <button ng-if="data.ifAnswer == 'NO'" type="submit" class="btn btn-primary"
                ng-click="save();">
                <span class="glyphicon glyphicon-ok"></span>&nbsp;保存
              </button>
             </#if>
              <span >&nbsp;&nbsp;&nbsp;</span>
              <button type="button" class="btn btn-success"
                onclick="window.close()">
                <span class="glyphicon glyphicon-chevron-left"></span>&nbsp;关闭
              </button>
            </div>
          </div>
        </div>
      </div>
    </form>
    
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
