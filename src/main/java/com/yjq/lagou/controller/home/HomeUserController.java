package com.yjq.lagou.controller.home;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yjq.lagou.bean.CodeMsg;
import com.yjq.lagou.bean.Result;
import com.yjq.lagou.constant.SessionConstant;
import com.yjq.lagou.entity.common.User;
import com.yjq.lagou.service.common.UserService;
import com.yjq.lagou.util.StringUtil;
/**
 * 前端用户控制器
 *
 *
 */
@RequestMapping("/home/user")
@Controller
public class HomeUserController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * 保存用户信息
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> saveUserForm(User user,HttpServletRequest request)
	{
		if(user == null){
			return Result.error(CodeMsg.DATA_ERROR);
		}
		if(StringUtil.isEmpty(user.getUsername())) {
			return Result.error(CodeMsg.USER_NAME_EMPTY);
		}
		if(StringUtil.isEmpty(user.getMobile())) {
			return Result.error(CodeMsg.USER_MOBILE_EMPTY);
		}
		if(user.getMobile().length() != 11) {
			return Result.error(CodeMsg.USER_MOBILE_NOT_CORRECT);
		}
		User session_user = (User) request.getSession().getAttribute("user");
		User findById = userService.find(session_user.getId());
		if(checkUsername(user,findById.getId())){
			return Result.error(CodeMsg.USER_NAME_ALREADY_EXIST);
		}
		BeanUtils.copyProperties(user, findById, "id","createTime","updateTime","content","type","email","password");
		findById.setUpdateTime(new Date());
		if(userService.save(findById) == null){
			return Result.error(CodeMsg.USER_SAVE_ERROR);
		}
		//更新权限
		request.getSession().setAttribute(SessionConstant.SESSION_USER_LOGIN_KEY, userService.find(session_user.getId()));
		return Result.success(true);
	}
	
	/**
	 * 保存自我描述信息
	 * @param content
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/save_self_description",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> saveSelfDescription(String content,HttpServletRequest request)
	{
		User session_user = (User) request.getSession().getAttribute("user");
		session_user.setContent(content);
		session_user.setUpdateTime(new Date());
		if(userService.save(session_user) == null){
			return Result.error(CodeMsg.USER_SAVE_SELF_DESCRIPTION_ERROR);
		}
		//更新权限
		request.getSession().setAttribute(SessionConstant.SESSION_USER_LOGIN_KEY, userService.find(session_user.getId()));
		return Result.success(true);
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
