$(function(){
	createCode();
});



/*定义全局变量*/
var url=window.location.href;
url = url.substring(0, url.lastIndexOf('/'));
function register(){
	if(validateCode() && validate()){
	var data = $('#landForm').serialize();
	if("" != data){
		// 为在action中能正常接收，在每个属性前加上action中定义的对象名
		data = 'landlord.' + data;
		data = data.replace(/&/g, '&landlord.');
	}
	if($('#xieyi').is(':checked')) {
	$.ajax({
		type: 'post',
		url: url+'/saveLandlord.action',
		data: data,
		async: true,
		cache: false,
		dataType: 'json',
		contentType: 'application/x-www-form-urlencoded;charset=UTF-8', 
		success: function(data){
			if(data.resultCode == '0000'){
				location.href=url+'/landlord.html';
			}else{
				alert("注册失败");
			}	
		}
	});
	}else{
		alert("请同意协议");
		 createCode();
	}
	
	}else{
		alert("请输入注册信息");
		 createCode();
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
var validateCode = function()
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
}   ;
//验证输入的信息
var validate = function(){
	 var lname=$("#lname").val();
	 var lpassword=$("#lpassword").val();
	 var lpassword2=$("#lpassword").val();
	 if(lpassword == lpassword2 && lname != "" && lpassword != ""){
		 return true;
	 }else{
		 return false;
	 }
	
};


