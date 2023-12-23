<!--我的公司ftl-->
<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb"><head>
</script><script type="text/javascript" async="" src="style/js/conversion.js"></script><script src="style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script><style type="text/css"></style>
<meta content="no-siteapp" http-equiv="Cache-Control">
<link  media="handheld" rel="alternate">
<!-- end 云适配 -->
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>我的公司-最专业的互联网招聘平台</title>
<meta content="23635710066417756375" property="qc:admins">

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
<script src="/home/style/js/additional-methods.js" type="text/javascript"></script>

<script type="text/javascript">
var youdao_conv_id = 271546; 
</script> 
<script src="/home/style/js/conv.js" type="text/javascript"></script>
<script src="/home/style/js/setting.js"></script>
<script src="/home/common/confirm_null.js"></script>
<body>
<div id="body">
	<#include "../common/top_menu.ftl"/>
    <div id="container">
        <div class="clearfix">
        				
            <div class="content_l">           
	                <div class="c_detail">
	                	<div style="background-color:#fff;" class="c_logo">
		                	<a title="上传公司LOGO" id="logoShow" href="javascript:void(0);" onclick="uploadPhoto();">
                			<img width="190" id="preview_company_photo" height="190" alt="公司logo" src="/home/style/images/logo_default.png">
                        	<span>更换公司图片<br>点公司名称旁边铅笔保存</span>
	                        </a>
		                </div>
		                <input type="file" id="company_photo_file" style="display:none;" onchange="uploadCompanyPhoto()">
		             
		                
	                    <div class="c_box companyName">
	                    
                    		<#if Company??>
                    			<h2 title="${Company.name}">${Company.name}</h2>
		                    	
		                		
		                    	<#if Company.state == "未认证">
		                    		<em class="unvalid"></em>
		                			<span class="va dn">未认证企业</span>
		                    		<a  class="applyC" href="javascript:void(0);" onclick="applyConfirm('${Company.id}')">申请认证</a>
		                    	</#if>
	                    		<#if Company.state == "待审核">
	                    			<em class="unvalid"></em>
		                			<span class="va dn">未认证企业</span>
		                    		<a  class="applyC" href="javascript:void(0);">待审核</a>
		                    	</#if>
		                    	<#if Company.state == "已认证">
		                    		<img src="/home/style/images/valid.png" width="15" height="19" style="margin-bottom:-4px;" title="认证企业" />
		                    		<a  class="applyC" href="javascript:void(0);">已认证</a>
		                    	</#if>
		                    	
		                        <div class="clear"></div>
		               			<h1 title="${Company.name}" class="fullname">${Company.name}</h1>
                    		<#else>
                    			<h2 title="快来填写公司名称吧">快来填写公司名称吧</h2>
		                    	<em class="unvalid"></em>
		                		<span class="va dn">未认证企业</span>
		                    	
		                    	<a class="applyC"  href="javascript:void(0);" onclick="tips();">申请认证</a>
		                        <div class="clear"></div>
		               			<h1 title="快来填写公司名称吧" class="fullname">快来填写公司名称吧</h1>
                    		</#if>
               			             
	                        <form class="clear editDetail dn" id="editDetailForm">
	                        	<input type="hidden" id="company_photo" value="common/logo_default.png">
	                            <input type="text" placeholder="请输入公司名称，限制30个字"  maxlength="30" class="require" value="" name="companyShortName" id="companyShortName" tips="公司名称不能为空！"  attributes="error_company_name">
	                            <span for="company_name" generated="true" class="error" id="error_company_name" style="display:none">公司名称不能为空！</span>
	                            
	                            <input type="text" placeholder="一句话描述公司优势，核心价值，限50字" maxlength="50" class="require" value="" name="companyFeatures" id="companyFeatures" tips="公司价值观不能为空！"  attributes="error_company_value">
	                            <span for="company_value" generated="true" class="error" id="error_company_value" style="display:none">公司价值观不能为空！</span>
	                            
	                            <input type="hidden" value="25927" id="companyId" name="companyId">
	                            <input type="button" value="保存" id="saveDetail" class="btn_small" onclick="saveCompanyDetailForm();">
	                            <a id="cancelDetail" class="btn_cancel_s" >取消</a>
		                    </form>
	                            
	                        <div class="clear oneword"><img width="17" height="15" src="/home/style/images/quote_l.png">
	                        	<#if Company??>
	                        		<span>${Company.value}</span> 
	                        	<#else>
	                        		<span>快来填写公司价值观吧！</span> 
	                        	</#if>
		                        <img width="17" height="15" src="/home/style/images/quote_r.png">
	                        </div>
	                        <h3 class="dn">已选择标签</h3>
	                        <ul style="overflow:auto" id="hasLabels" class="reset clearfix">
		                        <#if Tags??>
		                           <#if Tags?size gt 0>
							    		<#list Tags as tags>
		                        			<li><span>${tags!""}</span></li>
	                            		</#list>
	                            	</#if>
	                            </#if>
                            	<li class="link">编辑标签</li>
	                        </ul>
	                        <div class="dn" id="addLabels">
	                        	<font color="red">标签中间用英文逗号,隔开: </font>
	                        	<input type="hidden" value="1" id="labelPageNo">
                            	<input type="text" placeholder="添加自定义标签" name="label" id="label" class="label_form fr">	
	                            <div class="clear"></div>
	                            <ul class="reset clearfix"> </ul>
	                            <a id="saveLabels" class="btn_small" href="javascript:void(0)" onclick="saveCompanyTags();">保存</a>
	                            <a id="cancelLabels" class="btn_cancel_s" href="javascript:void(0)">取消</a>
	                        </div>
	                    </div>
	                    <a title="编辑基本信息" class="c_edit" id="editCompanyDetail" href="javascript:void(0);"></a>
	                	<div class="clear"></div>
	                </div>
                
                	<div class="c_breakline"></div>
       
       				<div id="Product">
        					        				
	        					<div class="product_wrap">
	                
					            	<!--产品编辑-->
					                <dl id="newProduct" class="newProduct dn">
					                	<dt>
					                    	<h2><em></em>公司产品</h2>
					                    </dt>
					                    <dd id="company_product_edit">
					                       
					                            <div class="new_product">
					                            	
						                            <div class="product_upload productShow" >
						                            	<img width="380" height="220" id="edit_preview_product_photo" src="/photo/view?filename=common/product_default.png">
							                        	<span>更换产品图片<br>380*220px 小于1M</span>
							                        	<input type="file" style="display:none;" onchange="uploadCompanyProductPhoto()">
							                        </div>
							                        <input type="hidden" value="common/product_default.png" id="product_photo"> 
							                        <input type="file"  id="product_photo_file" title="支持jpg、jpeg、gif、png格式，文件小于1M" onchange="uploadCompanyProductPhoto();">
							                    	<input type="hidden" value="3" name="type" class="type"> 
							                    </div>
					                            
					                            <div class="cp_intro">
					                               	<input type="text" placeholder="请输入产品名称"  name="product" id="company_product_name">	
					                                <textarea placeholder="请简短描述该产品定位、产品特色、用户群体等" maxlength="500"  class="s_textarea" name="productProfile" id="company_product_description"></textarea>	
					                                <div class="clear"></div>
					                                <input type="button" value="保存" class="btn_small" onclick="saveCompanyProduct();">
					                                <a class="btn_cancel_s product_delete" href="javascript:void(0)">取消</a>
					                        		<input type="hidden" value="11867" class="product_id">
					                            </div>
											
					                    </dd>
					                </dl>
					                <!--有产品-->
					                <dl class="c_product" id="company_product_show">
					                	<dt>
					                    	<h2><em></em>公司产品</h2>
					                    </dt>
					                    <dd >
					                    	<img width="380" height="220" id="preview_product_photo" alt="" src="/photo/view?filename=common/product_default.png">
				                        	<div class="cp_intro">
				                        	<#if Company??>
				                        		<#if Company.productTitle??>
				                        			<h3><a target="_blank" href="http://www.weimob.com">${Company.productTitle!""}</a></h3>
				                        		<#else>
				                        			<h3><a target="_blank" href="http://www.weimob.com">快来填写产品标题吧</a></h3>
				                        		</#if>
						                            <div class="scroll-pane" style="overflow: hidden; padding: 0px; width: 260px;">
						                            <div class="jspContainer" style="width: 260px; height: 140px;"><div class="jspPane" style="padding: 0px; top: 0px; width: 260px;"><div>
						                         <#if Company.productContent??>
				                        			${Company.productContent!""}
				                        		<#else>
				                        				酒香不怕巷子深已经过时啦！<br>
													把自己优秀的产品展示出来吸引人才围观吧！<br>
				                        		</#if>
				                        	   	
						                            </div></div></div></div>
						                    <#else>       
						                            <h3><a target="_blank" href="http://www.weimob.com">快来填写产品标题吧</a></h3>
						                       		<div class="scroll-pane" style="overflow: hidden; padding: 0px; width: 260px;">
						                            <div class="jspContainer" style="width: 260px; height: 140px;"><div class="jspPane" style="padding: 0px; top: 0px; width: 260px;"><div>
				                        			酒香不怕巷子深已经过时啦！<br>
													把自己优秀的产品展示出来吸引人才围观吧！<br>
													 </div></div></div></div>
				                        	</#if>
				                        		
					                        </div>
					                        <a title="编辑公司产品" class="c_edit product_edit" href="javascript:void(0)"></a>
					                    </dd>
					                </dl>
	            
	              				</div>
        			</div>   <!-- end #Product --> 
       	
       				<div id="Profile">
				        	<div class="profile_wrap">
					             <!--无介绍 -->
									<dl class="c_section dn">
					                	<dt>
					                    	<h2><em></em>公司介绍</h2>
					                    </dt>
					                    <dd>
					                    	<div class="addnew">
					                        	详细公司的发展历程、让求职者更加了解你!<br>
					                            <a id="addIntro" href="javascript:void(0)">+添加公司介绍</a>
					                        </div>
					                    </dd>
					                </dl>
					            <!--编辑介绍-->
					                <dl class="c_section newIntro dn">
					                    <dt>
					                        <h2><em></em>公司介绍</h2>
					                    </dt>
					                    <dd>
						                    <form id="companyDesForm">
						                        <textarea placeholder="请分段详细描述公司简介、企业文化等" name="companyProfile" id="companyProfile"></textarea>		                                        
						                        <div class="word_count fr">你还可以输入 <span>1000</span> 字</div>
						                        <div class="clear"></div>
						                        <input type="button" value="保存" id="submitProfile" class="btn_small" onclick="saveCompanyIntroducation();">
						                        <a id="delProfile" class="btn_cancel_s" href="javascript:void(0)">取消</a>
						                    </form>
					                    </dd>
					                </dl>
					            
					            <!--有介绍-->
					               <dl class="c_section">
					               		<dt>
					                   		<h2><em></em>公司介绍</h2>
					                   	</dt>
					                   	<dd>
					                   		<#if Company??>
					                   			<#if Company.introduction??>
					                   				<div class="c_intro">${Company.introduction!""}</div>
					                   				<a title="编辑公司介绍" id="editIntro" class="c_edit" href="javascript:void(0)"></a>
					                   			<#else>
					                   				<div class="addnew">
							                        	详细公司的发展历程、让求职者更加了解你!<br>
							                            <a id="addIntro" href="javascript:void(0)">+添加公司介绍</a>
							                        </div>
					                   			</#if>
					                   		<#else>
					                   			<div class="addnew">
						                        	详细公司的发展历程、让求职者更加了解你!<br>
						                            <a id="addIntro" href="javascript:void(0)">+添加公司介绍</a>
						                        </div>
					                   		</#if>
					                   		
					                   	</dd>
					               </dl>
				            </div>
				                 	
	     			</div><!-- end #Profile -->
      	
      
	    
	        			<!--无招聘职位-->
						<dl id="noJobs" class="c_section">
		                	<dt>
		                    	<h2><em></em>招聘职位</h2>
		                    </dt>
		                    <#if PositionList??>
		                    	 <dd>
			                    	<#if PositionList?size gt 0>
				 						<#list PositionList as position>
				 							<p><a href="/home/position/detail?id=${position.id!""}"><font size="3">${position_index+1}.${position.name!""}</a></font></p>
				 						</#list>
				 					</#if>
			                    </dd>
		                    <#else>
		                    	<dd>
			                    	<div class="addnew">
			                        	发布需要的人才信息，让伯乐和千里马尽快相遇……<br>
			                            <a href="/home/index/publish_position">+添加招聘职位</a>
			                        </div>
			                    </dd>
		                    </#if>
		                    
		                </dl>
	          	
	          	<input type="hidden" value="" name="hasNextPage" id="hasNextPage">
	          	<input type="hidden" value="" name="pageNo" id="pageNo">
	          	<input type="hidden" value="" name="pageSize" id="pageSize">
          		<div id="flag"></div>
            </div>	<!-- end .content_l -->
            
            <div class="content_r">
            	<div id="Tags">
	            	<div id="c_tags_show" class="c_tags solveWrap">
	                    <table>
	                        <tbody><tr>
	                            <td width="45">地点</td>
	                            <#if Company??>
	                            	<#if Company.locale??>
	                            		<td>${Company.locale!""}</td>
	                            	<#else>
	                            		<td>快来填写公司地点吧</td>
	                            	</#if>
	                            <#else>
	                            	<td>快来填写公司地点吧</td>
	                            </#if>
	                        </tr>
	                        <tr>
	                            <td>领域</td>
	                             <#if Company??>
	                            	<#if Company.territory??>
	                            		<td>${Company.territory!""}</td>
	                            	<#else>
	                            		<td>快来填写公司领域吧</td>
	                            	</#if>
	                            <#else>
	                            	<td>快来填写公司领域吧</td>
	                            </#if>
	                        </tr>
	                        <tr>
	                            <td>规模</td>
	                             <#if Company??>
	                            	<#if Company.scale??>
	                            		<td>${Company.scale!""}</td>
	                            	<#else>
	                            		<td>快来填写公司规模吧</td>
	                            	</#if>
	                            <#else>
	                            	<td>快来填写公司规模吧</td>
	                            </#if>
	                        </tr>
	                        <tr>
	                            <td>主页</td>
	                            <td>
                            	 	<#if Company??>
		                            	<#if Company.territory??>
		                            		<a rel="nofollow" title="${Company.url!""}" href="javascript:void(0);">${Company.url!""}</a>
		                            	<#else>
		                            		快来填写公司网址吧
		                            	</#if>
		                            <#else>
		                            		快来填写公司网址吧
		                            </#if>
	                            </td>
	                        </tr>
	                    </tbody></table>
	                    <a id="editTags" class="c_edit" href="javascript:void(0)"></a>
	                </div>
	                <div id="c_tags_edit" class="c_tags editTags dn">
		                <form id="tagForms">
		                    <table>
		                        <tbody><tr>
		                            <td>地点</td>
		                            <td>
		                            	<input type="text" class="require" id="company_locale" placeholder="请输入地点" value="上海"  tips="公司地点不能为空！"  attributes="error_company_locale">	
		                            	<span for="company_locale" generated="true" class="error" id="error_company_locale" style="display:none">公司地点不能为空！</span>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td>领域</td>
		                            <td>
		                            	<input type="text" class="require" id="company_territory" placeholder="请输入领域"  tips="公司领域不能为空！"  attributes="error_company_territory">
		                            	<span for="company_territory" generated="true" class="error" id="error_company_territory" style="display:none">公司领域不能为空！</span>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td>规模</td>
		                            <td>
		                            	<input type="hidden" value="150-500人" id="companySize" name="companySize">
		                            	<input type="button" value="150-500人"   id="select_sca" class="select_tags require"  tips="公司规模不能为空！"  attributes="error_company_scale">
		                                <div class="selectBox dn" id="box_sca" style="display: none;">
		                                    <ul class="reset">
		                            			<li>少于15人</li>
		                            			<li>15-50人</li>
		                            			<li>50-150人</li>
		                            			<li>150-500人</li>
		                            			<li>500-2000人</li>
		                            			<li>2000人以上</li>
	                                    	</ul>
		                                </div>	
		                            	<span for="company_scale" generated="true" class="error" id="error_company_scale" style="display:none">公司规模不能为空！</span>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td>主页</td>
		                            <td>
                            			<input type="text" placeholder="请输入网址"  name="companyUrl" id="companyUrl" class="require"  tips="公司网址不能为空！"  attributes="error_company_url">	
                            			<span for="company_url" generated="true" class="error" id="error_company_url" style="display:none">公司网址不能为空！</span>
		                            </td>
		                        </tr>
		                    </tbody></table>
		                    <input type="button" value="保存" id="submitFeatures" class="btn_small" onclick="saveCompanyBasic();">
		                    <a id="cancelFeatures" class="btn_cancel_s" href="javascript:void(0)">取消</a>
		                    <div class="clear"></div>
		            	</form>
	                </div>
       			</div><!-- end #Tags -->
       			
       			<dl class="c_section c_stages">
                	<dt>
                    	<h2><em></em>融资阶段</h2>
                    	<a title="编辑融资阶段" class="c_edit" href="javascript:void(0)"></a>
                    </dt>
                    <dd>
                    	<ul class="reset stageshow">
                    		<#if Company??>
	                            	<#if Company.finance??>
	                            		<li>目前阶段：<span class="c5">${Company.finance!""}</span></li>
	                            	</#if>
                            </#if>
                    	</ul>
                    	<form class="dn" id="stageform">
	                    	<ul id="stagesList" class="reset">
       		                    <li>
		                    		<label>目前阶段</label>
		                    		<input type="hidden" class="select_invest_hidden" name="select_invest_hidden">
				                    <input type="button" value="未融资"  class="select_tags_short select_invest" id="company_finance">
				                    <div class="selectBoxShort dn" style="display: none;">
				                        <ul class="reset">
		                        			<li>未融资</li>
		                           			<li>天使轮</li>
		                           			<li>A轮</li>
		                           			<li>B轮</li>
		                           			<li>C轮</li>
		                           			<li>D轮及以上</li>
		                           			<li>上市公司</li>
				                        </ul>
				                    </div>
		                    	</li>
		                    </ul>
		                    <input type="button" value="保存" class="btn_small" onclick="saveCompanyFinance();">
		                    
		                    <a id="cancelStages" class="btn_cancel_s" href="javascript:void(0)">取消</a>
		                    <div class="clear"></div>
		                    
		                    
		                   
		                </form>
                    </dd>
                </dl><!-- end .c_stages -->
       				
	      
	       		<div id="Member">		
	       		<!--有创始团队-->
		                <dl class="c_section c_member">
		                	<dt>
		                    	<h2><em></em>创始团队</h2>
		                    </dt>
		                    <dd> 
	       						<div class="member_wrap">
				                        <!-- 编辑创始人 -->
		                        		<div class="member_info newMember dn" id="edit_company_founder">
			                        		<form class="memberForm" id="founderForm">
			                        			<input type="hidden" value="common/default_headpic.png" id="founder_photo">
					                            <div class="new_portrait">
						                            <div class="portrait_upload dn portraitNo">
						                                <span>上传创始人头像</span>
						                            </div>
						                            <div class="portraitShow">
						                            	<img width="120" height="120" id="edit_preview_founder_photo" src="/home/style/images/leader_default.png">
							                        	<span>更换头像</span>
							                        </div>
							                        <input type="file" title="支持jpg、jpeg、gif、png格式，文件小于1M" onchange="uploadCompanyFounderPhoto();" id="founder_photo_file">
							                    	<input type="hidden" value="7" name="type" class="type">
							                    	<input type="hidden" value="images/leader_default.png" name="photo" class="leaderInfos">
						                            <em>
												                                尺寸：120*120px <br> 	
												                                大小：小于1M
						                            </em>
						                        </div>
						                        <input type="text" placeholder="请输入创始人姓名"  class="require" id="company_founder_name" name="name" tips="公司创始人姓名不能为空！"  attributes="error_company_founder_name">	
						                        <span for="company_founder_name" generated="true" class="error" id="error_company_founder_name" style="display:none">公司创始人姓名不能为空！</span>
					                            
					                            <input type="text" placeholder="请输入创始人当前职位" value="ceo" class="require" id="company_founder_position" name="position" tips="公司创始人职位不能为空！"  attributes="error_company_founder_position">
					                            <span for="company_founder_position" generated="true" class="error" id="error_company_founder_position" style="display:none">公司创始人职位不能为空！</span>
					                           
					                            <div class="clear"></div>
					                            <input type="button" value="保存" class="btn_small" onclick="saveCompanyFounder();">
				                                <a class="btn_cancel_s member_delete" href="javascript:void(0)">取消</a>
				                        		<input type="hidden" value="11493" class="leader_id">
				                        	</form>
				                        </div>
				                        
				                        <!-- 显示创始人 -->
				                    	<div class="member_info" id="show_company_founder">
	                    					<a title="编辑创始人" class="c_edit member_edit" href="javascript:void(0)"></a>
				                        	<div class="m_portrait">
				                            	<div></div>
				                            	<img width="120" height="120" id="preview_founder_photo" alt="孙泰英" src="/home/style/images/leader_default.png">
					                        </div>
					                        
				                            <div class="m_name">
				                            	 <#if Company??>
					                            	<#if Company.founderName??>
					                            		${Company.founderName!""}
					                            	<#else>
					                            		创始人:空
					                            	</#if>
					                            <#else>
					                            	创始人:空
					                            </#if>
				                            </div>
				                             <#if Company??>
					                            	<#if Company.founderPosition??>
					                            		 <div class="m_position">${Company.founderPosition!""}</div>
					                            	<#else>
					                            		<div class="m_position">创始人职位：空</div>
					                            	</#if>
					                            <#else>
					                            	<div class="m_position">创始人职位：空</div>
				                            </#if>
				                           
				                    		<div class="m_intro"></div>
				                        </div>
				                        
				                     </div><!-- end .member_wrap -->
 		                    </dd>
		                </dl>
		       			       	</div> <!-- end #Member -->
	       	
	       	
	       
	       	
        </div>
   	</div>
