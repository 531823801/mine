$(function(){
	querySession();
	queryCollectHouses(0);
});
//定义全局变量
var url=window.location.href;
url = url.substring(0, url.lastIndexOf('/'));
/*.................推荐房源.....................*/
//查询session中的值
	function querySession(){
		$.ajax({
			type: 'post',
			url: url+'/loginSession.action',
			async: true,
			cache: false,
			contentType: 'application/x-www-form-urlencoded;charset=UTF-8', 
			success: function(data){
				if(data.success){
				 $.each(data.data,function(i,landlord) {
					 var name=landlord['lname'];
					 var item='欢迎 <a href="edit.html">'+name+'</a> <span>|</span><a onclick="quitLogin();">退出</a>';
					$("#loginSession").append(item);
					var item2='<img src="'+url+'/upload/'+landlord['lphoto']+'" height="80" width="80" alt="">'+
					'<p>'+landlord['lname']+'</p>';
					$("#news").append(item2);
					 });
				}else{
					var item='<a href="entry.html">登录</a><span>|</span><a href="enroll.html">注册</a>';
					$("#loginSession").append(item);
				}
			}
		
		});
	}
	
//查询我的收藏房源
	var rowCount=0;
	function queryCollectHouses(pageNo){
		$.ajax({
			type: 'post',
			url: url+'/queryCollectHouses.action',
			async: true,
			cache: true,
			data:{pageNo:parseInt(pageNo)+1},
			contentType: 'application/x-www-form-urlencoded;charset=UTF-8', 
			success: function(data){
				rowCount=data.rowCount;
				if(data.success){
					$('#collectList').empty();
					$.each(data.data,function(i,houses) {
					 var photo=editPhoto(houses['photo']);
					 var features=editFeatures(houses['features']);
					 var item='<li class="clearfix"><div class="collect-pic"><a href="'+url+'/article.html?id='+houses['id']+'"><img src="'+url+'/upload/'+photo+'" height="160" width="218" alt=""></a>'+
						'</div><div class="collect-text-l"><h3>'+houses['tittle']+' '+houses['room']+'<i class="orange2">&#xe67b;</i>'+
						'<i class="green2">&#xe65b;</i></h3><p>'+houses['room']+'|'+houses['rentway']+'|'+houses['hlevel']+'|'+houses['floor']+'/'+houses['countfloor']+'层</p>'+
						'<p><i>&#xe616;</i>'+houses['address']+'</p>'+features+
						'</div><div class="collect-text-r"><a onclick="delCollect('+houses['id']+');" class="delete">删除</a>'+
						'<p class="orange"><b>'+houses['price']+'</b><span>/月</span></p><p>'+houses['addtime']+'</p></div></li>';
						$('#collectList').append(item);
					 });
				}else{
					alert("您没有发布房源！");
				};
				initPagination(rowCount,pageNo);
			}
		
		});
	}
	//处理图片
	var editPhoto=function(photoStr){
		 var arr=photoStr.split(",");
		 		return arr[0];
		 	};

	//处理特色
	var editFeatures=function(features){
		var arr=features.split(" ");
		var fea="";
		var fea1="";
		var fea2="";
		var fea3="";
		for(var i=0;i<arr.length;i++){
			if(i==0){
				fea1='<span class="orange">'+arr[i]+'</span>';
			}
			if(i==1){
				fea2='<span class="green">'+arr[i]+'</span>';
			}
			if(i==3){
				fea3='<span class="red">'+arr[i]+'</span>';
			}
			fea=fea1+fea2+fea3;
		}
			return fea;
	};
//删除收藏
function delCollect(hid){
	$.ajax({
		type: 'post',
		url: url+'/delCollect.action',
		async: true,
		cache: false,
		data:{hid:hid},
		contentType: 'application/x-www-form-urlencoded;charset=UTF-8', 
		success: function(data){
			if(data.resultCode == "0000"){
				alert("删除收藏成功！");
				document.location.reload();
			}else{
				alert("删除出错！");
			};
		}
	});
}	
//搜索房源的跳转
function skipUrl(){
	var hcondition=$("#skipUrl").val();
	if(hcondition !='请输入小区名称/区域/厅室 ' && hcondition!=""){
		location.href=url+'/screen.html?hcondition='+hcondition;
	}else{
		location.href=url+'/screen.html';
	}
}	 	
/*.................................分页..........................................*/

function initPagination(rowCount,pageNo){

    $("#Pagination").pagination(rowCount, {
    	 	callback: pageselectCallback,
            prev_text: "上一页",
            next_text: "下一页",
            num_edge_entries: 2,
            num_display_entries: 4,
            current_page:pageNo,
            items_per_page: 2
    });

}
function pageselectCallback(pageNo, jq){
	queryCollectHouses(pageNo);
	
}	
	
	