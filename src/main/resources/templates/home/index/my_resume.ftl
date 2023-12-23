<!--个人简历ftl -->
<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb"><head>
</script><script type="text/javascript" async="" src="/home/style/js/conversion.js"></script><script src="/home/style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script><style type="text/css"></style>
<meta content="no-siteapp" http-equiv="Cache-Control">
<link  media="handheld" rel="alternate">
<!-- end 云适配 -->
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>我的简历-最专业的互联网招聘平台</title>
<meta content="23635710066417756375" property="qc:admins">
<meta name="description" content="">
<meta name="keywords" content="">
<meta content="QIQ6KC1oZ6" name="baidu-site-verification">

<script type="text/javascript">
var ctx = "h";
console.log(1);
</script>
<link href="http://www.lagou.com/images/favicon.ico" rel="Shortcut Icon">
<link href="/home/style/css/style.css" type="text/css" rel="stylesheet">
<link href="/home/style/css/external.min.css" type="text/css" rel="stylesheet">
<link href="/home/style/css/popup.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/home/style/js/jquery.1.10.1.min.js"></script>
<script src="/home/style/js/jquery.lib.min.js" type="text/javascript"></script>
<script src="/home/style/js/setting.js"></script>
<script src="/home/style/js/additional-methods.js" type="text/javascript"></script>

<script type="text/javascript">
var youdao_conv_id = 271546; 
</script> 
<script src="/home/style/js/conv.js" type="text/javascript"></script>
<script src="/home/common/confirm_null.js"></script>
<body>
<div id="body">
	<#include "../common/top_menu.ftl"/>
    <div id="container">
        
  		<div class="clearfix">
            <div class="content_l">
            	<div class="fl" id="resume_name">
	            	<div class="nameShow fl">
	            		<h1 title="${user.username!""}的简历">${user.username!""}的简历</h1>
	            		<a target="_blank" href="/home/resume/preview">预览</a>
            		</div>
            	</div><!--end #resume_name-->
            	<div class="fr c5" id="lastChangedTime">最后一次更新： ${user.updateTime?string('yyyy-MM-dd HH:mm:ss')}<span></span></div><!--end #lastChangedTime-->
            	<div id="resumeScore">
            		<div class="score fl">
            			<canvas height="120" width="120" id="doughnutChartCanvas" style="width: 120px; height: 120px;"></canvas>
           				<div style="" class="scoreVal"><span>${scores!""}</span>分</div>
            		</div>	
            		
            		<div class="which fl">
        				<div>个人信息、工作经历、项目经验和教育背景这四个最能体现自己的工作能力和个人情况，且完善后才可投递简历哦！</div>
							<#if isOK == 1>
								<span><a href="javascript:void(0);">马上去投递</a></span>
							</#if>
            		</div>
            	</div><!--end #resumeScore-->
            	
<!-----------------------------------------------------基本信息--------------------------------------------------->
     			<div class="profile_box" id="basicInfo">     <!--start basicinfo--> 
            		<h2>基本信息  <span> （投递简历时必填）</span></h2>
            		<span class="c_edit"></span>
            		<div class="basicShow">
        				<span>姓名： ${user.username!""} |  性别： <#if user.sex == 0>未知<#elseif user.sex == 1>男<#else>女 </#if> |学历： ${user.degree!""}  |  工作经验： ${user.workExperience!""}<br>
            				电话： ${user.mobile!"暂无"}  |  邮箱： ${user.email!"暂无"} <br>
            			</span>
            		</div><!--end .basicShow-->
            		<div class="basicEdit dn">
            			<form id="profileForm">
						  <table>
						    <tbody><tr>
						      <td valign="top">
						       	 <span class="redstar">*</span>
						      </td> 
						      <td>
						         <input type="text" placeholder="姓名"  class="require"   name="name" id="name"  tips="姓名不能为空！"  attributes="error_username">
						         <span for="username" generated="true" class="error" id="error_username" style="display:none">姓名不能为空！</span>
						      </td>
						      <td valign="top"></td> 
						      <td>
						          <ul class="profile_radio clearfix reset">
						            <li class="current">
						           	  	 男<em></em>
						              	<input type="radio" name="gender"  value="男"> 
						            </li>
						            <li>
						            	  女<em></em>
						              	<input type="radio" name="gender"  value="女"> 
						            </li>
						             <li>
						            	  未知<em></em>
						              	<input type="radio" name="gender" checked="checked" value="未知"> 
						            </li>
						          </ul>  
						      </td>
						    </tr>
						    <tr>
						      <td valign="top">
						          <span class="redstar">*</span>
						      </td> 
						      <td>
						      	<input type="hidden" id="topDegree" value="${user.degree!""}" name="topDegree">
						        <input type="button" value="${user.degree!""}"  id="select_topDegree" class="profile_select_190 profile_select_normal">
								<div class="boxUpDown boxUpDown_190 dn" id="box_topDegree" style="display: none;">
						        	<ul>
					        			<li>大专</li>
					        			<li>本科</li>
					        			<li>硕士</li>
					        			<li>博士</li>
					        			<li>其他</li>
					        		</ul>
						        </div>  
						      </td>
						      <td valign="top">
						         <span class="redstar">*</span>
						      </td> 
						      <td>
						      	  <input type="hidden" id="workyear" value="${user.workExperience!""}" name="workyear">	
						          <input type="button"  value="${user.workExperience!""}" id="select_workyear" class="profile_select_190 profile_select_normal">
								  <div class="boxUpDown boxUpDown_190 dn" id="box_workyear" style="display: none;">
						          	 <ul>
					        			<li>应届毕业生</li>
					        			<li>1年</li>
					        			<li>2年</li>
					        			<li>3年</li>
					        			<li>4年</li>
					        			<li>5年</li>
					        			<li>6年</li>
					        			<li>7年</li>
					        			<li>8年</li>
					        			<li>9年</li>
					        			<li>10年</li>
					        			<li>10年以上</li>
						        	 </ul>
						          </div>  
						      </td>
						    </tr>
						    <tr>
						      <td valign="top">
						        <span class="redstar">*</span>
						      </td> 
						      <td colspan="3">
						          <input type="text" placeholder="手机号码"  class="require" name="tel" id="tel" tips="手机号不能为空！"  attributes="error_mobile">
						          <span for="mobile" generated="true" class="error" id="error_mobile" style="display:none">手机号不能为空！</span>
						      </td>
						   	</tr>
						    <tr>
						      <td></td> 
						      <td colspan="3">
						          <input type="button" onclick="saveBasicInfo();" value="保 存" class="btn_profile_save">
						          <a class="btn_profile_cancel" href="javascript:;">取 消</a>
						      </td>
						    </tr>
						  </tbody>
						 </table>
						</form><!--end #profileForm-->
						<div class="new_portrait">


							<!-- <input type="hidden" id="headPicHidden" /> -->

						</div><!--end .new_portrait-->
            		</div><!--end .basicEdit-->
            		<input type="hidden" id="nameVal" value="${user.username!""}">
            		<#if user.sex == 0><input type="hidden" id="genderVal" value="未知">
            		<#elseif user.sex == 1><input type="hidden" id="genderVal" value="男">	
            		<#else><input type="hidden" id="genderVal" value="女">
            		</#if>	
            		<input type="hidden" id="topDegreeVal" value="${user.degree!""}">
            		<input type="hidden" id="workyearVal" value="${user.workExperience!"应届毕业生"}">
            		<input type="hidden" id="telVal" value="${user.mobile!""}">
            		<input type="hidden" id="pageType" value="1"> 
            	</div><!--end #basicInfo-->

