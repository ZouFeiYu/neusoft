<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--_meta 作为公共模版分离出去-->
<jsp:include page="_meta.jsp" />
<!--/meta 作为公共模版分离出去-->

<title>管理员列表 - 管理员列表 - H-ui.admin v3.0</title>
<meta name="keywords"
	content="H-ui.admin v3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description"
	content="H-ui.admin v3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
	<!--_header 作为公共模版分离出去-->
	<jsp:include page="_header.jsp" />
	<!--/_header 作为公共模版分离出去-->

	<!--_menu 作为公共模版分离出去-->
	<jsp:include page="_menu.jsp" />
	<!--/_menu 作为公共模版分离出去-->

	<section class="Hui-article-box">
		<nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
			管理员管理 <span class="c-gray en">&gt;</span> 管理员列表 <a
				class="btn btn-success radius r"
				style="line-height: 1.6em; margin-top: 3px"
				href="javascript:location.replace(location.href);" title="刷新"><i
				class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<div class="Hui-article">
			<article class="cl pd-20">
<!-- 				<div class="text-c">
					日期范围： <input type="text"
						onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})"
						id="datemin" class="input-text Wdate" style="width: 120px;"> -
					<input type="text"
						onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})"
						id="datemax" class="input-text Wdate" style="width: 120px;">
					<input type="text" class="input-text" style="width: 250px"
						placeholder="输入管理员名称" id="" name="">
					<button type="submit" class="btn btn-success" id="" name="">
						<i class="Hui-iconfont">&#xe665;</i> 搜索
					</button>
				</div> -->
				<div class="cl pd-5 bg-1 bk-gray mt-20">
					<span class="l"> <a href="javascript:;" onclick="datadel()"
						class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
							批量删除</a> <a
						href="${pageContext.request.contextPath}/web/admin/addAdminPage"
						class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
							添加管理员</a>
					</span> <span class="r">共有数据：<strong>${adminCount}</strong> 条
					</span>
				</div>
				<form action="#" method="post" id="form-admin-list">
					<table
						class="table table-border table-bordered table-bg table-hover table-sort">
						<thead>
							<tr>
								<th scope="col" colspan="9">员工列表</th>
							</tr>
							<tr class="text-c">
								<th width="25"><input type="checkbox" name="" value=""></th>
								<th width="40">ID</th>
								<th width="150">登录名</th>
								<th width="90">手机</th>
								<th width="150">邮箱</th>
								<th>角色</th>
								<th width="130">加入时间</th>
								<th width="100">是否已启用</th>
								<th width="100">操作</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${admins}" var="admin">
								<tr class="text-c">
									<td><input type="checkbox" value="${admin.id}" name="id"></td>
									<td>${admin.id}</td>
									<td><u style="cursor: pointer" class="text-primary"
											onclick="admin_show('详细信息-${admin.nickName}','${pageContext.request.contextPath}/web/admin/adminShowPage/${admin.id}','400','450')">${admin.nickName}</u></td>
									<td>${admin.phone}</td>
									<td>${admin.email}</td>
									<c:if test="${admin.type==1}">
										<td>
											<!-- <span class="label label-secondary radius">普通用户</span>
									<span class="label label-warning radius">普通管理员</span> --> <span
											class="label label-danger radius">超级管理员</span>
										</td>
									</c:if>
									<c:if test="${admin.type==2}">
										<td><span class="label label-warning radius">普通管理员</span></td>
									</c:if>
