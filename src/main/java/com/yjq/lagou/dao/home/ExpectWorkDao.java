package com.yjq.lagou.dao.home;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yjq.lagou.entity.home.ExpectWork;
/**
 * 期望工作dao
 *
 *
 */
@Repository 
public interface ExpectWorkDao extends JpaRepository<ExpectWork, Long>{


	/**
	 * 根据用户ID查找所属期望工作
	 * @param id
	 * @return
	 */
	@Query(value="select * from expect_work where user_id = :id",nativeQuery=true)
	public ExpectWork findExpectWorkByUserId(@Param("id")Long id);

}