<#include "../common/alert.ftl"/>
<!-------------------------------------弹窗lightbox  ----------------------------------------->

<!------------------------------------- end ----------------------------------------->

<script src="/home/style/js/company.min.js" type="text/javascript"></script>
<script>
var avatar = {};
avatar.uploadComplate = function( data ){
	var result = eval('('+ data +')');
	if(result.success){
		jQuery('#logoShow img').attr("src",ctx+ '/'+result.content);
		jQuery.colorbox.close();
	}
};
</script>
<#include "../common/footer.ftl"/>			

<script src="/home/style/js/core.min.js" type="text/javascript"></script>
<script src="/home/style/js/popup.min.js" type="text/javascript"></script>

<!--  -->
<script type="text/javascript">
window.onload = function(){
<!-----------修改时  公司名称和价值观的赋值---------------------->
	<#if Company??>
		document.getElementById("companyShortName").value='${Company.name!""}';
		document.getElementById("companyFeatures").value='${Company.value!""}';
		document.getElementById("company_photo").value='${Company.photo!""}';
		$("#preview_company_photo").attr('src','/photo/view?filename=' + '${Company.photo!""}');
	<#else>
		document.getElementById("companyShortName").value='';
		document.getElementById("companyFeatures").value='';
	</#if>
<!-----------修改时  公司标签的赋值---------------------->
	<#if Tags??>
		document.getElementById("label").value='${Company.tags!""}';
	<#else>
		document.getElementById("label").value='';
	</#if>
<!-----------修改时  公司产品的赋值---------------------->
	<#if Company??>
		document.getElementById("company_product_name").value='${Company.productTitle!""}';
		document.getElementById("company_product_description").value='${Company.productContent!""}';
		$("#preview_product_photo").attr('src','/photo/view?filename=' + '${Company.productPhoto!""}');
		$("#edit_preview_product_photo").attr('src','/photo/view?filename=' + '${Company.productPhoto!""}');
		document.getElementById("product_photo").value='${Company.productPhoto!""}';
		
	<#else>
		document.getElementById("company_product_name").value='';
		document.getElementById("company_product_description").value='';
	</#if>
<!-----------修改时  公司地点、领域、规模和网页信息的赋值---------------------->
	<#if Company??>
		document.getElementById("company_locale").value='${Company.locale!""}';
		document.getElementById("company_territory").value='${Company.territory!""}';
		document.getElementById("companyUrl").value='${Company.url!""}';
		document.getElementById("select_sca").value='${Company.scale!""}';
	<#else>
		document.getElementById("company_locale").value='';
		document.getElementById("company_territory").value='';
		document.getElementById("companyUrl").value='';
	</#if>
<!-----------修改时  公司融资阶段的赋值---------------------->
	<#if Company??>
		document.getElementById("company_finance").value='${Company.finance!""}';
	<#else>
		document.getElementById("company_finance").value='';
	</#if>
<!-----------修改时  公司创始人的赋值---------------------->
	<#if Company??>
		document.getElementById("company_founder_name").value='${Company.founderName!""}';
		document.getElementById("company_founder_position").value='${Company.founderPosition!""}';
		document.getElementById("founder_photo").value='${Company.founderPhoto!""}';
		$("#edit_preview_founder_photo").attr('src','/photo/view?filename=' + '${Company.founderPhoto!""}');
		$("#preview_founder_photo").attr('src','/photo/view?filename=' + '${Company.founderPhoto!""}');
	<#else>
		document.getElementById("company_founder_name").value='';
		document.getElementById("company_founder_position").value='';
	</#if>
}
//打开上传公司图片窗口
function uploadPhoto(){
	$("#company_photo_file").click();
}
//上传公司创始人图片
function uploadCompanyFounderPhoto(){
		if($("#founder_photo_file").val() == '')return;
		var formData = new FormData();
		//取出所选图片中的第一张
		formData.append('photo',document.getElementById('founder_photo_file').files[0]);
		//进度条会话框打开
		$.ajax({
			url:'/upload/upload_photo',
			type:'post',
			data:formData,
			contentType:false,
			processData:false,
			success:function(data){
				if(data.code == 0){
					$("#successMsg").html("上传成功！└(^o^)┘");
					$.colorbox({inline:true, href:$("#successTip"),title:"系统提示"});
					$("#edit_preview_founder_photo").attr('src','/photo/view?filename=' + data.data);
					$("#preview_founder_photo").attr('src','/photo/view?filename=' + data.data);
					$("#founder_photo").val(data.data);
				}else{
					$("#errorMsg").html("上传失败，"+data.msg+"(ㄒoㄒ)");
					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
				}
			},
			error:function(data){
				$("#errorMsg").html("上传失败，请上传正确格式或者大小的文件！(ㄒoㄒ)");
				$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
			}
		});
}
//上传公司产品图片
function uploadCompanyProductPhoto(){
	if($("#product_photo_file").val() == '')return;
		var formData = new FormData();
		//取出所选图片中的第一张
		formData.append('photo',document.getElementById('product_photo_file').files[0]);
		//进度条会话框打开
		$.ajax({
			url:'/upload/upload_photo',
			type:'post',
			data:formData,
			contentType:false,
			processData:false,
			success:function(data){
				if(data.code == 0){
					$("#successMsg").html("上传成功！└(^o^)┘");
					$.colorbox({inline:true, href:$("#successTip"),title:"系统提示"});
					$("#edit_preview_product_photo").attr('src','/photo/view?filename=' + data.data);
					$("#preview_product_photo").attr('src','/photo/view?filename=' + data.data);
					$("#product_photo").val(data.data);
				}else{
					$("#errorMsg").html("上传失败，"+data.msg+"(ㄒoㄒ)");
					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
				}
			},
			error:function(data){
				$("#errorMsg").html("上传失败，请上传正确格式或者大小的文件！(ㄒoㄒ)");
				$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
			}
		});
}
//上传公司图片
function uploadCompanyPhoto(){
		if($("#company_photo_file").val() == '')return;
		var formData = new FormData();
		//取出所选图片中的第一张
		formData.append('photo',document.getElementById('company_photo_file').files[0]);
		//进度条会话框打开
		$.ajax({
			url:'/upload/upload_photo',
			type:'post',
			data:formData,
			contentType:false,
			processData:false,
			success:function(data){
				if(data.code == 0){
					$("#successMsg").html("上传成功！└(^o^)┘");
					$.colorbox({inline:true, href:$("#successTip"),title:"系统提示"});
					$("#preview_company_photo").attr('src','/photo/view?filename=' + data.data);
					$("#company_photo").val(data.data);
				}else{
					$("#errorMsg").html("上传失败，"+data.msg+"(ㄒoㄒ)");
					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
				}
			},
			error:function(data){
				$("#errorMsg").html("上传失败，请上传正确格式或者大小的文件！(ㄒoㄒ)");
				$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
			}
		});
}



