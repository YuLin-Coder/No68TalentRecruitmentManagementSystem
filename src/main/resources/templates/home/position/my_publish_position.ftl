<!--招聘者发布的职位ftl-->
<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb"><head>
<script async="" src="/home/style/js/analytics.js"></script><script type="text/javascript" async="" src="/home/style/js/conversion.js"></script><script src="/home/style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script><style type="text/css"></style>
<meta content="no-siteapp" http-equiv="Cache-Control">
<link  media="handheld" rel="alternate">
<!-- end 云适配 -->
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>我发布的职位-招聘服务-最专业的互联网招聘平台</title>
<meta content="23635710066417756375" property="qc:admins">
<meta name="description" content="">
<meta name="keywords" content="">
<meta content="QIQ6KC1oZ6" name="baidu-site-verification">


<script type="text/javascript">
var ctx = "http://www.lagou.com";
console.log(1);
</script>
<link href="http://www.lagou.com/images/favicon.ico" rel="Shortcut Icon">
<link href="/home/style/css/style.css" type="text/css" rel="stylesheet">
<link href="/home/style/css/external.min.css" type="text/css" rel="stylesheet">
<link href="/home/style/css/popup.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/home/style/js/jquery.1.10.1.min.js"></script>
<script src="/home/style/js/jquery.lib.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/home/style/js/ajaxfileupload.js"></script>
<script src="/home/style/js/additional-methods.js" type="text/javascript"></script>
<script src="/home/style/js/setting.js"></script>
<script src="/home/common/confirm_null.js"></script>
<script type="text/javascript">
var youdao_conv_id = 271546; 
</script> 
<script src="/home/style/js/conv.js" type="text/javascript"></script>
<script src="/home/style/js/ajaxCross.json" charset="UTF-8"></script></head>
<body>
<div id="body">
	<#include "../common/top_menu.ftl"/>
    <div id="container">
                	<div class="sidebar">
            	<a class="btn_create" href="/home/index/publish_position">发布新职位</a>
                <dl class="company_center_aside">
		<dt>我收到的简历</dt>
	<dd>
		<a href="/home/resume/my_receive_resume?resumeState=wait">待处理简历</a> 
	</dd>

	<dd>
		<a href="/home/resume/my_receive_resume?resumeState=effective">已通知面试简历</a>
	</dd>
	<dd class="btm">
		<a href="/home/resume/my_receive_resume?resumeState=out">不合适简历</a>
	</dd>
	
</dl>
<dl class="company_center_aside">
	<dt>我发布的职位</dt>
	<#if positionState??>
		<#if positionState == "effective">
			<dd class="current">
				<a href="/home/position/my_publish_position?positionState=effective">有效职位</a>
			</dd>
		<#else>
			<dd>
				<a href="/home/position/my_publish_position?positionState=effective">有效职位</a>
			</dd>
		</#if>
		<#if positionState == "wait">
			<dd class="current">
				<a href="/home/position/my_publish_position?positionState=wait">待审核职位</a>
			</dd>
		<#else>
			<dd>
				<a href="/home/position/my_publish_position?positionState=wait">待审核职位</a>
			</dd>
		</#if>
		<#if positionState == "out">
			<dd class="current">
				<a href="/home/position/my_publish_position?positionState=out">已下线职位</a>
			</dd>
		<#else>
			<dd>
				<a href="/home/position/my_publish_position?positionState=out">已下线职位</a>
			</dd>
		</#if>
	<#else>
		<dd class="current">
			<a href="/home/position/my_publish_position?positionState=effective">有效职位</a>
		</dd>
		<dd>
			<a href="/home/position/my_publish_position?positionState=wait">待审核职位</a>
		</dd>
		<dd>
			<a href="/home/position/my_publish_position?positionState=out">已下线职位</a>
		</dd>
	</#if>
	
	</dl>
    </div><!-- end .sidebar -->
            <div class="content">
            	<dl class="company_center_content">
                    <dt>
                        <h1>
                            <em></em>
                            <#if positionState??>
                            	<#if positionState == "effective">
                            		有效职位 
                            	</#if>
                            	<#if positionState == "wait">
                            		待审核职位 
                            	</#if>
                            	<#if positionState == "out">
                            		已下线职位 
                            	</#if>
                            <#else>
                            	有效职位 
                            </#if>
                       		
                       		<span>（共<i style="color:#fff;font-style:normal" id="positionNumber">${positionTotal!""}</i>个）</span>                        </h1>
                    </dt>
                    <dd>
                		<form id="searchForm">
	                    		<input type="hidden" value="Publish" name="type">
			                	<ul class="reset my_jobs">
			                		<#if PositionList?size gt 0>
				 						<#list PositionList as position>
				 						
			                            	<li data-id="149594">
		                                    	<h3>
			                                        <a target="_blank" title="${position.name!""}" href="">${position.name!""}</a> 
			                                        <span>[${position.city!""}]</span>
		                                    	</h3>
		                                  		<span class="receivedResumeNo">应聘该职位的简历（${position.number!""}）</span>
			                                    <div>${position.workType!""}/ ${position.minMoney!""}k-${position.maxMoney!""}k / ${position.workExperience!""} / ${position.degree!""}</div>
			                                    <div class="c9">发布时间： ${position.createTime!""}</div>
			                                    <div class="links">
			                                       	<a  href="/home/index/publish_position?id=${position.id!""}">编辑</a>
			                                       	<#if positionState??>
				                                       	<#if positionState == "out">
				                                       		<a  href="javascript:void(0)" onclick="changeStateToWait('${position.id!""}')">上线</a>   
				                                       	<#else>
				                                       		<a  href="javascript:void(0)" onclick="changeStateToOut('${position.id!""}')">下线</a>
				                                       	</#if>          
				                                    </#if>       
			                                        <a  href="javascript:void(0)" onclick="deletePosition('${position.id!""}')">删除</a>
			                                    </div>
			                                </li>
			                                
	                                	</#list>
	                                </#if>
	                           	</ul>
	                	</form>
               		</dd>
                </dl>
            </div><!-- end .content -->
