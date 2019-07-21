<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<a class="logo" href="${pageContext.request.contextPath}/web/main/index"><img src="${pageContext.request.contextPath}/images/icons/logo.jpg" alt="U袋网" class="cover"></a>
				<div class="title">购物车</div>
			</div>
		</div>
	</div>
	<div class="content clearfix bgf5">
		<section class="user-center inner clearfix">
			<div class="user-content__box clearfix bgf">
				<div class="title">购物车-确认支付 </div>
				<div class="shop-title">收货地址</div>
				<form action="" class="shopcart-form__box">
					<div class="addr-radio">
						<div class="radio-line radio-box active">
							<label class="radio-label ep" title="福建省 福州市 鼓楼区 温泉街道 五四路159号世界金龙大厦20层B北 福州rpg.blue网络 （喵喵喵 收） 153****9999">
								<input name="addr" checked="" value="0" autocomplete="off" type="radio"><i class="iconfont icon-radio"></i>
								福建省 福州市 鼓楼区 温泉街道
								五四路159号世界金龙大厦20层B北 福州rpg.blue网络
								（喵喵喵 收） 153****9999
							</label>
							<a href="javascript:;" class="default">默认地址</a>
							<a href="udai_address_edit.html" class="edit">修改</a>
						</div>
						<div class="radio-line radio-box">
							<label class="radio-label ep" title="福建省 福州市 鼓楼区 温泉街道 五四路159号世界金龙大厦20层B北 福州rpg.blue网络 （taroxd 收） 153****9999">
								<input name="addr" value="1" autocomplete="off" type="radio"><i class="iconfont icon-radio"></i>
								福建省 福州市 鼓楼区 温泉街道
								五四路159号世界金龙大厦20层B北 福州rpg.blue网络
								（taroxd 收） 153****9999
							</label>
							<a href="" class="default">设为默认地址</a>
							<a href="udai_address_edit.html" class="edit">修改</a>
						</div>
						<div class="radio-line radio-box">
							<label class="radio-label ep" title="福建省 福州市 鼓楼区 温泉街道 五四路159号世界金龙大厦20层B北 福州rpg.blue网络 （喵污喵⑤ 收） 153****9999">
								<input name="addr" value="2" autocomplete="off" type="radio"><i class="iconfont icon-radio"></i>
								福建省 福州市 鼓楼区 温泉街道
								五四路159号世界金龙大厦20层B北 福州rpg.blue网络
								（喵污喵⑤ 收） 153****9999
							</label>
							<a href="" class="default">设为默认地址</a>
							<a href="udai_address_edit.html" class="edit">修改</a>
						</div>
						<div class="radio-line radio-box">
							<label class="radio-label ep" title="福建省 福州市 鼓楼区 温泉街道 五四路159号世界金龙大厦20层B北 福州rpg.blue网络 （浴巾打码女 收） 153****9999">
								<input name="addr" value="2" autocomplete="off" type="radio"><i class="iconfont icon-radio"></i>
								福建省 福州市 鼓楼区 温泉街道
								五四路159号世界金龙大厦20层B北 福州rpg.blue网络
								（浴巾打码女 收） 153****9999
							</label>
							<a href="" class="default">设为默认地址</a>
							<a href="udai_address_edit.html" class="edit">修改</a>
						</div>
					</div>
					<div class="add_addr"><a href="udai_address.html">添加新地址</a></div>
					<div class="shop-title">确认订单</div>
					<div class="shop-order__detail">
						<table class="table">
							<thead>
								<tr>
									<th width="120"></th>
									<th width="300">商品信息</th>
									<th width="150">单价</th>
									<th width="200">数量</th>
									<th width="200">运费</th>
									<th width="80">总价</th>
								</tr>
							</thead>
							<tbody>
							<!-- 循环得到购物车信息 -->
								<c:forEach items="${cart}" var="cart">
									<tr>
										<th scope="row"><a href="item_show.html"><div class="img"><img src="${pageContext.request.contextPath}${cart.image}" alt="" class="cover"></div></a></th>
										<td>
											<div class="name ep3">${cart.name }</div>
											<div class="type c9">颜色分类：深棕色  尺码：均码</div>
										</td>
										<td>¥${cart.price }</td>
										<td>${cart.count}</td>
										<td>¥0.0</td>
										<td>
										<span>￥</span>
										<span class="totle_information">${cart.price * cart.count}</span>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="shop-cart__info clearfix">
						<div class="pull-left text-left">
							<div class="info-line text-nowrap">购买时间：<span class="c6">${date }</span></div>
							<div class="info-line text-nowrap">交易类型：<span class="c6">担保交易</span></div>
							<div class="info-line text-nowrap">交易号：<span class="c6">1001001830267490496</span></div>
						</div>
						<div class="pull-right text-right">
							<div class="form-group">
								<label for="coupon" class="control-label">优惠券使用：</label>
								<select id="coupon" >
									<option value="-1" selected>- 请选择可使用的优惠券 -</option>
									<option value="1">【满￥20.0元减￥2.0】</option>
									<option value="2">【满￥30.0元减￥2.0】</option>
									<option value="3">【满￥25.0元减￥1.0】</option>
									<option value="4">【满￥10.0元减￥1.5】</option>
									<option value="5">【满￥15.0元减￥1.5】</option>
									<option value="6">【满￥20.0元减￥1.0】</option>
								</select>
							</div>
							<script>
								$(function(){
									var sum = 0.00;
									var amount=0;
									$(".totle_information").each(function() {
										sum += parseInt($(this).text());
										$(".Total").text(sum.toFixed(2));
										$(".fz16").text(sum.toFixed(2));
									})
								})
								
								$('#coupon').bind('change',function() {
									console.log($(this).val());
								})
							</script>
							<div class="info-line">优惠活动：<span class="c6">无</span></div>
							<div class="info-line">运费：<span class="c6">¥0.00</span></div>
							<div class="info-line"><span class="favour-value">已优惠 ¥0.0</span>合计：<b class="fz18 cr"><span>¥</span><span class="Total"></span></b></div>
							<div class="info-line fz12 c9">（可获 <span class="c6">20</span> 积分）</div>
						</div>
					</div>
					<div class="shop-title">确认订单</div>
					<div class="pay-mode__box">
						<div class="radio-line radio-box">
							<label class="radio-label ep">
								<input name="pay-mode" value="2" autocomplete="off" type="radio" class="val"><i class="iconfont icon-radio"></i>
								<img src="${pageContext.request.contextPath}/images/icons/alipay.png" alt="支付宝支付">
							</label>
							<div class="pay-value">支付<b class="fz16 cr">18.00</b>元</div>
						</div>
						<div class="radio-line radio-box">
							<label class="radio-label ep">
								<input name="pay-mode" value="3" autocomplete="off" type="radio"><i class="iconfont icon-radio"></i>
								<img src="${pageContext.request.contextPath}/images/icons/paywechat.png" alt="微信支付">
							</label>
							<div class="pay-value">支付<b class="fz16 cr">18.00</b>元</div>
						</div>
					</div>
					<div class="user-form-group shopcart-submit">
						<div class="btn" id="buy">继续支付</div>
					</div>
					<script>
					
						$(document).ready(function(){
							$(this).on('change','input',function() {
								$(this).parents('.radio-box').addClass('active').siblings().removeClass('active');
							})
						});
						$('.btn').click(function(){
							alert('支付成功');
							location="${pageContext.request.contextPath}/web/main/index";
						})
					</script>
				</form>
			</div>
		</section>
	</div>
	<!-- 右侧菜单 -->
	<div class="right-nav">
		<ul class="r-with-gotop">
			<li class="r-toolbar-item">
				<a href="udai_welcome.html" class="r-item-hd">
					<i class="iconfont icon-user" data-badge="0"></i>
					<div class="r-tip__box"><span class="r-tip-text">用户中心</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="udai_shopcart.html" class="r-item-hd">
					<i class="iconfont icon-cart"></i>
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
		<script>
			$(document).ready(function(){ $('.to-top').toTop({position:false}) });
		</script>
	</div>
	<!-- 底部信息 -->
	<jsp:include page="footer.jsp"/>
</body>
</html>