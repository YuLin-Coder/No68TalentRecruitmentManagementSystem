<!--简历预览ftl-->
<!DOCTYPE HTML>
<html><head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>简历预览-我的简历-最专业的互联网招聘平台</title>
<meta content="23635710066417756375" property="qc:admins">
<meta name="description" content="">
<meta name="keywords" content="">

<meta content="QIQ6KC1oZ6" name="baidu-site-verification">

</script><script type="text/javascript">
var ctx = "h";
console.log(1);
</script>
<link href="http://www.lagou.com/images/favicon.ico" rel="Shortcut Icon">
<link href="/home/style/css/style.css" type="text/css" rel="stylesheet">
<link href="/home/style/css/colorbox.min.css" type="text/css" rel="stylesheet">
<link href="/home/style/css/popup.css" type="text/css" rel="stylesheet">

<script type="text/javascript" src="/home/style/js/jquery.1.10.1.min.js"></script>

<script src="/home/style/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script>
$(function(){
	 $("body").on("click","a.btn_s",function(){
		$.colorbox.close();
		parent.jQuery.colorbox.close();
	});
	$(".inline").colorbox({
		inline:true
	});
});
</script>
<script src="/home/style/js/ajaxCross.json" charset="UTF-8"></script></head>

<body>
  	<div id="previewWrapper">
        <div class="preview_header">
            <h1 title="jason的简历">jason的简历</h1>
                        	
        </div><!--end .preview_header-->

        <div class="preview_content">
            <div class="profile_box" id="basicInfo">
                <h2>基本信息</h2>
                <div class="basicShow">
                   <span>
                   	<#if currentUser??>
	                 	  姓名： ${currentUser.username!""} | 性别： <#if currentUser.sex == 0>未知<#elseif currentUser.sex == 1>男<#else>女 </#if> | 学历： ${currentUser.degree!""} | 
	                  	 工作经验： ${currentUser.workExperience!""}<br>	
	                  	 电话： ${currentUser.mobile!"暂无"}  |  邮箱： ${currentUser.email!"暂无"} <br>		  
	            		</span>

                   </#if>
                </div><!--end .basicShow-->
            </div><!--end #basicInfo-->
			
	            <div class="profile_box" id="expectJob">
	                <h2>期望工作</h2>
	                <div class="expectShow">
	                	<#if ExpectWork??>
            					期望城市：${ExpectWork.city!"空"}   |  工作性质：${ExpectWork.type!"全职"}  |  期望职位：${ExpectWork.position!"空"}  |  期望月薪：${ExpectWork.money!"空"}
						</#if>
	                </div><!--end .expectShow-->
	            </div><!--end #expectJob-->
						
	            <div class="profile_box" id="workExperience">
	                <h2>工作经历</h2>
	                <div class="experienceShow">
	                  <ul class="wlist clearfix">
	    				<li class="clear">
	    					<#if WorkExperience??>
		    					<span class="c9">${WorkExperience.startYear!""}年 ${WorkExperience.startMonth!""}月 — ${WorkExperience.endYear!""}年 ${WorkExperience.endMonth!""}月</span>
		       					<div>
		       						<h3>职位名称： ${WorkExperience.position!""}</h3>
		       						<h4>公司名称： ${WorkExperience.name!""}</h4>
		       					</div>
	    					<#else>
	    						<span class="c9">&#160;年&#160;月 —&#160;年&#160;月</span>
		       					<div>
		       						<h3>职位名称： </h3>
		       						<h4>公司名称：</h4>
		       					</div>
	    					</#if>
	       				</li>
                  	  </ul>
	                </div><!--end .experienceShow-->
	            </div><!--end #workExperience-->
			
	            <div class="profile_box" id="projectExperience">
	                <h2>项目经验</h2>
	                <div class="projectShow">
	                  <ul class="plist clearfix">
	                  	<li class="noborder">
	    					<div class="projectList">
	    						<#if ProjectExperience??>
	    							<div class="f16 mb10">项目名称： ${ProjectExperience.name!""} | 担任职务： ${ProjectExperience.position!""} | <span class="c9"> ${ProjectExperience.startYear!""}年 ${ProjectExperience.startMonth!""}月—— ${ProjectExperience.endYear!""}年 ${ProjectExperience.endMonth!""}月</span>
		        					</div>
		        					<div class="dl1">
		        						项目描述：${ProjectExperience.content!""}
		        					</div>
	    						<#else>
	    							<div class="f16 mb10">项目名称： | 担任职务：  | <span class="c9">&#160;年&#160;月——&#160;年 &#160;月</span>
		        					</div>
		        					<div class="dl1">
		        						项目描述：
		        					</div>
	    						</#if>
	        				</div>
        				</li>
                      </ul>
	                </div><!--end .projectShow-->
	            </div><!--end #projectExperience-->
						
	            <div class="profile_box" id="educationalBackground">
	                <h2>教育背景</h2>
	                <div class="educationalShow">
	                  <ul class="elist clearfix">
        				<li class="clear">
        					<#if EducationBackground??>
        						<span class="c9">&#160;${EducationBackground.startYear!""}年 ——${EducationBackground.endYear!""}年</span>
						 		<div>
		    						<h3>学校名称： ${EducationBackground.school_name!""}</h3>
		    						<h4>${EducationBackground.major!""} · ${EducationBackground.studyRecord!""}</h4>
					     		</div>
        					<#else>
        						<span class="c9"></span>
						 		<div>
		    						<h3>学校名称： </h3>
		    						<h4> · </h4>
					     		</div>
        					</#if>
        				</li>
                     </ul>
	                </div><!--end .educationalShow-->
	            </div><!--end #educationalBackground-->
	            
	            <div class="profile_box" id="selfDescription">
	                <h2>自我描述</h2>
	                <div class="descriptionShow">
	            		${currentUser.content!""}
	                </div><!--end .descriptionShow-->
	            </div><!--end #selfDescription-->
						
	            <div class="profile_box" id="worksShow">
	                <h2>作品展示</h2>
	                <div class="workShow">
	                  <ul class="slist clearfix">
        				<li class="noborder">
        					<div class="workList c7">
        						<#if WorkShow??>
	        						<div class="f16">作品网址：<a target="_blank" href="${WorkShow.url!""}">${WorkShow.url!""}</a></div>
	            					<p>作品说明： ${WorkShow.content!""}</p>
            					<#else>
            						<div class="f16">作品网址：</div>
	            					<p>作品说明： </p>
            					</#if>
            				</div>
        				</li>
             		  </ul>
	                </div><!--end .workShow-->
	            </div><!--end #worksShow-->
			        </div><!--end .preview_content-->
  	</div><!--end #previewWrapper-->

<!-------------------------------------弹窗lightbox ----------------------------------------->

<!------------------------------------- end ----------------------------------------->  




<div id="cboxOverlay" style="display: none;"></div><div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;"><div id="cboxWrapper"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left;"></div><div id="cboxContent" style="float: left;"><div id="cboxTitle" style="float: left;"></div><div id="cboxCurrent" style="float: left;"></div><button type="button" id="cboxPrevious"></button><button type="button" id="cboxNext"></button><button id="cboxSlideshow"></button><div id="cboxLoadingOverlay" style="float: left;"></div><div id="cboxLoadingGraphic" style="float: left;"></div></div><div id="cboxMiddleRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div></div></body></html>