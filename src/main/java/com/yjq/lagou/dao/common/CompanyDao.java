package com.yjq.lagou.dao.common;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yjq.lagou.entity.common.Company;
/**
 * 公司dao
 *
 *
 */
@Repository
public interface CompanyDao extends JpaRepository<Company, Long>{
	
	
	/**
	 * 根据公司id查询
	 * @param id
	 * @return
	 */
	@Query("select c from Company c where id = :id")
	public Company find(@Param("id")Long id);
	
	
	/**
	 * 根据用户id查询公司
	 * @param id
	 * @return
	 */
	@Query("select c from Company c where user_id = :id")
	public Company findByUserId(@Param("id")Long id);
	

	
	/**
	 * 根据公司名称查询公司
	 * @param company_name
	 * @return
	 */
	@Query("select c from Company c where name = :company_name")
	public Company findByCompanyName(String company_name);
	
	/**
	 * 前端分页获取已认证公司列表
	 * @param size
	 * @return
	 */
	//nativeQuery=true:把hql语句转化为原生sql语句,因为这里hql语句中不支持limit
	@Query(value="select * from company where state = :state limit :offset,:pageSize",nativeQuery=true)
	public List<Company> findCompanyList(@Param("state")String state,@Param("offset")int offset,@Param("pageSize")int pageSize);

	/**
	 * 分页获取所有公司列表
	 * @param size
	 * @return
	 */
	//nativeQuery=true:把hql语句转化为原生sql语句,因为这里hql语句中不支持limit
	@Query(value="select * from company order by update_time desc limit :offset,:pageSize",nativeQuery=true)
	public List<Company> findAllCompanyList(@Param("offset")int offset,@Param("pageSize")int pageSize);
	
	
	/**
	 * 前端根据搜索条件分页获取已认证公司列表
	 * @param size
	 * @return
	 */
	//nativeQuery=true:把hql语句转化为原生sql语句,因为这里hql语句中不支持limit
	@Query(value="select * from company where state = :state and name like %:search_value% limit :offset,:pageSize",nativeQuery=true)
	public List<Company> findCompanyListBySearchValue(@Param("state")String state,@Param("search_value")String search_value,@Param("offset")int offset,@Param("pageSize")int pageSize);
	
	
	
	/**
	 * 前端统计已认证公司个数
	 * @param size
	 * @return
	 */
	//nativeQuery=true:把hql语句转化为原生sql语句,因为这里hql语句中不支持limit
	@Query(value="select count(*) from company where state = :state",nativeQuery=true)
	int getCompanyTotal(@Param("state")String state);

	
	/**
	 * 前端根据搜索条件统计已认证公司个数
	 * @param size
	 * @return
	 */
	//nativeQuery=true:把hql语句转化为原生sql语句,因为这里hql语句中不支持limit
	@Query(value="select count(*) from company where state = :state and name like %:search_value%",nativeQuery=true)
	int getCompanyTotalBySearchValue(@Param("state")String state,@Param("search_value")String search_value);

}
