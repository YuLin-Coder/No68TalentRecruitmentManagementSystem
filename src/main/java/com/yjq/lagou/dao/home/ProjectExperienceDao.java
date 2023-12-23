package com.yjq.lagou.dao.home;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yjq.lagou.entity.home.ProjectExperience;
/**
 * 项目经验dao
 *
 *
 */
@Repository 
public interface ProjectExperienceDao extends JpaRepository<ProjectExperience, Long>{

	/**
	 * 根据用户ID查找所属项目经验
	 * @param id
	 * @return
	 */
	@Query(value="select * from project_experience where user_id = :id",nativeQuery=true)
	public ProjectExperience findProjectExperienceByUserId(@Param("id")Long id);

}
