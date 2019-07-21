<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<!-- id -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">&nbsp;*&nbsp;</span>用户ID：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="label label-default radius">${thisUser.id}</span>
			</div>
		</div>
		<!-- nickName* -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">&nbsp;*&nbsp;</span>用户昵称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="label label-default radius">${thisUser.nickName}</span>
			</div>
		</div>
		<!-- passTip -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>密码提示：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="label label-default radius">${thisUser.passTip}</span>
			</div>
		</div>
		<!-- passTipKey -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>密码提示答案：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="label label-default radius">${thisUser.passTipKey}</span>
			</div>
		</div>
		<!-- name -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>真实姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="label label-default radius">${thisUser.name}</span>
			</div>
		</div>
		<!-- IdCard -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>身份证号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="label label-default radius">${thisUser.idCard}</span>
			</div>
		</div>
		<!-- email -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="label label-default radius">${thisUser.email}</span>
			</div>
		</div>
		<!-- phone -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>手机：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="label label-default radius">${thisUser.phone}</span>
			</div>
		</div>
		<!-- createdUser -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>创建人：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="label label-default radius">${createdUser.nickName}</span>
			</div>
		</div>
		<!-- createdTime -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>创建时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="label label-default radius"> <fmt:formatDate
						pattern="yyyy-MM-dd HH:mm:ss"
						value="${thisUser.author.createdTime}" />
				</span>
			</div>
		</div>
		<!-- modifyUser -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>修改人：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="label label-default radius">
					${modifyUser.nickName} </span>
			</div>
		</div>
		<!-- modifyTime -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red"></span>修改时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="label label-default radius"> <fmt:formatDate
						pattern="yyyy-MM-dd HH:mm:ss"
						value="${thisUser.author.modifyTime}" />
				</span>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" id="close"
					value="&nbsp;&nbsp;关闭&nbsp;&nbsp;">
			</div>
		</div>
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

			/*关闭*/
			$('#close').click(function() {
				var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);
			});
		});
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>