package com.yjq.lagou.interceptor.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.alibaba.fastjson.JSON;
import com.yjq.lagou.bean.CodeMsg;
import com.yjq.lagou.constant.SessionConstant;
import com.yjq.lagou.util.StringUtil;

/**
 * 后台管理员登录拦截器
 * @author Administrator
 *
 */
@Component
public class AdminLoginInterceptor implements HandlerInterceptor{

	private Logger log = LoggerFactory.getLogger(AdminLoginInterceptor.class);
	
	@Override
	public boolean  preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
		String requestURI = request.getRequestURI();  //取得被拦截的链接，比如：requestURI=/admin/system/index
		HttpSession session = request.getSession();
		Object attribute = session.getAttribute(SessionConstant.SESSION_ADMIN_LOGIN_KEY);
		if(attribute == null && requestURI.contains("/admin/")){
			log.info("用户还未登录或者session失效,重定向到登录页面,当前URL=" + requestURI);
			//首先判断是否是ajax请求
			if(StringUtil.isAjax(request)){
				//表示是ajax请求
				try {
					response.setCharacterEncoding("UTF-8");
					//JSON.parseObject，是将Json字符串转化为相应的对象；JSON.toJSONString则是将对象转化为Json字符串。
					response.getWriter().write(JSON.toJSONString(CodeMsg.SESSION_EXPIRED));
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return false;
			}
			//说明是普通的请求，可直接重定向到登录页面
			//用户还未登录或者session失效,重定向到登录页面
			try {
				response.sendRedirect("/admin/system/login");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
		log.info("该请求符合登录要求，放行" + requestURI);
		return true;
	}
}
