package com.yjq.lagou.dao.home;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yjq.lagou.entity.home.WorkExperience;
/**
 * 工作经验dao
 *
 *
 */
@Repository 
public interface WorkExperienceDao extends JpaRepository<WorkExperience, Long>{

	/**
	 * 根据用户ID查找所属工作经历
	 * @param id
	 * @return
	 */
	@Query(value="select * from work_experience where user_id = :id",nativeQuery=true)
	public WorkExperience findWorkExperienceByUserId(@Param("id")Long id);

	/**
	 * 查找所有工作经历
	 * @return
	 */
	@Query(value="select * from work_experience",nativeQuery=true)
	public List<WorkExperience> findAllWorkExperience();

}
