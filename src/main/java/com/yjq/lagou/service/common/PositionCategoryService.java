package com.yjq.lagou.service.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yjq.lagou.dao.common.PositionCategoryDao;
import com.yjq.lagou.entity.common.PositionCategory;
/**
 * 职位类别service
 *
 *
 */


@Service
public class PositionCategoryService {

	@Autowired
	private PositionCategoryDao positionCategoryDao;
	
	/**
	 * 职业类别添加/编辑
	 * @param positionCategory
	 * @return
	 */
	public PositionCategory save(PositionCategory positionCategory)
	{
		return positionCategoryDao.save(positionCategory);
	}
	
	
	

	
	
	/**
	 * 职位类别总数
	 * @return
	 */
	public long total(){
		return positionCategoryDao.count();
	}
	
	/**
	 * 查询所有职位类别信息
	 * @return
	 */
	public List<PositionCategory> findAll()
	{
		return positionCategoryDao.findAll();
	}
	
	/**
	 * 根据职位类别id查询职位
	 * @param id
	 * @return
	 */
	public PositionCategory find(Long id)
	{
		return positionCategoryDao.find(id);
	}
	

	/**
	 * 根据id删除一条记录
	 * @param id
	 */
	public void delete(Long id){
		positionCategoryDao.deleteById(id);
	}
}