<!-----------------------------------------------------期望工作--------------------------------------------------->
            	<div class="profile_box" id="expectJob">
            		<h2>期望工作</h2>
            		<span class="c_edit dn"></span>
            		<div class="expectShow dn">
        				<span></span>
            		</div><!--end .expectShow-->
            		<div class="expectEdit dn">
            			<form id="expectForm">
	            			<table>
	            				<tbody><tr>
	            					<td>
	            						<input type="hidden" id="expectCity" value="" name="expectCity">
						        		<input  type="button" value="北京" id="select_expectCity" class="profile_select_287 profile_select_normal">
										<div class="boxUpDown boxUpDown_596 dn" id="box_expectCity" style="display: none;">
							        		<dl>
						        				<dt>热门城市</dt>
								        			<dd>
								        				<span>北京</span>
								        				<span>上海</span>
								        				<span>广州</span>
								        				<span>深圳</span>
								        				<span>成都</span>
								        				<span>杭州</span>
								        				<span>无要求</span>
								        			</dd>
							        	  	</dl>
							        		<dl>
							        			<dt>ABCDEF</dt>
								        			<dd>
								        				<span>北京</span>
								        				<span>长春</span>
								        				<span>成都</span>
								        				<span>重庆</span>
								        				<span>长沙</span>
								        				<span>常州</span>
								        				<span>东莞</span>
								        				<span>大连</span>
								        				<span>佛山</span>
								        				<span>福州</span>
								        			</dd>
							        	  	</dl>
							        	  	<dl>
							        			<dt>GHIJ</dt>
								        			<dd>
								        				<span>贵阳</span>
								        				<span>广州</span>
								        				<span>哈尔滨</span>
								        				<span>合肥</span>
								        				<span>海口</span>
								        				<span>杭州</span>
								        				<span>惠州</span>
								        				<span>金华</span>
								        				<span>济南</span>
								        				<span>嘉兴</span>
								        			</dd>
							        	  	</dl>
							        		<dl>
							        			<dt>KLMN</dt>
								        			<dd>
								        				<span>昆明</span>
								        				<span>廊坊</span>
								        				<span>宁波</span>
								        				<span>南昌</span>
								        				<span>南京</span>
								        				<span>南宁</span>
								        				<span>南通</span>
								        			</dd>
							        	  	</dl>
							        		<dl>
						        				<dt>OPQR</dt>
								        			<dd>
								        				<span>青岛</span>
								        				<span>泉州</span>
								        			</dd>
							        	  	</dl>
							        		<dl>
							        			<dt>STUV</dt>
								        			<dd>
								        				<span>上海</span>
								        				<span>石家庄</span>
								        				<span>绍兴</span>
								        				<span>沈阳</span>
								        				<span>深圳</span>
								        				<span>苏州</span>
								        				<span>天津</span>
								        				<span>太原</span>
								        				<span>台州</span>
								        			</dd>
							        	  	</dl>
							        		<dl>
					        					<dt>WXYZ</dt>
								        			<dd>
								        				<span>武汉</span>
								        				<span>无锡</span>
								        				<span>温州</span>
								        				<span>西安</span>
								        				<span>厦门</span>
								        				<span>烟台</span>
								        				<span>珠海</span>
								        				<span>中山</span>
								        				<span>郑州</span>
								        			</dd>
							        	  	</dl>
							        </div>  
            					</td>
            					<td>
            						<ul class="profile_radio clearfix reset">
            							<input type="hidden" value="全职" id="work_type">
        								<li class="current">
							             	 全职<em></em>
							              	<input type="radio" id="ew_type1"  name="type" value="全职"> 
							            </li>
							            <li>
							              	兼职<em></em>
							              	<input type="radio" id="ew_type2" name="type" value="兼职"> 
							            </li>
							            <li>
						            		  实习<em></em>
						              		<input type="radio" id="ew_type3" name="type" value="实习"> 
							            </li>
							        </ul> 
            					</td>
	            				</tr>
	            				<tr>
	            					<td>
							        	<input type="text" placeholder="期望职位，如：产品经理"  value="" name="expectPosition" id="expectPosition">
									</td>
	            					<td>
	            						<input type="hidden" id="expectSalary" value="" name="expectSalary">
	            						<input type="button" value="2k以下" id="select_expectSalary" class="profile_select_287 profile_select_normal">
							        	<div class="boxUpDown boxUpDown_287 dn" id="box_expectSalary" style="display: none;">
				          	  				<ul>
							        			<li>2k以下</li>
							        			<li>2k-5k</li>
							        			<li>5k-10k</li>
							        			<li>10k-15k</li>
							        			<li>15k-25k</li>
							        			<li>25k-50k</li>
							        			<li>50k以上</li>
						        	 	   </ul>
								         </div>  
	            					</td>
	            				</tr>
	            				<tr>
	            					<td colspan="2">
										<input type="button" onclick="saveExpectWork();" value="保 存" class="btn_profile_save">
						          		<a class="btn_profile_cancel" href="javascript:;">取 消</a>
	            					</td>
	            				</tr>
	            			</tbody></table>
            			</form><!--end #expectForm-->
            		</div><!--end .expectEdit-->
            		<div class="expectAdd pAdd">
            			<#if ExpectWork??>
            					期望城市：${ExpectWork.city!"空"}   |  工作性质：${ExpectWork.type!"全职"}  |  期望职位：${ExpectWork.position!"空"}  |  期望月薪：${ExpectWork.money!"空"}
						<#else>
							填写准确的期望工作能大大提高求职成功率哦…<br>
							快来添加期望工作吧！
						</#if>
						<#if ExpectWork??>
							<span>修改期望工作</span>
						<#else>
							<span>添加期望工作</span>
						</#if>
            		</div><!--end .expectAdd-->
            		
            		
            	</div><!--end #expectJob-->
            	