//保存公司标题简介图片信息
function saveCompanyDetailForm()
{
	var name = $("#companyShortName").val();
	var value = $("#companyFeatures").val();
	var photo = $("#company_photo").val();
	
	$('#error_company_name').css('display','none');
	$('#error_company_value').css('display','none');
	//进行统一表单非空验证
	if(!checkForm('editDetailForm'))
	{
		return;
	}
	$.ajax({
		url:'/home/company/save_company_detail',
		dataType:'json',
		type:'post',
		data:{name:name,value:value,photo:photo},
		success:function(data){
			if(data.code == 0){
				$("#successMsg").html("公司标题和简介保存成功！3s后自动刷新页面更新数据！└(^o^)┘");
				$.colorbox({inline:true, href:$("#successTip"),title:"系统提示"});
				setTimeout(function(){  
						window.location.reload();//页面刷新
						},3000);
			}else{
					switch(data.code){
					case -5000:
    					$('#error_company_name').css('display','block');
    					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
    					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
    					break;
					case -5001:
    					$('#error_company_value').css('display','block');
    					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
    					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
    					break;
    				default:
    					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
    					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
    					break;
					}
				}
		}
	});
	
}
//保存公司标签信息
function saveCompanyTags()
{
	var tags = $("#label").val();
	$.ajax({
		url:'/home/company/save_company_tags',
		dataType:'json',
		type:'post',
		data:{tags:tags},
		success:function(data){
			if(data.code == 0){
				$("#successMsg").html("公司标签保存成功！3s后自动刷新页面更新数据！└(^o^)┘");
				$.colorbox({inline:true, href:$("#successTip"),title:"系统提示"});
				setTimeout(function(){  
						window.location.reload();//页面刷新
						},3000);
			}else{
					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
				}
		}
	});
}
//保存公司介绍信息
function saveCompanyIntroducation(){
	var introduction = $("#companyProfile").val();
	$.ajax({
		url:'/home/company/save_company_introduction',
		dataType:'json',
		type:'post',
		data:{introduction:introduction},
		success:function(data){
			if(data.code == 0){
				$("#successMsg").html("公司介绍保存成功！3s后自动刷新页面更新数据！└(^o^)┘");
				$.colorbox({inline:true, href:$("#successTip"),title:"系统提示"});
				setTimeout(function(){  
						window.location.reload();//页面刷新
						},3000);
			}else{
					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
				}
		}
	});
}

