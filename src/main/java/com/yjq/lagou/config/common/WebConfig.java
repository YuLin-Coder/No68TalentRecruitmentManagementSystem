package com.yjq.lagou.config.common;
/**
 * 用来配置拦截器的配置类
 */
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.yjq.lagou.constant.RuntimeConstant;
import com.yjq.lagou.interceptor.admin.AdminLoginInterceptor;
import com.yjq.lagou.interceptor.home.UserLoginInterceptor;


@Configuration
public class WebConfig implements WebMvcConfigurer {
	
	@Autowired
	private UserLoginInterceptor userLoginInterceptor;
	
	@Autowired
	private AdminLoginInterceptor adminLoginInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//搜寻/**所有链接除了RuntimeConstant.loginExcludePathPatterns中的链接
	    registry.addInterceptor(userLoginInterceptor).addPathPatterns("/**").excludePathPatterns(RuntimeConstant.userLoginExcludePathPatterns);
	    registry.addInterceptor(adminLoginInterceptor).addPathPatterns("/**").excludePathPatterns(RuntimeConstant.adminLoginExcludePathPatterns);
	}

}
