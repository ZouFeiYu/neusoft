<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl">
			<a class="logo navbar-logo f-l mr-10 hidden-xs"
				href="${pageContext.request.contextPath}/web/admin/indexPage">东软商城后台管理</a>
			<span class="logo navbar-slogan f-l mr-10 visible-xs">v3.0</span> <a
				aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs"
				href="javascript:;">&#xe667;</a>
			<nav class="nav navbar-nav visible-xs">
				<ul class="cl">
					<li class="dropDown dropDown_hover"><a href="javascript:;"
						class="dropDown_A"><i class="Hui-iconfont">&#xe600;</i> 新增 <i
							class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;"
								onclick="article_add('添加资讯','article-add.html')"><i
									class="Hui-iconfont">&#xe616;</i> 资讯</a></li>
							<li><a href="javascript:;"
								onclick="picture_add('添加资讯','picture-add.html')"><i
									class="Hui-iconfont">&#xe613;</i> 图片</a></li>
							<li><a href="javascript:;"
								onclick="product_add('添加资讯','product-add.html')"><i
									class="Hui-iconfont">&#xe620;</i> 产品</a></li>
							<li><a href="javascript:;"
								onclick="member_add('添加用户','member-add.html','','510')"><i
									class="Hui-iconfont">&#xe60d;</i> 用户</a></li>
						</ul></li>
				</ul>
			</nav>
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
				<ul class="cl">
					<c:if test="${admin.type==1}">
						<li>超级管理员</li>
					</c:if>
					<c:if test="${admin.type==2}">
						<li>普通管理员</li>
					</c:if>
					<li class="dropDown dropDown_hover"><a href="#"
						class="dropDown_A">${admin.nickName} <i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li>
							<li><a href="${pageContext.request.contextPath}/web/admin/updatePasswordPage">修改密码</a></li>
							<li><a
								href="${pageContext.request.contextPath}/web/admin/logout">退出</a></li>
						</ul></li>
					<li id="Hui-msg"><a href="#" title="消息"><span
							class="badge badge-danger">1</span><i class="Hui-iconfont"
							style="font-size: 18px">&#xe68a;</i></a></li>
					<li id="Hui-skin" class="dropDown right dropDown_hover"><a
						href="javascript:;" class="dropDown_A" title="换肤"><i
							class="Hui-iconfont" style="font-size: 18px">&#xe62a;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" data-val="blue" title="默认(蓝色)">默认(蓝色)</a></li>
							<li><a href="javascript:;" data-val="default" title="黑色">黑色</a></li>
							<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
							<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
							<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
							<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
						</ul></li>
				</ul>
			</nav>
		</div>
	</div>
</header>