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
	<form action="#" method="post" class="form form-horizontal"
			id="form-category-update"onsubmit="return false">
	<article class="cl pd-20">
		<!-- nickName* -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">&nbsp;*&nbsp;</span>分类id：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${thisCategory.id }" placeholder="分类名称"
						readonly="no"id="id" name="id">
			</div>
		</div>
		<!-- nickName* -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">&nbsp;*&nbsp;</span>分类名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${thisCategory.name}" placeholder="分类名称"
						id="name" name="name">
			</div>
		</div>
		<div class="row cl">
			<div class="col-10">
					<span class="  col-sm-2"><a href="javascript:;" onclick="add()"
					class="btn btn-success radius"><i class="Hui-iconfont"></i>
						更新</a> </span>
				</div>
		</div>
	</article>
</form>
	<!--_footer 作为公共模版分离出去-->
	<jsp:include page="_footer.jsp" />
	<!--/_footer /作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript">
function add(){
	$.ajax({
		url:'${pageContext.request.contextPath}/web/admin/categoryUpdate',
		data:$("#form-category-update").serialize(),
		type:'POST',
		dataType:'JSON',
		success : function(msg) {
			if (msg.code == 1) {
				layer.msg('已更新', {
					icon : 6,
					time : 1000,
					end :function(){
						var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);	
						}
					});
			} else {
				layer.msg(msg.msg, {
					icon : 5,
					time : 1000
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
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>