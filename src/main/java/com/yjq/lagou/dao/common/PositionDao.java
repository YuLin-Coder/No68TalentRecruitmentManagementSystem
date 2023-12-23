package com.yjq.lagou.dao.common;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yjq.lagou.entity.common.Position;

/**
 * 职位dao
 *
 *
 */
@Repository 
public interface PositionDao extends JpaRepository<Position, Long>{

	
	/**
	 * 根据公司id查询职位
	 * @param id
	 * @return
	 */
	@Query("select p from Position p where company_id = :id")
	public List<Position> findPositionByCompanyId(@Param("id")Long id);
	
	/**
	 * 分页获取所有职位列表
	 * @param size
	 * @return
	 */
	//nativeQuery=true:把hql语句转化为原生sql语句,因为这里hql语句中不支持limit
	@Query(value="select * from position order by update_time desc limit :offset,:pageSize",nativeQuery=true)
	public List<Position> findAllPositionList(@Param("offset")int offset,@Param("pageSize")int pageSize);
	
	
	/**
	 * 根据职位id查询职位
	 * @param id
	 * @return
	 */
	@Query("select p from Position p where id = :id")
	public Position find(@Param("id")Long id);
		
	/**
	 * 根据公司id和职位状态来获取职位
	 * @param id
	 * @param state
	 * @return
	 */
	@Query("select p from Position p where state = :state and company_id = :id order by create_time desc")
	public List<Position> findPositionByCompanyIdAndState(@Param("id")Long id,@Param("state")String state);

	
	
	/**
	 * 统计不同状态职位的个数
	 * @param size
	 * @return
	 */
	//nativeQuery=true:把hql语句转化为原生sql语句,因为这里hql语句中不支持limit
	@Query(value="select count(*) from position where state = :state and company_id = :id",nativeQuery=true)
	int getPositionTotalByState(@Param("id")Long id,@Param("state")String state);
	
	
	/**
	 * 职位列表中统计职位的个数
	 * @param size
	 * @return
	 */
	//nativeQuery=true:把hql语句转化为原生sql语句,因为这里hql语句中不支持limit
	@Query(value="select count(*) from position where state = :state",nativeQuery=true)
	int getPositionTotal(@Param("state")String state);
	
	

	/**
	 * 根据搜素条件在职位列表中统计职位的个数
	 * @param size
	 * @return
	 */
	//nativeQuery=true:把hql语句转化为原生sql语句,因为这里hql语句中不支持limit
	@Query(value="select count(*) from position where state = :state and name like %:search_value%",nativeQuery=true)
	int getPositionTotalBySearchValue(@Param("state")String state,@Param("search_value")String search_value);
	
	/**
	 * 分页获取有效职位列表
	 * @param size
	 * @return
	 */
	//nativeQuery=true:把hql语句转化为原生sql语句,因为这里hql语句中不支持limit
	@Query(value="select * from position where state = :state order by create_time desc limit :offset,:pageSize",nativeQuery=true)
	public List<Position> findPositionList(@Param("state")String state,@Param("offset")int offset,@Param("pageSize")int pageSize);
	
	
	
	
	/**
	 * 根据搜索条件分页获取有效职位列表
	 * @param size
	 * @return
	 */
	//nativeQuery=true:把hql语句转化为原生sql语句,因为这里hql语句中不支持limit
	@Query(value="select * from position where state = :state and name like %:search_value% order by create_time desc limit :offset,:pageSize",nativeQuery=true)
	public List<Position> findPositionListBySearchValue(@Param("state")String state,@Param("search_value")String search_value,@Param("offset")int offset,@Param("pageSize")int pageSize);
	
}
