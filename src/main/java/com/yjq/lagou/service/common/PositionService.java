package com.yjq.lagou.service.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * 职位service
 *
 *
 */

import com.yjq.lagou.dao.common.PositionDao;
import com.yjq.lagou.entity.common.Position;
@Service 
public class PositionService {

	@Autowired
	private PositionDao positionDao;
	
	/**
	 * 职位添加/编辑
	 * @param employee
	 * @return
	 */
	public Position save(Position position)
	{
		return positionDao.save(position);
	}
	
	/**
	 * 获取所有职位
	 * @return
	 */
	public List<Position> findAll(){
		return positionDao.findAll();
	}
	
	
	/**
	 * 根据公司id查询职位
	 * @param id
	 * @return
	 */
	public List<Position> findPositionByCompanyId(Long id){
		return positionDao.findPositionByCompanyId(id);
	}
	/**
	 * 根据公司id和职位状态来获取职位
	 * @param id
	 * @param state
	 * @return
	 */
	public List<Position> findPositionByCompanyIdAndState(Long id,String state){
		return positionDao.findPositionByCompanyIdAndState(id, state);
	}
	
	
	/**
	 * 分页获取所有职位列表
	 * @param id
	 * @param state
	 * @return
	 */
	public List<Position> findAllPositionList(int offset,int pageSize){
		return positionDao.findAllPositionList(offset,pageSize);
	}
	
	/**
	 * 统计不同状态职位的个数
	 * @param id
	 * @param size
	 * @return
	 */
	public int getPositionTotalByState(Long id,String state){
		return positionDao.getPositionTotalByState(id,state);
	}
	
	/**
	 * 职位列表中统计职位的个数
	 * @param size
	 * @return
	 */
	public int getPositionTotal(String state){
		return positionDao.getPositionTotal(state);
	}
	
	/**
	 * 根据搜素条件在职位列表中统计职位的个数
	 * @param state
	 * @param search_value
	 * @return
	 */
	public int getPositionTotalBySearchValue(String state,String search_value){
		return positionDao.getPositionTotalBySearchValue(state,search_value);
	}
	
	
	/**
	 * 根据职位id查找职位
	 * @param id
	 * @return
	 */
	public Position findById(Long id) {
		return positionDao.find(id);
	}
	
	/**
	 * 职位根据id删除
	 * @param id
	 */
	public void delete(Long id) {
		positionDao.deleteById(id);
	}
	
	
	/**
	 * 前端分页获取有效公司列表
	 * @param state
	 * @param offset
	 * @param pageSize
	 * @return
	 */
	public List<Position> findPositionList(String state,int offset,int pageSize)
	{
		return positionDao.findPositionList(state, offset, pageSize);
	}
	
	/**
	 * 根据搜索条件分页获取有效职位列表
	 * @param state
	 * @param search_value
	 * @param offset
	 * @param pageSize
	 * @return
	 */
	public List<Position> findPositionListBySearchValue(String state,String search_value,int offset,int pageSize)
	{
		return positionDao.findPositionListBySearchValue(state,search_value,offset, pageSize);
	}
	
	/**
	 * 获取职位总数
	 * @return
	 */
	public long total() {
		return positionDao.count();
	}

	
}
