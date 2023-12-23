package com.yjq.lagou.dao.home;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yjq.lagou.entity.home.WorkShow;
/**
 * 作品展示dao
 *
 *
 */
@Repository 
public interface WorkShowDao extends JpaRepository<WorkShow, Long>{

	/**
	 * 根据用户ID查找所属作品展示
	 * @param id
	 * @return
	 */
	@Query(value="select * from work_show where user_id = :id",nativeQuery=true)
	public WorkShow findWorkShowByUserId(@Param("id")Long id);

}
