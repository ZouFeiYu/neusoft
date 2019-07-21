<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				class="c-red">&nbsp;*&nbsp;</span>分类ID：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="label label-default radius">${thisCategory.id}</span>
			</div>
		</div>
		<!-- nickName* -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">&nbsp;*&nbsp;</span>分类名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="label label-default radius">${thisCategory.name}</span>
			</div>
		</div>
		<!-- passTip -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">&nbsp;</span>分类排序：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="label label-default radius">${thisCategory.orders}</span>
			</div>
		</div>
		<!-- createdUser -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">&nbsp;</span>创建人：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="label label-default radius">${createdUser.nickName}</span>
			</div>
		</div>
		<!-- createdTime -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">&nbsp;</span>创建时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="label label-default radius"> - <fmt:formatDate
						pattern="yyyy-MM-dd HH:mm:ss"
						value="${thisCategory.author.createdTime}" />
				</span>
			</div>
		</div>
		<!-- modifyUser -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">&nbsp;</span>修改人：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="label label-default radius">
					${modifyUser.nickName} </span>
			</div>
		</div>
		<!-- modifyTime -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">&nbsp;</span>修改时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="label label-default radius"> <fmt:formatDate
						pattern="yyyy-MM-dd HH:mm:ss"
						value="${thisCategory.author.modifyTime}" />
				</span>
			</div>
		</div>
		<div class="row cl">
			<div class="col-10">
				<span class="  col-sm-2"><a href="javascript:;"
					onclick="add()" class="btn btn-success radius"><i
						class="Hui-iconfont">&#xe600;</i> 添加子分类</a> </span>
			</div>
			<div class="col-9">
				<span class="  col-sm-2"><a href="javascript:;"
					onclick="layer_show('添加分类','${pageContext.request.contextPath }/web/admin/categoryUpdatePage?id=${thisCategory.id}',400,300);"
					class="btn btn-primary radius"><i class="Hui-iconfont">&#xe60c;</i>
						修改分类</a> </span>
			</div>
			<div class="col-9">
				<c:if test="${thisCategory.status==1 }">
				<span class="  col-sm-2"><a href="javascript:;"
					onclick="updateState(${thisCategory.id},0)" class="btn btn-warning radius"><i
						class="Hui-iconfont">&#xe631;</i> 禁用分类</a> </span>
				</c:if>
				<c:if test="${thisCategory.status==0 }">
				<span class="  col-sm-2"><a href="javascript:;"
					onclick="updateState(${thisCategory.id},1)" class="btn btn-primary radius"><i
						class="Hui-iconfont">&#xe615;</i> 启用分类</a> </span>
				</c:if>
			</div>
			<div class="col-9">
				<span class="  col-sm-2"><a href="javascript:;"
					onclick="updateState(${thisCategory.id},-1)" class="btn btn-danger radius"><i
						class="Hui-iconfont">&#xe6e2;</i> 删除</a> </span>
			</div>
		</div>
	</article>

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
		function add() {
			layer_show(
					'添加分类',
					'${pageContext.request.contextPath }/web/admin/categoryAddPage?parentId=${thisCategory.id}',
					400, 300);
		}
		function updateState(id,state){
			$.ajax({
				url:'${pageContext.request.contextPath}/web/admin/categoryUpdateState',
				data:{'id':id,'status':state},
				type:'POST',
				dataType:'JSON',
				success : function(msg) {
					if (msg.code == 1) {
						layer.msg('已更新', {
							icon : 6,
							time : 1000,
							end :function(){
								location.replace(location.href);
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