<!-----------------------------------------------------工作经验--------------------------------------------------->
            	<div class="profile_box" id="workExperience">
            		<h2>工作经历  <span> （投递简历时必填）</span></h2>
            		<span class="c_add dn"></span>
            		
            		<div class="experienceEdit dn">
            			<form class="experienceForm" id="workExperienceForm">
	            			<table>
	            				<tbody><tr>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							        	<input type="text"  placeholder="公司名称"  name="companyName" id="we_company_name" class="require" tips="公司名称不能为空！"  attributes="error_company_name">
							        	<span for="company_name" generated="true" class="error" id="error_company_name" style="display:none">公司名称不能为空！</span>
							      	</td>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							          	<input type="text" placeholder="职位名称，如：产品经理" name="positionName" class="require" id="we_position_name" tips="职位名称不能为空！"  attributes="error_position_name"> 
							          	<span for="position_name" generated="true" class="error" id="error_position_name" style="display:none">职位名称不能为空！</span>
							      	</td>
							    </tr>
	            				<tr>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            						<input type="hidden" class="companyYearStart" value="" name="companyYearStart">
								        	<input type="button" value="开始年份"  class="profile_select_139 profile_select_normal select_companyYearStart" id="we_start_year">
								        	<span for="startTime" generated="true" class="error" id="error_startTime" style="display:none">开始时间不能为空！</span>
											<div class="box_companyYearStart boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									            	<li>2025</li>
									            	<li>2024</li>
									            	<li>2023</li>
									            	<li>2022</li>
									           		<li>2021</li>
									            	<li>2020</li>
									            	<li>2019</li>
									            	<li>2018</li>
									            	<li>2017</li>
									            	<li>2016</li>
									            	<li>2015</li>
								        			<li>2014</li>
								        			<li>2013</li>
								        			<li>2012</li>
								        			<li>2011</li>
								        			<li>2010</li>
								        			<li>2009</li>
								        			<li>2008</li>
								        			<li>2007</li>
								        			<li>2006</li>
								        			<li>2005</li>
								        			<li>2004</li>
								        			<li>2003</li>
								        			<li>2002</li>
								        			<li>2001</li>
								        			<li>2000</li>
								        			<li>1999</li>
								        			<li>1998</li>
								        			<li>1997</li>
								        			<li>1996</li>
								        			<li>1995</li>
								        			<li>1994</li>
								        			<li>1993</li>
								        			<li>1992</li>
								        			<li>1991</li>
								        			<li>1990</li>
								        			<li>1989</li>
								        			<li>1988</li>
								        			<li>1987</li>
								        			<li>1986</li>
								        			<li>1985</li>
								        			<li>1984</li>
								        			<li>1983</li>
								        			<li>1982</li>
								        			<li>1981</li>
								        			<li>1980</li>
								        			<li>1979</li>
								        			<li>1978</li>
								        			<li>1977</li>
								        			<li>1976</li>
								        			<li>1975</li>
								        			<li>1974</li>
								        			<li>1973</li>
								        			<li>1972</li>
								        			<li>1971</li>
								        			<li>1970</li>
								        		</ul>
									        </div>
										</div>
										<div class="fl">
									        <input type="hidden" class="companyMonthStart" value="" name="companyMonthStart">
								        	<input type="button" value="开始月份" class="profile_select_139 profile_select_normal select_companyMonthStart" id="we_start_month">
											<div style="display: none;" class="box_companyMonthStart boxUpDown boxUpDown_139 dn">
									            <ul>
									        		<li>01</li><li>02</li><li>03</li><li>04</li><li>05</li><li>06</li><li>07</li><li>08</li><li>09</li><li>10</li><li>11</li><li>12</li>
									        	</ul>
									        </div>
									    </div>
									    <div class="clear"></div>
	            					</td>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            						<input type="hidden" class="companyYearEnd" value="" name="companyYearEnd">
								        	<input type="button" value="结束年份" class="profile_select_139 profile_select_normal select_companyYearEnd" id="we_end_year">
											<span for="endTime" generated="true" class="error" id="error_endTime" style="display:none">结束时间不能为空！</span>
											<div class="box_companyYearEnd  boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									            	<li>2025</li>
									            	<li>2024</li>
									            	<li>2023</li>
									            	<li>2022</li>
									           		<li>2021</li>
									            	<li>2020</li>
									            	<li>2019</li>
									            	<li>2018</li>
									            	<li>2017</li>
									            	<li>2016</li>
									            	<li>2015</li>
								        			<li>2014</li>
								        			<li>2013</li>
								        			<li>2012</li>
								        			<li>2011</li>
								        			<li>2010</li>
								        			<li>2009</li>
								        			<li>2008</li>
								        			<li>2007</li>
								        			<li>2006</li>
								        			<li>2005</li>
								        			<li>2004</li>
								        			<li>2003</li>
								        			<li>2002</li>
								        			<li>2001</li>
								        			<li>2000</li>
								        			<li>1999</li>
								        			<li>1998</li>
								        			<li>1997</li>
								        			<li>1996</li>
								        			<li>1995</li>
								        			<li>1994</li>
								        			<li>1993</li>
								        			<li>1992</li>
								        			<li>1991</li>
								        			<li>1990</li>
								        			<li>1989</li>
								        			<li>1988</li>
								        			<li>1987</li>
								        			<li>1986</li>
								        			<li>1985</li>
								        			<li>1984</li>
								        			<li>1983</li>
								        			<li>1982</li>
								        			<li>1981</li>
								        			<li>1980</li>
								        			<li>1979</li>
								        			<li>1978</li>
								        			<li>1977</li>
								        			<li>1976</li>
								        			<li>1975</li>
								        			<li>1974</li>
								        			<li>1973</li>
								        			<li>1972</li>
								        			<li>1971</li>
								        			<li>1970</li>
									        	</ul>
									        </div>
										</div>
										<div class="fl">
									        <input type="hidden" class="companyMonthEnd" value="" name="companyMonthEnd">
								        	<input type="button" value="结束月份" class="profile_select_139 profile_select_normal select_companyMonthEnd" id="we_end_month">
											<div style="display: none;" class="box_companyMonthEnd boxUpDown boxUpDown_139 dn">
									            <ul>
									        		<li>01</li><li>02</li><li>03</li><li>04</li><li>05</li><li>06</li><li>07</li><li>08</li><li>09</li><li>10</li><li>11</li><li>12</li>
									        	</ul>
									        </div>
								        </div>
								        <div class="clear"></div>
	            					</td>
	            				</tr>
	            				<tr>
	            					<td></td>
	            					<td colspan="3">
										<input type="button" onclick="saveWorkExperience();" value="保 存" class="btn_profile_save">
						          		<a class="btn_profile_cancel" href="javascript:;">取 消</a>
	            					</td>
	            				</tr>
	            			</tbody></table>
	            			<input type="hidden" class="expId" value="">
            			</form><!--end .experienceForm-->
            		</div><!--end .experienceEdit-->
            		<div class="experienceAdd pAdd">
            			<#if WorkExperience??>
            				公司名称： ${WorkExperience.name!""} | 职位名称： ${WorkExperience.position!""} | 开始时间： ${WorkExperience.startYear!""}年 ${WorkExperience.startMonth!""}月 | 结束时间：  ${WorkExperience.endYear!""}年 ${WorkExperience.endMonth!""}月
            			<#else>
            				工作经历最能体现自己的工作能力！<br>
							且完善后才可投递简历哦！
            			</#if>
            		      
            		    <#if WorkExperience??>
            				<span>修改工作经历</span>
            			<#else>
            				<span>添加工作经历</span>
            			</#if>      			
						
            		</div><!--end .experienceAdd-->
            	</div><!--end #workExperience-->



