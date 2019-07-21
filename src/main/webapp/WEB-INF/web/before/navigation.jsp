<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 顶部tab -->
	<div class="tab-header">
		<div class="inner">
			<div class="pull-left">
				<div class="pull-left">嗨，欢迎来到<span class="cr">U袋网</span></div>
				<a href="agent_level.html">网店代销</a>
				<a href="temp_article/udai_article4.html">帮助中心</a>
			</div>
			<div class="pull-right">
				<c:if test="${sessionScope.user!=null }">
					<a href="${pageContext.request.contextPath}/web/main/loginOut">退出</a>
					<a href="${pageContext.request.contextPath}/web/main/welcomePage/${sessionScope.user.id}">我的U袋</a>
					<a href="udai_order.html">我的订单</a>
					<a href="udai_integral.html">积分平台</a>
				</c:if>
				<c:if test="${sessionScope.user==null }">
					<a href="${pageContext.request.contextPath}/web/main/loginPage"><span class="cr">登录</span></a>
					<a href="${pageContext.request.contextPath}/web/main/registerPage">注册</a>
				</c:if>
			</div>
		</div>
	</div>
