<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="_meta.jsp" />
<title>添加产品分类</title>
</head>
<body>
	<div class="pd-20">
		<form action="" method="post" class="form form-horizontal"
			id="form-user-add">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>分类名称：</label>
				<div class="formControls col-5">
					<input type="text" class="input-text" value="${name }"
						placeholder="" id="user-name" name="product-category-name">
				</div>
				<div class="col-5"></div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">备注：</label>
				<div class="formControls col-5">
					<textarea name="name" cols="" rows="" class="textarea"
						placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true"
						nullmsg="备注不能为空！" onKeyUp="textarealength(this,100)"></textarea>
					<p class="textarea-numberbar">
						<em class="textarea-length">0</em>/100
					</p>
				</div>
				<div class="col-5"></div>
			</div>
			<div class="row cl">
				<div class="col-9 col-offset-2">
					<input class="btn btn-primary radius" type="submit"
						value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				</div>
			</div>
			<div class="row cl">
				<div class="col-10">
					<span class="  col-sm-2"><a href="javascript:;" onclick="datadel()"
					class="btn btn-success radius"><i class="Hui-iconfont">&#xe600;</i>
						添加子分类</a> </span>
						
				</div>
				<div class="col-9">
					<span class="  col-sm-2"><a href="javascript:;" onclick="datadel()"
					class="btn btn-primary radius"><i class="Hui-iconfont">&#xe60c;</i>
						修改分类</a> </span>
						
				</div>
				<div class="col-9">
					<span class="  col-sm-2"><a href="javascript:;" onclick="datadel()"
					class="btn btn-warning radius"><i class="Hui-iconfont">&#xe631;</i>
						禁用分类</a> </span>
						
				</div>
				<div class="col-9">
					<span class="  col-sm-2"><a href="javascript:;" onclick="datadel()"
					class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
						删除</a> </span>
						
				</div>
				
			</div>
						
		</form>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<jsp:include page="_footer.jsp" />
	<!--/_footer /作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript">
		$(function() {
			$('.skin-minimal input').iCheck({
				checkboxClass : 'icheckbox-blue',
				radioClass : 'iradio-blue',
				increaseArea : '20%'
			});

		});
	</script>
</body>
</html>