<!--首页ftl -->
<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb">
<head>
<script id="allmobilize" charset="utf-8" src="/home/style/js/allmobilize.min.js"></script>
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate" media="handheld"  />
<!-- end 云适配 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>最专业的互联网招聘平台</title>
<meta property="qc:admins" content="23635710066417756375" />
<meta content="" name="description">
<meta content="" name="keywords">
<meta name="baidu-site-verification" content="QIQ6KC1oZ6" />

<script type="text/javascript">
var ctx = "h";
console.log(1);
</script>
<link href="http://www.lagou.com/images/favicon.ico" rel="Shortcut Icon">
<link rel="stylesheet" type="text/css" href="/home/style/css/style.css"/>
<link rel="stylesheet" type="text/css" href="/home/style/css/external.min.css"/>
<link rel="stylesheet" type="text/css" href="/home/style/css/popup.css"/>
<script src="/home/style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/home/style/js/jquery.lib.min.js"></script>
<script src="/home/style/js/ajaxfileupload.js" type="text/javascript"></script>
<script type="text/javascript" src="/home/style/js/additional-methods.js"></script>
<script src="/home/style/js/setting.js"></script>

<script type="text/javascript">
var youdao_conv_id = 271546; 
</script> 
<script type="text/javascript" src="/home/style/js/conv.js"></script>
</head>
<body>
<div id="body">
	<#include "../common/top_menu.ftl"/>
    <div id="container">
		<div id="sidebar">
			<div class="mainNavs">
			
			<#if topPositionCategoryList?size gt 0>
				 <#list topPositionCategoryList as topPositionCategory>
					<div class="menu_box">
						<div class="menu_main">
							<h2>${topPositionCategory.name!""} <span></span></h2> <!--顶级-->
							<#if quickIndexList?size gt 0>
								<#list quickIndexList as quickIndex>
									<#if quickIndex.parentId._parentId == topPositionCategory.id>
				    					<a href="${quickIndex.url!""}">${quickIndex.name!""}</a> <!--快捷索引-->
				    				</#if>
				    			</#list>
				    		</#if>
						</div>
				   	<div class="menu_sub dn">
				   		<#if secondPositionCategoryList?size gt 0>
						  <#list secondPositionCategoryList as secondPositionCategory>	
						  	<#if secondPositionCategory._parentId == topPositionCategory.id >
						    	<dl class="reset">
					        		<dt>
	        							${secondPositionCategory.name!""} <!--二级 -->
				        			</dt>
					        		<dd>
					        			<#if thirdPositionCategoryList?size gt 0>
							  				<#list thirdPositionCategoryList as thirdPositionCategory>
									   			<#if thirdPositionCategory._parentId == secondPositionCategory.id && secondPositionCategory._parentId == topPositionCategory.id>
									   				<a href="${thirdPositionCategory.url!""}">${thirdPositionCategory.name!""}</a>   <!--三级-->
									   			</#if>
											</#list>
										</#if>
									</dd>
								</dl>
							</#if>
						  </#list>
        				</#if>
					 </div><!-- end menu_sub dn -->
					</div><!-- end menu box -->
			 	</#list>
			 </#if>
			
			
			
			
			
			
		</div><!-- end main nvs -->
			
		</div>
        <div class="content">	
		<div id="search_box">
		
        <ul id="searchType">
    		<li data-searchtype="1" class="type_selected" id="selected_position">职位</li>
        	<li data-searchtype="4" id="selected_company">公司</li>
        	        </ul>
        <div class="searchtype_arrow"></div>
		        <input type="text" id="search_input" name="kd"  tabindex="1" value=""  placeholder="请输入职位名称，如：产品经理"  />
		        <input type="hidden" name="spc" id="spcInput" value=""/>
		        <input type="hidden" name="pl" id="plInput" value=""/>
		        <input type="hidden" name="gj" id="gjInput" value=""/>
		        <input type="hidden" name="xl" id="xlInput" value=""/>
		        <input type="hidden" name="yx" id="yxInput" value=""/>
		        <input type="hidden" name="gx" id="gxInput" value="" />
		        <input type="hidden" name="st" id="stInput" value="" />
		        <input type="hidden" name="labelWords" id="labelWords" value="" />
		        <input type="hidden" name="lc" id="lc" value="" />
		        <input type="hidden" name="workAddress" id="workAddress" value=""/>
                <input type="hidden" name="city" id="cityInput" value=""/>
                <input type="button" id="search_button" value="搜索"  onclick="search();" />
				
   
