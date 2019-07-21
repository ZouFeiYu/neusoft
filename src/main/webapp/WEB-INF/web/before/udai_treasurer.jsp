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
					<a href="udai_treasurer.html"><dd class="active">资金管理</dd></a>
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
					<div class="title">账户信息-资金管理</div>
					<div class="assets-box">
						<samll class="c6">账户余额：</samll>
						<samll class="cr">¥</samll>
						<b class="fz16 cr">88.0</b>
						<ul class="nav pull-right" role="tablist">
							<li role="presentation" class="active"><a href="#add" aria-controls="add" role="tab" data-toggle="tab">充值</a></li>
							<li role="presentation" class=""><a href="#up" aria-controls="up" role="tab" data-toggle="tab">提现</a></li>
							<li role="presentation" class=""><a href="#log" aria-controls="log" role="tab" data-toggle="tab">交易记录</a></li>
						</ul>
					</div>
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="add">
							<form action="" class="user-setting__form" role="form">
								<div class="form-group">
									<label for="add-money">充值金额</label>
									<input id="add-money" class="assets-control" placeholder="输入您要充值的金额" type="text">
								</div>
								<div class="form-group">
									<label for="add-note">备注（可不填）</label>
									<textarea id="add-note" class="assets-control" placeholder=""></textarea>
								</div>
								<div class="form-group">
									<label for="note">支付方式（手续费 <span id="tip">0</span>）</label>
									<div class="pay-method-box tags-box">
										<label><input type="radio" name="pay_method" value="Alipay"><i class="pay-method__img alipay"></i></label>
										<label><input type="radio" name="pay_method" value="WeChat"><i class="pay-method__img wechat"></i></label>
									</div>
								</div>
								<div class="user-form-group tags-box">
									<button type="button" class="btn ">立即支付</button>
									<button type="reset" class="btn ">重置</button>
								</div>
							</form>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="up">
							<form action="" class="user-setting__form" role="form">
								<div class="form-group">
									<label for="up-money">提现金额</label>
									<input id="up-money" class="assets-control" placeholder="输入您要提现的金额" type="text">
									<span class="help-block fz12">注：单次提现，提现金额不低于100.0元</span>
								</div>
								<div class="form-group">
									<label for="up-name">姓名</label>
									<input id="up-name" class="assets-control" placeholder="输入您的姓名" type="text">
								</div>
								<div class="form-group">
									<label for="up-bank">开户行</label>
									<input id="up-bank" class="assets-control" placeholder="开户行" type="text">
								</div>
								<div class="form-group">
									<label for="up-number">银行账号</label>
									<input id="up-number" class="assets-control" placeholder="银行账号" type="text">
								</div>
								<div class="form-group">
									<label for="up-phone">手机号码</label>
									<input id="up-phone" class="assets-control" placeholder="请输入您的联系号码" type="text">
								</div>
								<div class="form-group">
									<label for="up-note">备注（可不填）</label>
									<textarea id="up-note" class="assets-control" placeholder=""></textarea>
								</div>
								<div class="user-form-group tags-box">
									<button type="button" class="btn ">申请提现</button>
									<button type="reset" class="btn ">重置</button>
								</div>
							</form>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="log">
							<div class="bs-example" data-example-id="hoverable-table">
								<table class="assets-table table table-bordered table-hover c6 text-center">
									<thead>
										<tr>
											<th>操作时间</th>
											<th>类型</th>
											<th>金额</th>
											<th>备注</th>
											<th>状态</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>2017.09.20 17:20</td>
											<td>充值</td>
											<td>50.00</td>
											<td>充值代销</td>
											<td><span class="text-primary">未确认</span></td>
											<td><a href="">付款</a> <a href="">取消</a></td>
										</tr>
										<tr>
											<td>2017.09.20 17:20</td>
											<td>提现</td>
											<td>50.00</td>
											<td>提现金额</td>
											<td><span class="text-success">完成</span></td>
											<td>-</td>
										</tr>
										<tr>
											<td>2017.09.20 17:20</td>
											<td>提现</td>
											<td>50.00</td>
											<td>提现金额</td>
											<td><span class="text-info">提现中</span></td>
											<td><a href="">联系客服</a></td>
										</tr>
										<tr>
											<td>2017.09.20 17:20</td>
											<td>提现</td>
											<td>50.00</td>
											<td>无</td>
											<td><span class="text-success">完成</span></td>
											<td>-</td>
										</tr>
									</tbody>
								</table>
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