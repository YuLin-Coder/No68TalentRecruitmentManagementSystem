package com.yjq.lagou.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yjq.lagou.bean.CodeMsg;
import com.yjq.lagou.bean.Page;
import com.yjq.lagou.bean.Result;
import com.yjq.lagou.entity.common.Company;
import com.yjq.lagou.entity.common.Position;
import com.yjq.lagou.entity.common.User;
import com.yjq.lagou.entity.home.EducationBackground;
import com.yjq.lagou.entity.home.ExpectWork;
import com.yjq.lagou.entity.home.ProjectExperience;
import com.yjq.lagou.entity.home.Resume;
import com.yjq.lagou.entity.home.WorkExperience;
import com.yjq.lagou.entity.home.WorkShow;
import com.yjq.lagou.service.common.CompanyService;
import com.yjq.lagou.service.common.PositionService;
import com.yjq.lagou.service.common.UserService;
import com.yjq.lagou.service.home.EducationBackgroundService;
import com.yjq.lagou.service.home.ExpectWorkService;
import com.yjq.lagou.service.home.ProjectExperienceService;
import com.yjq.lagou.service.home.ResumeService;
import com.yjq.lagou.service.home.WorkExperienceService;
import com.yjq.lagou.service.home.WorkShowService;
/**
 * 后端用户管理控制器
 *
 *
 */
@RequestMapping("/admin/user")
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ResumeService resumeService;
	
	@Autowired
	private WorkExperienceService workExperienceService;
	
	@Autowired
	private WorkShowService workShowService;
	
	@Autowired 
	private ProjectExperienceService projectExperienceService;
	
	@Autowired
	private ExpectWorkService expectWorkService;
	
	@Autowired
	private EducationBackgroundService educationBackgroundService;
	
	@Autowired 
	private CompanyService companyService;
	
	@Autowired
	private PositionService PositionService;
	
	/**
	 * 后台用户管理信息页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/user_info",method=RequestMethod.GET)
	public String myInfo(Model model){
		return "admin/admin/user_info";
	}
	

	/**
	 * 后台用户信息列表
	 * @param request
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/user_info_list",method=RequestMethod.POST)
	@ResponseBody
	public  Map<String, Object>  userInfoList(HttpServletRequest request,Page page){
		Map<String, Object> ret = new HashMap<String, Object>();
		List<User> findAllUserList = userService.findAllUserList(page.getOffset(), page.getRows());
		ret.put("rows", findAllUserList);
		ret.put("total", userService.total());
		return ret; 
	}
	
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> delete(@RequestParam(name="id",required=true)Long id){
		User user = userService.find(id);
		try {
			if(user.getType() == 1) {
				//如果用户身份是招聘者
				Company findCompany = companyService.findByUserId(id);
				if(findCompany != null) {
					//删除该用户认证的公司下所有简历
					List<Resume> findResumeList = resumeService.findByCompanyId(findCompany.getId());
					for(Resume resume : findResumeList) {
						resumeService.delete(resume.getId());
					}
					//删除该用户认证的公司下所有职位
					List<Position> findPositionList = PositionService.findPositionByCompanyId(findCompany.getId());
					for(Position position : findPositionList) {
						PositionService.delete(position.getId());
					}
					//删除该用户所属公司
					companyService.delete(findCompany.getId());
				}
			}
			if(user.getType() == 0) {
				//如果用户身份是应聘者
				//删除该用户的所有简历
				List<Resume> findResume = resumeService.findByUserId(id);
				for(Resume resume : findResume) {
					resumeService.delete(resume.getId());
				}
				//删除该用户的工作经验
				WorkExperience findWorkExperience = workExperienceService.findWorkExperienceByUserId(id);
				if(findWorkExperience != null) {
					workExperienceService.delete(findWorkExperience.getId());
				}
				//删除该用户的作品展示
				WorkShow findWorkShow = workShowService.findWorkShowByUserId(id);
				if(findWorkShow != null) {
					workShowService.delete(findWorkShow.getId());
				}
				//删除该用户的项目经验
				ProjectExperience findProjectExperience = projectExperienceService.findProjectExperienceByUserId(id);
				if(findProjectExperience != null) {
					projectExperienceService.delete(findProjectExperience.getId());
				}
				//删除该用户的期望工作
				ExpectWork findExpectWork = expectWorkService.findExpectWorkByUserId(id);
				if(findExpectWork != null) {
					expectWorkService.delete(findExpectWork.getId());
				}
				//删除该用户的教育背景
				EducationBackground findEducationBackground = educationBackgroundService.findEducationBackgroundByUserId(id);
				if(findEducationBackground != null) {
					educationBackgroundService.delete(findEducationBackground.getId());
				}
			}
			//最后删除该用户
			userService.delete(id);
		}catch(Exception e){
			e.printStackTrace();
			return Result.error(CodeMsg.FOREIGN_KEY_RESTRAIN);
		}
		
		return Result.success(true);
	}
}
