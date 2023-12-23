package com.yjq.lagou.service.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * 应聘者service
 *
 *
 */

import com.yjq.lagou.dao.home.EducationBackgroundDao;
import com.yjq.lagou.entity.home.EducationBackground;
/**
 * 教育背景service
 *
 *
 */
@Service
public class EducationBackgroundService {

	@Autowired
	private EducationBackgroundDao educationBackgroundDao;
	
	/**
	 * 教育背景添加/编辑
	 * @param employee
	 * @return
	 */
	public  EducationBackground save(EducationBackground educationBackground)
	{
		return educationBackgroundDao.save(educationBackground);
	}
	
	/**
	 * 根据用户ID查找所属教育背景
	 * @param user_id
	 * @return
	 */
	public EducationBackground findEducationBackgroundByUserId(Long user_id)
	{
		return educationBackgroundDao.findEducationBackgroundByUserId(user_id);
	}
	
	/**
	 * 查找所有教育背景
	 * @return
	 */
	public List<EducationBackground> findAllEducationBackground(){
		return educationBackgroundDao.findAllEducationBackground();
	}
	
	/**
	 * 根据id删除教育背景
	 * @param id
	 */
	public void delete(Long id) {
		educationBackgroundDao.deleteById(id);
	}
}
