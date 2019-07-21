<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--_meta 作为公共模版分离出去-->
<jsp:include page="_meta.jsp" />

<!--/meta 作为公共模版分离出去-->

<title>删除的用户 - 会员管理 - H-ui.admin v3.0</title>
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
			管理员管理<span class="c-gray en">&gt;</span> 删除的管理员<a
				class="btn btn-success radius r"
				style="line-height: 1.6em; margin-top: 3px"
				href="javascript:location.replace(location.href);" title="刷新"><i
				class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<div class="Hui-article">
			<article class="cl pd-20">
				<!-- <div class="text-c"> 日期范围：
				<input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" class="input-text Wdate" style="width:120px;">
				-
				<input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" class="input-text Wdate" style="width:120px;">
				<input type="text" class="input-text" style="width:250px" placeholder="输入会员名称、电话、邮箱" id="" name="">
				<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
			</div> -->
				<div class="cl pd-5 bg-1 bk-gray mt-20">
					<span class="l"><a href="javascript:;" onclick="datadel()"
						class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
							批量删除</a> </span> <span class="r">共有数据：<strong>${adminCount}</strong>
						条
					</span>
				</div>
				<div class="mt-20">
					<form action="#" method="post" id="form-admin-list">
						<table
							class="table table-border table-bordered table-bg table-hover table-sort">
							<thead>
								<tr class="text-c">
									<th width="25"><input type="checkbox" name="" value=""></th>
									<th width="80">ID</th>
									<th width="100">用户名</th>
									<th width="90">手机</th>
									<th width="150">邮箱</th>
									<th width="130">加入时间</th>
									<th width="70">状态</th>
									<th width="100">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${adminList}" var="admin">
									<tr class="text-c">
										<td><input type="checkbox" value="${admin.id }" name="id"></td>
										<td>${admin.id}</td>
										<td><u style="cursor: pointer" class="text-primary"
											onclick="admin_show('${admin.nickName}','${pageContext.request.contextPath}/web/admin/adminShowPage/${admin.id}','400','450')">${admin.nickName}</u></td>
										<td>${admin.phone}</td>
										<td>${admin.email }</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
												value="${admin.author.createdTime}" /></td>
										<td class="td-status"><span
											class="label label-danger radius">已删除</span></td>
										<td class="td-manage"><a style="text-decoration: none"
											href="javascript:;" onClick="admin_huanyuan(this,'${admin.id}')"
											title="还原"><i class="Hui-iconfont">&#xe66b;</i></a> <a
											title="删除" href="javascript:;" onclick="admin_del(this,'${admin.id}')"
											class="ml-5" style="text-decoration: none"><i
												class="Hui-iconfont">&#xe6e2;</i></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
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
		$(function() {
			$('.table-sort').dataTable({
				"aaSorting" : [ [ 1, "desc" ] ],//默认第几个排序
				"bStateSave" : true,//状态保存
				"aoColumnDefs" : [
				//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
				{
					"orderable" : false,
					"aTargets" : [ 0, 6, 7 ]
				} // 制定列不参与排序
				]
			});
			$('.table-sort tbody').on('click', 'tr', function() {
				if ($(this).hasClass('selected')) {
					$(this).removeClass('selected');
				} else {
					table.$('tr.selected').removeClass('selected');
					$(this).addClass('selected');
				}
			});
		});
		/*查看用户*/
		function admin_show(title, url, w, h) {
			layer_show(title, url, w, h);
		}

		/*用户-还原*/
		function admin_huanyuan(obj, id) {
			layer.confirm('确认要还原吗？', function(index) {
				$.ajax({
					url : '${pageContext.request.contextPath}/web/admin/updateAdminState',
					type : 'POST',
					data : {
						'id' : id,
						'state' : 1
						},
						dataType : "JSON",
						success : function(msg) {
							if (msg.code == 1) {
								$(obj).parents("tr").remove();
								layer.msg('已还原!', {
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
			});
		}

		/*用户-删除*/
		function admin_del(obj, id) {
			layer.confirm('确认要删除吗？(注意:此操作不可撤销!)', function(index) {
				$.ajax({
					url : '${pageContext.request.contextPath}/web/admin/deleteAdmin',
					type : 'POST',
					data : {'id' : id},
						dataType : "JSON",
						success : function(msg) {
							if (msg.code == 1) {
								$(obj).parents("tr").remove();
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
			});
		}
		/*批量删除*/
		function datadel(){
			layer.confirm('确认要删除吗？(注意:此操作不可撤销!)', function(index) {
			$.ajax({
				url : '${pageContext.request.contextPath}/web/admin/deleteAdmin',
				type : 'POST',
				data:$("#form-admin-list").serialize(),
					dataType : "JSON",
					success : function(msg) {
						if (msg.code == 1) {
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
			});
		}
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>