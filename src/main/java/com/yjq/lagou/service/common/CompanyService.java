package com.yjq.lagou.service.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yjq.lagou.dao.common.CompanyDao;
import com.yjq.lagou.entity.common.Company;
/**
 * 公司service
 *
 *
 */
@Service
public class CompanyService {

	@Autowired
	private CompanyDao companyDao;
	
	/**
	 * 公司添加/编辑
	 * @param employee
	 * @return
	 */
	public Company save(Company company)
	{
		return companyDao.save(company);
	}
	
	/**
	 * 根据id查询公司
	 * @param id
	 * @return
	 */
	public Company find(Long id)
	{
		return companyDao.find(id);
	}
	
	/**
	 * 根据用户id查询公司
	 * @param id
	 * @return
	 */
	public Company findByUserId(Long id)
	{
		return companyDao.findByUserId(id);
	}
	
	/**
	 * 根据公司名称查找公司
	 * @param company_name
	 * @return
	 */
	public Company findByCompanyName(String company_name)
	{
		return companyDao.findByCompanyName(company_name);
	}
	
	/**
	 * 分页获取所有公司列表
	 * @param size
	 * @return
	 */
	public List<Company> findAllCompanyList(int offset,int pageSize){
		return companyDao.findAllCompanyList(offset, pageSize);
	}
	
	/**
	 * 前端分页获取已认证公司列表
	 * @param state
	 * @param offset
	 * @param pageSize
	 * @return
	 */
	public List<Company> findCompanyList(String state,int offset,int pageSize)
	{
		return companyDao.findCompanyList(state, offset, pageSize);
	}
	
	/**
	 * 前端根据搜索条件获取已认证的公司列表
	 * @param state
	 * @param search_value
	 * @param offset
	 * @param pageSize
	 * @return
	 */
	public List<Company> findCompanyListBySearchValue(String state,String search_value,int offset,int pageSize)
	{
		return companyDao.findCompanyListBySearchValue(state, search_value, offset, pageSize);
	}
	
	/**
	 * 前端统计已认证的公司个数
	 * @param size
	 * @return
	 */
	public int getCompanyTotal(String state){
		return companyDao.getCompanyTotal(state);
	}
	
	/**
	 * 前端根据搜索条件获取已认证公司个数
	 * @param state
	 * @param search_value
	 * @return
	 */
	public int getCompanyTotalBySearchValue(String state,String search_value){
		return companyDao.getCompanyTotalBySearchValue(state,search_value);
	}
	
	/**
	 * 根据id删除公司
	 * @param id
	 */
	public void delete(Long id) {
		companyDao.deleteById(id);
	}
	
	/**
	 * 获取所有公司信息
	 * @return
	 */
	public long total() {
		return companyDao.count();
	}
}
