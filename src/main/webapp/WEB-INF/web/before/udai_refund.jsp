<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
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
				<a class="logo" href="index.html"><img src="images/icons/logo.jpg" alt="U袋网" class="cover"></a>
				<div class="title">个人中心</div>
			</div>
		</div>
	</div>
	<div class="content clearfix bgf5">
		<section class="user-center inner clearfix">
			<div class="pull-left bgf">
				<a href="udai_welcome.html" class="title">U袋欢迎页</a>
				<dl class="user-center__nav">
					<dt>帐户信息</dt>
					<a href="udai_setting.html"><dd>个人资料</dd></a>
					<a href="udai_treasurer.html"><dd>资金管理</dd></a>
					<a href="udai_integral.html"><dd>积分平台</dd></a>
					<a href="udai_address.html"><dd>收货地址</dd></a>
					<a href="udai_coupon.html"><dd>我的优惠券</dd></a>
					<a href="udai_paypwd_modify.html"><dd>修改支付密码</dd></a>
					<a href="udai_pwd_modify.html"><dd>修改登录密码</dd></a>
				</dl>
				<dl class="user-center__nav">
					<dt>订单中心</dt>
					<a href="udai_order.html"><dd>我的订单</dd></a>
					<a href="udai_collection.html"><dd>我的收藏</dd></a>
					<a href="udai_refund.html"><dd class="active">退款/退货</dd></a>
				</dl>
				<dl class="user-center__nav">
					<dt>服务中心</dt>
					<a href="udai_mail_query.html"><dd>物流查询</dd></a>
					<a href=""><dd>数据自助下载</dd></a>
					<a href="temp_article/udai_article1.html"><dd>售后服务</dd></a>
					<a href="temp_article/udai_article2.html"><dd>配送服务</dd></a>
					<a href="temp_article/udai_article3.html"><dd>用户协议</dd></a>
					<a href="temp_article/udai_article4.html"><dd>常见问题</dd></a>
				</dl>
				<dl class="user-center__nav">
					<dt>新手上路</dt>
					<a href="temp_article/udai_article5.html"><dd>如何成为代理商</dd></a>
					<a href="temp_article/udai_article6.html"><dd>代销商上架教程</dd></a>
					<a href="temp_article/udai_article7.html"><dd>分销商常见问题</dd></a>
					<a href="temp_article/udai_article8.html"><dd>付款账户</dd></a>
				</dl>
				<dl class="user-center__nav">
					<dt>U袋网</dt>
					<a href="temp_article/udai_article10.html"><dd>企业简介</dd></a>
					<a href="temp_article/udai_article11.html"><dd>加入U袋</dd></a>
					<a href="temp_article/udai_article12.html"><dd>隐私说明</dd></a>
				</dl>
			</div>
			<div class="pull-right">
				<div class="user-content__box clearfix bgf">
					<div class="title">订单中心-退款/退货</div>
					<div class="order-list__box bgf">
						<div class="order-panel">
							<ul class="nav user-nav__title" role="tablist">
								<li role="presentation" class="nav-item active"><a href="#all" aria-controls="all" role="tab" data-toggle="tab">所有订单</a></li>
								<li role="presentation" class="nav-item "><a href="#money" aria-controls="money" role="tab" data-toggle="tab">退款 <span class="cr">0</span></a></li>
								<li role="presentation" class="nav-item "><a href="#item" aria-controls="item" role="tab" data-toggle="tab">退货 <span class="cr">0</span></a></li>
							</ul>

							<div class="tab-content">
								<div role="tabpanel" class="tab-pane fade in active" id="all">
									<table class="table table-hover table-striped text-center">
										<tr>
											<th width="170">申请单号</th>
											<th width="170">原订单号</th>
											<th width="170">商品名称</th>
											<th width="105">申请时间</th>
											<th width="105">应退金额</th>
											<th width="90">订单状态</th>
											<th width="90">操作</th>
										</tr>
										<tr>
											<td>2669901385864042</td>
											<td>2669901385864042</td>
											<td class="text-left">
												<div class="name ep" style="width: 180px">纯色圆领短袖T恤活动衫弹</div>
												<div class="c9 ep">颜色分类：深棕色  尺码：均码</div>
											</td>
											<td>2017-03-30</td>
											<td>¥18.0</td>
											<td class="refund-state">退款中<br><a href="">联系客服</a></td>
											<td class="refund-state"><a href="">取消退款</a></td>
										</tr>

										<tr>
											<td>2669901385864042</td>
											<td>2669901385864042</td>
											<td class="text-left">
												<div class="name ep" style="width: 180px">纯色圆领短袖T恤活动衫弹</div>
												<div class="c9 ep">颜色分类：深棕色  尺码：均码</div>
											</td>
											<td>2017-03-30</td>
											<td>¥18.0</td>
											<td class="refund-state">已退货<br><a href="">联系客服</a></td>
											<td class="refund-state"><a href="">完成</a></td>
										</tr>

										<tr><td>2669901385864042</td><td>2669901385864042</td><td class="text-left"><div class="name ep" style="width: 180px">纯色圆领短袖T恤活动衫弹</div><div class="c9 ep">颜色分类：深棕色  尺码：均码</div></td><td>2017-03-30</td><td>¥18.0</td><td class="refund-state">已退款<br><a href="">联系客服</a></td><td class="refund-state"><a href="">完成</a></td></tr>
										<tr><td>2669901385864042</td><td>2669901385864042</td><td class="text-left"><div class="name ep" style="width: 180px">纯色圆领短袖T恤活动衫弹</div><div class="c9 ep">颜色分类：深棕色  尺码：均码</div></td><td>2017-03-30</td><td>¥18.0</td><td class="refund-state">退款中<br><a href="">联系客服</a></td><td class="refund-state"><a href="">取消退款</a></td></tr><tr><td>2669901385864042</td><td>2669901385864042</td><td class="text-left"><div class="name ep" style="width: 180px">纯色圆领短袖T恤活动衫弹</div><div class="c9 ep">颜色分类：深棕色  尺码：均码</div></td><td>2017-03-30</td><td>¥18.0</td><td class="refund-state">退款中<br><a href="">联系客服</a></td><td class="refund-state"><a href="">取消退款</a></td></tr><tr><td>2669901385864042</td><td>2669901385864042</td><td class="text-left"><div class="name ep" style="width: 180px">纯色圆领短袖T恤活动衫弹</div><div class="c9 ep">颜色分类：深棕色  尺码：均码</div></td><td>2017-03-30</td><td>¥18.0</td><td class="refund-state">退款中<br><a href="">联系客服</a></td><td class="refund-state"><a href="">取消退款</a></td></tr><tr><td>2669901385864042</td><td>2669901385864042</td><td class="text-left"><div class="name ep" style="width: 180px">纯色圆领短袖T恤活动衫弹</div><div class="c9 ep">颜色分类：深棕色  尺码：均码</div></td><td>2017-03-30</td><td>¥18.0</td><td class="refund-state">退款中<br><a href="">联系客服</a></td><td class="refund-state"><a href="">取消退款</a></td></tr><tr><td>2669901385864042</td><td>2669901385864042</td><td class="text-left"><div class="name ep" style="width: 180px">纯色圆领短袖T恤活动衫弹</div><div class="c9 ep">颜色分类：深棕色  尺码：均码</div></td><td>2017-03-30</td><td>¥18.0</td><td class="refund-state">退款中<br><a href="">联系客服</a></td><td class="refund-state"><a href="">取消退款</a></td></tr><tr><td>2669901385864042</td><td>2669901385864042</td><td class="text-left"><div class="name ep" style="width: 180px">纯色圆领短袖T恤活动衫弹</div><div class="c9 ep">颜色分类：深棕色  尺码：均码</div></td><td>2017-03-30</td><td>¥18.0</td><td class="refund-state">退款中<br><a href="">联系客服</a></td><td class="refund-state"><a href="">取消退款</a></td></tr><tr><td>2669901385864042</td><td>2669901385864042</td><td class="text-left"><div class="name ep" style="width: 180px">纯色圆领短袖T恤活动衫弹</div><div class="c9 ep">颜色分类：深棕色  尺码：均码</div></td><td>2017-03-30</td><td>¥18.0</td><td class="refund-state">退款中<br><a href="">联系客服</a></td><td class="refund-state"><a href="">取消退款</a></td></tr><tr><td>2669901385864042</td><td>2669901385864042</td><td class="text-left"><div class="name ep" style="width: 180px">纯色圆领短袖T恤活动衫弹</div><div class="c9 ep">颜色分类：深棕色  尺码：均码</div></td><td>2017-03-30</td><td>¥18.0</td><td class="refund-state">退款中<br><a href="">联系客服</a></td><td class="refund-state"><a href="">取消退款</a></td></tr><tr><td>2669901385864042</td><td>2669901385864042</td><td class="text-left"><div class="name ep" style="width: 180px">纯色圆领短袖T恤活动衫弹</div><div class="c9 ep">颜色分类：深棕色  尺码：均码</div></td><td>2017-03-30</td><td>¥18.0</td><td class="refund-state">退款中<br><a href="">联系客服</a></td><td class="refund-state"><a href="">取消退款</a></td></tr><tr><td>2669901385864042</td><td>2669901385864042</td><td class="text-left"><div class="name ep" style="width: 180px">纯色圆领短袖T恤活动衫弹</div><div class="c9 ep">颜色分类：深棕色  尺码：均码</div></td><td>2017-03-30</td><td>¥18.0</td><td class="refund-state">退款中<br><a href="">联系客服</a></td><td class="refund-state"><a href="">取消退款</a></td></tr><tr><td>2669901385864042</td><td>2669901385864042</td><td class="text-left"><div class="name ep" style="width: 180px">纯色圆领短袖T恤活动衫弹</div><div class="c9 ep">颜色分类：深棕色  尺码：均码</div></td><td>2017-03-30</td><td>¥18.0</td><td class="refund-state">退款中<br><a href="">联系客服</a></td><td class="refund-state"><a href="">取消退款</a></td></tr><tr><td>2669901385864042</td><td>2669901385864042</td><td class="text-left"><div class="name ep" style="width: 180px">纯色圆领短袖T恤活动衫弹</div><div class="c9 ep">颜色分类：深棕色  尺码：均码</div></td><td>2017-03-30</td><td>¥18.0</td><td class="refund-state">退款中<br><a href="">联系客服</a></td><td class="refund-state"><a href="">取消退款</a></td></tr>
									</table>
									<div class="page text-right clearfix" style="margin-top: 40px">
										<a class="disabled">上一页</a>
										<a class="select">1</a>
										<a href="">2</a>
										<a href="">3</a>
										<a class="" href="">下一页</a>
									</div>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="money">
									<table class="table text-center">
										<tr>
											<th width="380">商品信息</th>
											<th width="85">单价</th>
											<th width="85">数量</th>
											<th width="120">实付款</th>
											<th width="120">交易状态</th>
											<th width="120">交易操作</th>
										</tr>
										<tr class="order-empty"><td colspan='6'>
											<div class="empty-msg">最近没有退款订单！</div>
										</td></tr>
									</table>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="item">
									<table class="table text-center">
										<tr>
											<th width="380">商品信息</th>
											<th width="85">单价</th>
											<th width="85">数量</th>
											<th width="120">实付款</th>
											<th width="120">交易状态</th>
											<th width="120">交易操作</th>
										</tr>
										<tr class="order-empty"><td colspan='6'>
											<div class="empty-msg">最近没有退货订单！</div>
										</td></tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				
				</div>
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