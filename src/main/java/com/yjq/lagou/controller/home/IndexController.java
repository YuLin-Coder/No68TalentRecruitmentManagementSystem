package com.yjq.lagou.controller.home;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yjq.lagou.bean.Page;
import com.yjq.lagou.constant.SessionConstant;
import com.yjq.lagou.entity.common.Company;
import com.yjq.lagou.entity.common.Position;
import com.yjq.lagou.entity.common.PositionCategory;
import com.yjq.lagou.entity.common.User;
import com.yjq.lagou.entity.home.EducationBackground;
import com.yjq.lagou.entity.home.ExpectWork;
import com.yjq.lagou.entity.home.ProjectExperience;
import com.yjq.lagou.entity.home.WorkExperience;
import com.yjq.lagou.entity.home.WorkShow;
import com.yjq.lagou.service.common.CompanyService;
import com.yjq.lagou.service.common.PositionCategoryService;
import com.yjq.lagou.service.common.PositionService;
import com.yjq.lagou.service.home.EducationBackgroundService;
import com.yjq.lagou.service.home.ExpectWorkService;
import com.yjq.lagou.service.home.ProjectExperienceService;
import com.yjq.lagou.service.home.ResumeService;
import com.yjq.lagou.service.home.WorkExperienceService;
import com.yjq.lagou.service.home.WorkShowService;
import com.yjq.lagou.util.PositionCategoryUtil;
import com.yjq.lagou.util.StringUtil;
/**
 * 首页控制器
 *
 *
 */

@RequestMapping("/home/index")
@Controller
public class IndexController {

	@Autowired
	private PositionCategoryService positionCategoryService; 
	
	@Autowired
	private WorkExperienceService workExperienceService;
	
	@Autowired
	private ProjectExperienceService projectExperienceService; 
	
	@Autowired
	private ExpectWorkService expectWorkService;
	
	@Autowired
	private EducationBackgroundService educationBackgroundService;
	
	@Autowired
	private WorkShowService workShowService;
	
	@Autowired
	private CompanyService companyService;
	
	@Autowired 
	private PositionService positionService;
	
	@Autowired
	private ResumeService resumeService;
	
