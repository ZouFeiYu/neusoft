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
					<div class="title">账户信息-个人资料</div>
					<div class="port b-r50" id="crop-avatar">
 						<div class="img"><img src="${pageContext.request.contextPath}/images/icons/default_avt.png" class="cover b-r50"></div> 
					</div>
					<form action="" class="user-setting__form" role="form">
						<div class="user-form-group">
							<input type="hidden" id="user-id" value="${user.id}">
							<label for="user-id"> 用   户  名 ：</label>
							<input type="text" id="user-nickName" value="${user.nickName}" placeholder="请输入您的昵称">
						</div>
						<div class="user-form-group">
							<label>真实姓名 ：</label>
							<input type="text" id="user-name" value="${user.name}" placeholder="请输入您的真实姓名">
						</div>
            	
          	 		 <div class="user-form-group">
							<label>邮箱地址 ：</label>
							<input type="text" id="user-email" value="${user.email}" placeholder="请输入您的邮箱地址">
						</div>
            		 <div class="user-form-group">
							<label>联系电话 ：</label>
							<input type="text" id="user-phone" value="${user.phone}" placeholder="请输入您的电话号码">
						</div>
					
						<div class="user-form-group">
							<button type="button" class="btn" id="update-submit">确认修改</button>
						</div>
					</form>
					<script src="${pageContext.request.contextPath}/js/zebra.datepicker.min.js"></script>
					<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zebra.datepicker.css">
					<!-- <script>
						$('input.datepicker').Zebra_DatePicker({
							default_position: 'below',
							show_clear_date: false,
							show_select_today: false,
						});
					</script> -->
				</div>
			</div>
		</section>
	</div>
	<!-- 头像选择模态框 -->
	<link href="${pageContext.request.contextPath}/css/cropper/cropper.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/cropper/sitelogo.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/cropper/cropper.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/cropper/sitelogo.js"></script>
<!-- 	<div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<form class="avatar-form" action="{%url('admin/upload-logo')%}" enctype="multipart/form-data" method="post">
					<div class="modal-header">
						<button class="close" data-dismiss="modal" type="button">&times;</button>
						<h4 class="modal-title" id="avatar-modal-label">Change Logo Picture</h4>
					</div>
					<div class="modal-body">
						<div class="avatar-body">
							<div class="avatar-upload">
								<input class="avatar-src" name="avatar_src" type="hidden">
								<input class="avatar-data" name="avatar_data" type="hidden">
								<label for="avatarInput">图片上传</label>
								<input class="avatar-input" id="avatarInput" name="avatar_file" type="file"></div>
							<div class="row">
								<div class="col-md-9">
									<div class="avatar-wrapper"></div>
								</div>
								<div class="col-md-3">
									<div class="avatar-preview preview-lg"></div>
									<div class="avatar-preview preview-md"></div>
									<div class="avatar-preview preview-sm"></div>
								</div>
							</div>
							<div class="row avatar-btns">
								<div class="col-md-9">
									<div class="btn-group">
										<button class="btn" data-method="rotate" data-option="-90" type="button" title="Rotate -90 degrees"><i class="fa fa-undo"></i> 向左旋转</button>
									</div>
									<div class="btn-group">
										<button class="btn" data-method="rotate" data-option="90" type="button" title="Rotate 90 degrees"><i class="fa fa-repeat"></i> 向右旋转</button>
									</div>
								</div>
								<div class="col-md-3">
									<button class="btn btn-success btn-block avatar-save" type="submit"><i class="fa fa-save"></i> 保存修改</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="loading" aria-label="Loading" role="img" tabindex="-1"></div> -->
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
	<!-- 修改个人信息 -->
	<script >
		$("#update-submit").click(function(){
			//alert($("#user-id").val());
			var id=$("#user-id").val();
			var username=$("#user-nickName").val();
			var name=$("#user-name").val();
			var email=$("#user-email").val();
			var phone=$("#user-phone").val();
			$.ajax({
				url:"${pageContext.request.contextPath}/web/main/person/"+id,
				data:"id="+id+"&username="+username+"&name="+name+"&email="+email+"&phone="+phone,
				type:"post",
				dataType:"json",
				success:function(obj){
					if(obj.state==0){
						alert("修改失败")
					}else{
						alert("修改成功")
					}
				}
			});
		});
	</script>
</body>
</html>