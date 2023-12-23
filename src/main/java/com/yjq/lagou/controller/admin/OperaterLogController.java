package com.yjq.lagou.controller.admin;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yjq.lagou.bean.CodeMsg;
import com.yjq.lagou.bean.Page;
import com.yjq.lagou.bean.Result;
import com.yjq.lagou.service.admin.OperaterLogService;
/**
 * 日志管理控制类
 *
 *
 */
@RequestMapping("/admin/operater_log")
@Controller
public class OperaterLogController {

	@Autowired 
	private OperaterLogService operaterLogService;
	
	/**
	 * 日志管理页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String operaterLog(Model model){
		return "admin/operater_log/list";
	}
	
	
	/**
	 * 获取日志管理列表
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public  Map<String, Object> operaterLogList(Page page){
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("rows", operaterLogService.findOperaterLogList(page.getOffset(), page.getRows()));
		ret.put("total", operaterLogService.total());
		return ret; 
	}
	
	/**
	 * 删除日志管理列表数据
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> deleteOperaterLogs(String ids){
		if(ids == null || "".equals(ids))
		{
			return Result.error(CodeMsg.OPERATERLOG_DELETE_ID_EMPTY);
		}
		String[] split = ids.split(",");
		for(int i=0;i<split.length;i++)
		{
			try {
				operaterLogService.delete(Long.valueOf(split[i]));
			}catch(Exception e)
			{
				return Result.error(CodeMsg.OPERATERLOG_DELETE_ERROR);
			}
		}
		return Result.success(true); 
	}
	
	
}
