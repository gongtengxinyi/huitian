<div align="right" style="vertical-align: middle;">
	<div class="row">
		<div class="col-md-8"></div>

		<div class="col-md-2">
			<div style="display: none;" id="yes">
				<div class="row" style="height: 30px; width: 30px">
					<img src="static/images/sign-check-icon.png" alt=""
						class="img-responsive">
				</div>
			</div>
			<div style="display: none;" id="no">
				<div class="row" style="height: 30px; width: 30px">
					<img src="static/images/sign-error-icon.png" alt=""
						class="img-responsive" id="errorImage"
						onclick="connectWebsocket();">
				</div>
			</div>
		</div>
		<div class="col-md-2">
			<span
				style="font-family: Microsoft YaHei UI; font-size: 16px; color: green; margin-left: 30px"
				id="messageNotice2">消息提醒</span>&nbsp; <span id="messageNotice"
				style="display: none"> <img style="width: 18px; height: 18px"
				src="static/images/notice.jpg">
			</span> <span
				style="font-family: Microsoft YaHei UI; font-size: 16px; color: green; margin-left: 10px"
				id="messageOpen">打开/关闭</span>
		</div>
	</div>
</div>
<div id="contentBa"
	style="background-color: white; display: none; margin-right: 30px; height: 500px; width: 600px; float: right; overflow: scroll;">

</div>
<script type="text/javascript">
	$(function() {
		$("#messageOpen").click(function() {
			$("#contentBa").slideToggle();
		});
	});
</script>





