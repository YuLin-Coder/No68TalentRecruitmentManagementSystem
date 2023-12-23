package com.yjq.lagou.controller.home;

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
import com.yjq.lagou.bean.Page;
import com.yjq.lagou.bean.Result;
import com.yjq.lagou.constant.SessionConstant;
import com.yjq.lagou.entity.common.Company;
import com.yjq.lagou.entity.common.Position;
import com.yjq.lagou.entity.common.User;
import com.yjq.lagou.entity.home.Resume;
import com.yjq.lagou.service.common.CompanyService;
import com.yjq.lagou.service.common.PositionService;
import com.yjq.lagou.service.home.ResumeService;
import com.yjq.lagou.util.StringUtil;
import com.yjq.lagou.util.ValidateEntityUtil;
/**
 * 前端职位管理控制器
 *
 *
 */
@RequestMapping("/home/position")
@Controller
public class HomePositionController {

	@Autowired
	private PositionService positionService;
	
	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private ResumeService resumeService;
	
	/**
	 * 职位详情页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public String positionDetail(Model model,@RequestParam(name="id",required=true)Long id){
		Position position = positionService.findById(id);
		model.addAttribute("Position", position);
		model.addAttribute("Company", companyService.find(position.getCompany().getId()));
		return "home/position/detail";
	}
	
	/**
	 * 职位列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String positionList(Model model,Page page,String search_value){
		
		if(StringUtil.isEmpty(search_value)) {
			//如果search_value为空
			//分页获取职位列表信息
			Page p = new Page();
			p.setTotalCount(positionService.getPositionTotal("effective"));
			p.setRows(20);//职位列表每页20个
			model.addAttribute("totalPage",p.getTotalPage());  //总页数
			model.addAttribute("currentPage",page.getPage()); //当前页
		    List<Position> findPositionList = positionService.findPositionList("effective", page.getOffset(), 20);
			model.addAttribute("PositionList", findPositionList);
			model.addAttribute("PositionTotal", positionService.getPositionTotal("effective"));
			
		}else {
			//如果search_value不为空
			//分页获取职位列表信息
			Page p = new Page();
			p.setTotalCount(positionService.getPositionTotalBySearchValue("effective", search_value));
			p.setRows(20);//职位列表每页20个
			model.addAttribute("totalPage",p.getTotalPage());  //总页数
			model.addAttribute("currentPage",page.getPage()); //当前页
		    List<Position> findPositionList = positionService.findPositionListBySearchValue("effective", search_value, page.getOffset(), 20);
			model.addAttribute("PositionList", findPositionList);
			model.addAttribute("PositionTotal", positionService.getPositionTotalBySearchValue("effective", search_value));
			model.addAttribute("SearchValue", search_value);
		}
		
		model.addAttribute("resumeTotal", resumeService.total());
		return "home/position/list";
	}
	
	
	
	/**
	 * 招聘者发布的职位页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/my_publish_position",method=RequestMethod.GET)
	public String myPosition(Model model,String positionState,HttpServletRequest request){
		User session_user = (User) request.getSession().getAttribute(SessionConstant.SESSION_USER_LOGIN_KEY);
		Company findCompanyByUserId = companyService.findByUserId(session_user.getId());
		if(!StringUtil.isEmpty(positionState)) {
			//如果positionState不为空
			List<Position> findPositionByCompanyIdAndState = positionService.findPositionByCompanyIdAndState(findCompanyByUserId.getId(), positionState);
			model.addAttribute("PositionList",findPositionByCompanyIdAndState);
			model.addAttribute("positionTotal", positionService.getPositionTotalByState(findCompanyByUserId.getId(), positionState));
			model.addAttribute("positionState", positionState);
		}else {
			//如果positionState为空
			List<Position> findPositionByCompanyIdAndState = positionService.findPositionByCompanyIdAndState(findCompanyByUserId.getId(), "effective");
			model.addAttribute("PositionList",findPositionByCompanyIdAndState);
			model.addAttribute("positionTotal", positionService.getPositionTotalByState(findCompanyByUserId.getId(), "effective"));
		}
		
		return "home/position/my_publish_position";
	}
	
	
	/**
	 * 保存职位信息
	 * @param position
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> savePosition(Position position,HttpServletRequest request)
	{
		if(position == null){
			return Result.error(CodeMsg.DATA_ERROR);
		}
		//统一表单验证
		CodeMsg validate = ValidateEntityUtil.validate(position);
		if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
			return Result.error(validate);
		}
		if(position.getMinMoney() > position.getMaxMoney()) {
			return Result.error(CodeMsg.POSITION_MONEY_NOT_CORRECT);
		}
		User session_user = (User) request.getSession().getAttribute(SessionConstant.SESSION_USER_LOGIN_KEY);
		Company findCompanyByUserId = companyService.findByUserId(session_user.getId());
		position.setCompany(findCompanyByUserId);
		
		CodeMsg url_way_one = new CodeMsg(1,"");  //前往待处理职位页面
		CodeMsg url_way_two = new CodeMsg(2,"");  //前往已下线职位页面
		//接下来进行添加或者更新数据库的操作
		if(position.getId() != null) {
			//编辑
			Position findById = positionService.findById(position.getId());
			if("effective".equals(findById.getState()) || "wait".equals(findById.getState())) {
				position.setState("wait");
			}else if("out".equals(findById.getState())) {
				position.setState("out");
			}
			BeanUtils.copyProperties(position, findById, "id","createTime","updateTime","number");
			if(positionService.save(findById) == null) {
				return Result.error(CodeMsg.POSITION_SAVE_ERROR);
			}
			if("effective".equals(findById.getState()) || "wait".equals(findById.getState())) {
				return Result.error(url_way_one);  //前往待处理职位页面
			}else{
				return Result.error(url_way_two);  //前往已下线职位页面
			}
		}else {
			//添加
			position.setState("wait");
			if(positionService.save(position) == null) {
				return Result.error(CodeMsg.POSITION_SAVE_ERROR);
			}
			return Result.error(url_way_one);  //前往待处理职位页面
		}
	
	}
	
	/**
	 * 删除职位信息
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> deletePosition(@RequestParam(name="id",required=true)Long id)
	{
		try {
			List<Resume> findByPositionId = resumeService.findByPositionId(id);
			//删除该职位下所有简历
			for(Resume resume : findByPositionId)
			{
				resumeService.delete(resume.getId());
			}
			positionService.delete(id);
		}catch(Exception e) {
			e.printStackTrace();
			return Result.error(CodeMsg.POSITION_SAVE_ERROR);
		}
		
		return Result.success(true);
	}
	
	/**
	 * 更改职位状态信息为下线
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/changeStateToOut",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> changeStateToOut(@RequestParam(name="id",required=true)Long id)
	{
	
		Position findById = positionService.findById(id);
		findById.setState("out");
		if(positionService.save(findById) == null){
			return Result.error(CodeMsg.POSITION_CHANGE_STATE_TO_OUT_ERROR);
		}
		return Result.success(true);
	}
	
	/**
	 * 更改职位状态信息为上线
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/changeStateToWait",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> changeStateToWait(@RequestParam(name="id",required=true)Long id)
	{
	
		Position findById = positionService.findById(id);
		findById.setState("wait");
		if(positionService.save(findById) == null){
			return Result.error(CodeMsg.POSITION_CHANGE_STATE_TO_WAIT_ERROR);
		}
		return Result.success(true);
	}
	
	
}