<!-----------------------------------------------------项目经验--------------------------------------------------->



            	<div class="profile_box" id="projectExperience">
            		<h2>项目经验<span> （投递简历时必填）</span></h2>
            		            		<span class="c_add dn"></span>
            		<div class="projectShow dn">
    				<ul class="plist clearfix"></ul>
	            			            			
            		</div><!--end .projectShow-->
            		<div class="projectEdit dn">
            			<form class="projectForm" id="projectExperienceForm">
	            			<table>
	            				<tbody><tr>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="项目名称"   class="require" id="pw_project_name" tips="项目名称不能为空！"  attributes="error_pw_project_name">
							        	<span for="projectName" generated="true" class="error" id="error_pw_project_name" style="display:none">项目名称不能为空！</span>
							      	</td>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							          	<input type="text" placeholder="担任职务，如：产品负责人" name="thePost" class="require" id="pw_position_name" tips="担任职务名称不能为空！"  attributes="error_pw_position_name">
							      		<span for="positionName" generated="true" class="error" id="error_pw_position_name" style="display:none">担任职务名称不能为空！</span>
							      	</td>
							    </tr>
	            				<tr>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            						<input type="hidden" class="projectYearStart" value="" name="projectYearStart">
								        	<input type="button" value="开始年份" class="profile_select_139 profile_select_normal select_projectYearStart" id="pw_start_year">
								        	<span for="startTime" generated="true" class="error" id="error_pw_startTime" style="display:none">开始时间不能为空！</span>
											<div class="box_projectYearStart  boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									            	<li>2025</li>
									            	<li>2024</li>
									            	<li>2023</li>
									            	<li>2022</li>
									           		<li>2021</li>
									            	<li>2020</li>
									            	<li>2019</li>
									            	<li>2018</li>
									            	<li>2017</li>
									            	<li>2016</li>
									            	<li>2015</li>
								        			<li>2014</li>
								        			<li>2013</li>
								        			<li>2012</li>
								        			<li>2011</li>
								        			<li>2010</li>
								        			<li>2009</li>
								        			<li>2008</li>
								        			<li>2007</li>
								        			<li>2006</li>
								        			<li>2005</li>
								        			<li>2004</li>
								        			<li>2003</li>
								        			<li>2002</li>
								        			<li>2001</li>
								        			<li>2000</li>
								        			<li>1999</li>
								        			<li>1998</li>
								        			<li>1997</li>
								        			<li>1996</li>
								        			<li>1995</li>
								        			<li>1994</li>
								        			<li>1993</li>
								        			<li>1992</li>
								        			<li>1991</li>
								        			<li>1990</li>
								        			<li>1989</li>
								        			<li>1988</li>
								        			<li>1987</li>
								        			<li>1986</li>
								        			<li>1985</li>
								        			<li>1984</li>
								        			<li>1983</li>
								        			<li>1982</li>
								        			<li>1981</li>
								        			<li>1980</li>
								        			<li>1979</li>
								        			<li>1978</li>
								        			<li>1977</li>
								        			<li>1976</li>
								        			<li>1975</li>
								        			<li>1974</li>
								        			<li>1973</li>
								        			<li>1972</li>
								        			<li>1971</li>
								        			<li>1970</li>
									        	</ul>
									        </div>
										</div>
										<div class="fl">
									        <input type="hidden" class="projectMonthStart" value="" name="projectMonthStart">
								        	<input type="button" value="开始月份" class="profile_select_139 profile_select_normal select_projectMonthStart" id="pw_start_month">
											<div style="display: none;" class="box_projectMonthStart boxUpDown boxUpDown_139 dn">
									            <ul>
									        		<li>01</li><li>02</li><li>03</li><li>04</li><li>05</li><li>06</li><li>07</li><li>08</li><li>09</li><li>10</li><li>11</li><li>12</li>
									        	</ul>
									        </div>
								        </div>
								        <div class="clear"></div>
	            					</td>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
	            						<div class="fl">
		            						<input type="hidden" class="projectYearEnd" value="" name="projectYearEnd">
								        	<input type="button" value="结束年份" class="profile_select_139 profile_select_normal select_projectYearEnd" id="pw_end_year">
											<span for="endTime" generated="true" class="error" id="error_pw_endTime" style="display:none">结束时间不能为空！</span>
											<div class="box_projectYearEnd  boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									            	<li>2025</li>
									            	<li>2024</li>
									            	<li>2023</li>
									            	<li>2022</li>
									           		<li>2021</li>
									            	<li>2020</li>
									            	<li>2019</li>
									            	<li>2018</li>
									            	<li>2017</li>
									            	<li>2016</li>
									            	<li>2015</li>
								        			<li>2014</li>
								        			<li>2013</li>
								        			<li>2012</li>
								        			<li>2011</li>
								        			<li>2010</li>
								        			<li>2009</li>
								        			<li>2008</li>
								        			<li>2007</li>
								        			<li>2006</li>
								        			<li>2005</li>
								        			<li>2004</li>
								        			<li>2003</li>
								        			<li>2002</li>
								        			<li>2001</li>
								        			<li>2000</li>
								        			<li>1999</li>
								        			<li>1998</li>
								        			<li>1997</li>
								        			<li>1996</li>
								        			<li>1995</li>
								        			<li>1994</li>
								        			<li>1993</li>
								        			<li>1992</li>
								        			<li>1991</li>
								        			<li>1990</li>
								        			<li>1989</li>
								        			<li>1988</li>
								        			<li>1987</li>
								        			<li>1986</li>
								        			<li>1985</li>
								        			<li>1984</li>
								        			<li>1983</li>
								        			<li>1982</li>
								        			<li>1981</li>
								        			<li>1980</li>
								        			<li>1979</li>
								        			<li>1978</li>
								        			<li>1977</li>
								        			<li>1976</li>
								        			<li>1975</li>
								        			<li>1974</li>
								        			<li>1973</li>
								        			<li>1972</li>
								        			<li>1971</li>
								        			<li>1970</li>
								        		</ul>
									        </div>
										</div>
										<div class="fl">
									        <input type="hidden" class="projectMonthEnd" value="" name="projectMonthEnd">
								        	<input type="button" value="结束月份" class="profile_select_139 profile_select_normal select_projectMonthEnd" id="pw_end_month">
											<div style="display: none;" class="box_projectMonthEnd boxUpDown boxUpDown_139 dn">
									            <ul>
									        		<li>01</li><li>02</li><li>03</li><li>04</li><li>05</li><li>06</li><li>07</li><li>08</li><li>09</li><li>10</li><li>11</li><li>12</li>
									        	</ul>
									        </div>
								        </div>
								        <div class="clear"></div>
	            					</td>
	            				</tr>
	            				<tr>
	            					<td valign="top"></td> 
									<td colspan="3">
										<textarea class="s_textarea" name="projectDescription" placeholder="项目描述"  id="pw_project_description"></textarea>
										<div class="word_count">你还可以输入 <span>500</span> 字</div>
									</td>
	            				</tr>
	            				<tr>
	            					<td valign="top"></td> 
	            					<td colspan="3">
										<input type="button" value="保 存" class="btn_profile_save" onclick="saveProjectExperience();">
						          		<a class="btn_profile_cancel" href="javascript:;">取 消</a>
	            					</td>
	            				</tr>
	            			</tbody></table>
			            	<input type="hidden" value="" class="projectId">
            			</form><!--end .projectForm-->
            		</div><!--end .projectEdit-->
            		<div class="projectAdd pAdd">
            			<#if ProjectExperience??>
            				项目名称： ${ProjectExperience.name!""} | 担任职务： ${ProjectExperience.position!""} | 开始时间： ${ProjectExperience.startYear!""}年 ${ProjectExperience.startMonth!""}月 | 结束时间：  ${ProjectExperience.endYear!""}年 ${ProjectExperience.endMonth!""}月
            				 | 项目描述：${ProjectExperience.content!""}
            			<#else>
            				项目经验是用人单位衡量人才能力的重要指标哦！<br>
							来说说让你难忘的项目吧！
            			</#if>
            			
						<#if ProjectExperience??>
            				<span>修改项目经验</span>
            			<#else>
            				<span>添加项目经验</span>
            			</#if>
            		</div><!--end .projectAdd-->
            	</div><!--end #projectExperience-->
            	
            	