</div>
<style>
.ui-autocomplete{width:488px;background:#fafafa !important;position: relative;z-index:10;border: 2px solid #91cebe;}
.ui-autocomplete-category{font-size:16px;color:#999;width:50px;position: absolute;z-index:11; right: 0px;/*top: 6px; */text-align:center;border-top: 1px dashed #e5e5e5;padding:5px 0;}
.ui-menu-item{ *width:439px;vertical-align: middle;position: relative;margin: 0px;margin-right: 50px !important;background:#fff;border-right: 1px dashed #ededed;}
.ui-menu-item a{display:block;overflow:hidden;}
</style>
<script type="text/javascript" src="/home/style/js/search.min.js"></script>
<dl class="hotSearch">
	<dt>热门搜索：</dt>
	<dd><a href="/home/position/list?search_value=Java开发员">Java开发员</a></dd>
	<dd><a href="/home/position/list?search_value=Android开发员">Android开发员</a></dd>
	<dd><a href="/home/position/list?search_value=iOS开发员">iOS开发员</a></dd>
	<dd><a href="/home/position/list?search_value=html5开发员">html5开发员</a></dd>
	<dd><a href="/home/position/list?search_value=产品经理">产品经理</a></dd>
	<dd><a href="/home/position/list?search_value=销售经理">销售经理</a></dd>
	<dd><a href="/home/position/list?search_value=人事/HR">人事/HR</a></dd>
</dl>			
			<div id="home_banner">
	            <ul class="banner_bg">
	                <li  class="banner_bg_1 current" >
	                    <img src="/home/style/images/d05a2cc6e6c94bdd80e074eb05e37ebd.jpg" width="612" height="160" alt="好买基金——来了就给100万" />
	                </li>
	                <li  class="banner_bg_2" >
	                    <img src="/home/style/images/c9d8a0756d1442caa328adcf28a38857.jpg" width="612" height="160" alt="世界杯放假看球，老板我也要！" />
	                </li>
	                <li  class="banner_bg_3" >
	                    <img src="/home/style/images/d03110162390422bb97cebc7fd2ab586.jpg" width="612" height="160" alt="出北京记——第一站厦门" />
	                </li>
	                	            </ul>
	            <div class="banner_control">
	                <em></em> 
	                <ul class="thumbs">
	                		                    <li  class="thumbs_1 current" >
	                        <i></i>
	                        <img src="/home/style/images/4469b1b83b1f46c7adec255c4b1e4802.jpg" width="113" height="42" />
	                    </li>
	                    	                    <li  class="thumbs_2" >
	                        <i></i>
	                        <img src="/home/style/images/381b343557774270a508206b3a725f39.jpg" width="113" height="42" />
	                    </li>
	                    	                    <li  class="thumbs_3" >
	                        <i></i>
	                        <img src="/home/style/images/354d445c5fd84f1990b91eb559677eb5.jpg" width="113" height="42" />
	                    </li>
	                    	                </ul>
	            </div>
	        </div><!--/#main_banner-->
			
        	<ul id="da-thumbs" class="da-thumbs">
	        		        		<li >
	                    <a href="/home/company/detail?id=12" target="_blank">
	                        <img src="/home/style/images/a254b11ecead45bda166afa8aaa9c8bc.jpg" width="113" height="113" alt="联想" />
	                        <div class="hot_info">
	                        	<h2 title="联想">联想</h2>
	                            <em></em>
	                            <p title="世界因联想更美好">
	                            	世界因联想更美好
	                            </p>
	                        </div>
	                    </a>
	                </li>
                	        		<li >
	                    <a href="/home/company/detail?id=9" target="_blank">
	                        <img src="/home/style/images/c75654bc2ab141df8218983cfe5c89f9.jpg" width="113" height="113" alt="淘米" />
	                        <div class="hot_info">
	                        	<h2 title="淘米">淘米</h2>
	                            <em></em>
	                            <p title="将心注入 追求极致">
	                            	将心注入 追求极致
	                            </p>
	                        </div>
	                    </a>
	                </li>
                	        		<li >
	                    <a href="/home/company/detail?id=14" target="_blank">
	                        <img src="/home/style/images/2bba2b71d0b0443eaea1774f7ee17c9f.png" width="113" height="113" alt="优酷土豆" />
	                        <div class="hot_info">
	                        	<h2 title="优酷土豆">优酷土豆</h2>
	                            <em></em>
	                            <p title="专注于视频领域，是中国网络视频行业领军企业">
	                            	专注于视频领域，是中国网络视频行业领军企业
	                            </p>
	                        </div>
	                    </a>
	                </li>
                	        		<li >
	                    <a href="/home/company/detail?id=10" target="_blank">
	                        <img src="/home/style/images/f4822a445a8b495ebad81fcfad3e40e2.jpg" width="113" height="113" alt="思特沃克" />
	                        <div class="hot_info">
	                        	<h2 title="思特沃克">思特沃克</h2>
	                            <em></em>
	                            <p title="一家全球信息技术服务公司">
	                            	一家全球信息技术服务公司
	                            </p>
	                        </div>
	                    </a>
	                </li>
                	        		<li >
	                    <a href="/home/company/detail?id=15" target="_blank">
	                        <img src="/home/style/images/5caf8f9631114bf990f87bb11360653e.png" width="113" height="113" alt="奇猫" />
	                        <div class="hot_info">
	                        	<h2 title="奇猫">奇猫</h2>
	                            <em></em>
	                            <p title="专注于移动互联网、互联网产品研发">
	                            	专注于移动互联网、互联网产品研发
	                            </p>
	                        </div>
	                    </a>
	                </li>
                	        		<li  class="last" >
	                    <a href="/home/company/detail?id=11" target="_blank">
	                        <img src="/home/style/images/c0052c69ef4546c3b7d08366d0744974.jpg" width="113" height="113" alt="堆糖网" />
	                        <div class="hot_info">
	                        	<h2 title="堆糖网">堆糖网</h2>
	                            <em></em>
	                            <p title="分享收集生活中的美好，遇见世界上的另外一个你">
	                            	分享收集生活中的美好，遇见世界上的另外一个你
	                            </p>
	                        </div>
	                    </a>
	                </li>
                            </ul>
            
            <ul class="reset hotabbing">
	            	<li class="current">最新职位</li>
            </ul>
            <div id="hotList">
	            <ul class="hot_pos reset">
	            	
				 		<#if PositionList?size gt 0>
				 			<#list PositionList as position>	
				 			
				 			<#if position_index % 2 == 0>
			            		<li class="clearfix">
			            		
				            	  	<div class="hot_pos_l">
				                    	<div class="mb10">
				                        	<a href="/home/position/detail?id=${position.id!""}" style="text-decoration:none">${position.name!""}</a> 
				                            &nbsp;
				                            <span class="c9">[${position.city!""}]</span>
				                        </div>
				                        <span><em class="c7">月薪： </em>${position.minMoney!""}k-${position.maxMoney!""}k</span>
				                        <span><em class="c7">经验：</em> ${position.workExperience!""}</span>
				                        <span><em class="c7">最低学历： </em>${position.degree!""}</span>
				                        <br />
				                        <span><em class="c7">职位诱惑：</em>${position.advantage!""}</span>
				                        <br />
					                    <span>发布时间：${position.createTime!""}</span>
				                    </div>
				            </#if>
				            <#if position_index % 2 == 1>
				                	<div class="hot_pos_r">
				                    	<div class="mb10 recompany">
				                    		<a href="/home/position/detail?id=${position.id!""}" style="text-decoration:none">${position.name!""}</a> 
				                            &nbsp;
				                            <span class="c9">[${position.city!""}]</span>
				                        </div>
				                        <span><em class="c7">月薪： </em>${position.minMoney!""}k-${position.maxMoney!""}k</span>
				                        <span><em class="c7">经验：</em> ${position.workExperience!""}</span>
				                        <span><em class="c7">最低学历： </em>${position.degree!""}</span>
				                        <br />
				                        <span><em class="c7">职位诱惑：</em>${position.advantage!""}</span>
				                        <br />
					                    <span>发布时间：${position.createTime!""}</span>
				                    </div>
				                    
				                    
			                	</li>
	               	     	</#if>
	                	</#list>
	                </#if>              	            				          
	                <#if PositionTotal %2 == 1>
	                	</li>
	                </#if>		                	            				            
	                		                	            	
	                		                	                
	                	               
            	</ul>
	            <a href="/home/position/list" class="btn fr">查看更多</a>
            </div>
            
            <div class="clear"></div>
        </div>	
 	    <input type="hidden" value="" name="userid" id="userid" />
 		    
<#include "../common/alert.ftl"/>


<!-------------------------------------弹窗lightbox  ----------------------------------------->

<!------------------------------------- end ----------------------------------------->
<script type="text/javascript" src="/home/style/js/Chart.min.js"></script>
<script type="text/javascript" src="/home/style/js/home.min.js"></script>
<script type="text/javascript" src="/home/style/js/count.js"></script>

<#include "../common/footer.ftl"/>

<script type="text/javascript" src="/home/style/js/core.min.js"></script>
<script type="text/javascript" src="/home/style/js/popup.min.js"></script>

<script type="text/javascript">
	var searchType = "position"; //默认是职位搜索
	document.getElementById("selected_position").onclick = function(){
           searchType = "position";
        }
        
    document.getElementById("selected_company").onclick = function(){
       	   searchType = "company";
    }
    function search(){
    	var search_value = $("#search_input").val();
    	if(search_value == null || search_value == ""){
    		$("#errorMsg").html("搜索信息不能为空！(ㄒoㄒ)");
			$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
			return;
    	}
    
    
    	//如果是职位搜索
    	if(searchType == "position"){
		 	window.location.href = "/home/position/list?search_value="+search_value;
    	}
    	
    	//如果是公司搜索
    	if(searchType == "company"){
    	 	window.location.href = "/home/index/company_list?search_value="+search_value;
    	}
    
    }
    

</script>

</body>
</html>	