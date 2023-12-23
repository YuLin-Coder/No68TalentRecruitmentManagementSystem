package com.yjq.lagou.service.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * 应聘者service
 *
 *
 */

import com.yjq.lagou.dao.home.ProjectExperienceDao;
import com.yjq.lagou.entity.home.ProjectExperience;
/**
 * 项目经验service
 *
 *
 */
@Service
public class ProjectExperienceService {

	@Autowired
	private ProjectExperienceDao  projectExperienceDao;
	
	/**
	 * 项目经验添加/编辑
	 * @param employee
	 * @return
	 */
	public  ProjectExperience save(ProjectExperience projectExperience)
	{
		return projectExperienceDao.save(projectExperience);
	}

	/**
	 * 根据用户ID查找所属项目经验
	 * @param user_id
	 * @return
	 */
	public ProjectExperience findProjectExperienceByUserId(Long user_id)
	{
		return projectExperienceDao.findProjectExperienceByUserId(user_id);
	}
	
	/**
	 * 根据id删除项目经验
	 * @param id
	 */
	public void delete(Long id) {
		projectExperienceDao.deleteById(id);
	}
}
