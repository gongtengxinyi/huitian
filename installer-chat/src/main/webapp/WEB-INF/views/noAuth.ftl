<#include "/include/common.ftl" />
<link rel="stylesheet" href="static/css/homepage.css" type="text/css" />
<script src="static/angular/angular.js"></script>
<script type="text/javascript">
angular.module('app', []);

</script>
</head>
<body>
  <#include "/include/body-begin.ftl" />

  <div class="row">
    <div class="col-md-12">
      <div class="alert alert-warning">对不起，您没有权限查看此页面！
       <button type="button" class="btn btn-success" onclick="javascript:history.go(-1)">
                <span class="glyphicon glyphicon-chevron-left"></span>&nbsp;返回
       
       
    </div>
  </div>

  <#include "/include/body-end.ftl" />
</body>
</html>