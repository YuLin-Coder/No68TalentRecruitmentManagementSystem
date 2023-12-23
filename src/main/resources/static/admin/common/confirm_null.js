//提示警告信息
function showWarningMsg(msg)
{
	$.messager.alert("消息提醒", msg, "warning");
}
//提示错误信息
function showErrorMsg(msg)
{
	$.messager.alert("消息提醒", msg, "error");
}
//表单验证公用方法，传表单form的id进来即可
function checkForm(formId){
	var flag = true;
	$("#"+formId).find(".required").each(function(i,e){
		if($(e).val() == ''){
			showWarningMsg($(e).attr('tips')); 
			flag = false;
			return false;
		}
	});
	return flag;  
//jquery 的 each 方法中如果 return true 相当于是 continue，而 return false 相当于是 break。所以return false仍会继续往后执行
}