<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<jsp:include page="header.jsp" />
<body>
	<!-- 顶部tab -->
	<jsp:include page="navigation.jsp" />
	<!-- 顶部标题 -->
	<div class="bgf5 clearfix">
		<div class="top-user">
			<div class="inner">
				<a class="logo" href="${pageContext.request.contextPath}/web/main/index"><img
					src="${pageContext.request.contextPath}/images/icons/logo.jpg" alt="U袋网" class="cover"></a>
				<div class="title">购物车</div>
			</div>
		</div>
	</div>
	<div class="content clearfix bgf5">
		<section class="user-center inner clearfix">
			<div class="user-content__box clearfix bgf">
				<div class="title">购物车</div>
				<form action="" class="shopcart-form__box" method="post">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th width="150"><label class="checked-label"><input
										type="checkbox" class="check-all"><i></i> 全选</label></th>
								<th width="300">商品信息</th>
								<th width="150">单价</th>
								<th width="200">数量</th>
								<th width="200">现价</th>
								<th width="80">操作</th>
							</tr>
						</thead>
						<tbody>
							<!-- 循环得到购物车信息 -->
							<c:forEach items="${carts}" var="cart">
								<tr id="${cart.id}" class="tbody">
									<th scope="row" class="normal"><label class="checked-label"><input
											type="checkbox"><i></i>
											<div class="img">
												<img
													src="${pageContext.request.contextPath}${cart.image}"
													alt="" class="cover">
											</div> </label></th>
									<td>
										<div class="name ep3">${cart.name }</div>
										<div class="type c9">颜色分类：深棕色 尺码：均码</div>
									</td>
									<td class="pices">
										<span>￥</span>
										<span class="pices_information">${cart.price }</span>
									</td>
									<td class="num">
										<div class="cart-num__box">
											<input type="button" class="sub" value="-"> <input
												type="text" class="val" value="${cart.count}" maxlength="2">
											<input type="button" class="add" value="+">
										</div>
									</td>
									<td class="totle">
										<span>￥</span>
										<span class="totle_information"></span>
									</td>
									<td><a href="javascript:;" class="del_d">删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="user-form-group tags-box shopcart-submit pull-right">
						<div class="btn" id="go-buy">提交订单</div>
					</div>
					<div class="checkbox shopcart-total">
						<label class="normal"><input type="checkbox" class="check-all"><i></i>
							全选</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" class="foot_del">删除</a>
						<div class="pull-right">
							已选商品 <span class="total">0</span> 件 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;合计（不含运费） <b
								class="cr">¥<span class="fz24">0</span></b>
						</div>
					</div>
					<script>
						//合计
						function totl() {
							var sum = 0.00;
							var amount=0;
							$(".totle_information").each(function() {
								sum += parseInt($(this).text());
								$(".fz24").text(sum.toFixed(2));
								amount++;
								$('.total').text(amount);
							})
						}
						//如果选中商品，则计算商品的总价并显示
						function amountadd(){
							var amo=0;
							$('.checked-label>i').each(function(){
								if($(this).hasClass('true')){
									amo+=parseInt($(this).parent().parent().siblings('.totle').children('.totle_information').text());
								}
							})
							$('.fz24').text(amo.toFixed(2));
						}
						$(document).ready(function(){
							var $item_checkboxs = $('.shopcart-form__box tbody input[type="checkbox"]'),
								$check_all = $('.check-all');
							// 全选
							$check_all.on('change', function() {
								amountadd();
								if($('.checkbox>label').hasClass('normal')){
									$('.checkbox>label').addClass('true').removeClass('normal');
									$check_all.prop('checked', $(this).prop('checked'));
									$item_checkboxs.prop('checked', $(this).prop('checked'));
									$(".tbody").each(function() {
										$('.tbody>th').addClass('true').removeClass('normal');
									})
									totl();
								}else{
									$('.checkbox>label').addClass('normal').removeClass('true');
									$check_all.prop('checked', $(this).prop('checked'));
									$('.tbody>th').addClass('normal').removeClass('true');
									$item_checkboxs.prop('checked', $(this).prop('checked'));
									$(".fz24").text(0.00);
									$('.total').text(0);
								}
							});
							// 点击选择
							$item_checkboxs.on('change', function() {
								var flag = true;
								var price=0.00;
								$item_checkboxs.each(function() {
									if (!$(this).prop('checked')) { flag = false}
									else{
									var danjia=$(this).parent().parent().siblings(".pices").children().siblings(".pices_information").text();
									price+=(danjia*$(this).parent().parent().siblings(".num").children().children().siblings(".val").val());
									
									}
									
								});
								$('.fz24').text(price);
								$check_all.prop('checked', flag);
							});
							//去结算
							var str=[];
							var totalPrice=0;
							$('#go-buy').click(function(){
								var flag = true;
								$item_checkboxs.each(function() {
									if (!$(this).prop('checked')) { flag = false}
									else{
										var id=$(this).parent().parent().parent().attr('id');
										//var num=$(this).parent().parent().siblings('.num').children().children('.val').val();
										str.push(id);
									}
								});
								totalPrice=$('.fz24').html();
								console.log(totalPrice);
								console.log(str);
								if(str.length>0){
									var url = 'cartToOrder?ids='+str;
									 window.location.href = url;
								}else{
									alert('请选择要购买的商品');
								}

							})
						});
						
					</script>
				</form>
			</div>
		</section>
	</div>
	<!-- 右侧菜单 -->
	<div class="right-nav">
		<ul class="r-with-gotop">
			<li class="r-toolbar-item"><a href="udai_welcome.html"
				class="r-item-hd"> <i class="iconfont icon-user" data-badge="0"></i>
					<div class="r-tip__box">
						<span class="r-tip-text">用户中心</span>
					</div>
			</a></li>
			<li class="r-toolbar-item"><a href="udai_shopcart.html"
				class="r-item-hd"> <i class="iconfont icon-cart"></i>
					<div class="r-tip__box">
						<span class="r-tip-text">购物车</span>
					</div>
			</a></li>
			<li class="r-toolbar-item"><a href="udai_collection.html"
				class="r-item-hd"> <i class="iconfont icon-aixin"></i>
					<div class="r-tip__box">
						<span class="r-tip-text">我的收藏</span>
					</div>
			</a></li>
			<li class="r-toolbar-item"><a href="" class="r-item-hd"> <i
					class="iconfont icon-liaotian"></i>
					<div class="r-tip__box">
						<span class="r-tip-text">联系客服</span>
					</div>
			</a></li>
			<li class="r-toolbar-item"><a href="issues.html"
				class="r-item-hd"> <i class="iconfont icon-liuyan"></i>
					<div class="r-tip__box">
						<span class="r-tip-text">留言反馈</span>
					</div>
			</a></li>
			<li class="r-toolbar-item to-top"><i class="iconfont icon-top"></i>
				<div class="r-tip__box">
					<span class="r-tip-text">返回顶部</span>
				</div></li>
		</ul>
		<script>
			$(document).ready(function() {
				$('.to-top').toTop({
					position : false
				})
			});
		</script>
	</div>
	<!-- 底部信息 -->
	<jsp:include page="footer.jsp" />
</body>
</html>