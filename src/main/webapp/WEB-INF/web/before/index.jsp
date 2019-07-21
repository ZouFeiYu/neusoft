<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<html lang="zh-cmn-Hans">
<jsp:include page="header.jsp"></jsp:include>
<body>
	<jsp:include page="navigation.jsp"/>
		<!-- 搜索栏 -->
	<div class="top-search">
		<div class="inner">
			<a class="logo" href="${pageContext.request.contextPath}/web/main/index"><img src="${pageContext.request.contextPath}/images/icons/logo.jpg" alt="U袋网" class="cover"></a>
			<div class="search-box">
				<form class="input-group" action="${pageContext.request.contextPath}/web/main/searchGoods" method="post">
					<input placeholder="Ta们都在搜U袋网" type="text" id="name" name="name">
					<span class="input-group-btn">
						<button type="submit">
							<span class="glyphicon glyphicon-search" aria-hidden="true" id="glyphicon-search"></span>
						</button>
					</span>
				</form>
				<p class="help-block text-nowrap">
					<a href="">连衣裙</a>
					<a href="">裤</a>
					<a href="">衬衫</a>
					<a href="">T恤</a>
					<a href="">女包</a>
					<a href="">家居服</a>
					<a href="">2017新款</a>
				</p>
			</div>
			<div class="cart-box">
				<a href="${pageContext.request.contextPath}/web/main/cartPage" class="cart-but">
					<i class="iconfont icon-shopcart cr fz16"></i> 购物车 ${count } 件
				</a>
			</div>
		</div>
	</div>
	<!-- 首页导航栏 -->
	<div class="top-nav bg3">
		<div class="nav-box inner">
			<div class="all-cat">
				<div class="title"><i class="iconfont icon-menu"></i> 全部分类</div>
				<div class="cat-list__box">
				<!-- 2018-12-13 19:11:00 修改 -->
					<c:forEach items="${topLevel}" var="c1">
						<div class="cat-box">
							<div class="title">
								<i class="iconfont icon-skirt ce"></i> ${c1.name}
							</div>
						<ul class="cat-list clearfix">
							<c:forEach items="${childrenLevel[c1.id]}" var="cc" end="1">
							<li>${cc.name}</li>
							</c:forEach>
						</ul>
						<div class="cat-list__deploy">
							<div class="deploy-box">
								<c:forEach items="${childrenLevel[c1.id]}" var="c2">
									<div class="genre-box clearfix">
									<span class="title">${c2.name}</span>
									<div class="genre-list">
										<c:forEach items="${childrenLevel[c2.id]}" var="c3">
											<a href="${pageContext.request.contextPath}/web/main/nonePage">${c3.name}</a>
										</c:forEach>
									</div>
								</div>
								</c:forEach>
							</div>
						</div>
						</div>
					</c:forEach>
					<!--  -->
				</div>
			</div>
			<ul class="nva-list">
				<a href="index.html"><li class="active">首页</li></a>
				<a href="temp_article/udai_article10.html"><li>企业简介</li></a>
				<a href="temp_article/udai_article5.html"><li>新手上路</li></a>
				<a href="class_room.html"><li>U袋学堂</li></a>
				<a href="enterprise_id.html"><li>企业账号</li></a>
				<a href="udai_contract.html"><li>诚信合约</li></a>
				<a href="item_remove.html"><li>实时下架</li></a>
			</ul>
			<div class="user-info__box">
				<div class="login-box">
					<div class="avt-port">
						<img src="${pageContext.request.contextPath}/images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
					</div>
					<!-- 已登录 -->
					<c:if test="${sessionScope.user !=null}">
						<div class="name c6">Hi~ <span class="cr">${user.nickName}</span></div>
					</c:if>
					<!-- 未登录 -->
					<c:if test="${sessionScope.user==null}">
						 <div class="name c6">Hi~ 你好</div>
						<div class="point c6"><a href="${pageContext.request.contextPath}/web/main/loginPage">点此登录</a>，发现更多精彩</div> 
					</c:if>
					<div class="report-box">
						<span class="badge">+30</span>
						<a class="btn btn-info btn-block disabled" href="#" role="button">已签到1天</a>
						<!-- <a class="btn btn-primary btn-block" href="#" role="button">签到领积分</a> -->
					</div>
				</div>
				<div class="agent-box">
					<a href="#" class="agent">
						<i class="iconfont icon-fushi"></i>
						<p>申请网店代销</p>
					</a>
					<a href="javascript:;" class="agent">
						<i class="iconfont icon-agent"></i>
						<p><span class="cr">9527</span>位代销商</p>
					</a>
				</div>
				<div class="verify-qq">
					<div class="title">
						<i class="fake"></i>
						<span class="fz12">真假QQ客服验证-远离骗子</span>
					</div>
					<form class="input-group">
						<input class="form-control" placeholder="输入客服QQ号码" type="text">
						<span class="input-group-btn">
							<button class="btn btn-primary submit" id="verifyqq" type="button">验证</button>
				</span>
					</form>