//保存公司产品信息
function saveCompanyProduct(){

	var productTitle = $("#company_product_name").val();
	var productContent = $("#company_product_description").val();
	var productPhoto = $("#product_photo").val();
	$.ajax({
		url:'/home/company/save_company_product',
		dataType:'json',
		type:'post',
		data:{productTitle:productTitle,productContent:productContent,productPhoto:productPhoto},
		success:function(data){
			if(data.code == 0){
				$("#successMsg").html("公司产品保存成功！3s后自动刷新页面更新数据！└(^o^)┘");
				$.colorbox({inline:true, href:$("#successTip"),title:"系统提示"});
				setTimeout(function(){  
						window.location.reload();//页面刷新
						},3000);
			}else{
					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
				}
		}
	});
	
}
//保存公司地点、领域、规模和网页信息
function saveCompanyBasic(){
	var locale = $("#company_locale").val();
	var territory = $("#company_territory").val();
	var scale = $("#select_sca").val();
	var url = $("#companyUrl").val();
	$('#error_company_locale').css('display','none');
	$('#error_company_scale').css('display','none');
	$('#error_company_territory').css('display','none');
	$('#error_company_url').css('display','none');
	//进行统一表单非空验证
	if(!checkForm('tagForms'))
	{
		return;
	}
	$.ajax({
		url:'/home/company/save_company_basic',
		dataType:'json',
		type:'post',
		data:{locale:locale,territory:territory,scale:scale,url:url},
		success:function(data){
			if(data.code == 0){
				$("#successMsg").html("公司地点、领域、规模和网页信息保存成功！3s后自动刷新页面更新数据！└(^o^)┘");
				$.colorbox({inline:true, href:$("#successTip"),title:"系统提示"});
				setTimeout(function(){  
						window.location.reload();//页面刷新
						},3000);
			}else{
					switch(data.code){
					case -5012:
    					$('#error_company_locale').css('display','block');
    					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
    					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
    					break;
					case -5013:
    					$('#error_company_territory').css('display','block');
    					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
    					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
    					break;
    				case -5014:
    					$('#error_company_url').css('display','block');
    					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
    					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
    					break;
    				case -5016:
    					$('#error_company_scale').css('display','block');
    					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
    					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
    					break;
    				default:
    					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
    					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
    					break;
					}
				}
		}
	});
	
}
//保存公司融资阶段信息
function saveCompanyFinance()
{
	var finance = $("#company_finance").val();
	$.ajax({
		url:'/home/company/save_company_finance',
		dataType:'json',
		type:'post',
		data:{finance:finance},
		success:function(data){
			if(data.code == 0){
				$("#successMsg").html("公司融资阶段信息保存成功！3s后自动刷新页面更新数据！└(^o^)┘");
				$.colorbox({inline:true, href:$("#successTip"),title:"系统提示"});
				setTimeout(function(){  
						window.location.reload();//页面刷新
						},3000);
			}else{
					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
				}
		}
	});
}

