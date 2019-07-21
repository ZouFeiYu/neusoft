<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
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
					<div class="title">账户信息-修改登陆密码</div>
					<div class="step-flow-box">
						<div class="step-flow__bd">
							<div class="step-flow__li step-flow__li_done">
							  <div class="step-flow__state"><i class="iconfont icon-ok"></i></div>
							  <p class="step-flow__title-top">输入旧密码</p>
							</div>
							<div class="step-flow__line step-flow__li_done">
							  <div class="step-flow__process"></div>
							</div>
							<div class="step-flow__li step-flow__li_done">
							  <div class="step-flow__state"><i class="iconfont icon-ok"></i></div>
							  <p  class="step-flow__title-top">重置登陆密码</p>
							</div>
							<div class="step-flow__line step-flow__line_ing">
							  <div class="step-flow__process"></div>
							</div>
							<div class="step-flow__li">
							  <div class="step-flow__state"><i class="iconfont icon-ok"></i></div>
							  <p class="step-flow__title-top">完成</p>
							</div>
						</div>
					</div>
					<form action="udai_modifypwd_step3.html" class="user-setting__form" role="form">
						<div class="form-group">
							<input type="hidden" id="id" value="${sessionScope.user.id}">
							<input class="form-control" id="newPwd01"required="" maxlength="11" autocomplete="off" type="password">
							<span class="tip-text">新的密码</span>
							<span class="see-pwd pwd-toggle" title="显示密码"><i class="glyphicon glyphicon-eye-open"></i></span>
							<span class="error_tip"></span>
						</div>
						<div class="form-group">
						<div class="form-group">
							<input class="form-control"  id="newPwd02"required="" maxlength="11" autocomplete="off" type="password">
							<span class="tip-text">再次确认新的密码</span>
							<span class="see-pwd pwd-toggle" title="显示密码"><i class="glyphicon glyphicon-eye-open"></i></span>
							<span class="error_tip"></span>
						</div>
						</div>
						<div class="user-form-group tags-box">
							<button type="submit" class="btn " id="newPwd-submin">提交</button>
						</div>
				
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
	<!-- 输入新密码 -->
	<script >
		$("#newPwd-submin").click(function(){
			var newPwd01=$("#newPwd01").val();
			var newPwd02=$("#newPwd02").val();
			var id=$("#id").val()
			if(newPwd01==newPwd02){
				$.ajax({
					url:"${pageContext.request.contextPath}/web/main/checkNewPwd/"+id,
					data:"id="+id+"&newPwd="+newPwd01,
					dataType:"json",
					type:"get",
					success:function(obj){
						if(obj.code==1){
							alert("修改成功");
							location.href="${pageContext.request.contextPath}/web/main/reLoginPage/"+id;
						}else{
							alert("不得与旧密码相同");
						}
					}
				});
				alert("密码校对中");
			}else{
				alert("密码不匹配");
			}
		})
	</script>
</body>
</html>