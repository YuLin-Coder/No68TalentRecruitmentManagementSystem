package com.yjq.lagou.service.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * 应聘者service
 *
 *
 */

import com.yjq.lagou.dao.common.UserDao;
import com.yjq.lagou.entity.common.User;
/**
 * 用户service
 *
 *
 */
@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	/**
	 * 用户添加/编辑
	 * @param employee
	 * @return
	 */
	public User save(User user)
	{
		return userDao.save(user);
	}
	
	/**
	 * 根据用户邮箱地址查找
	 * @param email
	 * @return
	 */
	public User findByEmail(String email)
	{
		return userDao.findByEmail(email);
	}
	
	
	/**
	 * 根据用户昵称查找
	 * @param email
	 * @return
	 */
	public User findByUsername(String username)
	{
		return userDao.findByUsername(username);
	}
	
	/**
	 * 后端获取所有用户信息
	 * @param offset
	 * @param pageSize
	 * @return
	 */
	public List<User> findAllUserList(int offset,int pageSize){
		return userDao.findAllUserList(offset, pageSize);
	}
	
	
	/**
	 * 根据id查询用户
	 * @param id
	 * @return
	 */
	public User find(Long id)
	{
		return userDao.find(id);
	}
	
	/**
	 * 统计用户总数
	 * @return
	 */
	public long total() {
		return userDao.count();
	}
	
	/**
	 * 删除用户
	 * @param id
	 */
	public void delete(Long id) {
		userDao.deleteById(id);
	}
}
