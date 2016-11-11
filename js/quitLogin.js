


/*定义全局变量*/
var url=window.location.href;
url = url.substring(0, url.lastIndexOf('/'));



function quitLogin(){
		$.ajax({
			type: 'post',
			url: url+'/quitLogin.action',
			async: true,
			cache: false,
			contentType: 'application/x-www-form-urlencoded;charset=UTF-8', 
			success: function(data){
				if(data.resultCode == '0000'){
					location.href=url+'/entry.html';
				}else{
					alert("退出失败！");
				}
			}
		
		});
	}