<!-- 				<script>
						$(function() {
							$('#verifyqq').click(function() {
								DJMask.open({
								　　width:"400px",
								　　height:"150px",
								　　title:"U袋网提示您：",
								　　content:"<b>该QQ不是客服-谨防受骗！</b>"
							　　});
							});
						});
					</script> -->
				</div>
				<div class="tags">
					<div class="tag"><i class="iconfont icon-real fz16"></i> 品牌正品</div>
					<div class="tag"><i class="iconfont icon-credit fz16"></i> 信誉认证</div>
					<div class="tag"><i class="iconfont icon-speed fz16"></i> 当天发货</div>
					<div class="tag"><i class="iconfont icon-tick fz16"></i> 人工质检</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 顶部轮播 -->
    <div class="swiper-container banner-box">
        <div class="swiper-wrapper">
            <div class="swiper-slide"><a href="item_show.jsp"><img src="${pageContext.request.contextPath}/images/temp/banner_1.jpg" class="cover"></a></div>
            <div class="swiper-slide"><a href="item_show.jsp"><img src="${pageContext.request.contextPath}/images/temp/banner_2.jpg" class="cover"></a></div>
            <div class="swiper-slide"><a href="item_category.html"><img src="${pageContext.request.contextPath}/images/temp/banner_3.jpg" class="cover"></a></div>
            <div class="swiper-slide"><a href="item_show.jsp"><img src="${pageContext.request.contextPath}/images/temp/banner_4.jpg" class="cover"></a></div>
            <div class="swiper-slide"><a href="item_sale_page.html"><img src="${pageContext.request.contextPath}/images/temp/banner_5.jpg" class="cover"></a></div>
        </div>
        <div class="swiper-pagination"></div>
    </div>
    <!-- 首页楼层导航 -->
		<nav class="floor-nav visible-lg-block">
		<c:forEach items="${topLevel}" var="c" varStatus="i">
		<c:choose>
			<c:when test="${i.index==0}">
				<span class="scroll-nav active">${c.name}</span>
			</c:when>
			<c:otherwise>
			<span class="scroll-nav">${c.name}</span>
			</c:otherwise>
			</c:choose>
		</c:forEach>
	</nav>
	<!-- 楼层内容 -->
	<div class="content inner" style="margin-bottom: 40px;">
		
		<section class="scroll-floor floor-2">
			<div class="floor-title">
				<i class="iconfont icon-skirt fz16"></i> 女装
				<div class="case-list fz0 pull-right">
					<a href="item_category.html">高端女装</a>
					<a href="item_category.html">时尚女装</a>
					<a href="item_category.html">上装</a>
					<a href="item_category.html">下装</a>
					<a href="item_category.html">裙装</a>
					<a href="item_category.html">内衣</a>
				</div>
			</div>
			<div class="con-box">
				<a class="left-img hot-img" href="">
					<img src="${pageContext.request.contextPath}/images/floor_2.jpg" alt="" class="cover">
				</a>
				<div class="right-box">
					<c:forEach items="${list1}" var="goods">
						<a href="${pageContext.request.contextPath}/web/main/detailsPage?id=${goods.id}" class="floor-item">
							<div class="item-img hot-img">
								<img src="${pageContext.request.contextPath}${goods.image}" alt="纯色圆领短袖T恤活a动衫弹" class="cover">
							</div>
							<div class="price clearfix">
								<span class="pull-left cr fz16">￥${goods.price }</span>
								<span class="pull-right c6">进货价</span>
							</div>
							<div class="name ep" title="纯色圆领短袖T恤活a动衫弹力柔软">${goods.name }</div>
						</a>
					</c:forEach>
				</div>
			</div>
		</section>
		<section class="scroll-floor floor-3">
			<div class="floor-title">
				<i class="iconfont icon-fushi fz16"></i> 男装
				<div class="case-list fz0 pull-right">
					<a href="item_category.html">高端女装</a>
					<a href="item_category.html">时尚女装</a>
					<a href="item_category.html">上装</a>
					<a href="item_category.html">下装</a>
					<a href="item_category.html">裙装</a>
					<a href="item_category.html">内衣</a>
				</div>
			</div>
			<div class="con-box">
				<a class="left-img hot-img" href="">
					<img src="${pageContext.request.contextPath}/images/floor_3.jpg" alt="" class="cover">
				</a>
				<div class="right-box">
					<c:forEach items="${list2}" var="goods">
						<a href="${pageContext.request.contextPath}/web/main/detailsPage?id=${goods.id}" class="floor-item">
							<div class="item-img hot-img">
								<img src="${pageContext.request.contextPath}${goods.image}" alt="纯色圆领短袖T恤活a动衫弹" class="cover">
							</div>
							<div class="price clearfix">
								<span class="pull-left cr fz16">￥${goods.price }</span>
								<span class="pull-right c6">进货价</span>
							</div>
							<div class="name ep" title="纯色圆领短袖T恤活a动衫弹力柔软">${goods.name }</div>
						</a>
					</c:forEach>
				</div>
			</div>
		</section>
		<section class="scroll-floor floor-4">
			<div class="floor-title">
				<i class="iconfont icon-kid fz16"></i> 活力童装
				<div class="case-list fz0 pull-right">
					<a href="item_category.html">高端女装</a>
					<a href="item_category.html">时尚女装</a>
					<a href="item_category.html">上装</a>
					<a href="item_category.html">下装</a>
					<a href="item_category.html">裙装</a>
					<a href="item_category.html">内衣</a>
				</div>
			</div>
			<div class="con-box">
				<a class="left-img hot-img" href="">
					<img src="${pageContext.request.contextPath}/images/floor_4.jpg" alt="" class="cover">
				</a>
				<div class="right-box">
					<c:forEach items="${list3}" var="goods">
						<a href="${pageContext.request.contextPath}/web/main/detailsPage?id=${goods.id}" class="floor-item">
							<div class="item-img hot-img">
								<img src="${pageContext.request.contextPath}${goods.image}" alt="纯色圆领短袖T恤活a动衫弹" class="cover">
							</div>
							<div class="price clearfix">
								<span class="pull-left cr fz16">￥${goods.price }</span>
								<span class="pull-right c6">进货价</span>
							</div>
							<div class="name ep" title="纯色圆领短袖T恤活a动衫弹力柔软">${goods.name }</div>
						</a>
					</c:forEach>
				</div>
			</div>
		</section>
		<section class="scroll-floor floor-5">
			<div class="floor-title">
				<i class="iconfont icon-bao fz16"></i> 时尚包包
				<div class="case-list fz0 pull-right">
					<a href="item_category.html">高端女装</a>
					<a href="item_category.html">时尚女装</a>
					<a href="item_category.html">上装</a>
					<a href="item_category.html">下装</a>
					<a href="item_category.html">裙装</a>
					<a href="item_category.html">内衣</a>
				</div>
			</div>
			<div class="con-box">
				<a class="left-img hot-img" href="">
					<img src="${pageContext.request.contextPath}/images/floor_5.jpg" alt="" class="cover">
				</a>
				<div class="right-box">
					<c:forEach items="${list4}" var="goods">
						<a href="${pageContext.request.contextPath}/web/main/detailsPage?id=${goods.id}" class="floor-item">
							<div class="item-img hot-img">
								<img src="${pageContext.request.contextPath}${goods.image}" alt="纯色圆领短袖T恤活a动衫弹" class="cover">
							</div>
							<div class="price clearfix">
								<span class="pull-left cr fz16">￥${goods.price }</span>
								<span class="pull-right c6">进货价</span>
							</div>
							<div class="name ep" title="纯色圆领短袖T恤活a动衫弹力柔软">${goods.name }</div>
						</a>
					</c:forEach>
				</div>
			</div>
		</section>
		<section class="scroll-floor floor-6">
			<div class="floor-title">
				<i class="iconfont icon-shoes fz16"></i> 鞋靴
				<div class="case-list fz0 pull-right">
					<a href="item_category.html">高端女装</a>
					<a href="item_category.html">时尚女装</a>
					<a href="item_category.html">上装</a>
					<a href="item_category.html">下装</a>
					<a href="item_category.html">裙装</a>
					<a href="item_category.html">内衣</a>
				</div>
			</div>
			<div class="con-box">
				<a class="left-img hot-img" href="">
					<img src="${pageContext.request.contextPath}/images/floor_6.jpg" alt="" class="cover">
				</a>
				<div class="right-box">
					<c:forEach items="${list5}" var="goods">
						<a href="${pageContext.request.contextPath}/web/main/detailsPage?id=${goods.id}" class="floor-item">
							<div class="item-img hot-img">
								<img src="${pageContext.request.contextPath}${goods.image}" alt="纯色圆领短袖T恤活a动衫弹" class="cover">
							</div>
							<div class="price clearfix">
								<span class="pull-left cr fz16">￥${goods.price }</span>
								<span class="pull-right c6">进货价</span>
							</div>
							<div class="name ep" title="纯色圆领短袖T恤活a动衫弹力柔软">${goods.name }</div>
						</a>
					</c:forEach>
				</div>
			</div>
		</section>
	</div>
	<script>
		$(document).ready(function(){ 
			// 顶部banner轮播
			var banner_swiper = new Swiper('.banner-box', {
				autoplayDisableOnInteraction : false,
				pagination: '.banner-box .swiper-pagination',
				paginationClickable: true,
				autoplay : 5000,
			});
			// 新闻列表滚动
			var notice_swiper = new Swiper('.notice-box .swiper-container', {
				paginationClickable: true,
				mousewheelControl : true,
				direction : 'vertical',
				slidesPerView : 10,
				autoplay : 2e3,
			});
			// 楼层导航自动 active
			$.scrollFloor();
			// 页面下拉固定楼层导航
			$('.floor-nav').smartFloat();
			$('.to-top').toTop({position:false});
		});
	</script>
	<!-- 右侧菜单 -->
	<div class="right-nav">
		<ul class="r-with-gotop">
			<li class="r-toolbar-item">
				<a href="udai_welcome.html" class="r-item-hd">
					<i class="iconfont icon-user"></i>
					<div class="r-tip__box"><span class="r-tip-text">用户中心</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="udai_shopcart.html" class="r-item-hd">
					<i class="iconfont icon-cart" data-badge="10"></i>
					<div class="r-tip__box"><span class="r-tip-text">购物车</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="udai_collection.html" class="r-item-hd">
					<i class="iconfont icon-aixin"></i>
					<div class="r-tip__box"><span class="r-tip-text">我的收藏</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="" class="r-item-hd">
					<i class="iconfont icon-liaotian"></i>
					<div class="r-tip__box"><span class="r-tip-text">联系客服</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="issues.html" class="r-item-hd">
					<i class="iconfont icon-liuyan"></i>
					<div class="r-tip__box"><span class="r-tip-text">留言反馈</span></div>
				</a>
			</li>
			<li class="r-toolbar-item to-top">
				<i class="iconfont icon-top"></i>
				<div class="r-tip__box"><span class="r-tip-text">返回顶部</span></div>
			</li>
		</ul>
	</div>
	<!-- 底部信息 -->
	<jsp:include page="footer.jsp"/>
</body>
</html>
