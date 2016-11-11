$(function(){
	createCode();
});


/*定义全局变量*/
var url=window.location.href;
url = url.substring(0, url.lastIndexOf('/'));
function login(){
	if(validateCode()){
	var data = $('#landLoginForm').serialize();
	if("" != data){
		// 为在action中能正常接收，在每个属性前加上action中定义的对象名
		data = 'landlord.' + data;
		data = data.replace(/&/g, '&landlord.');
	}else{
		alert("请输入登录名或密码！");
		return false ;
	}
	if($('#xieyi').is(':checked')) {
	$.ajax({
		type: 'post',
		url: url+'/landlordLogin.action',
		data: data,
		async: true,
		cache: false,
		dataType: 'json',
		contentType: 'application/x-www-form-urlencoded;charset=UTF-8', 
		success: function(data){
			if(data.resultCode == '0000'){
				location.href=url+'/landlord.html';
			}else{
				alert("用户名不存在或密码错误！");
				createCode();
			}	
		}
	});
	 }else{
		 alert("请同意协议");
	 }
	}
}
//创建验证码

var code;
function createCode() {
    code = "";
    var codeLength = 6; //验证码的长度
    var checkCode = document.getElementById("checkCode");
    var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
    'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
    for (var i = 0; i < codeLength; i++)
    {
        var charNum = Math.floor(Math.random() * 52);
        code += codeChars[charNum];
    }
    if (checkCode)
    {
        checkCode.className = "yzm";
        checkCode.innerHTML = code;
    }
}

//验证验证码
var validateCode=function()
{
    var inputCode = document.getElementById("inputCode").value;
    if (inputCode.length <= 0)
    {
        alert("请输入验证码！");
        return false;
    }
    else if (inputCode.toUpperCase() != code.toUpperCase())
    {
        alert("验证码输入有误！");
        createCode();
        return false;
    }
    else
    {
    	  return true;
    }       
} ;  