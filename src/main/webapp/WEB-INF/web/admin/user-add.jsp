<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--_meta 作为公共模版分离出去-->
<jsp:include page="_meta.jsp" />
<!--/meta 作为公共模版分离出去-->

<title>添加管理员 - 管理员管理 - H-ui.admin v3.0</title>
<meta name="keywords"
	content="H-ui.admin v3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description"
	content="H-ui.admin v3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
	<article class="cl pd-20">
		<form action="#" method="post" class="form form-horizontal"
			id="form-admin-add"onsubmit="return false">
			<!-- nickName* -->
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">&nbsp;*&nbsp;</span>用户昵称：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder="管理员昵称"
						id="nickName" name="nickName">
				</div>
			</div>
			<!-- password* -->
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">&nbsp;*&nbsp;</span>初始密码：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="password" class="input-text" autocomplete="off"
						value="" placeholder="密码" id="password" name="password">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">&nbsp;*&nbsp;</span>确认密码：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="password" class="input-text" autocomplete="off"
						placeholder="确认新密码" id="password2" name="password2">
				</div>
			</div>
			<!-- passTip -->
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red"></span>密码提示：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" autocomplete="off"
						placeholder="密码提示" id=passTip name="passTip">
				</div>
			</div>
			<!-- passTipKey -->
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red"></span>密码提示答案：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" autocomplete="off"
						placeholder="密码提示答案" id="passTipKey" name="passTipKey">
				</div>
			</div>
			<!-- name -->
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red"></span>真实姓名：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" autocomplete="off"
						placeholder="真实姓名" id="name" name="name">
				</div>
			</div>
			<!-- IdCard -->
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red"></span>身份证号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" autocomplete="off"
						placeholder="身份证号" id="IdCard" name="IdCard">
				</div>
			</div>
			<!-- email -->
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red"></span>邮箱：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" placeholder="@" name="email"
						id="email">
				</div>
			</div>
			<!-- phone -->
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red"></span>手机：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder=""
						id="phone" name="phone">
				</div>
			</div>
			<!-- <div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="radio-box">
					<input name="sex" type="radio" id="sex-1" checked>
					<label for="sex-1">男</label>
				</div>
				<div class="radio-box">
					<input type="radio" id="sex-2" name="sex">
					<label for="sex-2">女</label>
				</div>
			</div>
		</div> -->
			<!-- <div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">角色：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box" style="width:150px;">
				<select class="select" name="adminRole" size="1">
					<option value="0">超级管理员</option>
					<option value="1">总编</option>
					<option value="2">栏目主辑</option>
					<option value="3">栏目编辑</option>
				</select>
				</span> </div>
		</div> -->
			<!-- <div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">备注：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<textarea name="" cols="" rows="" class="textarea"
						placeholder="说点什么...100个字符以内" dragonfly="true"
						onKeyUp="textarealength(this,100)"></textarea>
					<p class="textarea-numberbar">
						<em class="textarea-length">0</em>/100
					</p>
				</div>
			</div> -->
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input class="btn btn-primary radius" type="submit"
						value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</article>

	<!--_footer 作为公共模版分离出去-->
	<jsp:include page="_footer.jsp" />
	<!--/_footer /作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript">
		$(function() {
			$('.skin-minimal input').iCheck({
				checkboxClass : 'icheckbox-blue',
				radioClass : 'iradio-blue',
				increaseArea : '20%'
			});

			$("#form-admin-add").validate({
				rules : {
					nickName : {
						required : true,
						minlength : 4,
						maxlength : 16
					},
					password : {
						required : true,
					},
					password2 : {
						required : true,
						equalTo : "#password"
					},
					/* sex : {
						required : true,
					}, */
					phone : {
						required : false,
						isPhone : true,
					},
					email : {
						required : false,
						email : true,
					},
					adminRole : {
						required : true,
					},
				},
				onkeyup : false,
				focusCleanup : true,
				success : "valid",
				submitHandler : function(form) {
					/* $(form).ajaxSubmit();
					var index = parent.layer.getFrameIndex(window.name);
					parent.$('.btn-refresh').click();
					parent.layer.close(index); */
					 
					$(form).ajaxSubmit({
						url:'${pageContext.request.contextPath}/web/admin/addUser',
						type:'POST',
						//data:$(form).serialize(),
						dataType : "JSON",
						success : function(msg) {
							if(msg.code==1){
								layer.msg('添加成功!', {
									icon : 6,
									time : 1000,
									end:function(){
										var index = parent.layer.getFrameIndex(window.name);
										parent.layer.close(index);									}
									});
							}else{
								layer.msg(msg.msg, {
									icon : 5,
									time : 1000
								});
							}
						},
						error : function() {
							layer.msg('已服务器繁忙', {
								icon : 6,
								time : 1000
							});
						},
						complete : function(xmlhttprequest, textstatus) {
							if ("REDIRECT" == xmlhttprequest
									.getResponseHeader("REDIRECT")) {
								var win = window;
								while (win != win.top) {
									win = win.top;
								}
								win.location.href = xmlhttprequest
										.getResponseHeader("CONTENTPATH");
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