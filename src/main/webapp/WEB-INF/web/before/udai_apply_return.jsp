<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<a href="udai_order.html"><dd class="active">我的订单</dd></a>
					<a href="udai_collection.html"><dd>我的收藏</dd></a>
					<a href="udai_refund.html"><dd>退款/退货</dd></a>
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
					<div class="title">订单中心-申请退款/退货</div>
					<div class="order-info__box">
						<div class="step-flow-box" style="width: 800px;margin: 0 auto 24px">
							<div class="step-flow__bd">
								<div class="step-flow__li step-flow__li_done">
									<div class="step-flow__state"><i class="iconfont icon-ok"></i></div>
									<p class="step-flow__title-top">买家申请</p>
								</div>
								<div class="step-flow__line step-flow__line_ing">
									<div class="step-flow__process"></div>
								</div>
								<div class="step-flow__li">
									<div class="step-flow__state"><i class="iconfont icon-ok"></i></div>
									<p class="step-flow__title-top">卖家处理</p>
								</div>
								<div class="step-flow__line">
									<div class="step-flow__process"></div>
								</div>
								<div class="step-flow__li">
									<div class="step-flow__state"><i class="iconfont icon-ok"></i></div>
									<p class="step-flow__title-top">完毕</p>
								</div>
							</div>
						</div>
						<hr>
						<div class="return-item__info">
							<div class="img"><img src="images/temp/M-001.jpg" alt="" class="cover"></div>
							<div class="name ep2">锦瑟 原创传统日常汉服男绣花交领衣裳cp情侣装春夏款</div>
							<div class="type">颜色分类：深棕色 尺码：均码</div>
							<div class="num">订单编号：156465416412132</div>
						</div>
						<form action="" class="user-addr__form form-horizontal" role="form">
							<div class="form-group">
								<label class="col-sm-2 control-label">服务类型：</label>
								<div class="col-sm-6">
									<div class="user-form-group return_val c6">
										<label><input name="money" value="0" type="radio"><i class="iconfont icon-radio"></i> 仅退款</label><br>
										<label><input name="money" value="1" type="radio"><i class="iconfont icon-radio"></i> 退货退款</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">货物状态：</label>
								<div class="col-sm-6">
									<div class="user-form-group return_val c6">
										<label><input name="item" value="0" type="radio"><i class="iconfont icon-radio"></i> 未收到货</label><br>
										<label><input name="item" value="1" type="radio"><i class="iconfont icon-radio"></i> 已收到货</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">退款金额：</label>
								<div class="col-sm-6">
									<div class="return_val cr">￥15.0</div>
								</div>
							</div>
							<div class="form-group">
								<label for="cause" class="col-sm-2 control-label">退款原因：</label>
								<div class="col-sm-10">
									<select name="town" id="cause">
										<option value="0">请选择</option>
										<option value="1">质量问题</option>
										<option value="2">发错货物</option>
										<option value="3">七天无理由退换</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="note" class="col-sm-2 control-label">退款说明：</label>
								<div class="col-sm-6">
									<textarea class="form-control" id="note" rows="3"></textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-3">
									<button type="submit" class="but">提交</button>
								</div>
							</div>
						</form>
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