package com.yjq.lagou.controller.home;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yjq.lagou.bean.CodeMsg;
import com.yjq.lagou.bean.Result;
import com.yjq.lagou.constant.SessionConstant;
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
import com.yjq.lagou.util.StringUtil;
/**
 * 前端简历管理控制器
 *
 *
 */
@RequestMapping("/home/resume")
@Controller
public class HomeResumeController {

	@Autowired
	private ExpectWorkService expectWorkService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private WorkExperienceService  workExperienceService;
	
	@Autowired
	private ProjectExperienceService projectExperienceService; 
	
	@Autowired
	private EducationBackgroundService educationBackgroundService;
	
	@Autowired
	private WorkShowService workShowService;
	
	@Autowired
	private PositionService positionService;
	
	@Autowired
	private ResumeService  resumeService;
	
	@Autowired
	private CompanyService companyService;
	
	/**
	 * 简历预览页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/preview",method=RequestMethod.GET)
	public String preview(Model model,HttpServletRequest request,Long user_id){
		if(user_id != null) {
			model.addAttribute("currentUser", userService.find(user_id));
			model.addAttribute("ExpectWork", expectWorkService.findExpectWorkByUserId(user_id));
			model.addAttribute("WorkExperience", workExperienceService.findWorkExperienceByUserId(user_id));
			model.addAttribute("ProjectExperience", projectExperienceService.findProjectExperienceByUserId(user_id));
			model.addAttribute("EducationBackground", educationBackgroundService.findEducationBackgroundByUserId(user_id));
			model.addAttribute("WorkShow", workShowService.findWorkShowByUserId(user_id));
		}else {
			User user = (User) request.getSession().getAttribute(SessionConstant.SESSION_USER_LOGIN_KEY);
			model.addAttribute("currentUser", userService.find(user.getId()));
			model.addAttribute("ExpectWork", expectWorkService.findExpectWorkByUserId(user.getId()));
			model.addAttribute("WorkExperience", workExperienceService.findWorkExperienceByUserId(user.getId()));
			model.addAttribute("ProjectExperience", projectExperienceService.findProjectExperienceByUserId(user.getId()));
			model.addAttribute("EducationBackground", educationBackgroundService.findEducationBackgroundByUserId(user.getId()));
			model.addAttribute("WorkShow", workShowService.findWorkShowByUserId(user.getId()));
		}
		return "home/resume/preview";
	}
	
	/**
	 * 我投递的简历页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/my_delivery_resume",method=RequestMethod.GET)
	public String my_delivery_resume(Model model,String resumeState,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute(SessionConstant.SESSION_USER_LOGIN_KEY);
		if(!StringUtil.isEmpty(resumeState)) {
			//如果resumeState不为空
			model.addAttribute("ResumeList", resumeService.findByUserIdAndState(user.getId(), resumeState));
			model.addAttribute("resumeState", resumeState);
		}else {
			//如果resumeState为空
			model.addAttribute("ResumeList", resumeService.findByUserId(user.getId()));
		}
		
		return "home/resume/my_delivery_resume";
	}
	
	
	/**
	 * 招聘者收到简历页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/my_receive_resume",method=RequestMethod.GET)
	public String my_receive_resume(Model model,String resumeState,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute(SessionConstant.SESSION_USER_LOGIN_KEY);
		if(!StringUtil.isEmpty(resumeState)) {
			//如果resumeState不为空
			Company findCompanyByUserId = companyService.findByUserId(user.getId());
			List<Resume> findByCompanyIdAndState = resumeService.findByCompanyIdAndState(findCompanyByUserId.getId(), resumeState);
			model.addAttribute("ResumeList", findByCompanyIdAndState);
			model.addAttribute("EducationBackgroundList", educationBackgroundService.findAllEducationBackground());
			model.addAttribute("WorkExperienceList", workExperienceService.findAllWorkExperience());
			model.addAttribute("resumeTotal", resumeService.getPositionTotalByStateAndCompanyId(findCompanyByUserId.getId(), resumeState));
			model.addAttribute("resumeState", resumeState);
		}else {
			Company findCompanyByUserId = companyService.findByUserId(user.getId());
			List<Resume> findByCompanyIdAndState = resumeService.findByCompanyIdAndState(findCompanyByUserId.getId(), "wait");
			model.addAttribute("ResumeList", findByCompanyIdAndState);
			model.addAttribute("EducationBackgroundList", educationBackgroundService.findAllEducationBackground());
			model.addAttribute("WorkExperienceList", workExperienceService.findAllWorkExperience());
			model.addAttribute("resumeTotal", resumeService.getPositionTotalByStateAndCompanyId(findCompanyByUserId.getId(), "wait"));
		}
		return "home/resume/my_receive_resume";
	}
	
	
	/**
	 * 简历通知面试
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/interview",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> interview(HttpServletRequest request,@RequestParam(name="id",required=true)Long id)
	{
		Resume findByResumeId = resumeService.findByResumeId(id);
		findByResumeId.setState("effective");
		if(resumeService.save(findByResumeId) == null) {
			return Result.error(CodeMsg.RESUME_STATE_SAVE_ERROR);
		}
		return Result.success(true);
	}
	
	/**
	 * 简历设置为不合适
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/unsuitable",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> unsuitable(HttpServletRequest request,@RequestParam(name="id",required=true)Long id)
	{
		Resume findByResumeId = resumeService.findByResumeId(id);
		findByResumeId.setState("out");
		if(resumeService.save(findByResumeId) == null) {
			return Result.error(CodeMsg.RESUME_STATE_SAVE_ERROR);
		}
		return Result.success(true);
	}
	
	/**
	 * 删除简历
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> delete(HttpServletRequest request,@RequestParam(name="id",required=true)Long id)
	{
		try {
			resumeService.delete(id);
		}catch(Exception e) {
			return Result.error(CodeMsg.RESUME_DELETE_ERROR);
		}
		return Result.success(true);
	}
	
	
	/**
	 * 投递简历
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/submit_resume",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> submitResume(HttpServletRequest request,@RequestParam(name="id",required=true)Long id)
	{
		User user = (User) request.getSession().getAttribute(SessionConstant.SESSION_USER_LOGIN_KEY);
		WorkExperience workExperience = workExperienceService.findWorkExperienceByUserId(user.getId());
		ProjectExperience projectExperience = projectExperienceService.findProjectExperienceByUserId(user.getId());
		EducationBackground educationBackground = educationBackgroundService.findEducationBackgroundByUserId(user.getId());
		//判断简历必填部分是否填写了
		if(workExperience != null && projectExperience != null && educationBackground != null) {
			Position findById = positionService.findById(id);
			Resume resume = new Resume();
			resume.setPosition(findById);
			Resume findByPositionIdAndUserId = resumeService.findByPositionIdAndUserId(user.getId(), findById.getId());
			if(findByPositionIdAndUserId != null) {
				return Result.error(CodeMsg.RESUME_ALREADY_SUBMIT);
			}else {
				resume.setUser(user);
				resume.setCompany(findById.getCompany());
				resume.setState("wait");
				resumeService.save(resume);
				findById.setNumber(findById.getNumber()+1);
				positionService.save(findById);
			}
		}else {
			return Result.error(CodeMsg.RESUME_WRITE_NOT_COMPLETE);
		}
		return Result.success(true);
	}
	
	/**
	 * 保存期望工作信息
	 * @param expectWork
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/save_expect_work",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> saveExpectWorkForm(ExpectWork expectWork,HttpServletRequest request)
	{
		if(expectWork == null){
			return Result.error(CodeMsg.DATA_ERROR);
		}
		User session_user = (User) request.getSession().getAttribute("user");
		expectWork.setUser(session_user);
		//检查有没有添加过期望工作
		ExpectWork findExpectWork = expectWorkService.findExpectWorkByUserId(session_user.getId());
		if(findExpectWork != null){
			//进行修改操作
			BeanUtils.copyProperties(expectWork, findExpectWork, "id","createTime","updateTime");
			if(expectWorkService.save(findExpectWork) == null){
				return Result.error(CodeMsg.RESUME_EXPECT_WORK_ERROR);
			}
		}else {
			//进行添加操作
			if(expectWorkService.save(expectWork) == null){
				return Result.error(CodeMsg.RESUME_EXPECT_WORK_ERROR);
			}
		}
		//更新最后一次修改时间
		session_user.setUpdateTime(new Date());
		if(userService.save(session_user) == null){
			return Result.error(CodeMsg.USER_UPDATE_TIME_ERROR);
		}
		//把用户权限更新
		User new_session_user = userService.find(session_user.getId());
		request.getSession().setAttribute(SessionConstant.SESSION_USER_LOGIN_KEY, new_session_user);
		return Result.success(true);
	}
	
	/**
	 * 保存工作经历信息
	 * @param workExperience
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/save_work_experience",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> saveWorkExperienceForm(WorkExperience workExperience,HttpServletRequest request)
	{
		if(workExperience == null){
			return Result.error(CodeMsg.DATA_ERROR);
		}
		//检查公司名称是否为空
		if(StringUtil.isEmpty(workExperience.getName())){
			return Result.error(CodeMsg.RESUME_WORK_EXPERIENCE_COMPANY_NAME_EMPTY);
		}
		//检查职位名称是否为空
		if(StringUtil.isEmpty(workExperience.getPosition())) {
			return Result.error(CodeMsg.RESUME_WORK_EXPERIENCE_POSITION_NAME_EMPTY);
		}
		//检查开始时间是否为空
		if(workExperience.getStartYear() == null || workExperience.getStartMonth() == null || "开始年份".equals(workExperience.getStartYear()) || "开始月份".equals(workExperience.getStartMonth())) {
			return Result.error(CodeMsg.RESUME_WORK_EXPERIENCE_START_TIME_EMPTY);
		}
		//检查结束时间是否为空
		if(workExperience.getEndYear() == null || workExperience.getEndMonth() == null || "结束年份".equals(workExperience.getEndYear()) || "结束月份".equals(workExperience.getEndMonth())) {
			return Result.error(CodeMsg.RESUME_WORK_EXPERIENCE_END_TIME_EMPTY);
		}
		//检查结束时间是否大于开始时间
		if(Integer.valueOf(workExperience.getStartYear()) > Integer.valueOf(workExperience.getEndYear()) || (workExperience.getStartYear().equals(workExperience.getEndYear()) && Integer.valueOf(workExperience.getStartMonth()) > Integer.valueOf(workExperience.getEndMonth()))) {
			return Result.error(CodeMsg.RESUME_WORK_EXPERIENCE_TIME_NOT_CORRECT);
		}
		User session_user = (User) request.getSession().getAttribute("user");
		workExperience.setUser(session_user);
		//检查有没有添加过工作经历
		WorkExperience findWorkExperience = workExperienceService.findWorkExperienceByUserId(session_user.getId());
		if(findWorkExperience != null){
			//进行修改操作
			BeanUtils.copyProperties(workExperience, findWorkExperience, "id","createTime","updateTime");
			if(workExperienceService.save(findWorkExperience) == null){
				return Result.error(CodeMsg.RESUME_WORK_EXPERIENCE_ERROR);
			}
		}else {
			//进行添加操作
			if(workExperienceService.save(workExperience) == null){
				return Result.error(CodeMsg.RESUME_WORK_EXPERIENCE_ERROR);
			}
		}
		//更新最后一次修改时间
		session_user.setUpdateTime(new Date());
		if(userService.save(session_user) == null){
			return Result.error(CodeMsg.USER_UPDATE_TIME_ERROR);
		}
		//把用户权限更新
		User new_session_user = userService.find(session_user.getId());
		request.getSession().setAttribute(SessionConstant.SESSION_USER_LOGIN_KEY, new_session_user);
		
		return Result.success(true);
	}
	
	/**
	 * 保存项目经验
	 * @param projectExperience
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/save_project_experience",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> saveProjectExperienceForm(ProjectExperience projectExperience,HttpServletRequest request)
	{
		if(projectExperience == null){
			return Result.error(CodeMsg.DATA_ERROR);
		}
		//检查项目名称是否为空
		if(StringUtil.isEmpty(projectExperience.getName())){
			return Result.error(CodeMsg.RESUME_PROJECT_EXPERIENCE_PROJECT_NAME_EMPTY);
		}
		//检查职位名称是否为空
		if(StringUtil.isEmpty(projectExperience.getPosition())) {
			return Result.error(CodeMsg.RESUME_PROJECT_EXPERIENCE_POSITION_NAME_EMPTY);
		}
		//检查开始时间是否为空
		if(projectExperience.getStartYear() == null || projectExperience.getStartMonth() == null || "开始年份".equals(projectExperience.getStartYear()) || "开始月份".equals(projectExperience.getStartMonth())) {
			return Result.error(CodeMsg.RESUME_PROJECT_EXPERIENCE_START_TIME_EMPTY);
		}
		//检查结束时间是否为空
		if(projectExperience.getEndYear() == null || projectExperience.getEndMonth() == null || "结束年份".equals(projectExperience.getEndYear()) || "结束月份".equals(projectExperience.getEndMonth())) {
			return Result.error(CodeMsg.RESUME_PROJECT_EXPERIENCE_END_TIME_EMPTY);
		}
		//检查结束时间是否大于开始时间
		if(Integer.valueOf(projectExperience.getStartYear()) > Integer.valueOf(projectExperience.getEndYear()) || (projectExperience.getStartYear().equals(projectExperience.getEndYear()) && Integer.valueOf(projectExperience.getStartMonth()) > Integer.valueOf(projectExperience.getEndMonth()))) {
			return Result.error(CodeMsg.RESUME_PROJECT_EXPERIENCE_TIME_NOT_CORRECT);
		}
		User session_user = (User) request.getSession().getAttribute("user");
		projectExperience.setUser(session_user);
		//检查有没有添加过项目经验
		ProjectExperience findProjectExperience = projectExperienceService.findProjectExperienceByUserId(session_user.getId());
		if(findProjectExperience != null){
			//进行修改操作
			BeanUtils.copyProperties(projectExperience, findProjectExperience, "id","createTime","updateTime");
			if(projectExperienceService.save(findProjectExperience) == null){
				return Result.error(CodeMsg.RESUME_PROJECT_EXPERIENCE_ERROR);
			}
		}else {
			//进行添加操作
			if(projectExperienceService.save(projectExperience) == null){
				return Result.error(CodeMsg.RESUME_PROJECT_EXPERIENCE_ERROR);
			}
		}
		//更新最后一次修改时间
		session_user.setUpdateTime(new Date());
		if(userService.save(session_user) == null){
			return Result.error(CodeMsg.USER_UPDATE_TIME_ERROR);
		}
		//把用户权限更新
		User new_session_user = userService.find(session_user.getId());
		request.getSession().setAttribute(SessionConstant.SESSION_USER_LOGIN_KEY, new_session_user);
		
		return Result.success(true);
	}
	
	/**
	 * 保存教育背景
	 * @param educationBackground
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/save_education_background",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> saveEducationBackgroundForm(EducationBackground educationBackground,HttpServletRequest request)
	{
		if(educationBackground == null){
			return Result.error(CodeMsg.DATA_ERROR);
		}
		//检查学校名称是否为空
		if(StringUtil.isEmpty(educationBackground.getSchool_name())){
			return Result.error(CodeMsg.RESUME_EDUCATION_BACKGROUND_SCHOOL_NAME_EMPTY);
		}
		//检查专业名称是否为空
		if(StringUtil.isEmpty(educationBackground.getMajor())) {
			return Result.error(CodeMsg.RESUME_EDUCATION_BACKGROUND_MAJOR_EMPTY);
		}
		//检查开始年份是否为空
		if(educationBackground.getStartYear() == null || "开始年份".equals(educationBackground.getStartYear())) {
			return Result.error(CodeMsg.RESUME_EDUCATION_BACKGROUND_START_TIME_EMPTY);
		}
		//检查结束年份是否为空
		if(educationBackground.getEndYear() == null || "结束年份".equals(educationBackground.getEndYear())) {
			return Result.error(CodeMsg.RESUME_EDUCATION_BACKGROUND_END_TIME_EMPTY);
		}
		//检查结束年份是否大于开始年份
		if(Integer.valueOf(educationBackground.getStartYear()) > Integer.valueOf(educationBackground.getEndYear())) {
			return Result.error(CodeMsg.RESUME_EDUCATION_BACKGROUND_TIME_NOT_CORRECT);
		}
		User session_user = (User) request.getSession().getAttribute("user");
		educationBackground.setUser(session_user);
		
		//检查有没有添加过教育背景
		EducationBackground findEducationBackground = educationBackgroundService.findEducationBackgroundByUserId(session_user.getId());
		if(findEducationBackground != null){
			//进行修改操作
			BeanUtils.copyProperties(educationBackground, findEducationBackground, "id","createTime","updateTime");
			if(educationBackgroundService.save(findEducationBackground) == null){
				return Result.error(CodeMsg.RESUME_EDUCATION_BACKGROUND_ERROR);
			}
		}else {
			//进行添加操作
			if(educationBackgroundService.save(educationBackground) == null){
				return Result.error(CodeMsg.RESUME_EDUCATION_BACKGROUND_ERROR);
			}
		}
		
		//更新最后一次修改时间
		session_user.setUpdateTime(new Date());
		if(userService.save(session_user) == null){
			return Result.error(CodeMsg.USER_UPDATE_TIME_ERROR);
		}
		//把用户权限更新
		User new_session_user = userService.find(session_user.getId());
		request.getSession().setAttribute(SessionConstant.SESSION_USER_LOGIN_KEY, new_session_user);
		return Result.success(true);
	}
	
	
	/**
	 * 保存作品展示信息
	 * @param workShow
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/save_work_show",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> saveWorkShow(WorkShow workShow,HttpServletRequest request)
	{
		if(workShow == null) {
			return Result.error(CodeMsg.DATA_ERROR);
		}
		User session_user = (User) request.getSession().getAttribute("user");
		workShow.setUser(session_user);
		
		//检查有没有添加过教育背景
		WorkShow findWorkShow = workShowService.findWorkShowByUserId(session_user.getId());
		if(findWorkShow != null){
			//进行修改操作
			BeanUtils.copyProperties(workShow, findWorkShow, "id","createTime","updateTime");
			if(workShowService.save(findWorkShow) == null){
				return Result.error(CodeMsg.RESUME_WORK_SHOW_SAVE_ERROR);
			}
		}else {
			//进行添加操作
			if(workShowService.save(workShow) == null){
				return Result.error(CodeMsg.RESUME_WORK_SHOW_SAVE_ERROR);
			}
		}
		
		//更新最后一次修改时间
		session_user.setUpdateTime(new Date());
		if(userService.save(session_user) == null){
			return Result.error(CodeMsg.USER_UPDATE_TIME_ERROR);
		}
		//把用户权限更新
		User new_session_user = userService.find(session_user.getId());
		request.getSession().setAttribute(SessionConstant.SESSION_USER_LOGIN_KEY, new_session_user);
		
		return Result.success(true);
	}
}