//保存公司创始人信息
function saveCompanyFounder(){
	var founderName = $("#company_founder_name").val();
	var founderPosition = $("#company_founder_position").val();
	var founderPhoto = $("#founder_photo").val();
	
	$('#error_company_founder_position').css('display','none');
	$('#error_company_founder_name').css('display','none');
	//进行统一表单非空验证
	if(!checkForm('founderForm'))
	{
		return;
	}
	$.ajax({
		url:'/home/company/save_company_founder',
		dataType:'json',
		type:'post',
		data:{founderName:founderName,founderPosition:founderPosition,founderPhoto:founderPhoto},
		success:function(data){
			if(data.code == 0){
				$("#successMsg").html("公司创始人信息保存成功！3s后自动刷新页面更新数据！└(^o^)┘");
				$.colorbox({inline:true, href:$("#successTip"),title:"系统提示"});
				setTimeout(function(){  
						window.location.reload();//页面刷新
						},3000);
			}else{
					switch(data.code){
					case -5020:
    					$('#error_company_founder_position').css('display','block');
    					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
    					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
    					break;
					case -5019:
    					$('#error_company_founder_name').css('display','block');
    					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
    					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
    					break;
    				default:
    					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
    					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
    					break;
					}
				}
		}
	});
}

//申请公司认证
function applyConfirm(i){
	$.ajax({
		url:'/home/company/apply_confirm',
		dataType:'json',
		type:'post',
		data:{id:i},
		success:function(data){
			if(data.code == 0){
				$("#successMsg").html("公司认证申请成功提交！3s后自动刷新页面更新数据！└(^o^)┘");
				$.colorbox({inline:true, href:$("#successTip"),title:"系统提示"});
				setTimeout(function(){  
						window.location.reload();//页面刷新
						},3000);
			}else{
					$("#errorMsg").html("公司认证申请提交失败，"+data.msg+"(ㄒoㄒ)");
					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
				}
		}
	});

}

//提示
function tips(){

		$("#errorMsg").html("申请公司认证失败，请先填写基本公司信息(ㄒoㄒ)");
		$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});

}
</script>


<div id="cboxOverlay" style="display: none;"></div><div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;"><div id="cboxWrapper"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left;"></div><div id="cboxContent" style="float: left;"><div id="cboxTitle" style="float: left;"></div><div id="cboxCurrent" style="float: left;"></div><button type="button" id="cboxPrevious"></button><button type="button" id="cboxNext"></button><button id="cboxSlideshow"></button><div id="cboxLoadingOverlay" style="float: left;"></div><div id="cboxLoadingGraphic" style="float: left;"></div></div><div id="cboxMiddleRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div></div></body></html>