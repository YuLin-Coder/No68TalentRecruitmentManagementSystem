<!--后端系统登录ftl-->
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>后台管理员登录</title>
  <meta name="description" content="particles.js is a lightweight JavaScript library for creating particles.">
  <meta name="author" content="Vincent Garreau">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <link rel="stylesheet" type="text/css" href="/admin/easyui/easyui/1.3.4/themes/default/easyui.css" />
  <link rel="stylesheet" type="text/css" href="/admin/easyui/css/wu.css" />
  <link rel="stylesheet" type="text/css" href="/admin/easyui/css/icon.css" />
  <link rel="stylesheet" media="screen" href="/admin/login/css/style.css">
  <link rel="stylesheet" type="text/css" href="/admin/login/css/reset.css">
<body>

<div id="particles-js">
		<div class="login" style="display: block;">
			<div class="login-top">
				后台管理系统登录
			</div>
			<form id="adminLoginForm">
				<div class="login-center clearfix">
					<div class="login-center-img"><img src="/admin/login/images/name.png"></div>
					<div class="login-center-input">
						<input type="text" name="adminName" class="required" id="adminName" value="" placeholder="请输入您的用户名" onfocus="this.placeholder=&#39;&#39;" onblur="this.placeholder=&#39;请输入您的用户名&#39;" tips="用户名不能为空">
						<div class="login-center-input-text">用户名</div>
					</div>
				</div>
				<div class="login-center clearfix">
					<div class="login-center-img"><img src="/admin/login/images/password.png"></div>
					<div class="login-center-input">
						<input type="password" name="password" class="required" id="password" value="" placeholder="请输入您的密码" onfocus="this.placeholder=&#39;&#39;" onblur="this.placeholder=&#39;请输入您的密码&#39;" tips="密码不能为空">
						<div class="login-center-input-text">密码</div>
					</div>
				</div>
				<div class="login-center clearfix">
					<div class="login-center-img"><img src="/admin/login/images/cpacha.png"></div>
					<div class="login-center-input">
						<input style="width:50%;" type="text" class="required" name="cpacha" id="cpacha" value="" placeholder="请输入验证码" onfocus="this.placeholder=&#39;&#39;" onblur="this.placeholder=&#39;请输入验证码&#39;" tips="验证码不能为空">
						<div class="login-center-input-text">验证码</div>
						<img id="cpacha-img" title="点击切换验证码" style="cursor:pointer;" src="/common/cpacha/generate_cpacha?vl=4&fs=21&w=98&h=33&method=admin_login" width="110px" height="30px" onclick="changeCpacha()">
					</div>
				</div>
			</form>
			<div class="login-button">
				登录
			</div>
		</div>
		<div class="sk-rotating-plane"></div>
<canvas class="particles-js-canvas-el" width="1147" height="952" style="width: 100%; height: 100%;"></canvas></div>

<!-- scripts -->
<script src="/admin/login/js/particles.min.js"></script>
<script src="/admin/login/js/app.js"></script>
<script src="/admin/login/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="/admin/easyui/easyui/1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/admin/easyui/easyui/1.3.4/locale/easyui-lang-zh_CN.js"></script>
<script src="/admin/common/confirm_null.js"></script>
<script type="text/javascript">
	function hasClass(elem, cls) {
	  cls = cls || '';
	  if (cls.replace(/\s/g, '').length == 0) return false; //当cls没有参数时，返回false
	  return new RegExp(' ' + cls + ' ').test(' ' + elem.className + ' ');
	}
	 
	function addClass(ele, cls) {
	  if (!hasClass(ele, cls)) {
	    ele.className = ele.className == '' ? cls : ele.className + ' ' + cls;
	  }
	}
	 
	function removeClass(ele, cls) {
	  if (hasClass(ele, cls)) {
	    var newClass = ' ' + ele.className.replace(/[\t\r\n]/g, '') + ' ';
	    while (newClass.indexOf(' ' + cls + ' ') >= 0) {
	      newClass = newClass.replace(' ' + cls + ' ', ' ');
	    }
	    ele.className = newClass.replace(/^\s+|\s+$/g, '');
	  }
	}
	
	function changeCpacha(){
		$("#cpacha-img").attr("src",'/common/cpacha/generate_cpacha??vl=4&fs=21&w=98&h=33&method=admin_login&t=' + new Date().getTime());
	}
		document.querySelector(".login-button").onclick = function(){
				//进行统一表单非空验证
				if(!checkForm('adminLoginForm'))
				{
					return;
				}
				addClass(document.querySelector(".login"), "active")
				addClass(document.querySelector(".sk-rotating-plane"), "active")
				document.querySelector(".login").style.display = "none"
				
				var data = $('#adminLoginForm').serialize();
				
				$.ajax({
					url:'/admin/system/login',
					data:data,
					type:'post',
					dataType:'json',
					success:function(data){
						if(data.code == 0){
							window.location.href = '/admin/system/index';
						}else{
							removeClass(document.querySelector(".login"), "active");
							removeClass(document.querySelector(".sk-rotating-plane"), "active");
							document.querySelector(".login").style.display = "block";
							$.messager.alert("消息提醒",data.msg, "error");
							changeCpacha();
						}
					},
					error:function(data){
						$.messager.alert("消息提醒", '网络错误！', "error");
					}
				});
				
		}
</script>
</body></html>