<!-----------------------------------------------------教育背景--------------------------------------------------->
            	<div class="profile_box" id="educationalBackground">
            		<h2>教育背景<span>（投递简历时必填）</span></h2>
					<span class="c_add dn"></span>
            		<div class="educationalEdit dn">
            			<form class="educationalForm" id="educationBackgroundForm">
	            			<table>
	            				<tbody><tr>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="学校名称" name="schoolName" class="require" id="eb_school_name"  tips="学校名称不能为空！"  attributes="error_eb_school_name">
							        	<span for="schoolName" generated="true" class="error" id="error_eb_school_name" style="display:none">学校名称不能为空！</span>
							      	</td>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							      		<input type="hidden" class="degree" value="" name="degree">
							        	<input type="button" value="大专" class="profile_select_287 profile_select_normal select_degree" id="eb_degree">
										<div class="box_degree boxUpDown boxUpDown_287 dn" style="display: none;">
								            <ul>
							        			<li>大专</li>
							        			<li>本科</li>
							        			<li>硕士</li>
							        			<li>博士</li>
							        			<li>其他</li>
								        	</ul>
								        </div>
							        </td>
							    </tr>
	            				<tr>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
	            						<input type="text" placeholder="专业名称" name="professionalName" class="require" id="eb_major" tips="专业名称不能为空！"  attributes="error_eb_major">
	            						<span for="major" generated="true" class="error" id="error_eb_major" style="display:none">专业名称不能为空！</span>
	            					</td>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            						<input type="hidden" class="schoolYearStart" value="" name="schoolYearStart">
								        	<input type="button" value="开始年份" class="profile_select_139 profile_select_normal select_schoolYearStart" id="eb_start_year">
											<span for="startTime" generated="true" class="error" id="error_eb_startTime" style="display:none">开始年份不能为空！</span>
											<div class="box_schoolYearStart boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									            	<li>2025</li>
									            	<li>2024</li>
									            	<li>2023</li>
									            	<li>2022</li>
									           		<li>2021</li>
									            	<li>2020</li>
									            	<li>2019</li>
									            	<li>2018</li>
									            	<li>2017</li>
									            	<li>2016</li>
									            	<li>2015</li>
								        			<li>2014</li>
								        			<li>2013</li>
								        			<li>2012</li>
								        			<li>2011</li>
								        			<li>2010</li>
								        			<li>2009</li>
								        			<li>2008</li>
								        			<li>2007</li>
								        			<li>2006</li>
								        			<li>2005</li>
								        			<li>2004</li>
								        			<li>2003</li>
								        			<li>2002</li>
								        			<li>2001</li>
								        			<li>2000</li>
								        			<li>1999</li>
								        			<li>1998</li>
								        			<li>1997</li>
								        			<li>1996</li>
								        			<li>1995</li>
								        			<li>1994</li>
								        			<li>1993</li>
								        			<li>1992</li>
								        			<li>1991</li>
								        			<li>1990</li>
								        			<li>1989</li>
								        			<li>1988</li>
								        			<li>1987</li>
								        			<li>1986</li>
								        			<li>1985</li>
								        			<li>1984</li>
								        			<li>1983</li>
								        			<li>1982</li>
								        			<li>1981</li>
								        			<li>1980</li>
								        			<li>1979</li>
								        			<li>1978</li>
								        			<li>1977</li>
								        			<li>1976</li>
								        			<li>1975</li>
								        			<li>1974</li>
								        			<li>1973</li>
								        			<li>1972</li>
								        			<li>1971</li>
								        			<li>1970</li>
									        	</ul>
									        </div>
										</div>
										<div class="fl">
		            						<input type="hidden" class="schoolYearEnd" value="" name="schoolYearEnd">
								        	<input type="button" value="结束年份" class="profile_select_139 profile_select_normal select_schoolYearEnd" id="eb_end_year">
								        	<span for="endTime" generated="true" class="error" id="error_eb_endTime" style="display:none">结束年份不能为空！</span>
											<div class="box_schoolYearEnd  boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									            	<li>2025</li>
									            	<li>2024</li>
									            	<li>2023</li>
									            	<li>2022</li>
									           		<li>2021</li>
									            	<li>2020</li>
									            	<li>2019</li>
									            	<li>2018</li>
									            	<li>2017</li>
									            	<li>2016</li>
									            	<li>2015</li>
								        			<li>2014</li>
								        			<li>2013</li>
								        			<li>2012</li>
								        			<li>2011</li>
								        			<li>2010</li>
								        			<li>2009</li>
								        			<li>2008</li>
								        			<li>2007</li>
								        			<li>2006</li>
								        			<li>2005</li>
								        			<li>2004</li>
								        			<li>2003</li>
								        			<li>2002</li>
								        			<li>2001</li>
								        			<li>2000</li>
								        			<li>1999</li>
								        			<li>1998</li>
								        			<li>1997</li>
								        			<li>1996</li>
								        			<li>1995</li>
								        			<li>1994</li>
								        			<li>1993</li>
								        			<li>1992</li>
								        			<li>1991</li>
								        			<li>1990</li>
								        			<li>1989</li>
								        			<li>1988</li>
								        			<li>1987</li>
								        			<li>1986</li>
								        			<li>1985</li>
								        			<li>1984</li>
								        			<li>1983</li>
								        			<li>1982</li>
								        			<li>1981</li>
								        			<li>1980</li>
								        			<li>1979</li>
								        			<li>1978</li>
								        			<li>1977</li>
								        			<li>1976</li>
								        			<li>1975</li>
								        			<li>1974</li>
								        			<li>1973</li>
								        			<li>1972</li>
								        			<li>1971</li>
								        			<li>1970</li>
									        	</ul>
									        </div>
	            						</div>
	            						<div class="clear"></div>
	            					</td>
	            				</tr>
	            				<tr>
	            					<td></td>
	            					<td colspan="3">
										<input type="button" value="保 存" class="btn_profile_save" onclick="saveEducationBackground();">
						          		<a class="btn_profile_cancel" href="javascript:;">取 消</a>
	            					</td>
	            				</tr>
	            			</tbody></table>
	            			<input type="hidden" class="eduId" value="">
            			</form><!--end .educationalForm-->
            		</div><!--end .educationalEdit-->
            		<div class="educationalAdd pAdd">
            			
						<#if EducationBackground??>
							学校名称： ${EducationBackground.school_name!""} | 学历： ${EducationBackground.studyRecord!""} | 专业名称： ${EducationBackground.major!""} | 开始时间： ${EducationBackground.startYear!""}年 | 结束时间：  ${EducationBackground.endYear!""}年
						<#else>
							教育背景可以充分体现你的学习和专业能力！<br>
								且完善后才可投递简历哦！
						</#if>
						
						<#if EducationBackground??>
							<span>修改教育经历</span>
						<#else>
							<span>添加教育经历</span>
						</#if>
						
            		</div><!--end .educationalAdd-->
            	</div><!--end #educationalBackground-->
            	
            	
            	
