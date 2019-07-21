<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
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
			<jsp:include page="pull_left.jsp"></jsp:include>
			<div class="pull-right">
				<div class="user-content__box clearfix bgf">
					<div class="title">订单中心-订单2669901385864042</div>
					<div class="order-info__box">
						<div class="order-addr">收货地址：<span class="c6">${order.consignee}，${order.phone}，${order.address} </span></div>
						<div class="order-info">
							订单信息
							<table>
								<tr>
									<td>订单编号：${order.id }</td>
									<td>支付宝交易号：20175215464616164616</td>
									<td>创建时间：2017-09-20 08:15:45</td>
								</tr>
								<tr>
									<td>付款时间：2017-09-20 08:15:45</td>
									<td>成交时间：2017-09-20 08:25:45</td>
									<td></td>
								</tr>
							</table>
						</div>
						<div class="table-thead">
							<div class="tdf3">商品</div>
							<div class="tdf1">状态</div>
							<div class="tdf1">数量</div>
							<div class="tdf1">单价</div>
							<div class="tdf2">优惠</div>
							<div class="tdf1">总价</div>
							<div class="tdf1">运费</div>
						</div>
						<div class="order-item__list">
							<c:forEach items="${goodses}" var="goods">
								<div class="item">
									<div class="tdf3">
										<a href="item_show.html"><div class="img"><img src="${pageContext.request.contextPath}/images/temp/M-003.jpg" alt="" class="cover"></div>
										<div class="ep2 c6">${goods.name }</div></a>
										<div class="attr ep">${goods.details}</div>
									</div>
									<div class="tdf1"><a href="order_evaluate.html">待评价</a><!-- 已确认收货 --></div>
									<div class="tdf1">${goods.count }</div>
									<div class="tdf1">${goods.price}</div>
									<div class="tdf2">
										<div class="ep2">活动8折优惠<br>优惠：¥ 
											<fmt:formatNumber type="number" value="${goods.price-goods.price * 0.8 }" pattern="0.00" maxFractionDigits="2"/>
										</div>
									</div>
									<div class="tdf1 payCount">¥
											<fmt:formatNumber type="number" value="${(goods.price-goods.price * 0.8)*goods.count}" pattern="0.00" maxFractionDigits="2"/>
									</div>
									<div class="tdf1">
										<div class="ep2">快递<br>¥0.00</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="price-total">
							<div class="fz12 c9">使用优惠券【满￥20.0减￥2.0】优惠￥2.0元<br>快递运费 ￥0.0</div>
							<div class="fz18 c6">实付款：<b class="cr" id="allPay"></b></div>
							<div class="fz12 c9">（本单可获 <span class="c6">380</span> 积分）</div>
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
	<!-- 记账 -->
	<script >
		$(function(){
			var total=0;
			$(".payCount").each(function(){
			});
			
		});
	</script>
</body>
</html>