<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--_meta 作为公共模版分离出去-->
<jsp:include page="_meta.jsp" />
<!--/meta 作为公共模版分离出去-->

<title>会员列表 - 会员管理 - H-ui.admin v3.0</title>
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
			用户管理 <span class="c-gray en">&gt;</span> 用户列表<a
				class="btn btn-success radius r"
				style="line-height: 1.6em; margin-top: 3px"
				href="javascript:location.replace(location.href);" title="刷新"><i
				class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<div class="Hui-article">
			<article class="cl pd-20">
				<!-- 			<div class="text-c"> 日期范围：
				<input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" class="input-text Wdate" style="width:120px;">
				-
				<input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" class="input-text Wdate" style="width:120px;">
				<input type="text" class="input-text" style="width:250px" placeholder="输入会员名称、电话、邮箱" id="" name="">
				<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
			</div> -->
				<div class="cl pd-5 bg-1 bk-gray mt-20">
					<span class="l"><a href="javascript:;" onclick="datadel()"
						class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
							批量删除</a> <a href="javascript:;"
						onclick="user_add('添加用户','${pageContext.request.contextPath}/web/admin/addUserPage','','510')"
						class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
							添加用户</a></span> <span class="r">共有数据：<strong>${userCount}</strong> 条
					</span>
				</div>
				<div class="mt-20">
				<form action="#" method="post" id="form-admin-list">
					<table
						class="table table-border table-bordered table-hover table-bg table-sort">
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
							<c:forEach items="${userList}" var="user">
								<tr class="text-c">
									<td><input type="checkbox" value="${user.id }" name="id"></td>
									<td>${user.id}</td>
									<td><u style="cursor: pointer" class="text-primary"
										onclick="user_show('详细信息-${user.nickName}','${pageContext.request.contextPath}/web/admin/userShowPage/${user.id}','400','450')">${user.nickName }</u></td>
									<td>${user.phone }</td>
									<td>${user.email }</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
											value="${user.author.createdTime}" /></td>
									<td class="td-status"><c:if test="${user.state==1 }">
											<span class="label label-success radius">已启用</span>
										</c:if> <c:if test="${user.state==0 }">
											<span class="label label-default radius">已禁用</span>
										</c:if></td>
									<td class="td-manage"><c:if test="${user.state==1 }">
											<a style="text-decoration: none"
												onClick="user_stop(this,'${user.id}')" href="javascript:;"
												title="停用"><i class="Hui-iconfont">&#xe631;</i></a>
										</c:if> <c:if test="${user.state==0 }">
											<a style="text-decoration: none"
												onClick="user_start(this,'${user.id}')"
												href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe631;</i></a>
										</c:if> <a
										title="编辑" href="javascript:;"
										onclick="user_edit('编辑-${user.nickName}','${pageContext.request.contextPath}/web/admin/updateUserInfoPage/${user.id }','','510')"
										class="ml-5" style="text-decoration: none"><i
											class="Hui-iconfont">&#xe6df;</i></a> <a
										style="text-decoration: none" class="ml-5"
										onClick="user_pass_update('修改密码-${user.nickName}','${pageContext.request.contextPath}/web/admin/updateUserPassPage/${user.id }','600','270')"
										href="javascript:;" title="修改密码"><i class="Hui-iconfont">&#xe63f;</i></a>
										<a title="删除" href="javascript:;"
										onclick="user_del(this,'${user.id}')" class="ml-5"
										style="text-decoration: none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
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
		src="${pageContext.request.contextPath }/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
		$(function() {
			$('.table-sort').dataTable({
				"aaSorting" : [ [ 1, "asc" ] ],//默认第几个排序
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
		/*用户-添加*/
		function user_add(title, url, w, h) {
			layer_show(title, url, w, h);
		}
		/*用户-查看*/
		function user_show(title, url, id, w, h) {
			layer_show(title, url, w, h);
		}
		/*用户-停用*/
		function user_stop(obj, id) {
			layer.confirm('确认要停用吗？',function(index) {
				$.ajax({
				url : '${pageContext.request.contextPath}/web/admin/updateUserState',
				type : 'POST',
				data : {
					'id' : id,
					'state' : 0
					},
					dataType : "JSON",
					success : function(msg) {
						if (msg.code == 1) {
							$(obj).parents("tr").find(".td-manage").prepend(
								'<a style="text-decoration:none" onClick="user_start(this,'+id+')" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
							$(obj).parents("tr").find(".td-status").html(
								'<span class="label label-defaunt radius">已停用</span>');
							$(obj).remove();
							layer.msg('已停用!', {icon : 5, time : 1000});
						} else {
							layer.msg(msg.msg, {
								icon : 5,
								time : 1000,
								end :function(){
									location.replace(location.href);
								}
							});
						}
					},
					error : function() {
						layer.msg('服务器繁忙', {
								icon : 5,
								time : 1000,
								end :function(){
									location.replace(location.href);
								}
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

		/*用户-启用*/
		function user_start(obj, id) {
			layer.confirm('确认要启用吗？',function(index) {
				$.ajax({
				url : '${pageContext.request.contextPath}/web/admin/updateUserState',
				type : 'POST',
				data : {
					'id' : id,
					'state' : 1
					},
					dataType : "JSON",
					success : function(msg) {
						if (msg.code == 1) {
							$(obj).parents("tr").find(".td-manage").prepend(
								'<a style="text-decoration:none" onClick="user_stop(this,'+id+')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
							$(obj).parents("tr").find(".td-status").html(
												'<span class="label label-success radius">已启用</span>');
							$(obj).remove();
							layer.msg('已启用!', {icon : 6,time : 1000});
						} else {
							layer.msg(msg.msg, {
								icon : 5,
								time : 1000,
								end :function(){
									location.replace(location.href);
								}
							});
						}
					},
					error : function() {
						layer.msg('服务器繁忙', {
								icon : 5,
								time : 1000,
								end :function(){
									location.replace(location.href);
								}
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
		/*用户-编辑*/
		function user_edit(title, url, w, h) {
			layer_show(title, url, w, h);
		}
		/*密码-修改*/
		function user_pass_update(title, url, w, h) {
			layer_show(title, url, w, h);
		}
		/*用户-删除*/
		function user_del(obj, id) {
			layer.confirm('确认要删除吗？', function(index) {
				$.ajax({
					url : '${pageContext.request.contextPath}/web/admin/updateUserState',
					type : 'POST',
					data : {
						'id' : id,
						'state' : -1
						},
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
									time : 1000,
									end :function(){
										location.replace(location.href);
									}
								});
							}
						},
						error : function() {
							layer.msg('服务器繁忙', {
									icon : 5,
									time : 1000,
									end :function(){
										location.replace(location.href);
									}
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
			layer.confirm('确认要删除吗？', function(index) {
			$.ajax({
				url:'${pageContext.request.contextPath}/web/admin/updateUserState',
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
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>