<!--顶部公共菜单ftl-->
<div id="header">
    	<div class="wrapper">
    		<a href="/home/index/index" class="logo">
<#--    			<img src="/home/style/images/logo.png" width="229" height="43" alt="招聘-专注互联网招聘" />-->
    		</a>
    		<ul class="reset" id="navheader">
    			<#if index??>
    				<li class="current"><a href="/home/index/index">首页</a></li>
    			<#else>
    				<li><a href="/home/index/index">首页</a></li>
    			</#if>
    			
    			<#if company_list??>
    				<li class="current"><a href="/home/index/company_list" >公司</a></li>
    			<#else>
    				<li ><a href="/home/index/company_list" >公司</a></li>
    			</#if>
    			
    			<#if about??>
    				<li class="current"><a href="/home/index/about" >关于我们</a></li>
    			<#else>
    				<li ><a href="/home/index/about" >关于我们</a></li>
    			</#if>
    			
    			
    			<#if user??>
	    			<#if user.type == 0>
	    				<#if my_resume??>
	    					<li class="current"><a href="/home/index/my_resume" rel="nofollow">我的简历</a></li>
		    			<#else>
		    				<li><a href="/home/index/my_resume" rel="nofollow">我的简历</a></li>
		    			</#if>
	    			</#if>
    			</#if>
    			
    			<#if user??>
	    			<#if user.type == 1>
	    				<#if publish_position??>
	    					<li class="current"><a href="/home/index/publish_position" rel="nofollow">发布职位</a></li>
		    			<#else>
		    				<li><a href="/home/index/publish_position" rel="nofollow">发布职位</a></li>
		    			</#if>
	    			</#if>
    			</#if>
	    		
    		</ul>
    		
    		<#if user ??>
    			<dl class="collapsible_menu">
	            	<dt>
	           			<span>${user.username!""}&nbsp;</span> 
	            		<span class="red dn" id="noticeDot-0"></span>
	            		<i></i>
	            	</dt>
	            	<#if user.type == 0>
						<dd><a rel="nofollow" href="/home/index/my_resume">我的简历</a></dd>
		                <dd class="btm"><a href="/home/resume/my_delivery_resume">我投递的简历</a></dd>
	                <#elseif user.type == 1>
		                <dd><a href="/home/position/my_publish_position">我发布的职位</a></dd>
	                	<dd><a href="/home/resume/my_receive_resume">我收到的简历</a></dd>
	                	<dd><a href="/home/index/publish_position">我要招人</a></dd>
	                	<dd class="btm"><a href="/home/company/my_company">我的公司主页</a></dd>
	                </#if>
					<dd><a href="/home/system/update_password">更改密码</a></dd>
					<dd class="logout"><a rel="nofollow" href="/home/system/logout">退出</a></dd>
            	
            	</dl>
    		<#else>
    			<ul class="loginTop">
	            	<li><a href="/home/system/login" rel="nofollow">登录</a></li> 
	            	<li>|</li>
	            	<li><a href="/home/system/register" rel="nofollow">注册</a></li>
            	</ul>
    		</#if>
        </div>
</div><!-- end #header -->