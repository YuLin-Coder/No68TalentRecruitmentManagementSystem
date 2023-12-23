package com.yjq.lagou.dao.common;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yjq.lagou.entity.common.User;
/**
 * 用户dao
 *
 *
 */
@Repository 
public interface UserDao extends JpaRepository<User, Long>{

	
	/**
	 * 按照邮箱地址查询
	 * @param email
	 * @return
	 */
	@Query("select u from User u where email = :email")
	public User findByEmail(String email);
	
	/**
	 * 后端获取所有用户的信息
	 * @param id
	 * @param offset
	 * @param size
	 * @return
	 */
	@Query(value="select * from user order by update_time desc limit :offset,:pageSize",nativeQuery=true)
	public List<User> findAllUserList(@Param("offset")int offset,@Param("pageSize")int pageSize);
	
	
	/**
	 * 按照用户昵称查找用户信息
	 * @param username
	 * @return
	 */
	public User findByUsername(String username);
	
	
	/**
	 * 根据用户id查询
	 * @param id
	 * @return
	 */
	@Query("select u from User u where id = :id")
	public User find(@Param("id")Long id);
}
