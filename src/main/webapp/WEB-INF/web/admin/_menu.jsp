<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
		<dl id="menu-admin">
			<dt>
				<i class="Hui-iconfont">&#xe62d;</i> 管理员管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/web/admin/updatePasswordPage"
						title="修改密码">修改密码</a></li>
					<li><a href="${pageContext.request.contextPath}/web/admin/addAdminPage" title="添加管理员">添加管理员</a></li>
					<li><a href="${pageContext.request.contextPath}/web/admin/adminListPage" title="查询管理员">查询管理员</a></li>
					<li><a href="${pageContext.request.contextPath}/web/admin/adminDelPage" title="删除的管理员">删除的管理员</a></li>

				</ul>
			</dd>
		</dl>
		<dl id="menu-member">
			<dt>
				<i class="Hui-iconfont">&#xe60d;</i> 用户管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a href="${pageContext.request.contextPath}/web/admin/userListPage" title="查询用户信息">用户列表</a></li>
					<li><a href="${pageContext.request.contextPath}/web/admin/userDelPage" title="删除的用户">删除的用户</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-product">
			<dt>
				<i class="Hui-iconfont">&#xe620;</i> 商品管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a href="${pageContext.request.contextPath}/web/admin/nonePage" title="增加新商品">增加新商品</a></li>
					<li><a href="${pageContext.request.contextPath}/web/admin/goodsListPage" title="查询商品">查询商品</a></li>
					<li><a href="${pageContext.request.contextPath}/web/admin/nonePage" title="修改商品">修改商品</a></li>
					<li><a href="${pageContext.request.contextPath}/web/admin/nonePage" title="删除商品">删除商品</a></li>
					<li><a href="${pageContext.request.contextPath}/web/admin/nonePage" title="删除评论">删除评论</a></li>
					<li><a href="${pageContext.request.contextPath}/web/admin/nonePage" title="查询脱销商品">查询脱销商品</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-product">
			<dt>
				<i class="Hui-iconfont">&#xe620;</i>商品分类管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
				<li><a href="${pageContext.request.contextPath}/web/admin/categoryListPage" title="查询商品分类">查询商品分类</a></li>
					<li><a href="${pageContext.request.contextPath}/web/admin/nonePage" title="查询分类">查询分类</a></li>
					<li><a href="${pageContext.request.contextPath}/web/admin/nonePage" title="添加分类">添加分类</a></li>
					<li><a href="${pageContext.request.contextPath}/web/admin/nonePage" title="修改分类">修改分类</a></li>
					<li><a href="${pageContext.request.contextPath}/web/admin/nonePage" title="删除分类">删除分类</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-order">
			<dt>
				<i class="Hui-iconfont">&#xe613;</i> 订单管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a href="${pageContext.request.contextPath}/web/admin/nonePage" title="查询订单">查询订单</a></li>
					<li><a href="${pageContext.request.contextPath}/web/admin/nonePage" title="订单状态修改">订单状态修改</a></li>
					<li><a href="${pageContext.request.contextPath}/web/admin/nonePage" title="删除订单">删除订单</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-order">
			<dt>
				<i class="Hui-iconfont">&#xe613;</i>新闻管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a href="${pageContext.request.contextPath}/web/admin/nonePage" title="公告管理">公告管理</a></li>
					<li><a href="${pageContext.request.contextPath}/web/admin/nonePage" title="资讯管理">资讯管理</a></li>
					<li><a href="${pageContext.request.contextPath}/web/admin/nonePage" title="发布资讯">发布资讯</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-order">
			<dt>
				<i class="Hui-iconfont">&#xe613;</i>3.2.13 销售统计<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a href="${pageContext.request.contextPath}/web/admin/nonePage" title="销售统计">销售统计</a></li>
				</ul>
			</dd>
		</dl>


	</div>
</aside>
<div class="dislpayArrow hidden-xs">
	<a class="pngfix" href="javascript:void(0);"
		onClick="displaynavbar(this)"></a>
</div>