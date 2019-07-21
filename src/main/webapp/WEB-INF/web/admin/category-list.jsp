<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--_meta 作为公共模版分离出去-->
<jsp:include page="_meta.jsp"/>
<!--/meta 作为公共模版分离出去-->

<title>产品分类</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body>
<!--_header 作为公共模版分离出去-->
<jsp:include page="_header.jsp"/>
<!--/_header 作为公共模版分离出去-->

<!--_menu 作为公共模版分离出去-->
<jsp:include page="_menu.jsp"/>	
<!--/_menu 作为公共模版分离出去-->

<section class="Hui-article-box">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 产品管理 <span class="c-gray en">&gt;</span> 产品分类 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="Hui-article">
		<article class="cl pd-20">
			<table class="table">
				<tr>
					<td width="200" class="va-t"><ul id="treeDemo" class="ztree"></ul></td>
					<td class="va-t"><iframe ID="testIframe" Name="testIframe" FRAMEBORDER=0 SCROLLING=AUTO width=100%  height=390px SRC=""></iframe></td>
				</tr>
			</table>
		</article>
	</div>
</section>
<!--_footer 作为公共模版分离出去-->
<jsp:include page="_footer.jsp"/>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>

<%-- <!--图标样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/ttt/css/bootstrap.min.css"/>

    <!--主要样式-->

    <script type="text/javascript" src="${pageContext.request.contextPath }/ttt/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/test.js"></script> --%>
    
<script type="text/javascript">
var setting = {
	view: {
		dblClickExpand: true,
		showLine: true,
		selectedMulti: true,
		//icon:'${pageContext.request.contextPath}/images/icons/alipay.png'
		showIcon:false,
		//fontCss : {color:"#ff0011"},
/* 		addHoverDom: addDiyDom,
		addHoverDom: addDiyDom1,
		removeHoverDom:removeHoverDom, */
	},
	data: {
		simpleData: {
			enable:true,
			idKey: "id",
			pIdKey: "parentId",
			rootPId: "0"
		}
	},
	edit:{
		//showRemoveBtn :true,
		//removeTitle : "删除",
		//showRenameBtn : true,
		///renameTitle : "rename",
		//enable: true,
		
	},
	callback: {
		beforeClick: function(treeId, treeNode) {
				$('#testIframe').attr("src","${pageContext.request.contextPath}/web/admin/categoryShowPage/"+treeNode.id);
			var zTree = $.fn.zTree.getZTreeObj("tree");
			if (treeNode.isParent) {
				zTree.expandNode(treeNode);
				return false;
			} else {
				return true;
			}
		},
		//beforeRemove:function(treeId, treeNode){},
		//onRemove:function(treeId, treeNode){},
/* 		beforeRename:function(treeId, treeNode, newName, isCancel){
			alert(treeId+','+ treeNode.orders+','+ newName+','+ isCancel);
			},
		onRename:function(treeId, treeNode){
		//	alert(treeId+','+ treeNode+','+","+treeNode.name);
		}, */
	}
};

/*  var zNodes =[
	{ id:1, parentId:0, name:"一级分类", open:true},
	{ id:11, parentId:1, name:"二级分类"},
	{ id:111, parentId:11, name:"三级分类"},
	{ id:112, parentId:11, name:"三级分类"},
	{ id:113, parentId:11, name:"三级分类"},
	{ id:114, parentId:11, name:"三级分类"},
	{ id:115, parentId:11, name:"三级分类"},
	{ id:12, parentId:1, name:"二级分类 1-2"},
	{ id:121, parentId:12, name:"三级分类 1-2-1"},
	{ id:122, parentId:12, name:"三级分类 1-2-2"},
]; */ 
var zNodes=${categoryList};
var code;

function showCode(str) {
	if (!code) code = $("#code");
	code.empty();
	code.append("<li>"+str+"</li>");
}

$(document).ready(function(){
	var t = $("#treeDemo");
	t = $.fn.zTree.init(t, setting, zNodes);
	//demoIframe = $("#testIframe");
	//demoIframe.bind("load", loadReady);
	//var zTree = $.fn.zTree.getZTreeObj("tree");
	//zTree.selectNode(zTree.getNodeByParam("id",'11'));
});

/* function addDiyDom(treeId, treeNode) {
	var aObj = $("#" + treeNode.tId + "_a");
	if ($("#diyBtn_"+treeNode.id).length>0) return;
	var editStr = "<span id='diyBtn_space_" +treeNode.id+ "' >"+'<i class="Hui-iconfont">&#xe604;</i>'+" </span>"
		+ "<button type='button' class='diyBtn1' id='diyBtn_" + treeNode.id
		+ "' title='"+treeNode.name+"' onfocus='this.blur();'>&#xe631;</button>";
	aObj.append(editStr);
	var btn = $("#diyBtn_"+treeNode.id);
	if (btn) btn.bind("click", function(){alert("diy Button for " + treeNode.name);});
};
 */

</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>