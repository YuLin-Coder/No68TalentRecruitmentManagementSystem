package com.yjq.lagou.dao.home;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yjq.lagou.entity.home.EducationBackground;
/**
 * 教育背景dao
 *
 *
 */
@Repository 
public interface EducationBackgroundDao extends JpaRepository<EducationBackground, Long>{

	/**
	 * 根据用户ID查找所属教育背景
	 * @param id
	 * @return
	 */
	@Query(value="select * from education_background where user_id = :id",nativeQuery=true)
	public EducationBackground findEducationBackgroundByUserId(@Param("id")Long id);
	
	/**
	 * 查找所有教育背景
	 * @return
	 */
	@Query(value="select * from education_background",nativeQuery=true)
	public List<EducationBackground> findAllEducationBackground();


}
