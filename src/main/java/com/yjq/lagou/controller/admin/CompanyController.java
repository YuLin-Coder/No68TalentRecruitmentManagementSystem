package com.yjq.lagou.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.yjq.lagou.entity.home.Resume;
import com.yjq.lagou.service.common.CompanyService;
import com.yjq.lagou.service.common.PositionService;
import com.yjq.lagou.service.home.ResumeService;
import com.yjq.lagou.util.StringUtil;
/**
 *后端公司管理控制器
 *
 *
 */
@RequestMapping("/admin/company")
@Controller
public class CompanyController {

	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private ResumeService resumeService;
	
	@Autowired
	private PositionService positionService;
	
	/**
	 * 后台公司管理信息页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(Model model){
		return "admin/company/list";
	}
	

	/**
	 * 获取后台公司信息列表
	 * @param request
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public  Map<String, Object> list(@RequestParam(name="state",required=false,defaultValue="") String state,Page page){
		Map<String, Object> ret = new HashMap<String, Object>();
		if(!StringUtil.isEmpty(state)) {
			//如果state不为空
			List<Company> findCompanyList = companyService.findCompanyList(state, page.getOffset(), page.getRows());
			ret.put("rows", findCompanyList);
			ret.put("total", companyService.getCompanyTotal(state));
		}else {
			//如果state为空
			List<Company> findAllCompanyList = companyService.findAllCompanyList(page.getOffset(), page.getRows());
			ret.put("rows", findAllCompanyList);
			ret.put("total", companyService.total());
		}
		
		return ret; 
	}
	
	/**
	 * 改变公司状态
	 * @param request
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/change_state",method=RequestMethod.POST)
	@ResponseBody
	public  Result<Boolean> changeState(Company company){
		if(company == null) {
			return Result.error(CodeMsg.DATA_ERROR);
		}
		Company findCompany = companyService.find(company.getId());
		findCompany.setState(company.getState());
		if(companyService.save(findCompany) == null) {
			return Result.error(CodeMsg.COMPANY_CHANGE_STATE_ERROR);
		}
		return Result.success(true); 
	}
	
	/**
	 *删除公司
	 * @param request
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public  Result<Boolean> delete(@RequestParam(name="id",required=true)Long id){
		try {
			List<Resume> findResumeList = resumeService.findByCompanyId(id);
			//先删除该公司所有的简历
			for(Resume resume : findResumeList) {
				resumeService.delete(resume.getId());
			}
			//再删除该公司所有职位
			List<Position> findPositionList = positionService.findPositionByCompanyId(id);
			for(Position position : findPositionList) {
				positionService.delete(position.getId());
			}
			//最后删除公司
			companyService.delete(id);
		}catch(Exception e) {
			e.printStackTrace();
			return Result.error(CodeMsg.FOREIGN_KEY_RESTRAIN);
		}
	
		return Result.success(true); 
	}
	
}
