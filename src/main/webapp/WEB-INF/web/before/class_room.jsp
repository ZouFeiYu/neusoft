<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<jsp:include page="header.jsp"/>
<body>
	<!-- 顶部tab -->
	<jsp:include page="navigation.jsp"/>
	<!-- 搜索栏 -->
	<div class="top-search">
		<div class="inner">
			<a class="logo" href="index.html"><img src="images/icons/logo.jpg" alt="U袋网" class="cover"></a>
			<div class="search-box">
				<form class="input-group">
					<input placeholder="Ta们都在搜U袋网" type="text">
					<span class="input-group-btn">
						<button type="button">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>
					</span>
				</form>
				<p class="help-block text-nowrap">
					<a href="">连衣裙</a>
					<a href="">裤</a>
					<a href="">衬衫</a>
					<a href="">T恤</a>
					<a href="">女包</a>
					<a href="">家居服</a>
					<a href="">2017新款</a>
				</p>
			</div>
			<div class="cart-box">
				<a href="udai_shopcart.html" class="cart-but">
					<i class="iconfont icon-shopcart cr fz16"></i> 购物车 0 件
				</a>
			</div>
		</div>
	</div>
	<!-- 内页导航栏 -->
	<div class="top-nav bg3">
		<div class="nav-box inner">
			<div class="all-cat">
				<div class="title"><i class="iconfont icon-menu"></i> 全部分类</div>
			</div>
			<ul class="nva-list">
				<a href="index.html"><li>首页</li></a>
				<a href="temp_article/udai_article10.html"><li>企业简介</li></a>
				<a href="temp_article/udai_article5.html"><li>新手上路</li></a>
				<a href="class_room.html"><li class="active">U袋学堂</li></a>
				<a href="enterprise_id.html"><li>企业账号</li></a>
				<a href="udai_contract.html"><li>诚信合约</li></a>
				<a href="item_remove.html"><li>实时下架</li></a>
			</ul>
		</div>
	</div>
	<div class="content inner">
		<section class="panel__div clearfix">
			<div class="filter-value">
				<div class="filter-title">视频专区</div>
				<div class="auto-play pull-right">自动播放</div>
			</div>
			<div class="video-list_div">
				<div class="video-box">
					<div class="img" data-toggle="modal" data-target="#video-modal" data-id="1" data-video="images/temp/videos/video_1.mp4"><img src="images/temp/S-001-1_s.jpg" alt="U袋学堂第1课" class="cover"></div>
					<div class="buttom">
						<div class="title ep">U袋学堂第1课</div>
						<div class="price">免费学习</div>
					</div>
				</div>
				<div class="video-box">
					<div class="img" data-toggle="modal" data-target="#video-modal" data-id="2" data-video="images/temp/videos/video_2.mp4"><img src="images/temp/S-001-2_s.jpg" alt="U袋学堂第2课" class="cover"></div>
					<div class="buttom">
						<div class="title ep">U袋学堂第1课</div>
						<div class="price">免费学习</div>
					</div>
				</div>
				<div class="video-box">
					<div class="img" data-toggle="modal" data-target="#video-modal" data-id="3" data-video="images/temp/videos/video_3.mp4"><img src="images/temp/S-001-3_s.jpg" alt="U袋学堂第3课" class="cover"></div>
					<div class="buttom">
						<div class="title ep">U袋学堂第1课</div>
						<div class="price">免费学习</div>
					</div>
				</div>
				<div class="video-box">
					<div class="img" data-toggle="modal" data-target="#video-modal" data-id="4" data-video="images/temp/videos/video_4.mp4"><img src="images/temp/S-001-4_s.jpg" alt="U袋学堂第4课" class="cover"></div>
					<div class="buttom">
						<div class="title ep">U袋学堂第1课</div>
						<div class="price">免费学习</div>
					</div>
				</div>
				<div class="video-box">
					<div class="img" data-toggle="modal" data-target="#video-modal" data-id="5" data-video="images/temp/videos/video_5.mp4"><img src="images/temp/S-001-5_s.jpg" alt="U袋学堂第5课" class="cover"></div>
					<div class="buttom">
						<div class="title ep">U袋学堂第1课</div>
						<div class="price">免费学习</div>
					</div>
				</div>
				<div class="video-box">
					<div class="img" data-toggle="modal" data-target="#video-modal" data-id="6" data-video="images/temp/videos/video_6.mp4"><img src="images/temp/S-001-6_s.jpg" alt="U袋学堂第6课" class="cover"></div>
					<div class="buttom">
						<div class="title ep">U袋学堂第1课</div>
						<div class="price">免费学习</div>
					</div>
				</div>
				<div class="video-box">
					<div class="img" data-toggle="modal" data-target="#video-modal" data-id="7" data-video="images/temp/videos/video_7.mp4"><img src="images/temp/S-001-7_s.jpg" alt="U袋学堂第7课" class="cover"></div>
					<div class="buttom">
						<div class="title ep">U袋学堂第1课</div>
						<div class="price">免费学习</div>
					</div>
				</div>
				<div class="video-box">
					<div class="img" data-toggle="modal" data-target="#video-modal" data-id="8" data-video="images/temp/videos/video_8.mp4"><img src="images/temp/S-001-8_s.jpg" alt="U袋学堂第8课" class="cover"></div>
					<div class="buttom">
						<div class="title ep">U袋学堂第1课</div>
						<div class="price">免费学习</div>
					</div>
				</div>
			</div>
			<script>
				$(function() {
					$('#video-modal').on('show.bs.modal', function (e) {
						if ($('#video').data('id') != $(e.relatedTarget).data('id')) {
							 $('#video').data('id',$(e.relatedTarget).data('id'));
							$('#video').attr({
								'src': $(e.relatedTarget).data('video'),
								'poster': $(e.relatedTarget).find('img').attr('src')
							});
						};
						if ($('.auto-play').hasClass('active')) {
							$('#video').get(0).play()
						};
					});
					$('.auto-play').click(function() {
						$(this).toggleClass('active')
					});
					$('#video-modal').on('hide.bs.modal', function (e) {
						$('#video').get(0).pause();
					});
				});
			</script>
		</section>
		<section class="panel__div clearfix">
			<div class="filter-value">
				<div class="filter-title">U袋学堂说明</div>
			</div>
			<div class="html-code">
				<p>这里是U袋学堂说明内容</p>
			</div>
		</section>
	</div>
	<div class="modal fade bs-example-modal-lg" id="video-modal" tabindex="-1" role="dialog" aria-labelledby="videoModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<video id="video" width="870" controls preload="metadata" data-id=""></video>
				</div>
			</div>
		</div>
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