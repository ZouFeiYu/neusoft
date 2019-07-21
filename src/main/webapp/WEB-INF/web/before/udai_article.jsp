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
				<a href="" class="title">U袋欢迎页</a>
				<dl class="user-center__nav">
					<dt>帐户信息</dt>
					<a href=""><dd>个人资料</dd></a>
					<a href=""><dd>资金管理</dd></a>
					<a href=""><dd>积分平台</dd></a>
					<a href=""><dd>收货地址</dd></a>
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
					<a href="temp_article/udai_article1.html"><dd class="active">售后服务</dd></a>
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
			<div class="pull-right bgf">
				<div class="user-center__content">
					<div class="head-box">服务中心-售后服务</div>
					<div class="html-code">
						<h3>售后服务管理常见问题</h3>
						<ul style="text-indent: 2em">
							<li>• 如何提高服务资源的使用效率，降低服务成本？</li>
							<li>• 如何提高服务质量，提高客户满意度？</li>
							<li>• 如何对售后服务的全流程进行精细化的管理？</li>
							<li>• 如何合理分派现场工程师，并监督他们的工作进度？</li>
							<li>• 如何帮助现场工程师方便地申请到备件？</li>
							<li>• 如何帮助现场工程师更快地解决问题？</li>
							<li>• 如何对现场工程师进行考核？</li>
							<li>• 如何发现售后服务中存在的问题，并进行改进？</li>
						</ul>
						<h3>U袋售后服务系统简介</h3>
						<p style="text-indent: 2em">U袋售后服务管理系统是新U袋公司将售后服务领域的专业经验，与强大的任务流程管理平台及最新的信息技术结合在一起，专门为企业的售后服务业务打造的一款专业的售后服务管理软件，它提供对售后服务全流程自动化精细化管理，帮助企业大大提高服务资源的使用效率，节约服务运营成本，提升客户体验，提高客户满意度。</p>
						<p style="text-indent: 2em">U袋售后服务管理系统可以帮助企业系统化地管理售后服务运营中的各项业务，包括客服中心（呼叫中心或服务热线）、客户管理、服务请求管理、现场任务管理、备件管理、服务资源的管理、安装记录管理、服务业务机会和服务财务管理等。</p>
						<h3>U袋售后服务系统目标</h3>
						<ul style="text-indent: 2em">
							<li>• 进一步优化服务运营的流程</li>
							<li>• 提高服务响应速度和质量，从而提高客户满意度</li>
							<li>• 提高内部各团队的协作和信息共享</li>
							<li>• 提高服务资源的使用效率，降低服务运营的成本</li>
							<li>• 增加服务业务的机会和成功率以及产品的销售机会</li>
							<li>• 提供产品质量的追溯</li>
							<li>• 为决策层及时提供售后服务数据统计、分析和报表</li>
						</ul>
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