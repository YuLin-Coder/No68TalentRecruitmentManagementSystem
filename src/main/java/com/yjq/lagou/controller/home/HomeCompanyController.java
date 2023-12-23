package com.yjq.lagou.controller.home;

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
import com.yjq.lagou.entity.common.User;
import com.yjq.lagou.service.common.CompanyService;
import com.yjq.lagou.service.common.PositionService;
import com.yjq.lagou.util.StringUtil;
/**
 * 前端公司管理控制器
 *
 *
 */
@RequestMapping("/home/company")
@Controller
public class HomeCompanyController {

	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private PositionService positionService;
	
	/**
	 * 公司详情页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public String companyDetail(Model model,@RequestParam(name="id",required=true)Long id){
		Company findCompany = companyService.find(id);
		model.addAttribute("Company", findCompany);
		return "home/company/detail";
	}
	
	
	
	/**
	 * 我的公司页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/my_company",method=RequestMethod.GET)
	public String myCompany(Model model,HttpServletRequest request){
		User session_user = (User) request.getSession().getAttribute(SessionConstant.SESSION_USER_LOGIN_KEY);
		Company company = companyService.findByUserId(session_user.getId());
		model.addAttribute("Company", company);
		if(company != null && company.getTags() != null){
			model.addAttribute("Tags", company.getTags().split(","));
		}
		if(company != null && company.getId() != null) {
			model.addAttribute("PositionList", positionService.findPositionByCompanyIdAndState(company.getId(), "effective"));
		}
		
		return "home/company/my_company";
	}
	
	
	/**
	 * 申请公司认证
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/apply_confirm",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> applyConfirm(@RequestParam(name="id",required=true)Long id)
	{
		Company findCompany = companyService.find(id);
		findCompany.setState("待审核");
		if(companyService.save(findCompany) == null) {
			return Result.error(CodeMsg.COMPANY_APPLY_SAVE_ERROR);
		}
		return Result.success(true);
	}
	
	/**
	 * 保存公司名称、价值观和图片信息
	 * @param company
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/save_company_detail",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> saveCompanyDetail(Company company,HttpServletRequest request)
	{
		if(company == null){
			return Result.error(CodeMsg.DATA_ERROR);
		}
		//检测公司名称是否为空
		if(StringUtil.isEmpty(company.getName())) {
			return Result.error(CodeMsg.COMPANY_NAME_EMPTY);
		}
		//检测公司价值观是否为空
		if(StringUtil.isEmpty(company.getValue())) {
			return Result.error(CodeMsg.COMPANY_VALUE_EMPTY);
		}
		//检测公司名称长度
		if(company.getName().length() > 30) {
			return Result.error(CodeMsg.COMPANY_NAME_WORD_OVER);
		}
		//检测公司名称长度
		if(company.getValue().length() > 50) {
			return Result.error(CodeMsg.COMPANY_VALUE_WORD_OVER);
		}
		User session_user = (User) request.getSession().getAttribute(SessionConstant.SESSION_USER_LOGIN_KEY);
		Company findCompany = companyService.findByUserId(session_user.getId());
		if(findCompany == null) {
			//进行添加操作
			//检测公司名称是否重名
			if(checkCompanyName(company,0l)){
				return Result.error(CodeMsg.COMPANY_NAME_ALREADY_EXIST);
			}
			company.setUser(session_user);
			if(companyService.save(company) == null){
				return Result.error(CodeMsg.COMPANY_NAME_AND_VALUE_SAVE_ERROR);
			}
		}else {
			//进行修改操作
			//检测公司名称是否重名
			if(checkCompanyName(company,findCompany.getId())){
				return Result.error(CodeMsg.COMPANY_NAME_ALREADY_EXIST);
			}
			company.setState("待审核");
			BeanUtils.copyProperties(company, findCompany, "id","createTime","updateTime","user","tags","productPhoto","productTitle","productContent","introduction","locale","territory","scale","url","finance","founderName","founderPosition","founderPhoto");
			if(companyService.save(findCompany) == null){
				return Result.error(CodeMsg.COMPANY_NAME_AND_VALUE_SAVE_ERROR);
			}
		}
		return Result.success(true);
	}
	
	/**
	 * 保存公司标签
	 * @param company
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/save_company_tags",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> saveCompanyTags(Company company,HttpServletRequest request)
	{
		if(company == null){
			return Result.error(CodeMsg.DATA_ERROR);
		}
		//检测公司标签长度
		if(company.getTags().length() > 30) {
			return Result.error(CodeMsg.COMPANY_TAGS_WORD_OVER);
		}
		User session_user = (User) request.getSession().getAttribute(SessionConstant.SESSION_USER_LOGIN_KEY);
		Company findCompany = companyService.findByUserId(session_user.getId());
		if(findCompany == null) {
			//先让用户填写名称和价值观基本信息
			return Result.error(CodeMsg.COMPANY_NAME_AND_VALUE_PRIORITY);
		}else {
			//进行修改操作
			company.setState("待审核");
			BeanUtils.copyProperties(company, findCompany, "id","createTime","updateTime","user","name","value","photo","productPhoto","productTitle","productContent","introduction","locale","territory","scale","url","finance","founderName","founderPosition","founderPhoto");
			if(companyService.save(findCompany) == null){
				return Result.error(CodeMsg.COMPANY_TAGS_SAVE_ERROR);
			}
		}
		return Result.success(true);
	}
	
	/**
	 * 保存公司产品
	 * @param company
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/save_company_product",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> saveCompanyProduct(Company company,HttpServletRequest request)
	{
		if(company == null){
			return Result.error(CodeMsg.DATA_ERROR);
		}
		//检测公司产品标题长度
		if(company.getProductTitle().length() > 11) {
			return Result.error(CodeMsg.COMPANY_PRODUCT_NAME_WORD_OVER);
		}
		User session_user = (User) request.getSession().getAttribute(SessionConstant.SESSION_USER_LOGIN_KEY);
		Company findCompany = companyService.findByUserId(session_user.getId());
		if(findCompany == null) {
			//先让用户填写名称和价值观基本信息
			return Result.error(CodeMsg.COMPANY_NAME_AND_VALUE_PRIORITY);
		}else {
			//进行修改操作
			if("".equals(company.getProductTitle())) {
				company.setProductTitle(null);
			}
			if("".equals(company.getProductContent())) {
				company.setProductContent(null);
			}
			company.setState("待审核");
			BeanUtils.copyProperties(company, findCompany, "id","createTime","updateTime","tags","user","name","value","photo","introduction","locale","territory","scale","url","finance","founderName","founderPosition","founderPhoto");
			if(companyService.save(findCompany) == null){
				return Result.error(CodeMsg.COMPANY_PRODUCT_SAVE_ERROR);
			}
		}
		return Result.success(true);
	}
	
	/**
	 * 保存公司介绍
	 * @param company
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/save_company_introduction",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> saveCompanyIntroduction(Company company,HttpServletRequest request)
	{
		if(company == null){
			return Result.error(CodeMsg.DATA_ERROR);
		}
		User session_user = (User) request.getSession().getAttribute(SessionConstant.SESSION_USER_LOGIN_KEY);
		Company findCompany = companyService.findByUserId(session_user.getId());
		if(findCompany == null) {
			//先让用户填写名称和价值观基本信息
			return Result.error(CodeMsg.COMPANY_NAME_AND_VALUE_PRIORITY);
		}else {
			//进行修改操作
			if("".equals(company.getIntroduction())){
				company.setIntroduction(null);
			}
			company.setState("待审核");
			BeanUtils.copyProperties(company, findCompany, "id","createTime","updateTime","tags","user","name","value","photo","productPhoto","productTitle","productContent","locale","territory","scale","url","finance","founderName","founderPosition","founderPhoto");
			if(companyService.save(findCompany) == null){
				return Result.error(CodeMsg.COMPANY_INTRODUCTION_SAVE_ERROR);
			}
		}
		return Result.success(true);
	}
	
	/**
	 * 保存公司地点、领域、规模和网页信息
	 * @param company
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/save_company_basic",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> saveCompanyBasic(Company company,HttpServletRequest request)
	{
		if(company == null){
			return Result.error(CodeMsg.DATA_ERROR);
		}
		//检测公司地点是否为空
		if(StringUtil.isEmpty(company.getLocale())) {
			return Result.error(CodeMsg.COMPANY_LOCALE_EMPTY);
		}
		//检测公司领域是否为空
		if(StringUtil.isEmpty(company.getTerritory())) {
			return Result.error(CodeMsg.COMPANY_TERRITORY_EMPTY);
		}
		//检测公司规模是否为空
		if(StringUtil.isEmpty(company.getScale())) {
			return Result.error(CodeMsg.COMPANY_SCALE_EMPTY);
		}
		//检测公司网址是否为空
		if(StringUtil.isEmpty(company.getUrl())) {
			return Result.error(CodeMsg.COMPANY_URL_EMPTY);
		}
		
		User session_user = (User) request.getSession().getAttribute(SessionConstant.SESSION_USER_LOGIN_KEY);
		Company findCompany = companyService.findByUserId(session_user.getId());
		if(findCompany == null) {
			//先让用户填写名称和价值观基本信息
			return Result.error(CodeMsg.COMPANY_NAME_AND_VALUE_PRIORITY);
		}else {
			//进行修改操作
			company.setState("待审核");
			BeanUtils.copyProperties(company, findCompany, "id","createTime","updateTime","user","name","tags","value","photo","productPhoto","productTitle","productContent","introduction","finance","founderName","founderPosition","founderPhoto");
			if(companyService.save(findCompany) == null){
				return Result.error(CodeMsg.COMPANY_BASIC_SAVE_ERROR);
			}
		}
		return Result.success(true);
	}
	
	

	
	/**
	 * 保存公司融资阶段
	 * @param company
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/save_company_finance",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> saveCompanyFinance(Company company,HttpServletRequest request)
	{
		if(company == null){
			return Result.error(CodeMsg.DATA_ERROR);
		}
		User session_user = (User) request.getSession().getAttribute(SessionConstant.SESSION_USER_LOGIN_KEY);
		Company findCompany = companyService.findByUserId(session_user.getId());
		if(findCompany == null) {
			//先让用户填写名称和价值观基本信息
			return Result.error(CodeMsg.COMPANY_NAME_AND_VALUE_PRIORITY);
		}else {
			//进行修改操作
			company.setState("待审核");
			BeanUtils.copyProperties(company, findCompany, "id","createTime","updateTime","user","name","tags","value","photo","productPhoto","productTitle","productContent","introduction","locale","territory","scale","url","founderName","founderPosition","founderPhoto");
			if(companyService.save(findCompany) == null){
				return Result.error(CodeMsg.COMPANY_FINANCE_SAVE_ERROR);
			}
		}
		return Result.success(true);
	}

	/**
	 * 保存公司创始人信息
	 * @param company
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/save_company_founder",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> saveCompanyFounder(Company company,HttpServletRequest request)
	{
		if(company == null){
			return Result.error(CodeMsg.DATA_ERROR);
		}
		//检测公司创始人姓名是否为空
		if(StringUtil.isEmpty(company.getFounderName())){
			return Result.error(CodeMsg.COMPANY_FOUNDER_NAME_EMPTY);
		}
		//检测公司创始人职位是否为空
		if(StringUtil.isEmpty(company.getFounderPosition())){
			return Result.error(CodeMsg.COMPANY_FOUNDER_POSITION_EMPTY);
		}
		if(company.getFounderName().length() > 10){
			return Result.error(CodeMsg.COMPANY_FOUNDER_NAME_WORD_OVER);
		}
		if(company.getFounderPosition().length() > 15){
			return Result.error(CodeMsg.COMPANY_FOUNDER_POSITION_WORD_OVER);
		}
		User session_user = (User) request.getSession().getAttribute(SessionConstant.SESSION_USER_LOGIN_KEY);
		Company findCompany = companyService.findByUserId(session_user.getId());
		if(findCompany == null) {
			//先让用户填写名称和价值观基本信息
			return Result.error(CodeMsg.COMPANY_NAME_AND_VALUE_PRIORITY);
		}else {
			//进行修改操作
			company.setState("待审核");
			BeanUtils.copyProperties(company, findCompany, "id","createTime","updateTime","user","name","tags","value","photo","productPhoto","productTitle","productContent","introduction","locale","territory","scale","url","finance");
			if(companyService.save(findCompany) == null){
				return Result.error(CodeMsg.COMPANY_FOUNDER_SAVE_ERROR);
			}
		}
		return Result.success(true);
	}
	
	
	//检查有没有重复的companyName
	public boolean checkCompanyName(Company company,Long id)
	{
		Company findByCompanyName = companyService.findByCompanyName(company.getName());
		if(findByCompanyName == null)
			return false;  //没有重复
		if(findByCompanyName.getId().longValue() == id.longValue())
			return false;  //没有重复
		return true;  //有重复
	}
}
