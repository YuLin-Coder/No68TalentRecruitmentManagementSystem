package com.yjq.lagou.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * 管理员管理service
 *
 *
 */

import com.yjq.lagou.dao.admin.AdminDao;
import com.yjq.lagou.entity.admin.Admin;



@Service
public class AdminService {

	@Autowired
	private AdminDao adminDao;
	
	/**
	 * 根据管理员姓名查找信息
	 * @param admin_name
	 * @return
	 */
	public Admin findByAdminName(String admin_name)
	{
		return adminDao.findByAdminName(admin_name);
	}
	
	/**
	 * 获取某个管理员所有信息
	 * @param id
	 * @param offset
	 * @param pageSize
	 * @return
	 */
	public List<Admin> findAdminList(Long id,int offset,int pageSize)
	{
		return adminDao.findAdminList(id, offset, pageSize);
	}
	
	/**
	 * 管理员修改/添加
	 * @param blog
	 * @return
	 */
	public Admin save(Admin admin){
		return adminDao.save(admin);
	} 
	
	/**
	 * 根据id查询管理员
	 * @param id
	 * @return
	 */
	public Admin find(Long id){
		return adminDao.find(id);
	}
}
