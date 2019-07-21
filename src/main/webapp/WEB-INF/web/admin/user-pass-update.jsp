<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--_meta 作为公共模版分离出去-->
<jsp:include page="_meta.jsp"/>
<!--/meta 作为公共模版分离出去-->

<title>修改密码 - 会员管理 - H-ui.admin v3.0</title>
<meta name="keywords" content="H-ui.admin v3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="cl pd-20">
	<form action="${pageContext.request.contextPath}/web/admin/updateUserPass" method="post" class="form form-horizontal" id="form-change-password">
		<div class="row cl hidden">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户ID：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="label label-default radius"> <input
						type="text" class="input-text" value="${thisUser.id}" id="id"
						name="id" readonly unselectable="on" /></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>账户：</label>
			<div class="formControls col-xs-8 col-sm-9"> ${thisUser.nickName }</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>新密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" autocomplete="off" placeholder="不修改请留空" name="password" id="password" value="${thisUser.password }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>确认密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" autocomplete="off" placeholder="不修改请留空" name="password2" id="new-password2" value="${thisUser.password }">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<jsp:include page="_footer.jsp"/>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript">
$(function(){
	$("#form-change-password").validate({
		rules:{
			password:{
				required:true,
				minlength:6,
				maxlength:16
			},
			password2:{
				required:true,
				minlength:6,
				maxlength:16,
				equalTo: "#password"
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type : 'POST',
				dataType : "JSON",
				success : function(msg) {
					if (msg.code == 1) {
						layer.msg('密码已更新!', {icon : 6,time : 1000,end:function(){
							var index = parent.layer.getFrameIndex(window.name);
							parent.$('.btn-refresh').click();
							parent.layer.close(index);
							}});
					} else {
						layer.msg(msg.msg, {
							icon : 5,
							time : 1000,
						});
					}
				},
				error : function() {
					layer.msg('服务器繁忙', {
							icon : 5,
							time : 1000
						});
				},
				complete : function(xmlhttprequest,textstatus) {
					if ("REDIRECT" == xmlhttprequest.getResponseHeader("REDIRECT")) {
						var win = window;
						while (win != win.top) {
							win = win.top;
						}
						win.location.href = xmlhttprequest.getResponseHeader("CONTENTPATH");
					}
				}
			});
		}
	});
});
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>