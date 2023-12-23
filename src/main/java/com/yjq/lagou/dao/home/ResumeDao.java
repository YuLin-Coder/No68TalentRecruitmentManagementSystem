package com.yjq.lagou.dao.home;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yjq.lagou.entity.home.Resume;
/**
 * 投递简历dao
 *
 *
 */
@Repository
public interface ResumeDao extends JpaRepository<Resume, Long>{

	
	
	/**
	 * 根据职位id和用户id查询简历
	 * @param id
	 * @return
	 */
	@Query("select r from Resume r where user_id = :user_id and position_id = :position_id")
	public Resume findByPositionIdAndUserId(@Param("user_id")Long user_id,@Param("position_id")Long position_id);
	
	/**
	 * 根据职位id查询简历
	 * @param id
	 * @return
	 */
	@Query("select r from Resume r where position_id = :position_id")
	public List<Resume> findByPositionId(@Param("position_id")Long position_id);
	

	/**
	 * 根据用户id查询简历
	 * @param id
	 * @return
	 */
	@Query("select r from Resume r where user_id = :user_id")
	public List<Resume> findByUserId(@Param("user_id")Long user_id);
	
	

	/**
	 * 根据用户id和简历状态查询简历
	 * @param id
	 * @return
	 */
	@Query("select r from Resume r where user_id = :user_id and state = :state")
	public List<Resume> findByUserIdAndState(@Param("user_id")Long user_id,@Param("state")String state);
	
	
	/**
	 * 根据公司id和简历状态查询简历
	 * @param id
	 * @return
	 */
	@Query("select r from Resume r where company_id = :company_id and state = :state order by create_time desc")
	public List<Resume> findByCompanyIdAndState(@Param("company_id")Long company_id,@Param("state")String state);
	
	/**
	 * 根据公司id查询简历
	 * @param id
	 * @return
	 */
	@Query("select r from Resume r where company_id = :company_id")
	public List<Resume> findByCompanyId(@Param("company_id")Long company_id);
	
	/**
	 * 根据简历id查询简历
	 * @param id
	 * @return
	 */
	@Query("select r from Resume r where id = :id")
	public Resume findByResumeId(@Param("id")Long id);
	
	

	/**
	 * 根据公司id和不同状态分别统计简历的个数
	 * @param size
	 * @return
	 */
	//nativeQuery=true:把hql语句转化为原生sql语句,因为这里hql语句中不支持limit
	@Query(value="select count(*) from resume where state = :state and company_id = :id",nativeQuery=true)
	int getPositionTotalByStateAndCompanyId(@Param("id")Long id,@Param("state")String state);
}
