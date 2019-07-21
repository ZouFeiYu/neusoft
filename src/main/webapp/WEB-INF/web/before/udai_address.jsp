<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
			<jsp:include page="pull_left.jsp"></jsp:include>
			<div class="pull-right">
				<div class="user-content__box clearfix bgf">
					<div class="title">账户信息-收货地址</div>
					<form class="user-addr__form form-horizontal" role="form"onsubmit="return false">
						<p class="fz18 cr">新增收货地址<span class="c6" style="margin-left: 20px">电话号码、手机号码选填一项，其余均为必填项</span></p>
						<div class="form-group">
							<input type="hidden" id="userId" value="${sessionScope.user.id}">
							<label for="name" class="col-sm-2 control-label">收货人姓名：</label>
							<div class="col-sm-6">
								<input class="form-control" id="name" placeholder="请输入姓名" type="text">
							</div>
						</div>
						<div class="form-group">
							<label for="details" class="col-sm-2 control-label">收货地址：</label>
							<div class="col-sm-10">
								<input class="form-control" id="details" placeholder="建议您如实填写详细收货地址，例如街道名称，门牌号码等信息" maxlength="30" type="text">
							</div>
						</div>
						<div class="form-group">
							<label for="phone" class="col-sm-2 control-label">手机号码：</label>
							<div class="col-sm-6">
								<input class="form-control" id="mobile" placeholder="请输入手机号码" type="text">
							</div>
						</div>
						<div class="form-group">
							<label for="phone" class="col-sm-2 control-label">电话号码：</label>
							<div class="col-sm-6">
								<input class="form-control" id="telphone" placeholder="请输入电话号码" type="text">
							</div>
						</div>
						<div id="error_tips"></div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-6">
								<div class="checkbox">
									<label><input type="checkbox" id="setDefault"><i></i> 设为默认收货地址</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-6">
								<button type="submit" id="save-sumbit"  >保存地址</button>
							</div>
						</div>
					</form>
					<p class="fz18 cr">已保存的有效地址</p>

					<div class="table-thead addr-thead">
						<div class="tdf1">收货人</div>
						<div class="tdf3"><div class="tdt-a_l">详细地址</div></div>
						<!-- <div class="tdf1">邮编</div> -->
						<div class="tdf1">电话</div>
						<div class="tdf1">手机</div>
						<div class="tdf1">操作</div>
						<div class="tdf1"></div>
					</div>
					<div class="addr-list">
					<c:forEach items="${addresses}"  var="address">
						<div class="addr-item">
						<input type="hidden"  id="id" value="${address.id}">
						<div class="tdf1">${address.recName }</div>
						<div class="tdf3 tdt-a_l">${address.detail }</div>
						<div class="tdf1">${address.telphone}</div>
						<div class="tdf1">${address.phone}</div>
						<div class="tdf1 order">
							<a href="${pageContext.request.contextPath}/web/main/updateAddressPage/${sessionScope.user.id}?userId=${sessionScope.user.id}&id=${address.id}">	
							修改</a>
							<a href="${pageContext.request.contextPath}/web/main/deleteAddress/${sessionScope.user.id}?userId=${sessionScope.user.id}&id=${address.id}">
							删除</a>
						</div>
						<div class="tdf1"> 
						<c:if test="${address.recDefault==1}">
								<a href="${pageContext.request.contextPath}/web/main/setDefaultAddress/${sessionScope.user.id}?userId=${sessionScope.user.id}&id=${address.id}"
								  id="setDefault" class="default active">
								默认地址</a>
						</c:if>
						<c:if test="${address.recDefault==0}">
								<a href="${pageContext.request.contextPath}/web/main/setDefaultAddress/${sessionScope.user.id}?userId=${sessionScope.user.id}&id=${address.id}"
								  id="setDefault" class="default ">
									默认地址</a>
						</c:if>
						</div>
					</div>
					</c:forEach>
					</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- 右侧菜单 -->
	<jsp:include page="right_navi.jsp"></jsp:include>
	<!-- 底部信息 -->
	<jsp:include page="footer.jsp"/>
	<!-- 保存地址 -->
	<script >
		$("#save-sumbit").click(function(){
			var userId=$("#userId").val();
			var recName=$("#name").val();
			var detail=$("#details").val();
			var phone=$("#mobile").val();
			var telphone=$("#telphone").val();
			var recDefault=$("#setDefault").prop("checked")?1:0;
			if(recName==""||recName==null){
				alert("收件人不能为空");
			}else if(detail==""||detail==null){
		 			alert("地址不能为空");
			}else if(phone==""&&telphone==""){
				alert("联系方式不能为空");
			}else{
					$.ajax({
						url:"${pageContext.request.contextPath}/web/main/insertAddress/"+userId,
						data:"userId="+userId+"&recName="+recName+"&detail="+detail+"&phone="+phone+"&telphone="+telphone+"&recDefault="+recDefault,
						type:"post",
						dataType:"json",
						success:function(obj){
							if(obj.code=1){
								alert(obj.msg);
								location.href="${pageContext.request.contextPath}/web/main/addressPage/"+userId;
							}else{
								alert(obj.msg);
							}
						}
					});
			}
		});
	</script>

	
</body>
</html>