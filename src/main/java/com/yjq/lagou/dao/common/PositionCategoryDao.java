package com.yjq.lagou.dao.common;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yjq.lagou.entity.common.PositionCategory;
/**
 * 职位类别dao
 *
 *
 */
@Repository 
public interface PositionCategoryDao extends JpaRepository<PositionCategory, Long>{

	/**
	 * 根据职位类别id查询职位
	 * @param id
	 * @return
	 */
	@Query("select pc from PositionCategory pc where id = :id")
	public PositionCategory find(@Param("id")Long id);
	
	
	
	

}
