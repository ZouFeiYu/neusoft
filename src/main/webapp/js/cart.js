$(function() {
	
		/*if ($(".imfor").length==0) {
			$('#section').hide();
			$('.none').show();
		}*/
	
	adddel();
	//显示单个商品总价
	$('.tbody').each(function(){
		var price=parseFloat($(this).children('.pices').children('.pices_information').html());
		var amount=parseFloat($(this).children('.num').children().children('.val').val());
		var amountPrice=price*amount;
		$(this).children('.totle').children('.totle_information').html(amountPrice.toFixed(2));
	});


	//删除当前行
	$('.del_d').click(function() {
			var id=$(this).parent().parent().attr('id');
			console.log(id);
			var url ='deleteById?goodsId='+id;
			 window.location.href=url;
	});

	//批量删除
	$(".foot_del").click(function() {
		var str=[];
		$('.Each>span').each(function(){
			if($(this).hasClass('true')){
				var id=$(this).parent().siblings('.table').children('.tbody').children().attr('id');
				str.push(id);
			}
		});
		console.log(str);
		//有商品选中
		if(str.length>0){
			var url ='removeByIds.do?&ids='+str;
			 window.location.href=url;
			//没有选任何商品
		}else{
			alert('没有选中商品');
		}
	})
})
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

function adddel(){
	//小计和加减
	//加
	$(".add").each(function() {
		$(this).click(function() {
			var $multi = 0;
			//商品数量
			var vall = $(this).prev().val();
			vall++;
			$(this).prev().val(vall);
			//单件商品总价=商品数量*商品单价
			$multi = (parseInt(vall).toFixed(2) * parseInt($(this).parent().parent().prev().children('.pices_information').html()));
			$(this).parent().parent().next().children(".totle_information").text(Math.round($multi).toFixed(2));			
			amountadd();
			var id=$(this).parent().parent().parent().attr('id');
			var num=$(this).prev().val();
			$.ajax({
				type: "GET",
				url: "updateCart.do",
				data: {id:id,num:num},
				success: function(data){
				}
			});
		})
	})
	//减
	$(".sub").each(function() {
		$(this).click(function() {
			var $multi1 = 0;
			var vall1 = $(this).next().val();
			vall1--;
			if(vall1 <= 0) {
				vall1 = 1;
			}
			$(this).next().val(vall1);
			$multi1 = parseInt(vall1) * parseInt($(this).parent().parent().prev().children('.pices_information').html());
			$(this).parent().parent().next().children(".totle_information").text(Math.round($multi1).toFixed(2));
			amountadd();
			var id=$(this).parent().parent().parent().attr('id');
			var num=$(this).next().val();
			$.ajax({
				type: "GET",
				url: "updateCart.do",
				data: {id:id,num:num},
				success: function(data){

				}
			});
		})
	})
	//数量输入框
	$(".val").each(function(){
		$(this).blur(function(){
			//商品数量
			var num=$(this).val();
			//商品单价
			var price=parseInt($(this).parent().parent().prev().children('.pices_information').html());
			var sum=num*price;
			$(this).parent().parent().next().children(".totle_information").text(Math.round(sum).toFixed(2));
			amountadd();
			var id=$(this).parent().parent().parent().attr('id');
			$.ajax({
				type: "GET",
				url: "updateCart.do",
				data: {id:id,num:num},
				success: function(data){

				}
			});
		})
	});
}