<%-- 									<c:if test="${admin.type==3}">
										<td><span class="label label-secondary radius">普通用户</span></td>
									</c:if> --%>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
											value="${admin.author.createdTime}" /></td>
									<td class="td-status"><c:if test="${admin.state==1 }">
											<span class="label label-success radius">已启用</span>
										</c:if> <c:if test="${admin.state==0 }">
											<span class="label label-default radius">已禁用</span>
										</c:if></td>
									<td class="td-manage"><c:if test="${admin.state==1 }">
											<a style="text-decoration: none"
												onClick="admin_stop(this,'${admin.id}')" href="javascript:;"
												title="停用"><i class="Hui-iconfont">&#xe631;</i></a>
										</c:if> <c:if test="${admin.state==0 }">
											<a style="text-decoration: none"
												onClick="admin_start(this,'${admin.id}')"
												href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe631;</i></a>
										</c:if> <a title="编辑"
										href="${pageContext.request.contextPath}/web/admin/updateAdminInfoPage/${admin.id}"
										class="ml-5" style="text-decoration: none"><i
											class="Hui-iconfont">&#xe6df;</i></a> <a title="修改权限"
										href="javascript:;" onclick="admin_power(this,'${admin.id}')"
										class="ml-5" style="text-decoration: none"><i
											class="Hui-iconfont">&#xe60c;</i></a> <a title="删除"
										href="javascript:;" onclick="admin_del(this,'${admin.id}')"
										class="ml-5" style="text-decoration: none"><i
											class="Hui-iconfont">&#xe6e2;</i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</article>
		</div>
	</section>

	<!--_footer 作为公共模版分离出去-->
	<jsp:include page="_footer.jsp" />
	<!--/_footer /作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
		/*
		 参数解释：
		 title	标题
		 url		请求的url
		 id		需要操作的数据id
		 w		弹出层宽度（缺省调默认值）
		 h		弹出层高度（缺省调默认值）
		 */
			/*查看用户*/
			function admin_show(title, url, w, h) {
				layer_show(title, url, w, h);
			}
		/*管理员-删除*/
		function admin_del(obj, id) {
			layer
					.confirm(
							'确认要删除吗？',
							function(index) {
								//此处请求后台程序，下方是成功后的前台处理……
								$
										.ajax({
											url : '${pageContext.request.contextPath}/web/admin/updateAdminState',
											type : 'POST',
											data : {
												'id' : id,
												'state' : -1
											},
											dataType : "JSON",
											success : function(msg) {
												if (msg.code == 1) {
													$(obj).parents("tr")
															.remove();
													layer.msg('已删除!', {
														icon : 1,
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
											complete : function(xmlhttprequest,
													textstatus) {
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

							});
		}
		/*管理员权限-修改*/
		function admin_power(obj, id) {
			layer_show('管理员权限', '${pageContext.request.contextPath}/web/admin/adminPowerPage/'+id, 800, 610)
		}
		/*管理员-编辑*/
		function admin_edit(title, url, id, w, h) {
			layer_show(title, url, w, h);
		}
		/*管理员-停用*/
		function admin_stop(obj, id) {
			layer
					.confirm(
							'确认要停用吗？',
							function(index) {
								//此处请求后台程序，下方是成功后的前台处理……
								$
										.ajax({
											url : '${pageContext.request.contextPath}/web/admin/updateAdminState',
											type : 'POST',
											data : {
												'id' : id,
												'state' : 0
											},
											dataType : "JSON",
											success : function(msg) {
												if (msg.code == 1) {
													$(obj)
															.parents("tr")
															.find(".td-manage")
															.prepend(
																	'<a onClick="admin_start(this,'
																			+ id
																			+ ')" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
													$(obj)
															.parents("tr")
															.find(".td-status")
															.html(
																	'<span class="label label-default radius">已禁用</span>');
													$(obj).remove();
													layer.msg('已停用!', {
														icon : 5,
														time : 1000
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
											complete : function(xmlhttprequest,
													textstatus) {
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
							});

		}

		/*管理员-启用*/
		function admin_start(obj, id) {
			layer
					.confirm(
							'确认要启用吗？',
							function(index) {
								//此处请求后台程序，下方是成功后的前台处理……
								$
										.ajax({
											url : '${pageContext.request.contextPath}/web/admin/updateAdminState',
											type : 'POST',
											data : {
												'id' : id,
												'state' : 1
											},
											dataType : "JSON",
											success : function(msg) {
												if (msg.code == 1) {
													$(obj)
															.parents("tr")
															.find(".td-manage")
															.prepend(
																	'<a onClick="admin_stop(this,'
																			+ id
																			+ ')" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
													$(obj)
															.parents("tr")
															.find(".td-status")
															.html(
																	'<span class="label label-success radius">已启用</span>');
													$(obj).remove();
													layer.msg('已启用!', {
														icon : 6,
														time : 1000
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
											complete : function(xmlhttprequest,
													textstatus) {
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

							});
		}
		/*批量删除*/
		function datadel(){
			layer.confirm('确认要删除吗？', function(index) {
			$.ajax({
				url:'${pageContext.request.contextPath}/web/admin/updateAdminState',
				type:'POST',
				data:$("#form-admin-list").serialize()+'&state=-1',
				dataType : "JSON",
				success : function(msg) {
					if(msg.code==1){
						layer.msg('删除成功!', {
							icon : 6,
							time : 2000,
							end :function(){
						location.replace(location.href);
								}
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
				});
		}
	</script>
	<script type="text/javascript">
		$('.table-sort').dataTable({
			"aaSorting" : [ [ 1, "desc" ] ],//默认第几个排序
			"bStateSave" : true,//状态保存
			"aoColumnDefs" : [
			//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
			{
				"orderable" : false,
				"aTargets" : [ 0, 8 ]
			} // 不参与排序的列
			]
		});
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>