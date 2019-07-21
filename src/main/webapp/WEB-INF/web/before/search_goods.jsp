<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<jsp:include page="navigation.jsp" />
	<!-- 搜索栏 -->
	<div class="top-search">
		<div class="inner">
			<a class="logo"
				href="${pageContext.request.contextPath}/web/main/index"><img
				src="${pageContext.request.contextPath}/images/icons/logo.jpg"
				alt="U袋网" class="cover"></a>
			<div class="search-box">
				<form class="input-group" action="${pageContext.request.contextPath}/web/main/searchGoods" method="post">
					<input placeholder="${name }" type="text" id="name" name="name"> <span
						class="input-group-btn">
						<button type="submit">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>
					</span>
				</form>
				<!-- <p class="help-block text-nowrap">
					<a href="">连衣裙</a>
					<a href="">裤</a>
					<a href="">衬衫</a>
					<a href="">T恤</a>
					<a href="">女包</a>
					<a href="">家居服</a>
					<a href="">2017新款</a>
				</p> -->
			</div>
			<div class="cart-box">
				<a href="${pageContext.request.contextPath}/web/main/cartPage" class="cart-but"> <i
					class="iconfont icon-shopcart cr fz16"></i> 购物车${count } 件
				</a>
			</div>
		</div>
	</div>
	<div class="con-box">
		<div class="right-box">
			<c:forEach items="${list}" var="goods">
				<a
					href="${pageContext.request.contextPath}/web/main/detailsPage?id=${goods.id}"
					class="floor-item">
					<div class="item-img hot-img">
						<img src="${pageContext.request.contextPath}${goods.image}"
							alt="纯色圆领短袖T恤活a动衫弹" class="cover">
					</div>
					<div class="price clearfix">
						<span class="pull-left cr fz16">￥${goods.price }</span> <span
							class="pull-right c6">进货价</span>
					</div>
					<div class="name ep" title="纯色圆领短袖T恤活a动衫弹力柔软">${goods.name }</div>
				</a>
			</c:forEach>
		</div>
	</div>
	<!-- 分页显示商品信息 -->
	<div class="page text-center clearfix" style="clear:both">
		<!-- 上一页 -->
		<c:choose>
			<c:when test="${page != 1 }">
				<a href="${pageContext.request.contextPath}/web/main/searchGoods?page=${page-1}&name=${name}">上一页</a>
			</c:when>
			<c:otherwise>
				<a class="disabled">上一页</a>
			</c:otherwise>
		</c:choose>
		<!-- 页数列表 -->
		<c:choose>
			<c:when test="${page == 1 }">
				<a class="select">1</a>
				<a href="${pageContext.request.contextPath}/web/main/searchGoods?page=${page+1}&name=${name}">2</a> 
				<a href="${pageContext.request.contextPath}/web/main/searchGoods?page=${page+2}&name=${name}">3</a> 
			</c:when>
			<c:when test="${page == pageSize }">
				<a href="${pageContext.request.contextPath}/web/main/searchGoods?page=${page-1}&name=${name}">${page-1 }</a> 
				<a class="select">${page }</a> 
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/web/main/searchGoods?page=${page-1}&name=${name}">${page-1 }</a> 
				<a class="select">${page }</a> 
				<a href="${pageContext.request.contextPath}/web/main/searchGoods?page=${page+1}&name=${name}">${page+1 }</a> 
			</c:otherwise>
		</c:choose>
		<!-- 下一页 -->
		<c:choose>
			<c:when test="${page != pageSize }">
				<a href="${pageContext.request.contextPath}/web/main/searchGoods?page=${page+1}&name=${name}">下一页</a>
			</c:when>
			<c:otherwise>
				<a class="disabled">下一页</a>
			</c:otherwise>
		</c:choose>
		<a class="disabled">${page }/${pageSize }页</a>
	</div>
	<%-- <div align="center" style="font-size: 20px">
		共${counts}种商品|共${pageSize }页|
		<c:forEach var="i" begin="1" end="${pageSize}">
			<a
				href="${pageContext.request.contextPath}/web/main/searchGoods?page=${i}&name=${name}">${i}</a>
		</c:forEach>
	</div> --%>
	<script>
		$(document).ready(function() {
			// 楼层导航自动 active
			$.scrollFloor();
			// 页面下拉固定楼层导航
			$('.floor-nav').smartFloat();
			$('.to-top').toTop({
				position : false
			});
		});
	</script>
	<!-- 右侧菜单 -->
	<div class="right-nav">
		<ul class="r-with-gotop">
			<li class="r-toolbar-item"><a href="udai_welcome.html"
				class="r-item-hd"> <i class="iconfont icon-user"></i>
					<div class="r-tip__box">
						<span class="r-tip-text">用户中心</span>
					</div>
			</a></li>
			<li class="r-toolbar-item"><a href="udai_shopcart.html"
				class="r-item-hd"> <i class="iconfont icon-cart" data-badge="10"></i>
					<div class="r-tip__box">
						<span class="r-tip-text">购物车</span>
					</div>
			</a></li>
			<li class="r-toolbar-item"><a href="udai_collection.html"
				class="r-item-hd"> <i class="iconfont icon-aixin"></i>
					<div class="r-tip__box">
						<span class="r-tip-text">我的收藏</span>
					</div>
			</a></li>
			<li class="r-toolbar-item"><a href="" class="r-item-hd"> <i
					class="iconfont icon-liaotian"></i>
					<div class="r-tip__box">
						<span class="r-tip-text">联系客服</span>
					</div>
			</a></li>
			<li class="r-toolbar-item"><a href="issues.html"
				class="r-item-hd"> <i class="iconfont icon-liuyan"></i>
					<div class="r-tip__box">
						<span class="r-tip-text">留言反馈</span>
					</div>
			</a></li>
			<li class="r-toolbar-item to-top"><i class="iconfont icon-top"></i>
				<div class="r-tip__box">
					<span class="r-tip-text">返回顶部</span>
				</div></li>
		</ul>
	</div>
	<!-- 底部信息 -->
	<jsp:include page="footer.jsp" />
</body>
</html>