	/**
	 * 首页
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(Model model){
		List<PositionCategory> topList = PositionCategoryUtil.getTopPositionCategory(positionCategoryService.findAll());
		List<PositionCategory> secondList = PositionCategoryUtil.getSecondCategory(positionCategoryService.findAll());
		List<PositionCategory> thirdList = PositionCategoryUtil.getThirdCategory(positionCategoryService.findAll());
		List<PositionCategory> quickIndexList = PositionCategoryUtil.getQuickIndexCategory(positionCategoryService.findAll());
		model.addAttribute("topPositionCategoryList",topList);
		model.addAttribute("secondPositionCategoryList",secondList);
		model.addAttribute("thirdPositionCategoryList",thirdList);
		model.addAttribute("quickIndexList",quickIndexList);
		model.addAttribute("index", "index"); //top_menu显示
		model.addAttribute("PositionList", positionService.findPositionList("effective", 0, 20));//获取20个职位列表
		model.addAttribute("PositionTotal", positionService.getPositionTotal("effective"));
		
		return "home/index/index";
	}
	
	/**
	 * 公司页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/company_list",method=RequestMethod.GET)
	public String companyList(Model model,Page page,String search_value){
		model.addAttribute("company_list", "company_list"); //top_menu显示
		
		if(StringUtil.isEmpty(search_value)) {
			//如果search_value为空
			//分页获取公司列表信息
			Page p = new Page();
			p.setTotalCount(companyService.getCompanyTotal("已认证"));
			p.setRows(9);//公司列表每页9个
			model.addAttribute("totalPage",p.getTotalPage());  //总页数
			model.addAttribute("currentPage",page.getPage()); //当前页
			model.addAttribute("PositionList", positionService.findAll());
			List<Company> findCompanyList = companyService.findCompanyList("已认证", page.getOffset(), 9);
			model.addAttribute("CompanyList", findCompanyList);
		}else {
			//如果search_value不为空
			Page p = new Page();
			p.setTotalCount(companyService.getCompanyTotalBySearchValue("已认证", search_value));
			p.setRows(9);//公司列表每页9个
			model.addAttribute("totalPage",p.getTotalPage());  //总页数
			model.addAttribute("currentPage",page.getPage()); //当前页
			List<Company> findCompanyList = companyService.findCompanyListBySearchValue("已认证", search_value, page.getOffset(), 9);
			model.addAttribute("CompanyList", findCompanyList);
			model.addAttribute("PositionList", positionService.findAll());
			model.addAttribute("SearchValue", search_value);
		}
		
		model.addAttribute("resumeTotal", resumeService.total());
		
		
		return "home/index/company_list";
	}
	
	/**
	 * 我的简历页面
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/my_resume",method=RequestMethod.GET)
	public String my_resume(Model model,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute(SessionConstant.SESSION_USER_LOGIN_KEY);
		int scores = 0; //简历完善度
		int isOK = 0; //是否可以投递（必填项是否都填了） 0：不可以  1：可以
		ExpectWork expectWork = expectWorkService.findExpectWorkByUserId(user.getId());
		WorkExperience workExperience = workExperienceService.findWorkExperienceByUserId(user.getId());
		ProjectExperience projectExperience = projectExperienceService.findProjectExperienceByUserId(user.getId());
		EducationBackground educationBackground = educationBackgroundService.findEducationBackgroundByUserId(user.getId());
		WorkShow workShow = workShowService.findWorkShowByUserId(user.getId());
		if(expectWork != null) {
			scores += 20;
		}
		if(workExperience != null) {
			scores += 20;
		}
		if(projectExperience != null) {
			scores += 20;
		}
		if(educationBackground != null) {
			scores += 20;
		}
		if(workShow != null) {
			scores += 20;
		}
		if(workExperience != null && projectExperience != null && educationBackground != null) {
			isOK = 1;
		}
		model.addAttribute("isOK", isOK);
		model.addAttribute("scores", scores);
		model.addAttribute("ExpectWork", expectWork);
		model.addAttribute("WorkExperience", workExperience);
		model.addAttribute("ProjectExperience", projectExperience);
		model.addAttribute("EducationBackground", educationBackground);
		model.addAttribute("WorkShow", workShow);
		model.addAttribute("my_resume", "my_resume"); //top_menu显示
		return "home/index/my_resume";
	}
	
	
	/**
	 * 发布职位页面
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/publish_position",method=RequestMethod.GET)
	public String publishPosition(Model model,HttpServletRequest request,Long id){
		List<PositionCategory> topList = PositionCategoryUtil.getTopPositionCategory(positionCategoryService.findAll());
		List<PositionCategory> secondList = PositionCategoryUtil.getSecondCategory(positionCategoryService.findAll());
		List<PositionCategory> thirdList = PositionCategoryUtil.getThirdCategory(positionCategoryService.findAll());
		model.addAttribute("topPositionCategoryList",topList);
		model.addAttribute("secondPositionCategoryList",secondList);
		model.addAttribute("thirdPositionCategoryList",thirdList);
		
		User user = (User) request.getSession().getAttribute(SessionConstant.SESSION_USER_LOGIN_KEY);
		Company findCompanyByUserId = companyService.findByUserId(user.getId());
		if(findCompanyByUserId == null || !"已认证".equals(findCompanyByUserId.getState())) {
			model.addAttribute("errorMsg", "您的公司还没认证通过，请填写公司信息或者等待认证通过！3s后为您跳转我的公司页面！");
		}
		
		//判断是不是编辑操作
		if(id != null) {
			//如果是
			Position findById = positionService.findById(id);
			model.addAttribute("editPosition", findById);
		}
		
		model.addAttribute("publish_position", "publish_position"); //top_menu显示
		return "home/index/publish_position";
	}
	
	
	/**
	 * 关于我们页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/about",method=RequestMethod.GET)
	public String about(Model model){
		model.addAttribute("about", "about"); //top_menu显示
		return "home/index/about";
	}
}
