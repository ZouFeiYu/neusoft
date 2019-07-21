<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--_meta 作为公共模版分离出去-->
<jsp:include page="_meta.jsp" />
<!--/meta 作为公共模版分离出去-->
<title>修改密码</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/link.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/layui.css" />
<LINK rel="Bookmark"
	href="${pageContext.request.contextPath}/favicon.ico">
<LINK rel="Shortcut Icon"
	href="${pageContext.request.contextPath}/favicon.ico" />
</head>
<body>
	<!--_header 作为公共模版分离出去-->
	<jsp:include page="_header.jsp" />
	<!--/_header 作为公共模版分离出去-->

	<!--_menu 作为公共模版分离出去-->
	<jsp:include page="_menu.jsp" />
	<!--/_menu 作为公共模版分离出去-->

	<div class="rebinding-box">
		<div class="box-title">
			<h2 class="mtb5">修改密码</h2>
			<i>为了保障您的帐户安全，请先进行安全验证</i>
		</div>
		<div class="box-timeline">
			<ul class="text-center" style="width: 800px;">
				<li>填写登录密码
					<div class="box-num1">1</div>
				</li>
				<li class="ml45">输入新密码
					<div class="box-outside1 outside1ab" id="outside1abs">
						<div class="box-num2 num2ab">2</div>
					</div>
				</li>
				<li class="ml45">完成
					<div class="box-outside2 outside2a" id="outside2as">
						<div class="box-num3 num3a">3</div>
					</div>
				</li>
				<div class="clear"></div>
			</ul>


		</div>
		<!--第一步-->
		<div class="onebox-form" id="oneform">
			<div class="oneform">
				<div class="oneform-box">
					<label class="oneform-label">登录密码</label>
					<div class="oneform-input">
						<input type="password" id="pasval" autocomplete="off"
							placeholder="请填写登录密码，认证帐号">
					</div>
				</div>
				<div class="onebtn-box">
					<button class="onebtn" id="onebtn" onclick="fun()">下一步</button>
				</div>
			</div>
		</div>
		<!--第二步-->
		<div class="twobox-form" id="twoform">
			<form class="twoform" onsubmit="return false">
				<div class="twoform-box">
					<div class="newtel">
						<label class="twoform-label">新密码</label>
						<div class="twoform-input">
							<input type="password" id="ntel" autocomplete="off"
								placeholder="请输入新密码">
						</div>
					</div>
					<div class="validatecode">
						<!-- <label class="twoform-label2">验证码</label>
						<div class="twoform-input2">
							<input type="text" autocomplete="off" placeholder="请输入验证码">

						</div>
						<button class="sendcode" disabled="disabled">发送验证码</button> -->
						<label class="twoform-label">确认密码</label>
						<div class="twoform-input">
							<input type="password" id="ntel1" autocomplete="off"
								placeholder="请再输入一遍新密码">
						</div>
					</div>
				</div>
			</form>
			<div class="twobtn-box">
				<button class="twobtn" id="twobtn" onclick="fun1()">下一步</button>
			</div>
		</div>
		<!--第三步-->
		<div class="threebox-form" id="threeform">
			<div class="successr">
				<div class="symbol"></div>
				<p>恭喜您，修改密码成功！</p>
				<a href="${pageContext.request.contextPath}/web/admin">
					<button class="confirm">确认</button>
				</a>
			</div>
		</div>
	</div>

</body>
<!--_footer 作为公共模版分离出去-->
<jsp:include page="_footer.jsp" />
<!--/_footer /作为公共模版分离出去-->
<script src="js/layui.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	var onebtns = document.getElementById("onebtn");
	var twobtns = document.getElementById("twobtn");
	var soutside1ab = document.getElementById("outside1abs");
	var soutside2as = document.getElementById("outside2as");
	var oneforms = document.getElementById("oneform");
	var twoforms = document.getElementById("twoform");
	var threeforms = document.getElementById("threeform");
	function fun() {
		var pasvals = document.getElementById("pasval").value;
		$
				.ajax({
					url : "${pageContext.request.contextPath}/web/admin/checkPasword",
					type : "POST",
					data : {
						'password' : pasvals
					},
					dataType : "json",
					success : function(msg) {
						if (msg.code == 1) {
							soutside1ab.classList.remove("outside1ab");
							oneforms.style.display = "none";
							twoforms.style.display = "block";
						} else {
							alert(msg.msg);
						}
					},
					error : function() {
						alert('服务器繁忙');
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
		/* 		isPasswd(pasvals);
		 function isPasswd(s) {
		 var patrn = /^(\w){6,20}$/;
		 if (!patrn.exec(s)) {
		 alert("只能输入6-20个字母、数字、下划线")
		 return false
		 } else {
		

		 }
		 } */
	}
	function fun1() {
		var str = document.getElementById("ntel").value;
		var str1 = document.getElementById("ntel1").value;
		if (str != str1) {
			alert("两次输入不符");
			return false;
		}
		$
				.ajax({
					url : "${pageContext.request.contextPath}/web/admin/updatePassword",
					type : "POST",
					data : {
						'password' : str
					},
					dataType : "json",
					success : function(msg) {
						if (msg.code == 1) {
							threeforms.style.display = "block";
							twoforms.style.display = "none";
							soutside2as.classList.remove("outside2a");
						} else {
							alert(msg.msg);
						}
					},
					error : function() {
						alert('服务器繁忙');
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
		/* isPoneAvailable(str);
		function isPoneAvailable(str) {
			var myreg = /^[1][0-9]{10}$/;
			if (!myreg.test(str)) {
				alert("请输入正确的手机号")
				return false;
			} else {
				threeforms.style.display = "block";
				twoforms.style.display = "none";
				soutside2as.classList.remove("outside2a");
			}
		} */

	}
</script>
</html>
