package com.yjq.lagou.service.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * 应聘者service
 *
 *
 */

import com.yjq.lagou.dao.home.WorkShowDao;
import com.yjq.lagou.entity.home.WorkShow;
/**
 * 项目展示service
 *
 *
 */
@Service
public class WorkShowService {

	@Autowired
	private WorkShowDao workShowDao;
	
	/**
	 * 项目展示添加/编辑
	 * @param employee
	 * @return
	 */
	public  WorkShow save(WorkShow WorkShow)
	{
		return workShowDao.save(WorkShow);
	}
	
	/**
	 * 根据用户ID查找所属作品展示
	 * @param user_id
	 * @return
	 */
	public WorkShow findWorkShowByUserId(Long user_id)
	{
		return workShowDao.findWorkShowByUserId(user_id);
	}
	
	/**
	 * 根据id删除作品展示
	 * @param id
	 */
	public void delete(Long id) {
		workShowDao.deleteById(id);
	}
}
