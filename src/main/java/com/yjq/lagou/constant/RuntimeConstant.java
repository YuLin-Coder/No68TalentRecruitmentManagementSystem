package com.yjq.lagou.constant;

import java.util.Arrays;
import java.util.List;

/**
 * 系统运行时的常量
 * @author Administrator
 *
 */
public class RuntimeConstant {

	//后端登录拦截器无需拦截的url      Arrays.asList：字符串数组转化为List
	public static List<String> adminLoginExcludePathPatterns = Arrays.asList(
			"/admin/common/**",
			"/admin/easyui/**",
			"/admin/h-ui/**",
			"/admin/login/**",
			"/admin/system/login",
			"/common/cpacha/generate_cpacha",
			"/common/cpacha/generate_emailCpacha",
			"/photo/view",
			"/upload/upload_photo"
		);
	
	//前端登录拦截器无需拦截的url      Arrays.asList：字符串数组转化为List
	public static List<String> userLoginExcludePathPatterns = Arrays.asList(
			"/common/cpacha/generate_cpacha",
			"/common/cpacha/generate_emailCpacha",
			"/photo/view",
			"/upload/upload_photo",
			"/home/index/index",
			"/home/style/**",
			"/home/system/login",
			"/home/system/register",
			"/home/common/**",
			"/home/index/company_list",
			"/home/company/detail",
			"/home/position/detail",
			"/home/position/list"
		);
}