<!-----------------------------------------------------自我描述--------------------------------------------------->
            	<div class="profile_box" id="selfDescription">
            		<h2>自我描述</h2>
            		<span class="c_edit dn"></span>
            		<div class="descriptionShow dn">
            		</div><!--end .descriptionShow-->
            		<div class="descriptionEdit dn">
            			<form class="descriptionForm">
	            			<table>
	            				<tbody><tr>
									<td colspan="2">
										<textarea class="s_textarea" name="selfDescription" placeholder="请输入自我描述" id="user_selfDescription"></textarea>
										<div class="word_count">你还可以输入 <span>500</span> 字</div>
									</td>
	            				</tr>
	            				<tr>
	            					<td colspan="2">
										<input type="button" value="保 存" class="btn_profile_save" onclick="saveSelfDescription();">
						          		<a class="btn_profile_cancel" href="javascript:;">取 消</a>
	            					</td>
	            				</tr>
	            			</tbody></table>
            			</form><!--end .descriptionForm-->
            		</div><!--end .descriptionEdit-->
		        		<div class="descriptionAdd pAdd">
		        			<#if user.content??>
		        				自我描述： ${user.content!""}
		        			<#else>
		        				描述你的性格、爱好以及吸引人的经历等！<br>
									让企业了解多元化的你！
		        			</#if>
	            			
							<#if user.content??>
		        				<span>修改自我描述</span>
		        			<#else>
		        				<span>添加自我描述</span>
		        			</#if>
		        		</div><!--end .descriptionAdd-->
            	</div><!--end #selfDescription-->
<!-----------------------------------------------------作品展示--------------------------------------------------->
            	<div class="profile_box" id="worksShow">
            		<h2>作品展示</h2>
            		<span class="c_add dn"></span>
            		<div class="workShow dn">
        				<ul class="slist clearfix"></ul>
            		</div><!--end .workShow-->
            		<div class="workEdit dn">
            			<form class="workForm">
	            			<table>
	            				<tbody><tr>
							      	<td>
							        	<input type="text" placeholder="请输入作品链接" name="workLink"  id="ws_href">
							      	</td>
							    </tr>
	            				<tr>
									<td>
										<textarea maxlength="100" class="s_textarea" name="workDescription" placeholder="请输入说明文字"  id="ws_description"></textarea>
										<div class="word_count">你还可以输入 <span id="1">100</span> 字</div>
									</td>
	            				</tr>
	            				<tr>
	            					<td>
										<input type="button" onclick="saveWorkShow();" value="保 存"  class="btn_profile_save">
						          		<a class="btn_profile_cancel" href="javascript:;">取 消</a>
	            					</td>
	            				</tr>
	            			</tbody></table>
	            			<input type="hidden" class="showId" value="">
            			</form><!--end .workForm-->
            		</div><!--end .workEdit-->
		        		<div class="workAdd pAdd">
		        			<#if WorkShow??>
		        				作品链接： ${WorkShow.url!""} | 作品说明： ${WorkShow.content!""}
		        			<#else>
		        				         好作品会说话！<br>
								快来秀出你的作品打动企业吧！
		        			</#if>
		        			
		        			<#if WorkShow??>
		        				<span>修改作品展示</span>
		        			<#else>
		        				<span>添加作品展示</span>
		        			</#if>
		        		</div><!--end .workAdd-->
            	</div><!--end #worksShow-->
				<input type="hidden" id="resumeId" value="268472">
            </div><!--end .content_l-->
            <div class="content_r">
            	

				
				<div class="greybg qrcode mt20">
                	<img width="242" height="242" alt="微信公众号二维码" src="/home/style/images/qr_resume.png">
                    <span class="c7">微信扫一扫，轻松找工作</span>
                </div>
            </div><!--end .content_r-->
        </div>
        
      <input type="hidden" id="userid" name="userid" value="314873">
<#include "../common/alert.ftl"/>
<!-------------------------------------弹窗lightbox ----------------------------------------->

	
	
	
    
   
    
   
<!------------------------------------- end ----------------------------------------->  

<script src="/home/style/js/Chart.min.js" type="text/javascript"></script>
<script src="/home/style/js/profile.min.js" type="text/javascript"></script>
<!-- <div id="profileOverlay"></div> -->


<#include "../common/footer.ftl"/>

<script src="/home/style/js/core.min.js" type="text/javascript"></script>
<script src="/home/style/js/popup.min.js" type="text/javascript"></script>



