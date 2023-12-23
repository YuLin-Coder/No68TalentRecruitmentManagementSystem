package com.yjq.lagou.service.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * 应聘者service
 *
 *
 */

import com.yjq.lagou.dao.home.WorkExperienceDao;
import com.yjq.lagou.entity.home.WorkExperience;
/**
 * 工作经验service
 *
 *
 */
@Service
public class WorkExperienceService {

	@Autowired
	private WorkExperienceDao  workExperienceDao;
	
	/**
	 * 工作经验添加/编辑
	 * @param employee
	 * @return
	 */
	public  WorkExperience save(WorkExperience workExperience)
	{
		return workExperienceDao.save(workExperience);
	}
	
	/**
	 * 根据用户ID查找所属工作经历
	 * @param user_id
	 * @return
	 */
	public WorkExperience findWorkExperienceByUserId(Long user_id)
	{
		return workExperienceDao.findWorkExperienceByUserId(user_id);
	}
	
	/**
	 * 查找所有工作经历
	 * @return
	 */
	public List<WorkExperience> findAllWorkExperience(){
		return workExperienceDao.findAllWorkExperience();
	}
	
	/**
	 * 根据id删除工作经验
	 * @param id
	 */
	public void delete(Long id) {
		workExperienceDao.deleteById(id);
	}
	
}
