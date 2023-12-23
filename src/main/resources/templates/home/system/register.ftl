<!--注册页面ftl -->
<!DOCTYPE HTML>
<html>
<head>
<script id="allmobilize" charset="utf-8" src="/home/style/js/allmobilize.min.js"></script>
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate" media="handheld"  />
<!-- end 云适配 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册-最专业的互联网招聘平台</title>
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
<script src="/home/style/js/core.min.js" type="text/javascript"></script>
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
        
    	<input type="hidden" id="resubmitToken" value="9b207beb1e014a93bc852b7ba450db27" />		
		<div class="login_box">
        	<form id="loginForm">
        		<ul class="register_radio clearfix">
		            <li>
		            	找工作
		              	<input type="radio" value="0" id="type0" name="type" /> 
		            </li>
		            <li>
		           	           招人
		              	<input type="radio" value="1" id="type1" name="type" /> 
		            </li>
		        </ul> 
		        <span for="type" generated="true" class="error" id="error_type" style="display:none">请勾选注册目的</span>
            	<input type="text" id="Email" name="Email" tabindex="1" class="require" placeholder="请输入常用邮箱地址"  tips="邮箱地址不能为空！"  attributes="error_email" />
            	<span for="email" generated="true" class="error" id="error_email" style="display:none">请输入邮箱地址</span>
            	
                <input type="password" id="Password" name="Password" class="require" tabindex="2" placeholder="请输入密码"  tips="密码不能为空！" attributes="error_password"  />
                <span for="password" generated="true" class="error" id="error_password" style="display:none">请输入密码</span>
                
                <input type="text" id="username" name="username" class="require" tabindex="3" placeholder="请输入昵称"   tips="昵称不能为空！" attributes="error_username" />
                <span for="username" generated="true" class="error" id="error_username" style="display:none">请输入昵称</span>
                
            	<input type="text" id="cpacha" name="cpacha" class="require" tabindex="4" placeholder="请输入验证码" /  tips="验证码不能为空！" attributes="error_cpacha" >
            	&nbsp;&nbsp;<a onclick="sendMailCpacha();" href="javascript:void(0);">发送邮箱验证码 </a>
            	<span for="cpacha" generated="true" class="error" id="error_cpacha" style="display:none">请输入验证码</span>
            	
            	
                <input type="button" id="submitLogin" value="注 &nbsp; &nbsp; 册" />
              
            </form>
            <div class="login_right">
            	<div>已有帐号</div>
            	<a  href="/home/system/login"  class="registor_now">直接登录</a>
            </div>
        </div>
        <div class="login_box_btm"></div>
    </div>
    
<#include "../common/alert.ftl"/>
    
<script type="text/javascript">

	//勾选目的为上次默认选择
	window.onload = function(){
		var type =$('input[type="radio"]:checked',loginForm).val();
		if(type == 0)
			$("#type0").click();
		else if(type == 1)
			$("#type1").click();
 　　	}

    //发送邮件验证码
    function sendMailCpacha()
    {
    	var reg=/^\w+@[a-zA-Z0-9]{2,10}(?:\.[a-z]{2,4}){1,3}$/;
        if(!reg.test(document.getElementById("Email").value))
        { 
       		//如果邮箱格式不正确
        	$("#errorMsg").html("发送失败，邮箱格式不正确！(ㄒoㄒ)");
            $.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
        }
        else{
           var email =  $('#Email').val(); //取得用户输入的邮箱地址
           var type = "user_register"; //邮件类型是用户注册验证
           $.ajax({
				url:'/common/cpacha/generate_emailCpacha',
				dataType:'json',
				type:'post',
				data:{receiver:email,type:type},
				success:function(data){
					if(data.code == 0){
						$("#successMsg").html("邮件发送成功！└(^o^)┘");
						$.colorbox({inline:true, href:$("#successTip"),title:"系统提示"});
					}else{
						$("#errorMsg").html("发送失败，"+data.msg+"(ㄒoㄒ)");
            			$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
					}
				}
			});
        } 
    }
    
      //注册表单提交
      $("#submitLogin").click(function() {
         	var type =$('input[type="radio"]:checked',loginForm).val();
			$('#error_type').css('display','none');
			$('#error_email').css('display','none');
			$('#error_password').css('display','none');
			$('#error_username').css('display','none');
			$('#error_cpacha').css('display','none');
			
			//进行统一表单非空验证
			if(!checkForm('loginForm'))
			{
				return;
			}
         	
        	var data = $("#loginForm").serialize(); 
       		$.ajax({
				url:'/home/system/register',
				dataType:'json',
				type:'post',
				data:data,
				success:function(data){
					if(data.code == 0){
						$("#successMsg").html("注册成功！快去登录体验叭！└(^o^)┘");
						$.colorbox({inline:true, href:$("#successTip"),title:"系统提示"});
					}else{
						switch(data.code){
							case -1010:
								$('#error_type').css('display','block');
								$("#errorMsg").html("注册失败，"+data.msg+"(ㄒoㄒ)");
            					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
            					break;
            				case -3:
            					$('#error_cpacha').css('display','block');
            					$("#errorMsg").html("注册失败，"+data.msg+"(ㄒoㄒ)");
            					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
            					break;
            				case -1000:
            					$('#error_username').css('display','block');
            					$("#errorMsg").html("注册失败，"+data.msg+"(ㄒoㄒ)");
            					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
            					break;
            				case -1001:
            					$('#error_password').css('display','block');
            					$("#errorMsg").html("注册失败，"+data.msg+"(ㄒoㄒ)");
            					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
            					break;
            				case -1006:
            					$('#error_email').css('display','block');
            					$("#errorMsg").html("注册失败，"+data.msg+"(ㄒoㄒ)");
            					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
            					break;
            				default:
            					$("#errorMsg").html("注册失败，"+data.msg+"(ㄒoㄒ)");
            					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
            					break;
						}
					}
				}
			});
       
       })
       
        
   
    
    
</script>
</body>
</html>
