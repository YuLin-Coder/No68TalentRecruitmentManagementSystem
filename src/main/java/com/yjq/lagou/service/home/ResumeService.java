package com.yjq.lagou.service.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yjq.lagou.dao.home.ResumeDao;
import com.yjq.lagou.entity.home.Resume;
/**
 * 投递简历service
 *
 *
 */
@Service 
public class ResumeService {

	@Autowired
	private ResumeDao resumeDao;
	
	/**
	 * 投递简历
	 * @param resume
	 * @return
	 */
	public  Resume save(Resume resume)
	{
		return resumeDao.save(resume);
	}
	
	/**
	 * 根据职位id和用户id查询简历
	 * @param user_id
	 * @param position_id
	 * @return
	 */
	public Resume findByPositionIdAndUserId(Long user_id,Long position_id){
		return resumeDao.findByPositionIdAndUserId(user_id, position_id);
	}
	
	/**
	 * 根据职位id查询简历
	 * @param position_id
	 * @return
	 */
	public List<Resume> findByPositionId(Long position_id){
		return resumeDao.findByPositionId(position_id);
	}
	
	/**
	 * 根据公司id和简历状态查询简历
	 * @param user_id
	 * @param company_id
	 * @return
	 */
	public List<Resume> findByCompanyIdAndState(Long company_id,String state){
		return resumeDao.findByCompanyIdAndState(company_id, state);
	}
	
	/**
	 * 根据公司id查询简历
	 * @param user_id
	 * @param company_id
	 * @return
	 */
	public List<Resume> findByCompanyId(Long company_id){
		return resumeDao.findByCompanyId(company_id);
	}
	
	/**
	 * 根据用户id和简历状态查询简历
	 * @param user_id
	 * @param company_id
	 * @return
	 */
	public List<Resume> findByUserIdAndState(Long user_id,String state){
		return resumeDao.findByUserIdAndState(user_id, state);
	}
	
	/**
	 * 根据用户id查询简历
	 * @param user_id
	 * @param company_id
	 * @return
	 */
	public List<Resume> findByUserId(Long user_id){
		return resumeDao.findByUserId(user_id);
	}
	
	/**
	 * 根据简历id获取简历
	 * @param id
	 * @return
	 */
	public Resume findByResumeId(Long id){
		return resumeDao.findByResumeId(id);
	}
	
	/**
	 * 根据公司id和不同状态分别统计简历的个数
	 * @param id
	 * @param size
	 * @return
	 */
	public int getPositionTotalByStateAndCompanyId(Long id,String state){
		return resumeDao.getPositionTotalByStateAndCompanyId(id,state);
	}
	
	/**
	 * 删除简历
	 * @param id
	 */
	public void delete(Long id){
		resumeDao.deleteById(id);
	}
	
	/**
	 * 统计投递简历的总数
	 * @return
	 */
	public long total() {
		return resumeDao.count();
	}
}
