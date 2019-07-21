<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--_meta 作为公共模版分离出去-->
<jsp:include page="_meta.jsp" />
<!--/meta 作为公共模版分离出去-->

<title>新建网站角色 - 管理员管理 - H-ui.admin v3.0</title>
<meta name="keywords"
	content="H-ui.admin v3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description"
	content="H-ui.admin v3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
	<article class="cl pd-20">
		<form
			action="${pageContext.request.contextPath}/web/admin/updateAdminPower"
			method="POST" class="form form-horizontal" id="form-admin-role-add">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red"></span>角色ID：</label>
				<div class="formControls col-xs-8 col-sm-9 ">
					<span class="label label-default radius"> <input type="text"
						class="input-text" readonly unselectable="on"
						value="${thisAdmin.id}" placeholder="" id="id" name="id">
					</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red"></span>角色名称：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<span class="label label-default radius"> <input type="text"
						class="input-text" readonly unselectable="on"
						value="${thisAdmin.nickName }" placeholder="" id="nickName"
						name="nickName">
					</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">角色权限：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<dl class="permission-list">
						<dt>
							<label> <input type="checkbox" value=""
								name="user-Character-0" id="user-Character-0"> 用户
							</label>
						</dt>
						<dd>
							<label class=""> <input type="checkbox" value="1" name="power"
							id="user-Character-0-0-0"> 添加用户
							</label>
							<label class=""> <input type="checkbox" value="2"
								name="power" id="user-Character-0-0-0"> 删除用户
							</label> <label class=""> <input type="checkbox" value="3"
								name="power" id="user-Character-0-0-1"> 查找用户
							</label> <label class=""> <input type="checkbox" value="4"
								name="power" id="user-Character-0-0-2"> 修改用户
							</label>
							<!-- <label class="c-orange"><input type="checkbox"
										value="" name="user-Character-0-0-0" id="user-Character-0-0-5">
										只能操作自己发布的</label> -->
						</dd>
						<!-- 						<dd>
							<dl class="cl permission-list2">
																<dt>
									<label class=""> <input type="checkbox" value=""
										name="user-Character-0-0" id="user-Character-0-0">
										添加用户
									</label>
								</dt>

							</dl>
						</dd> -->
					</dl>
					<dl class="permission-list">
						<dt>
							<label> <input type="checkbox" value=""
								name="user-Character-0" id="user-Character-1"> 管理员
							</label>
						</dt>
						<dd>
							<label class=""> <input type="checkbox" value="5"
								name="power" id="user-Character-1-0"> 添加管理员
							</label> <label class=""> <input type="checkbox" value="6"
								name="power" id="user-Character-1-0-0"> 删除管理员
							</label> <label class=""> <input type="checkbox" value="7"
								name="power" id="user-Character-1-0-1"> 查找管理员
							</label> <label class=""> <input type="checkbox" value="8"
								name="power" id="user-Character-1-0-2"> 修改管理员
							</label>

						</dd>
					</dl>

					<dl class="permission-list">
						<dt>
							<label> <input type="checkbox" value=""
								id="user-Character-1"> 商品
							</label>
						</dt>
						<dd>
							<label class=""> <input type="checkbox" value="9"
								name="power" id="user-Character-1-0"> 添加商品
							</label> <label class=""> <input type="checkbox" value="10"
								name="power" id="user-Character-1-0-0"> 删除商品
							</label> <label class=""> <input type="checkbox" value="11"
								name="power" id="user-Character-1-0-1"> 查找商品
							</label> <label class=""> <input type="checkbox" value="12"
								name="power" id="user-Character-1-0-2"> 修改商品
							</label>
						</dd>
					</dl>

					<dl class="permission-list">
						<dt>
							<label> <input type="checkbox" value=""
								id="user-Character-1"> 商品分类
							</label>
						</dt>
						<dd>
							<label class=""> <input type="checkbox" value="13"
								name="power" id="user-Character-1-0"> 添加商品分类
							</label> <label class=""> <input type="checkbox" value="14"
								name="power" id="user-Character-1-0-0"> 删除商品分类
							</label> <label class=""> <input type="checkbox" value="15"
								name="power" id="user-Character-1-0-1"> 查找商品分类
							</label> <label class=""> <input type="checkbox" value="16"
								name="power" id="user-Character-1-0-2"> 修改商品分类
							</label>
						</dd>
					</dl>

					<dl class="permission-list">
						<dt>
							<label> <input type="checkbox" value=""
								id="user-Character-1"> 订单
							</label>
						</dt>
						<dd>
							<label class=""> <input type="checkbox" value="17"
								name="power" id="user-Character-1-0"> 添加订单
							</label> <label class=""> <input type="checkbox" value="18"
								name="power" id="user-Character-1-0-0"> 删除订单
							</label> <label class=""> <input type="checkbox" value="19"
								name="power" id="user-Character-1-0-1"> 查找订单
							</label> <label class=""> <input type="checkbox" value="20"
								name="power" id="user-Character-1-0-2"> 修改订单
							</label>
						</dd>
					</dl>

				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<button type="submit" class="btn btn-success radius"
						id="admin-role-save">
						<i class="icon-ok"></i> 确定
					</button>
				</div>
			</div>
		</form>
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
	$(function() {
		$(".permission-list dt input:checkbox").click(function() {
			$(this).closest("dl").find("dd input:checkbox").prop(
				"checked", $(this).prop("checked"));
		});
		$(".permission-list2 dd input:checkbox").click(function() {
			var l = $(this).parent().parent().find("input:checked").length;
			var l2 = $(this).parents(".permission-list").find(".permission-list2 dd").find("input:checked").length;
			if ($(this).prop("checked")) {
				$(this).closest("dl").find("dt input:checkbox").prop("checked", true);
				$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked", true);
			} else {
				if (l == 0) {
					$(this).closest("dl").find("dt input:checkbox").prop("checked", false);
				}
				if (l2 == 0) {
					$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked", false);
				}
			}
		});

		$("#form-admin-role-add").validate({
			rules : {
				roleName : {
					required : true,
				},
			},
			onkeyup : false,
			focusCleanup : true,
			success : "valid",
			submitHandler : function(form) {
				$(form).ajaxSubmit({
					dataType : "JSON",
					success:function(msg){
						if (msg.code == 1){
							layer.msg('权限更新成功!', {
								icon : 1,
								time : 1000,
								end:function(){
									var index = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index);
								}
							});
						}else{
							layer.msg(msg.msg, {
								icon : 5,
								time : 1000,
							});
						}
					},
					error:function(){
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
		var list=${thisPower};
		for(var i=0;i<list.length;i++){
			$("[name=power]").each(function(){
				if($(this).val()==list[i]){
					$(this).attr("checked","checked");
				}
			});
		}
	});
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>