<#include "../common/alert.ftl"/>
<script src="/home/style/js/job_list.min.js" type="text/javascript"></script> 
<#include "../common/footer.ftl"/>	

<script src="/home/style/js/core.min.js" type="text/javascript"></script>
<script src="/home/style/js/popup.min.js" type="text/javascript"></script>
<script src="/home/style/js/tongji.js" type="text/javascript"></script>
<!--  -->
<script src="/home/style/js/analytics01.js" type="text/javascript"></script><script type="text/javascript" src="/home/style/js/h.js"></script>
<script type="text/javascript">
//删除职位
function deletePosition(i){

	if(confirm("是否确定要删除？如果删除，该职位下简历也将被删除")){
		$.ajax({
			url:'/home/position/delete',
			dataType:'json',
			type:'post',
			data:{id:i},
			success:function(data){
				if(data.code == 0){
					$("#successMsg").html("职位删除成功！3s后自动刷新页面更新数据！└(^o^)┘");
					$.colorbox({inline:true, href:$("#successTip"),title:"系统提示"});
					setTimeout(function(){  
							window.location.reload();//页面刷新
							},3000);
				}else{
						$("#errorMsg").html("职位删除失败，"+data.msg+"(ㄒoㄒ)");
						$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
					}
			}
		});
	}
}
//把职位状态改为下线
function changeStateToOut(i){

	$.ajax({
			url:'/home/position/changeStateToOut',
			dataType:'json',
			type:'post',
			data:{id:i},
			success:function(data){
				if(data.code == 0){
					$("#successMsg").html("下线成功！3s后自动刷新页面更新数据！└(^o^)┘");
					$.colorbox({inline:true, href:$("#successTip"),title:"系统提示"});
					setTimeout(function(){  
							window.location.reload();//页面刷新
							},3000);
				}else{
						$("#errorMsg").html("下线失败，"+data.msg+"(ㄒoㄒ)");
						$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
					}
			}
		});
}

//把下线的职位状态更改为上线
function changeStateToWait(i){

	$.ajax({
			url:'/home/position/changeStateToWait',
			dataType:'json',
			type:'post',
			data:{id:i},
			success:function(data){
				if(data.code == 0){
					$("#successMsg").html("上线成功！不过要等管理员审核通过！3s后自动刷新页面更新数据！└(^o^)┘");
					$.colorbox({inline:true, href:$("#successTip"),title:"系统提示"});
					setTimeout(function(){  
							window.location.reload();//页面刷新
							},3000);
				}else{
						$("#errorMsg").html("上线失败，"+data.msg+"(ㄒoㄒ)");
						$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
					}
			}
		});

}

</script>

<div id="cboxOverlay" style="display: none;"></div><div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;"><div id="cboxWrapper"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left;"></div><div id="cboxContent" style="float: left;"><div id="cboxTitle" style="float: left;"></div><div id="cboxCurrent" style="float: left;"></div><button type="button" id="cboxPrevious"></button><button type="button" id="cboxNext"></button><button id="cboxSlideshow"></button><div id="cboxLoadingOverlay" style="float: left;"></div><div id="cboxLoadingGraphic" style="float: left;"></div></div><div id="cboxMiddleRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div></div></body></html>