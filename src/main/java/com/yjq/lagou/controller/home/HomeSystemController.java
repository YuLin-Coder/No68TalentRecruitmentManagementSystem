package com.yjq.lagou.controller.home;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/**
 * 页面系统类控制器
 *
 *
 */
import org.springframework.web.bind.annotation.ResponseBody;

import com.yjq.lagou.bean.CodeMsg;
import com.yjq.lagou.bean.Result;
import com.yjq.lagou.constant.SessionConstant;
import com.yjq.lagou.entity.common.User;
import com.yjq.lagou.service.common.UserService;
import com.yjq.lagou.util.StringUtil;
import com.yjq.lagou.util.ValidateEntityUtil;
@RequestMapping("/home/system")
@Controller
public class HomeSystemController {

	@Autowired
	private UserService userService;
	
	
	
	/**
	 * 前端注册页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String register(Model model){
		return "home/system/register";
	}
	
	/**
	 * 更改密码页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/update_password",method=RequestMethod.GET)
	public String updatePwd(Model model){
		return "home/system/update_password";
	}
	
	

	/**
	 * 前端用户退出登录
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/logout")
	public String loginout(HttpServletRequest request){
		request.getSession().setAttribute(SessionConstant.SESSION_USER_LOGIN_KEY , null);
		return "redirect:/home/index/index";
	}

	/**
	 * 前端登录页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(Model model){
		return "home/system/login";
	}
	
	/**
	 * 前端修改密码数据处理
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/update_password",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> updatePwd(String oldPwd,String newPwd,String confirmPwd,HttpServletRequest request)
	{
		User user = (User) request.getSession().getAttribute(SessionConstant.SESSION_USER_LOGIN_KEY);
		if(!user.getPassword().equals(oldPwd)) {
			return Result.error(CodeMsg.USER_OLD_PASSWORD_NOT_CORRECT);
		}
		if(newPwd.length() <6 || newPwd.length() > 16) {
			return Result.error(CodeMsg.USER_NEW_PASSWORD_NOT_CORRECT);
		}
		if(!newPwd.equals(confirmPwd)) {
			return Result.error(CodeMsg.USER_CONFIRM_PASSWORD_NOT_CORRECT);
		}
		user.setPassword(newPwd);
		if(userService.save(user) == null) {
			return Result.error(CodeMsg.USER_NEW_PASSWORD_SAVE_ERROR);
		}
		User findUser = userService.find(user.getId());
		request.getSession().setAttribute(SessionConstant.SESSION_USER_LOGIN_KEY, findUser);
		return Result.success(true);
	}
	
	
	
	
	
	/**
	 * 前端登录表单处理
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> loginForm(String email,String password,String cpacha,HttpServletRequest request)
	{
		if(StringUtil.isEmpty(email)){
			return Result.error(CodeMsg.USER_EMAIL_EMPTY);
		}
		if(StringUtil.isEmpty(password)){
			return Result.error(CodeMsg.USER_PASSWORD_EMPTY);
		}
		if(StringUtil.isEmpty(cpacha)){
			return Result.error(CodeMsg.CPACHA_EMPTY);
		}
		//获取系统生成的验证码
		String correct_cpacha = (String) request.getSession().getAttribute("user_login");
		//验证验证码是否正确
		if(!cpacha.toUpperCase().equals(correct_cpacha.toUpperCase())) {
			return Result.error(CodeMsg.CPACHA_ERROR);
		}
		User user = userService.findByEmail(email);
		//判断该邮箱地址是否存在
		if(user == null){
			return Result.error(CodeMsg.USER_EMAIL_NOT_EXIST);
		}
		//判断用户输入密码是否正确
		if(!password.equals(user.getPassword())){
			return Result.error(CodeMsg.USER_PASSWORD_ERROR);
		}
		request.getSession().setAttribute(SessionConstant.SESSION_USER_LOGIN_KEY, user);
	
		return Result.success(true);
	}
	
	/**
	 * 注册表单处理
	 * @param type
	 * @param Email
	 * @param Password
	 * @param username
	 * @param cpacha
	 * @return
	 */
	@RequestMapping(value="/register",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> registerForm(HttpServletRequest request,User user,String cpacha){
		//如果勾选目的为空
		if(user.getType() == null || user.getType() < 0){
			return Result.error(CodeMsg.USER_REGISTER_TYPE_EMPTY);
		}
		//如果邮箱地址为空
		if(StringUtil.isEmpty(user.getEmail())){
			return Result.error(CodeMsg.USER_EMAIL_EMPTY);
		}
		//如果用户密码为空
		if(StringUtil.isEmpty(user.getPassword())) {
			return Result.error(CodeMsg.USER_PASSWORD_EMPTY);
		}
		//如果用户昵称为空
		if(StringUtil.isEmpty(user.getUsername())) {
			return Result.error(CodeMsg.USER_NAME_EMPTY);
		}
		//如果验证码为空
		if(StringUtil.isEmpty(cpacha)){
			return Result.error(CodeMsg.CPACHA_EMPTY);
		}
		//用统一验证实体方法验证是否合法
		user.setMobile("13774559485"); //先随便设置一个，后面恢复
		CodeMsg validate = ValidateEntityUtil.validate(user);
		if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
			return Result.error(validate);
		}
		user.setMobile(null);//恢复
		//如果用户没点发送邮件
		if(request.getSession().getAttribute("user_register") == null)
		{
			return Result.error(CodeMsg.SYSTEM_CPACHA_EMPTY);
		}
		String correct_cpacha = (String) request.getSession().getAttribute("user_register");
		//如果验证码不正确
		if(!correct_cpacha.toUpperCase().equals(cpacha.toUpperCase())){
			return Result.error(CodeMsg.CPACHA_ERROR);
		}
		//检查邮箱和用户昵称是否有重复
		if(checkEmail(user,0l)){
			request.getSession().setAttribute("user_register", null); //邮箱输入新的一个，需要重新发验证码确定
			return Result.error(CodeMsg.USER_EMAIL_ALREADY_EXIST);
		}
		if(checkUsername(user,0l)){
			return Result.error(CodeMsg.USER_NAME_ALREADY_EXIST);
		}
		//上面审核都通过后，准备添加数据库
		if(userService.save(user) == null)
		{
			return Result.error(CodeMsg.USER_REGISTER_ERROR);
		}
		//把验证码权限销毁
		request.getSession().setAttribute("user_register", null);
		return Result.success(true);
	}
	
	
	
	
	
	//检查有没有重复的email
	public boolean checkEmail(User user,Long id)
	{
		User findByEmail = userService.findByEmail(user.getEmail());
		if(findByEmail == null)
			return false;  //没有重复
		if(findByEmail.getId().longValue() == id.longValue())
			return false;  //没有重复
		return true;  //有重复
	}
	//检查有没有重复的username
	public boolean checkUsername(User user,Long id)
	{
		User findByUsername = userService.findByUsername(user.getUsername());
		if(findByUsername == null)
			return false;  //没有重复
		if(findByUsername.getId().longValue() == id.longValue())
			return false;  //没有重复
		return true;  //有重复
	}
}
