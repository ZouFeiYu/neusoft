<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<jsp:include page="header.jsp"/>
<body>
	<!-- 顶部tab -->
	<jsp:include page="navigation.jsp"/>
	<!-- 顶部标题 -->
	<div class="bgf5 clearfix">
		<div class="top-user">
			<div class="inner">
				<a class="logo" href="index.html"><img src="${pageContext.request.contextPath}/images/icons/logo.jpg" alt="U袋网" class="cover"></a>
				<div class="title">个人中心</div>
			</div>
		</div>
	</div>
	<div class="content clearfix bgf5">
		<section class="user-center inner clearfix">
			<jsp:include page="pull_left.jsp"/>
			<div class="pull-right">
				<div class="user-content__box clearfix bgf">
					<div class="title">订单中心-我的订单</div>
					<div class="order-list__box bgf">
						<div class="order-panel">
							<ul class="nav user-nav__title" role="tablist">
								<li role="presentation" class="nav-item active"><a href="#all" aria-controls="all" role="tab" data-toggle="tab">所有订单</a></li>
								<li role="presentation" class="nav-item "><a href="#pay" aria-controls="pay" role="tab" data-toggle="tab">待付款 <span class="cr">0</span></a></li>
								<li role="presentation" class="nav-item "><a href="#emit" aria-controls="emit" role="tab" data-toggle="tab">待发货 <span class="cr">0</span></a></li>
								<li role="presentation" class="nav-item "><a href="#take" aria-controls="take" role="tab" data-toggle="tab">待收货 <span class="cr">0</span></a></li>
								<li role="presentation" class="nav-item "><a href="#eval" aria-controls="eval" role="tab" data-toggle="tab">待评价 <span class="cr">0</span></a></li>
							</ul>

							<div class="tab-content">
								<div role="tabpanel" class="tab-pane fade in active" id="all">
									<table class="table text-center">
										<tr>
											<th width="380">商品信息</th>
											<th width="85">总商品数量</th>
											<th width="120">实付款</th>
											<th width="120">交易状态</th>
											<th width="120">交易操作</th>
										</tr>
										<c:forEach items="${orders}"  var="order">
										<tr class="order-item">
											<td>
												<label>
													<a href="udai_order_detail.html" class="num">
														2017-03-30 订单号: ${order.id}
													</a>
													<div class="card">
														<div class="img"><img src="${pageContext.request.contextPath}/images/temp/item-img_1.jpg" alt="" class="cover"></div>
														<div class="name ep2">纯色圆领短袖T恤活动衫弹力柔软纯色圆领短袖T恤</div>
													</div>
												</label>
											</td>
											<td>${fn:length(order.goods)}</td>
											<td>￥1000<br><span class="fz12 c6 text-nowrap">(含运费: ¥0.00)</span></td>
											<td class="state">
												<c:if test="${order.state==0}"><a class="but c6">等待付款</a></c:if>
												<c:if test="${order.state==1}"><a class="but c6">等待收货</a></c:if>
												<c:if test="${order.state==2}"><a class="but c6">已完成</a></c:if>
												<a href="${pageContext.request.contextPath}/web/main/orderDetailPage/${sessionScope.user.id}?orderId=${order.id}" class="but c9">订单详情</a>
											</td>
											<td class="order">
												<div class="del"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></div>
												<a href="${pageContext.request.contextPath}/web/main/orderDetailPage/${sessionScope.user.id}" class="but but-primary">立即付款</a>
												<!-- <a href="" class="but but-link">评价</a> -->
												<a href="" class="but c3">取消订单</a>
											</td>
										</tr>
										</c:forEach>
									</table>
									<div class="page text-right clearfix" style="margin-top: 40px">
									<!-- 上一页 -->
									<c:choose>
										<c:when test="${page != 1 }">
											<a href=" ">上一页</a>
										</c:when>
										<c:otherwise>
											<a class="disabled">上一页</a>
										</c:otherwise>
									</c:choose>
									<!-- 页数列表 -->
									<c:if test="${pageSize==1}">
											<a class="select">1</a>
									</c:if>
									<c:if test="${pageSize==2}">
											<c:choose>
											<c:when test="${page == 1 }">
												<a class="select">1</a>
												<a href="${pageContext.request.contextPath}/web/main/ordersPage/${sessionScope.user.id}?page=${page+1}">2</a> 
											</c:when>
											<c:when test="${page == pageSize }">
												<a href="${pageContext.request.contextPath}/web/main/ordersPage/${sessionScope.user.id}?page=${page-1}">${page-1 }</a> 
												<a class="select">${page }</a> 
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath}/web/main/ordersPage/${sessionScope.user.id}?page=${page-1}">${page-1 }</a> 
												<a class="select">${page }</a> 
											</c:otherwise>
										</c:choose>
									</c:if>
									<c:if test="${pageSize}>=3">
									<c:choose>
										<c:when test="${page == 1 }">
											<a class="select">1</a>
											<a href="${pageContext.request.contextPath}/web/main/ordersPage/${sessionScope.user.id}?page=${page+1}">2</a> 
											<a href="${pageContext.request.contextPath}/web/main/ordersPage/${sessionScope.user.id}?page=${page+2}">3</a> 
										</c:when>
										<c:when test="${page == pageSize }">
											<a href="${pageContext.request.contextPath}/web/main/ordersPage/${sessionScope.user.id}?page=${page-1}">${page-1 }</a> 
											<a class="select">${page }</a> 
										</c:when>
										<c:otherwise>
											<a href="${pageContext.request.contextPath}/web/main/ordersPage/${sessionScope.user.id}?page=${page-1}">${page-1 }</a> 
											<a class="select">${page }</a> 
											<a href="${pageContext.request.contextPath}/web/main/ordersPage/${sessionScope.user.id}?page=${page+1}">${page+1 }</a> 
										</c:otherwise>
									</c:choose>
									<!-- 下一页 -->
									<c:choose>
										<c:when test="${page != pageSize }">
											<a href="${pageContext.request.contextPath}/web/main/ordersPage/${sessionScope.user.id}?page=${page+1}">下一页</a>
										</c:when>
										<c:otherwise>
											<a class="disabled">下一页</a>
									</c:otherwise>
									</c:choose>
								</c:if>
								</div>
								</div>
							</div>
						</div>
					</div>
				
				</div>
			</div>
		</section>
	</div>
	<!-- 右侧菜单 -->
	<jsp:include page="right_navi.jsp"/>
	<!-- 底部信息 -->
	<jsp:include page="footer.jsp"/>
</body>
</html>