<#include "/include/common.ftl" />
<title>查看照片</title>
<#include "/include/common-entry-grid.ftl" />
<#include "/include/photoswipe.ftl" />
<!--  -->
<script type="text/javascript"
  src="static/scripts/indent/indentNodeImgAll.js?randomId=<%=Math.random()%>"></script>
</head>
<body ng-init="id='${id}'">
  <#include "/include/body-begin.ftl" />
  <div ng-controller="IndentNodeImgController">
    <form id="inputForm" name="form1" class="form-horizontal" novalidate>
    
      <div class="panel panel-default">
        <div class="panel-heading"></div>
        <div class="panel-body">
         <div class="row">
            <div class="col-md-12">
              <button type="button" class="btn btn-success pull-center"
                onclick="window.close()">
                <span class="glyphicon glyphicon-chevron-left"></span>&nbsp;关闭
              </button>
            </div>
          </div>
          
          <#list indentNodeStepItems as indentNodeStepItem>
         <#if indentNodeStepItem.imgUrlList> 
          <div class="row">
           <div class="form-group">   
           <div class="col-md-1"></div>
           <div class="col-md-10">
              <label class="control-label text-nowrap col-md-2 "> ${indentNodeStepItem.desc1}&nbsp;&nbsp;&nbsp;&nbsp;${indentNodeStepItem.modifyDate}   </label>
            </div>
            </div>
          </div>
          <div class="row">
            <div class="form-group">           
            <!--   <div> -->
               <!--  <div class="col-md-10">
                  <div class="row"> -->
                    <div class="col-md-1"></div>
                    <div class="col-md-10" >
                      <div class="row">
                      <div class="my-gallery" itemscope>
                       <div class="col-md-10">
                        <!--   <img width="100%" height="200" src="${imgUrl.fileUrl}"> -->
                        <#list indentNodeStepItem.imgUrlList as imgUrl>
                        
                         <figure itemprop="associatedMedia" itemscope >
                          <a href="${imgUrl.fileUrl}" itemprop="contentUrl" data-size="${imgUrl.imgWidth}x${imgUrl.imgHeight}"><img  
                            ng-src="${imgUrl.fileUrl}" itemprop="thumbnail"
                            alt="提报照片" width="${imgUrl.imgWidthThumbnail}"
                            height="${imgUrl.imgHeightThumbnail}" target="_blank"/> </a>
                        </figure>  
                      
                        </#list>    
                       <!--  </div>
                        </div>
                      </div> -->
                    </div>
                    
                  </div>
                 <!--  <div class="row">
                    <div class="col-md-4" >
                                                                                    上传时间：${indentNodeStepItem.modifyDate}
                    </div>
                  </div> -->
                  
                </div>
              </div>
            </div>
          </div>
          <#else>
              <div class="row">
           <div class="form-group">   
           <div class="col-md-1"></div>
           <div class="col-md-10"> 工人没有上传照片！</div>
           </div>
           </div>
          </#if>
          </#list>
         
          
          
          
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