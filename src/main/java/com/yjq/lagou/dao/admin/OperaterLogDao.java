package com.yjq.lagou.dao.admin;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.yjq.lagou.entity.admin.OperaterLog;
/**
 * 公共日志dao
 *
 *
 */
@Repository
public interface OperaterLogDao extends JpaRepository<OperaterLog, Long> {

	
	/**
	 * 分页获取日志列表
	 * @param offset
	 * @param pageSize
	 * @return
	 */
	@Query(value="select * from operater_log order by create_time desc limit :offset,:pageSize",nativeQuery=true)
	public List<OperaterLog> findOperaterLogList(int offset, int pageSize);

	
	
}
