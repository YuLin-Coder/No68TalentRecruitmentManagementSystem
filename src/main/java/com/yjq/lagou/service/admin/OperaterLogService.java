package com.yjq.lagou.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * 公共日志service
 *
 *
 */

import com.yjq.lagou.dao.admin.OperaterLogDao;
import com.yjq.lagou.entity.admin.OperaterLog;
@Service
public class OperaterLogService {

	@Autowired
	private OperaterLogDao operaterLogDao;
	
	/**
	 * 操作日志添加/编辑
	 * @param operaterLog
	 * @return
	 */
	public OperaterLog save(OperaterLog operaterLog)
	{
		return operaterLogDao.save(operaterLog);
	}
	
	/**
	 * 获取所有操作日志信息
	 * @param offset
	 * @param pageSize
	 * @return
	 */
	public List<OperaterLog> findOperaterLogList(int offset,int pageSize)
	{
		return operaterLogDao.findOperaterLogList(offset, pageSize);
	}
	
	/**
	 * 操作日志总数
	 * @return
	 */
	public long total(){
		return operaterLogDao.count();
	}
	
	/**
	 * 操作日志删除
	 * @param id
	 */
	public void delete(Long id) {
		operaterLogDao.deleteById(id);
	}
	
}
