/*****************************************************************
 * jQuery Validate扩展验证方法  (linjq)    
 * Modified by guojunhui
 * Date modified:01/01/2017  
*****************************************************************/
$(function(){
    // 判断整数value是否等于0 
    jQuery.validator.addMethod("isIntEqZero", function(value, element) { 
         value=parseInt(value);      
         return this.optional(element) || value==0;       
    }, "整数必须为0"); 
      
    // 判断整数value是否大于0
    jQuery.validator.addMethod("isIntGtZero", function(value, element) { 
         value=parseInt(value);      
         return this.optional(element) || value>0;       
    }, "整数必须大于0"); 
      
    // 判断整数value是否大于或等于0
    jQuery.validator.addMethod("isIntGteZero", function(value, element) { 
         value=parseInt(value);      
         return this.optional(element) || value>=0;       
    }, "整数必须大于或等于0");   
    
    // 判断整数value是否不等于0 
    jQuery.validator.addMethod("isIntNEqZero", function(value, element) { 
         value=parseInt(value);      
         return this.optional(element) || value!=0;       
    }, "整数必须不等于0");  
    
    // 判断整数value是否小于0 
    jQuery.validator.addMethod("isIntLtZero", function(value, element) { 
         value=parseInt(value);      
         return this.optional(element) || value<0;       
    }, "整数必须小于0");  
    
    // 判断整数value是否小于或等于0 
    jQuery.validator.addMethod("isIntLteZero", function(value, element) { 
         value=parseInt(value);      
         return this.optional(element) || value<=0;       
    }, "整数必须小于或等于0");  
    
    // 判断浮点数value是否等于0 
    jQuery.validator.addMethod("isFloatEqZero", function(value, element) { 
         value=parseFloat(value);      
         return this.optional(element) || value==0;       
    }, "浮点数必须为0"); 
      
    // 判断浮点数value是否大于0
    jQuery.validator.addMethod("isFloatGtZero", function(value, element) { 
         value=parseFloat(value);      
         return this.optional(element) || value>0;       
    }, "浮点数必须大于0"); 
      
    // 判断浮点数value是否大于或等于0
    jQuery.validator.addMethod("isFloatGteZero", function(value, element) { 
         value=parseFloat(value);      
         return this.optional(element) || value>=0;       
    }, "浮点数必须大于或等于0");   
    
    // 判断浮点数value是否不等于0 
    jQuery.validator.addMethod("isFloatNEqZero", function(value, element) { 
         value=parseFloat(value);      
         return this.optional(element) || value!=0;       
    }, "浮点数必须不等于0");  
    
    // 判断浮点数value是否小于0 
    jQuery.validator.addMethod("isFloatLtZero", function(value, element) { 
         value=parseFloat(value);      
         return this.optional(element) || value<0;       
    }, "浮点数必须小于0");  
    
    // 判断浮点数value是否小于或等于0 
    jQuery.validator.addMethod("isFloatLteZero", function(value, element) { 
         value=parseFloat(value);      
         return this.optional(element) || value<=0;       
    }, "浮点数必须小于或等于0");  
    
    // 判断浮点型  
    jQuery.validator.addMethod("isFloat", function(value, element) {       
         return this.optional(element) || /^[-\+]?\d+(\.\d+)?$/.test(value);       
    }, "只能包含数字、小数点等字符"); 
     
    // 匹配integer
    jQuery.validator.addMethod("isInteger", function(value, element) {       
         return this.optional(element) || (/^[-\+]?\d+$/.test(value) && parseInt(value)>=0);       
    }, "匹配integer");  
     
    // 判断数值类型，包括整数和浮点数
    jQuery.validator.addMethod("isNumber", function(value, element) {       
         return this.optional(element) || /^[-\+]?\d+$/.test(value) || /^[-\+]?\d+(\.\d+)?$/.test(value);       
    }, "匹配数值类型，包括整数和浮点数");  
    
    // 只能输入[0-9]数字
    jQuery.validator.addMethod("isDigits", function(value, element) {       
         return this.optional(element) || /^\d+$/.test(value);       
    }, "只能输入0-9数字");  
    
    // 判断中文字符 
    jQuery.validator.addMethod("isChinese", function(value, element) {       
         return this.optional(element) || /^[\u0391-\uFFE5]+$/.test(value);       
    }, "只能包含中文字符。");   
 
    // 判断英文字符 
    jQuery.validator.addMethod("isEnglish", function(value, element) {       
         return this.optional(element) || /^[A-Za-z]+$/.test(value);       
    }, "只能包含英文字符。");   
 
     // 手机号码验证    
    jQuery.validator.addMethod("isMobile", function(value, element) {    
      var length = value.length;    
      return this.optional(element) || (length == 11 && /^(((13[0-9]{1})|(15[0-35-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/.test(value));    
    }, "手机号码格式不正确。");

    // 电话号码验证    
    jQuery.validator.addMethod("isPhone", function(value, element) {    
      var tel = /^(\d{3,4}-?)?\d{7,9}$/g;    
      return this.optional(element) || (tel.test(value));    
    }, "电话号码格式不正确");

    // 联系电话(手机/电话皆可)验证   
    jQuery.validator.addMethod("isTel", function(value,element) {   
        var length = value.length;   
        var mobile = /^(((13[0-9]{1})|(15[0-35-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        var tel = /^(\d{3,4}-?)?\d{7,9}$/g;       
        return this.optional(element) || tel.test(value) || (length==11 && mobile.test(value));   
    }, "请输入正确手机号码或电话号码"); 
 
     // 匹配qq      
    jQuery.validator.addMethod("isQq", function(value, element) {       
         return this.optional(element) || /^[1-9]\d{4,12}$/;       
    }, "QQ号码不合法");   
 
     // 邮政编码验证    
    jQuery.validator.addMethod("isZipCode", function(value, element) {    
      var zip = /^[0-9]{6}$/;    
      return this.optional(element) || (zip.test(value));    
    }, "邮政编码不正确");  
    
    // 匹配密码，以字母开头，长度在6-16之间，只能包含字符、数字和下划线。      
    jQuery.validator.addMethod("isPwd", function(value, element) {       
         return this.optional(element) || /^[a-zA-Z]\\w{6,16}$/.test(value);       
    }, "以字母开头，长度在6-12之间，只能包含字符、数字和下划线。");  
    
    // 身份证号码验证
    jQuery.validator.addMethod("isIdCardNo", function(value, element) { 
      //var idCard = /^(\d{6})()?(\d{4})(\d{2})(\d{2})(\d{3})(\w)$/;   
      return this.optional(element) || isIdCardNo(value);    
    }, "身份证号码不正确"); 

    // IP地址验证   
    jQuery.validator.addMethod("ip", function(value, element) {    
      return this.optional(element) || /^(([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))\.)(([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))\.){2}([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))$/.test(value);    
    }, "请填写正确的IP地址");
   
    // 字符验证，只能包含中文、英文、数字、下划线等字符。    
    jQuery.validator.addMethod("stringCheck", function(value, element) {       
         return this.optional(element) || /^[a-zA-Z0-9\u4e00-\u9fa5-_]+$/.test(value);       
    }, "只能包含中文、英文、数字、下划线等字符");   
   
    // 匹配english  
    jQuery.validator.addMethod("isEnglish", function(value, element) {       
         return this.optional(element) || /^[A-Za-z]+$/.test(value);       
    }, "必须输入英文");   
    
    // 匹配汉字  
    jQuery.validator.addMethod("isChinese", function(value, element) {       
         return this.optional(element) || /^[\u4e00-\u9fa5]+$/.test(value);       
    }, "只能输入汉字");   
    
    // 匹配中文(包括汉字和字符) 
    jQuery.validator.addMethod("isChineseChar", function(value, element) {       
         return this.optional(element) || /^[\u0391-\uFFE5]+$/.test(value);       
    }, "匹配中文(包括汉字和字符) "); 
      
    // 判断是否为合法字符(a-zA-Z0-9-_)
    jQuery.validator.addMethod("isRightfulString", function(value, element) {       
         return this.optional(element) || /^[A-Za-z0-9_-]+$/.test(value);       
    }, "判断是否为合法字符(a-zA-Z0-9-_)");   
    
    // 判断是否包含中英文特殊字符，除英文"-_"字符外
    jQuery.validator.addMethod("isContainsSpecialChar", function(value, element) {  
         var reg = RegExp(/[(\ )(\`)(\~)(\!)(\@)(\#)(\$)(\%)(\^)(\&)(\*)(\()(\))(\+)(\=)(\|)(\{)(\})(\')(\:)(\;)(\')(',)(\[)(\])(\.)(\<)(\>)(\/)(\?)(\~)(\！)(\@)(\#)(\￥)(\%)(\…)(\&)(\*)(\（)(\）)(\—)(\+)(\|)(\{)(\})(\【)(\】)(\‘)(\；)(\：)(\”)(\“)(\’)(\。)(\，)(\、)(\？)]+/);   
         return this.optional(element) || !reg.test(value);       
    }, "含有中英文特殊字符");
	
	//车牌号校验
	jQuery.validator.addMethod("isPlateNo", function(value, element) {
		var reg = /^[\u4e00-\u9fa5]{1}[A-Z]{1}[A-Z_0-9]{5}$/;
		return this.optional(element) || (tel.test(value)); 
	},"请输入正确车牌号");
});
//身份证号码的验证规则
//函数参数必须是字符串，因为二代身份证号码是十八位，而在javascript中，十八位的数值会超出计算范围，造成不精确的结果，导致最后两位和计算的值不一致，从而该函数出现错误。
//详情查看javascript的数值范围
function checkIDCard(idcode){
 // 加权因子
 var weight_factor = [7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2];
 // 校验码
 var check_code = ['1', '0', 'X' , '9', '8', '7', '6', '5', '4', '3', '2'];

 var code = idcode + "";
 var last = idcode[17];//最后一个

 var seventeen = code.substring(0,17);

 // ISO 7064:1983.MOD 11-2
 // 判断最后一位校验码是否正确
 var arr = seventeen.split("");
 var len = arr.length;
 var num = 0;
 for(var i = 0; i < len; i++){
     num = num + arr[i] * weight_factor[i];
 }
 
 // 获取余数
 var resisue = num%11;
 var last_no = check_code[resisue];

 // 格式的正则
 // 正则思路
 /*
 第一位不可能是0
 第二位到第六位可以是0-9
 第七位到第十位是年份，所以七八位为19或者20
 十一位和十二位是月份，这两位是01-12之间的数值
 十三位和十四位是日期，是从01-31之间的数值
 十五，十六，十七都是数字0-9
 十八位可能是数字0-9，也可能是X
 */
 var idcard_patter = /^[1-9][0-9]{5}([1][9][0-9]{2}|[2][0][0|1][0-9])([0][1-9]|[1][0|1|2])([0][1-9]|[1|2][0-9]|[3][0|1])[0-9]{3}([0-9]|[X])$/;

 // 判断格式是否正确
 var format = idcard_patter.test(idcode);

 // 返回验证结果，校验码和格式同时正确才算是合法的身份证号码
 return last === last_no && format ? true : false;
}