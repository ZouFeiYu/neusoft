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
					<div class="title">账户信息-修改支付密码</div>
					<div class="step-flow-box">
						<div class="step-flow__bd">
							<div class="step-flow__li step-flow__li_done">
							  <div class="step-flow__state"><i class="iconfont icon-ok"></i></div>
							  <p class="step-flow__title-top">验证身份</p>
							</div>
							<div class="step-flow__line step-flow__line_ing">
							  <div class="step-flow__process"></div>
							</div>
							<div class="step-flow__li">
							  <div class="step-flow__state"><i class="iconfont icon-ok"></i></div>
							  <p  class="step-flow__title-top">重置支付密码</p>
							</div>
							<div class="step-flow__line">
							  <div class="step-flow__process"></div>
							</div>
							<div class="step-flow__li">
							  <div class="step-flow__state"><i class="iconfont icon-ok"></i></div>
							  <p class="step-flow__title-top">完成</p>
							</div>
						</div>
					</div>
					<form action="udai_modifypay_step2.html" class="user-setting__form" role="form">
						<div class="form-group">
							<input class="form-control phone" name="phone" required="" maxlength="11" autocomplete="off" type="text">
							<span class="tip-text">手机号</span>
							<span class="error_tip"></span>
						</div>
						<div class="form-group">
							<div class="input-group">
								<input class="form-control" name="sms" type="text">
								<span class="tip-text">输入验证码</span>
								<span class="input-group-btn">
									<button class="btn btn-pink" id="getsms" type="button">发送验证码</button>
								</span>
							</div>
						</div>
						<div class="user-form-group tags-box">
							<button type="submit" class="btn ">提交</button>
						</div>
						<script src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/js/login.js"></script>
						<script>
							$(document).ready(function(){
								$('.form-control').on('blur focus',function() {
									$(this).addClass('focus');
									$('.error_tip').empty();
									if ($(this).val() == ''){$(this).removeClass('focus')}
								});
								$('#getsms').click(function() {
									var phone = $(this).parents('form').find('input.phone');
									var error = $(this).parents('form').find('.error_tip');
									switch(phone.validatemobile()) {
										case 0:
											// 短信验证码的php请求
											error.html('验证码 <strong>已发送</strong>');
											$(this).rewire(60);
										break;
										case 1: error.html('<strong>手机号码为空</strong> 请输入手机号码'); break;
										case 2: error.html('<strong>手机号码错误</strong> 请输入11位数的号码'); break;
										case 3: error.html('<strong>手机号码错误</strong> 请输入正确的号码'); break;
									}
								});
							});
						</script>
					</form>
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