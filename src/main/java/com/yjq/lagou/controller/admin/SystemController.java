package com.yjq.lagou.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yjq.lagou.bean.CodeMsg;
import com.yjq.lagou.bean.Result;
import com.yjq.lagou.constant.SessionConstant;
import com.yjq.lagou.entity.admin.Admin;
import com.yjq.lagou.entity.admin.OperaterLog;
import com.yjq.lagou.service.admin.AdminService;
import com.yjq.lagou.service.admin.OperaterLogService;
import com.yjq.lagou.util.ValidateEntityUtil;
/**
 * 后台管理控制类
 *
 *
 */
@RequestMapping("/admin/system")
@Controller
public class SystemController {

	@Autowired 
	private AdminService adminService ;
	
	@Autowired
	private OperaterLogService  operaterLogService; 
	
	
	/**
	 * 后台管理首页
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String list(Model model){
		return "admin/system/index";
	}
	
	/**
	 * 后台管理登录页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(Model model){
		return "admin/system/login";
	}
	
	/**
	 * 管理员退出登录
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/logout")
	public String loginout(HttpServletRequest request){
		request.getSession().setAttribute(SessionConstant.SESSION_ADMIN_LOGIN_KEY , null);
		return "redirect:/admin/systen/login";
	}
	
	
	/**
	 * 登录表单处理
	 * @param admin
	 * @param cpacha
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> login(Admin admin,String cpacha,HttpServletRequest request)
	{
		if(admin == null)
		{
			return Result.error(CodeMsg.DATA_ERROR);
		}
		//判断用户输入验证码是否为空
		if(cpacha == null)
		{
			return Result.error(CodeMsg.CPACHA_EMPTY);
		}

		//判断用户输入的验证码是否正确
		String systemCpacha = (String) request.getSession().getAttribute("admin_login");
		if(!systemCpacha.toUpperCase().equals(cpacha.toUpperCase()))
		{
			return Result.error(CodeMsg.CPACHA_ERROR);
		}
		
		//判断用户是否存在
		Admin findByAdminName = adminService.findByAdminName(admin.getAdminName());
		if(findByAdminName == null)
		{
			return Result.error(CodeMsg.USER_NO_EXIST);
		}
		//如果存在，判断字段是否符合要求， 用统一验证实体方法验证是否合法
		findByAdminName.setPassword(admin.getPassword());
		CodeMsg validate = ValidateEntityUtil.validate(findByAdminName);
		if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
			return Result.error(validate);
		}
		
		//以上判断都通过后，进行判断密码是否正确
		if(!findByAdminName.getPassword().equals(admin.getPassword()))
		{
			return Result.error(CodeMsg.USER_PASSWORD_ERROR);
		}
		//创建权限
		request.getSession().setAttribute(SessionConstant.SESSION_ADMIN_LOGIN_KEY, findByAdminName);
		//添加操作日志
		OperaterLog operaterLog  = new OperaterLog();
		operaterLog.setOperator("【"+findByAdminName.getAdminName()+"】：");
		operaterLog.setContent("登录了后台管理系统。");
		operaterLogService.save(operaterLog);
		
		return Result.success(true);
	}
	
	
}
