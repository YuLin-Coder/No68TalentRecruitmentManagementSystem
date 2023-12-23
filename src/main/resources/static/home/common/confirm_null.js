//提示错误信息
function showErrorMsg(msg,field)
{
	$('#'+field).css('display','block');
	$("#errorMsg").html(msg+"(ㄒoㄒ)");
	$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
}
//表单验证公用方法，传表单form的id进来即可
function checkForm(formId){
	var flag = true;
	$("#"+formId).find(".require").each(function(i,e){
		if($(e).val() == ''){
			showErrorMsg($(e).attr('tips'),$(e).attr('attributes')); 
			flag = false;
			return false;
		}
	});
	return flag;  
//jquery 的 each 方法中如果 return true 相当于是 continue，而 return false 相当于是 break。所以return false仍会继续往后执行
}