<script type="text/javascript">
window.onload = function(){
<!-----------修改时  期望工作部分赋值---------------------->
	<#if ExpectWork??>
		document.getElementById("select_expectCity").value='${ExpectWork.city!""}';
		var type = '${ExpectWork.type!"全职"}';
		if(type =="兼职"){
			document.getElementById("ew_type2").click();
		}
		if(type =="实习"){
			document.getElementById("ew_type3").click();
		}
		document.getElementById("select_expectSalary").value='${ExpectWork.money!""}';
		document.getElementById("expectPosition").value='${ExpectWork.position!""}';
	</#if>
<!-----------修改时  工作经历部分赋值---------------------->
	<#if WorkExperience??>
		document.getElementById("we_company_name").value='${WorkExperience.name!""}';
		document.getElementById("we_position_name").value='${WorkExperience.position!""}';
		document.getElementById("we_start_year").value='${WorkExperience.startYear!""}';
		document.getElementById("we_start_month").value='${WorkExperience.startMonth!""}';
		document.getElementById("we_end_year").value='${WorkExperience.endYear!""}';
		document.getElementById("we_end_month").value='${WorkExperience.endMonth!""}';
	</#if>
<!-----------修改时  项目经验部分赋值---------------------->
	<#if ProjectExperience??>
		document.getElementById("pw_project_name").value='${ProjectExperience.name!""}';
		document.getElementById("pw_position_name").value='${ProjectExperience.position!""}';
		document.getElementById("pw_start_year").value='${ProjectExperience.startYear!""}';
		document.getElementById("pw_start_month").value='${ProjectExperience.startMonth!""}';
		document.getElementById("pw_end_year").value='${ProjectExperience.endYear!""}';
		document.getElementById("pw_end_month").value='${ProjectExperience.endMonth!""}';
		document.getElementById("pw_project_description").value='${ProjectExperience.content!""}';
	</#if>
<!-----------修改时  教育背景部分赋值---------------------->
	<#if EducationBackground??>
		document.getElementById("eb_school_name").value='${EducationBackground.school_name!""}';
		document.getElementById("eb_degree").value='${EducationBackground.studyRecord!""}';
		document.getElementById("eb_start_year").value='${EducationBackground.startYear!""}';
		document.getElementById("eb_end_year").value='${EducationBackground.endYear!""}';
		document.getElementById("eb_major").value='${EducationBackground.major!""}';
	</#if>
<!-----------修改时  自我描述部分赋值---------------------->
	<#if user.content??>
		document.getElementById("user_selfDescription").value='${user.content!""}';
	</#if>
<!-----------修改时  作品展示部分赋值---------------------->
	<#if WorkShow??>
		document.getElementById("ws_href").value='${WorkShow.url!""}';
		document.getElementById("ws_description").value='${WorkShow.content!""}';
	</#if>
	
	
}
<!----------------期望工作中三个工作类别的取值------------------>
document.getElementById("ew_type1").onclick = function(){
		var type = $("#ew_type1").val();
        $("#work_type").val(type);
}
document.getElementById("ew_type2").onclick = function(){
		var type = $("#ew_type2").val();
        $("#work_type").val(type);
}
document.getElementById("ew_type3").onclick = function(){
		var type = $("#ew_type3").val();
        $("#work_type").val(type);
}

