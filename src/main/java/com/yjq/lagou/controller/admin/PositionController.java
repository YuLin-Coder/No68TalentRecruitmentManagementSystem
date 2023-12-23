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
import com.yjq.lagou.entity.common.Position;
import com.yjq.lagou.service.common.PositionService;
import com.yjq.lagou.util.StringUtil;
/**
 * 后端职位管理控制器
 *
 *
 */
@RequestMapping("/admin/position")
@Controller
public class PositionController {

	@Autowired 
	private PositionService positionService;

	/**
	 * 后台职位管理信息页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(Model model){
		return "admin/position/list";
	}
	
	/**
	 * 获取后台职位信息列表
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
			List<Position> findPositionList = positionService.findPositionList(state, page.getOffset(), page.getRows());
			ret.put("rows", findPositionList);
			ret.put("total", positionService.getPositionTotal(state));
		}else {
			//如果state为空
			List<Position> findAllPositionList = positionService.findAllPositionList(page.getOffset(), page.getRows());
			ret.put("rows", findAllPositionList);
			ret.put("total", positionService.total());
		}
		
		return ret; 
	}
	
	/**
	 * 改变职位状态
	 * @param request
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/change_state",method=RequestMethod.POST)
	@ResponseBody
	public  Result<Boolean> changeState(Position position){
		if(position == null) {
			return Result.error(CodeMsg.DATA_ERROR);
		}
		Position findPosition = positionService.findById(position.getId());
		findPosition.setState(position.getState());
		if(positionService.save(findPosition) == null) {
			return Result.error(CodeMsg.POSITION_CHANGE_STATE_ERROR);
		}
		return Result.success(true); 
	}
}
