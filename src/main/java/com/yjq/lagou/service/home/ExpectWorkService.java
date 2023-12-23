package com.yjq.lagou.service.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * 应聘者service
 *
 *
 */

import com.yjq.lagou.dao.home.ExpectWorkDao;
import com.yjq.lagou.entity.home.ExpectWork;
/**
 * 期望工作service
 *
 *
 */
@Service
public class ExpectWorkService {

	@Autowired
	private ExpectWorkDao expectWorkDao;
	
	/**
	 * 期望工作添加/编辑
	 * @param employee
	 * @return
	 */
	public  ExpectWork save(ExpectWork expectWork)
	{
		return expectWorkDao.save(expectWork);
	}
	
	/**
	 * 根据用户ID查找所属期望工作
	 * @param user_id
	 * @return
	 */
	public ExpectWork findExpectWorkByUserId(Long user_id)
	{
		return expectWorkDao.findExpectWorkByUserId(user_id);
	}
	
	/**
	 * 根据id删除期待工作
	 * @param id
	 */
	public void delete(Long id) {
		expectWorkDao.deleteById(id);
	}
	
}