//上传图片
function upload(){
	if($("#headPic").val() == '')return;
	//new FormData():异步上传二进制文件。
	var formData = new FormData();
	//取出所选图片中的第一张
	formData.append('photo',document.getElementById('headPic').files[0]);
	$.ajax({
		url:'/upload/upload_photo',
		type:'post',
		data:formData,
		//用ajax上传文件时候，必须设置contentType:false,processData:false
		contentType:false,
		processData:false,
		success:function(data){
			if(data.code == 0){
				$("#successMsg").html("上传成功！└(^o^)┘");
				$.colorbox({inline:true, href:$("#successTip"),title:"系统提示"});
				$("#preview-user-photo").attr('src','/photo/view?filename=' + data.data);
				$("#edit-preview-user-photo").attr('src','/photo/view?filename=' + data.data);
				$("#user_headPic").val(data.data);
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
//保存基本个人信息
function saveBasicInfo()
{
	var username = $("#name").val();
	var sex_name = $('input[type="radio"]:checked',profileForm).val(); 
	var degree = $("#select_topDegree").val();
	var workExperience = $("#select_workyear").val();
	var mobile = $("#tel").val();
	var headPic = $("#user_headPic").val();
	if(sex_name == "男")
	{
		var sex = 1;
	}else if(sex_name == "女")
	{
		var sex = 2;
	}else{
		var sex = 0;
	}
	$('#error_username').css('display','none');
	$('#error_mobile').css('display','none');
	//进行统一表单非空验证
	if(!checkForm('profileForm'))
	{
		return;
	}
	
	
	$.ajax({
		url:'/home/user/save',
		dataType:'json',
		type:'post',
		data:{username:username,sex:sex,degree:degree,workExperience:workExperience,mobile:mobile,headPic:headPic},
		success:function(data){
			if(data.code == 0){
				$("#successMsg").html("个人信息保存成功！3s后自动刷新页面更新数据！└(^o^)┘");
				$.colorbox({inline:true, href:$("#successTip"),title:"系统提示"});
				setTimeout(function(){  
						window.location.reload();//页面刷新
						},3000);
			}else{
				switch(data.code){
            				case -1000:
            					$('#error_username').css('display','block');
            					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
            					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
            					break;
            				case -1014:
            					$('#error_mobile').css('display','block');
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
//保存期望工作
function saveExpectWork()
{
	var city = $("#select_expectCity").val();
	var type = $("#work_type").val();
	var money = $("#select_expectSalary").val();
	var position = $("#expectPosition").val();
	if(city == "无要求")
	{
		city = "";
	}
	$.ajax({
		url:'/home/resume/save_expect_work',
		dataType:'json',
		type:'post',
		data:{city:city,type:type,money:money,position:position},
		success:function(data){
			if(data.code == 0){
				$("#successMsg").html("期望工作保存成功！3s后自动刷新页面更新数据！└(^o^)┘");
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

//保存工作经历
function saveWorkExperience()
{
	var name = $("#we_company_name").val();
	var position = $("#we_position_name").val();
	var startYear = $("#we_start_year").val();
	var startMonth = $("#we_start_month").val();
	var endYear = $("#we_end_year").val();
	var endMonth = $("#we_end_month").val();
	
	$('#error_company_name').css('display','none');
	$('#error_position_name').css('display','none');
	$('#error_startTime').css('display','none');
	$('#error_endTime').css('display','none');
	//进行统一表单非空验证
	if(!checkForm('workExperienceForm'))
	{
		return;
	}
	//开始时间非空判断
	if(startYear=="开始年份" || startMonth == "开始月份")
	{
		$('#error_startTime').css('display','block');
		$("#errorMsg").html("开始时间不能为空！(ㄒoㄒ)");
		$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
		return;
	}
	//结束时间非空判断
	if(endYear=="结束年份" || endMonth == "结束月份")
	{
		$('#error_endTime').css('display','block');
		$("#errorMsg").html("结束时间不能为空！(ㄒoㄒ)");
		$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
		return;
	}
	//时间不符合规范
	if(endYear < startYear || (endYear == startYear && startMonth > endMonth))
	{
		$("#errorMsg").html("开始时间不能大于结束时间！(ㄒoㄒ)");
		$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
		return;
	}
	
	$.ajax({
		url:'/home/resume/save_work_experience',
		dataType:'json',
		type:'post',
		data:{name:name,position:position,startYear:startYear,startMonth:startMonth,endYear:endYear,endMonth:endMonth},
		success:function(data){
			if(data.code == 0){
				$("#successMsg").html("工作经历保存成功！3s后自动刷新页面更新数据！└(^o^)┘");
				$.colorbox({inline:true, href:$("#successTip"),title:"系统提示"});
				setTimeout(function(){  
						window.location.reload();//页面刷新
						},3000);
			}else{
				switch(data.code){
            				case -4002:
            					$('#error_company_name').css('display','block');
            					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
            					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
            					break;
            				case -4003:
            					$('#error_position_name').css('display','block');
            					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
            					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
            					break;
        					case -4004:
            					$('#error_startTime').css('display','block');
            					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
            					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
            					break;
        					case -4005:
            					$('#error_endTime').css('display','block');
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
//保存项目经验
function saveProjectExperience()
{
	var project = $("#pw_project_name").val();
	var position = $("#pw_position_name").val();
	var startYear = $("#pw_start_year").val();
	var startMonth = $("#pw_start_month").val();
	var endYear = $("#pw_end_year").val();
	var endMonth = $("#pw_end_month").val();
	var content = $("#pw_project_description").val();
	
	$('#error_pw_project_name').css('display','none');
	$('#error_pw_position_name').css('display','none');
	$('#error_pw_startTime').css('display','none');
	$('#error_pw_endTime').css('display','none');
	
	//进行统一表单非空验证
	if(!checkForm('projectExperienceForm'))
	{
		return;
	}
	
	//开始时间非空判断
	if(startYear=="开始年份" || startMonth == "开始月份")
	{
		$('#error_pw_startTime').css('display','block');
		$("#errorMsg").html("开始时间不能为空！(ㄒoㄒ)");
		$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
		return;
	}
	//结束时间非空判断
	if(endYear=="结束年份" || endMonth == "结束月份")
	{
		$('#error_pw_endTime').css('display','block');
		$("#errorMsg").html("结束时间不能为空！(ㄒoㄒ)");
		$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
		return;
	}
	//时间不符合规范
	if(endYear < startYear || (endYear == startYear && startMonth > endMonth))
	{
		$("#errorMsg").html("开始时间不能大于结束时间！(ㄒoㄒ)");
		$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
		return;
	}
	$.ajax({
		url:'/home/resume/save_project_experience',
		dataType:'json',
		type:'post',
		data:{name:project,position:position,startYear:startYear,startMonth:startMonth,endYear:endYear,endMonth:endMonth,content:content},
		success:function(data){
			if(data.code == 0){
				$("#successMsg").html("项目经验保存成功！3s后自动刷新页面更新数据！└(^o^)┘");
				$.colorbox({inline:true, href:$("#successTip"),title:"系统提示"});
				setTimeout(function(){  
						window.location.reload();//页面刷新
						},3000);
			}else{
				switch(data.code){
            				case -4010:
            					$('#error_pw_project_name').css('display','block');
            					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
            					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
            					break;
            				case -4011:
            					$('#error_pw_position_name').css('display','block');
            					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
            					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
            					break;
        					case -4007:
            					$('#error_pw_startTime').css('display','block');
            					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
            					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
            					break;
        					case -4008:
            					$('#error_pw_endTime').css('display','block');
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

//保存教育背景
function saveEducationBackground()
{
	var school_name = $("#eb_school_name").val();
	var major = $("#eb_major").val();
	var studyRecord = $("#eb_degree").val();
	var startYear = $("#eb_start_year").val();
	var endYear = $("#eb_end_year").val();
	
	$('#error_eb_school_name').css('display','none');
	$('#error_eb_major').css('display','none');
	$('#error_eb_startTime').css('display','none');
	$('#error_eb_endTime').css('display','none');

	//进行统一表单非空验证
	if(!checkForm('educationBackgroundForm'))
	{
		return;
	}
	//开始年份非空判断
	if(startYear=="开始年份")
	{
		$('#error_eb_startTime').css('display','block');
		$("#errorMsg").html("开始年份不能为空！(ㄒoㄒ)");
		$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
		return;
	}
	//结束年份非空判断
	if(endYear=="结束年份")
	{
		$('#error_eb_endTime').css('display','block');
		$("#errorMsg").html("结束年份不能为空！(ㄒoㄒ)");
		$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
		return;
	}
	//时间不符合规范
	if(endYear < startYear)
	{
		$("#errorMsg").html("开始年份不能大于结束年份！(ㄒoㄒ)");
		$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
		return;
	}
	
	$.ajax({
		url:'/home/resume/save_education_background',
		dataType:'json',
		type:'post',
		data:{school_name:school_name,major:major,startYear:startYear,studyRecord:studyRecord,endYear:endYear},
		success:function(data){
			if(data.code == 0){
				$("#successMsg").html("教育背景保存成功！3s后自动刷新页面更新数据！└(^o^)┘");
				$.colorbox({inline:true, href:$("#successTip"),title:"系统提示"});
				setTimeout(function(){  
						window.location.reload();//页面刷新
						},3000);
			}else{
				switch(data.code){
            				case -4015:
            					$('#error_eb_school_name').css('display','block');
            					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
            					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
            					break;
            				case -4016:
            					$('#error_eb_major').css('display','block');
            					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
            					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
            					break;
        					case -4013:
            					$('#error_eb_startTime').css('display','block');
            					$("#errorMsg").html("保存失败，"+data.msg+"(ㄒoㄒ)");
            					$.colorbox({inline:true, href:$("#errorTip"),title:"系统提示"});
            					break;
        					case -4014:
            					$('#error_eb_endTime').css('display','block');
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
//保存自我描述
function saveSelfDescription()
{
	var content = $("#user_selfDescription").val();
	$.ajax({
		url:'/home/user/save_self_description',
		dataType:'json',
		type:'post',
		data:{content:content},
		success:function(data){
			if(data.code == 0){
				$("#successMsg").html("自我描述保存成功！3s后自动刷新页面更新数据！└(^o^)┘");
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


//保存作品展示
function saveWorkShow()
{
	var url = $("#ws_href").val();
	var content = $("#ws_description").val();
	$.ajax({
		url:'/home/resume/save_work_show',
		dataType:'json',
		type:'post',
		data:{content:content,url:url},
		success:function(data){
			if(data.code == 0){
				$("#successMsg").html("作品展示保存成功！3s后自动刷新页面更新数据！└(^o^)┘");
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


</script>

<div id="cboxOverlay" style="display: none;"></div><div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;"><div id="cboxWrapper"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left;"></div><div id="cboxContent" style="float: left;"><div id="cboxTitle" style="float: left;"></div><div id="cboxCurrent" style="float: left;"></div><button type="button" id="cboxPrevious"></button><button type="button" id="cboxNext"></button><button id="cboxSlideshow"></button><div id="cboxLoadingOverlay" style="float: left;"></div><div id="cboxLoadingGraphic" style="float: left;"></div></div><div id="cboxMiddleRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div></div></body></html>