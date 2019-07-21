<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<LINK rel="Bookmark"
	href="${pageContext.request.contextPath}/favicon.ico">
<LINK rel="Shortcut Icon"
	href="${pageContext.request.contextPath}/favicon.ico" />

<title>登录</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/base.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">

</head>
<body>

	<div class="bg"></div>
	<div class="container">
		<div class="line bouncein">
			<div class="xs6 xm4 xs3-move xm4-move">
				<div style="height: 150px;"></div>
				<div class="media media-y margin-big-bottom"></div>
				<form action="#" method="post" onsubmit="return false">
					<div class="panel loginbox">
						<div class="text-center margin-big padding-big-top">
							<h1>后台管理中心</h1>
						</div>
						<div class="panel-body"
							style="padding: 30px; padding-bottom: 10px; padding-top: 10px;">
							<div class="form-group">
								<div class="field field-icon-right">
									<input type="text" class="input input-big" name="name"
										id="username" placeholder="登录账号" /> <span
										class="icon icon-user margin-small"></span>
								</div>
							</div>
							<div class="form-group">
								<div class="field field-icon-right">
									<input type="password" class="input input-big" name="password"
										id="password" placeholder="登录密码" /> <span
										class="icon icon-key margin-small"></span>
								</div>
							</div>
							<%-- <div class="form-group">
                                <div class="field">
                                    <input type="text" class="input input-big" name="code" placeholder="填写右侧的验证码" />
                                    <img src="${pageContext.request.contextPath}/images/passcode.jpg" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onClick="this.src=this.src+'?'">
                                </div>
                            </div> --%>

							<span id="tip" style="color: red;"></span>

						</div>
						<div style="padding: 30px;">
							<input type="button" id="button"
								class="button button-block bg-main text-big input-big"
								value="登录">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<jsp:include page="_footer.jsp" />
	<!--/_footer /作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript">
		$("#button").click(function() {
			var name = $("#username").val();
			var pass = $("#password").val();
			if (name == null||name=="") {
				$("#tip").html('用户名不可为空');
			} else if (pass == null||pass=="") {
				$("#tip").html('密码不可为空');
			} else {
				$("#tip").html('');
				$.ajax({
					url:'${pageContext.request.contextPath}/web/admin/login',
					type:'POST',
					data:{'name':name,'password':pass},
					dataType:'json',
					success:function(msg){
						if(msg.code==1){
							$(location).attr('href',"${pageContext.request.contextPath}/web/admin/indexPage");
						}else{
							$("#tip").html(msg.msg);
						}
					},
					error:function(){
						alert("服务器繁忙");
					},
					complete:function(xmlhttprequest,textstatus){
						if("REDIRECT"==xmlhttprequest.getResponseHeader("REDIRECT")){
							var win=window;
							while(win!=win.top){
								win=win.top;
							}
							win.location.href=xmlhttprequest.getResponseHeader("CONTENTPATH");
						}
					}
				});
			}
		});
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
	
</body>
</html>