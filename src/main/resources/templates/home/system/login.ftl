<!--登录页面ftl -->
<!DOCTYPE HTML>
<html>
<head>
<script id="allmobilize" charset="utf-8" src="/home/style/js/allmobilize.min.js"></script>
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate" media="handheld"  />
<!-- end 云适配 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录-最专业的互联网招聘平台</title>
<meta property="qc:admins" content="23635710066417756375" />
<meta content="" name="description">
<meta content="" name="keywords">

<meta name="baidu-site-verification" content="QIQ6KC1oZ6" />

<!-- <div class="web_root"  style="display:none">h</div> -->
<script type="text/javascript">
var ctx = "h";
console.log(1);
</script>
<link href="http://www.lagou.com/images/favicon.ico" rel="Shortcut Icon">
<link rel="stylesheet" type="text/css" href="/home/style/css/style.css"/>
<link href="/home/style/css/popup.css" type="text/css" rel="stylesheet">
<link href="/home/style/css/external.min.css" type="text/css" rel="stylesheet">

<script src="/home/style/js/jquery.1.10.1.min.js" type="text/javascript"></script>

<script type="text/javascript" src="/home/style/js/jquery.lib.min.js"></script>
<script src="/home/style/js/setting.js"></script>
<script type="text/javascript" src="/home/style/js/core.min.js"></script>
<script src="/home/style/js/popup.min.js" type="text/javascript"></script>


<script type="text/javascript">
var youdao_conv_id = 271546; 
</script> 
<script type="text/javascript" src="/home/style/js/conv.js"></script>
<script src="/home/common/confirm_null.js"></script>
</head>

<body id="login_bg">
	<div class="login_wrapper">
		<div class="login_header">
            <div id="cloud_s"><img src="/home/style/images/cloud_s.png" width="81" height="52" alt="cloud" /></div>
            <div id="cloud_m"><img src="/home/style/images/cloud_m.png" width="136" height="95"  alt="cloud" /></div>
        </div>
        
		 <div class="login_box">
        	<form id="loginForm">
				<input type="text" id="Email" name="Email" value="" tabindex="1" class="require" placeholder="请输入登录邮箱地址"  tips="邮箱地址不能为空！"  attributes="error_email" />
				<span for="email" generated="true" class="error" id="error_email"  style="display:none">请输入邮箱地址</span>
				
			  	<input type="password" id="Password" name="Password" tabindex="2" class="require" placeholder="请输入密码"  tips="密码不能为空！"  attributes="error_password" /  >
			  	<span for="password" generated="true" class="error" id="error_password" style="display:none">请输入密码</span>
			  	 
			  	<input type="text" id="cpacha" name="cpacha" tabindex="3" class="require" placeholder="请输入验证码"  tips="验证码不能为空！"  attributes="error_cpacha" />
			  	<img id="cpacha-img" title="点击切换验证码" style="cursor:pointer;margin-bottom: -13px;" src="/common/cpacha/generate_cpacha?vl=4&fs=21&w=98&h=33&method=user_login" width="110px" height="40px" onclick="changeCpacha()">
			  	<span for="cpacha" generated="true" class="error" id="error_cpacha" style="display:none">请输入验证码</span>
			  	
				<a style="color:#fff;" href="javascript:void(0);" onClick="submitLogin();" class="submitLogin" title="登 &nbsp; &nbsp; 录"/>登 &nbsp; &nbsp; 录</a>

			</form>
			<div class="login_right">
				<div>还没有帐号？</div>
				<a  href="/home/system/register"  class="registor_now">立即注册</a>
			</div>
        </div>
        <div class="login_box_btm"></div>
    </div>

<#include "../common/alert.ftl"/>
<script type="text/javascript">
	function changeCpacha(){
		$("#cpacha-img").attr("src",'/common/cpacha/generate_cpacha??vl=4&fs=21&w=98&h=33&method=user_login&t=' + new Date().getTime());
	}
	function submitLogin()
	{
			$('#error_email').css('display','none');
			$('#error_password').css('display','none');
			$('#error_cpacha').css('display','none');
			//进行统一表单验证
			if(!checkForm('loginForm'))
			{
				return;
			}
			var password = $("#Password").val();
			var email = $("#Email").val();
			var cpacha = $("#cpacha").val();
			
         	$.ajax({
				url:'/home/system/login',
				dataType:'json',
				type:'post',
				data:{email:email,password:password,cpacha:cpacha},
				success:function(data){
					if(data.code == 0){
						window.location.href = "/home/index/index";
					}else{
						switch(data.code){
            				case -3:
            					$('#error_cpacha').css('display','block');
            					$("#errorMsg").html("登陆失败，"+data.msg+"(ㄒoㄒ)");
            					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
            					break;
            				case -1001:
            					$('#error_password').css('display','block');
            					$("#errorMsg").html("登陆失败，"+data.msg+"(ㄒoㄒ)");
            					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
            					break;
            				case -1006:
            					$('#error_email').css('display','block');
            					$("#errorMsg").html("登陆失败，"+data.msg+"(ㄒoㄒ)");
            					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
            					break;
            				default:
            					changeCpacha()
            					$("#errorMsg").html("登陆失败，"+data.msg+"(ㄒoㄒ)");
            					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
            					break;
						}
					}
				}
			});
       
		
	}
	
	
</script>
</body>
</html>