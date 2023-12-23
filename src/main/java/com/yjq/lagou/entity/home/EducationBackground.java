package com.yjq.lagou.entity.home;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.yjq.lagou.annotion.ValidateEntity;
import com.yjq.lagou.entity.common.BaseEntity;
import com.yjq.lagou.entity.common.User;
/**
 * 教育背景实体类（每个用户只能填一个教育背景）
 *
 *
 */
@Entity
@Table(name="education_background")
@EntityListeners(AuditingEntityListener.class)  //是用于监听实体类添加或者删除操作的。
public class EducationBackground extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private static final String DEFAULT_DEGREE = "其他"; //默认学历
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;//教育背景所属用户
	
	@ValidateEntity(required=true,errorRequiredMsg="学校名称不能为空！")
	@Column(name="school_name",nullable=false)
	private String school_name;  //学校名称
	
	@ValidateEntity(required=true,errorRequiredMsg="学历不能为空！")
	@Column(name="study_record",nullable=false)
	private String studyRecord = DEFAULT_DEGREE;  //学历
	
	@ValidateEntity(required=true,errorRequiredMsg="专业名称不能为空！")
	@Column(name="major",nullable=false)
	private String major;  //专业名称
	
	@ValidateEntity(required=true,errorRequiredMsg="开始年份不能为空！")
	@Column(name="start_year",nullable=false)
	private String startYear;  //学习开始年份
	
	@ValidateEntity(required=true,errorRequiredMsg="结束年份不能为空！")
	@Column(name="end_year",nullable=false)
	private String endYear;  //学习结束年份

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getSchool_name() {
		return school_name;
	}

	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}

	public String getStudyRecord() {
		return studyRecord;
	}

	public void setStudyRecord(String studyRecord) {
		this.studyRecord = studyRecord;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getStartYear() {
		return startYear;
	}

	public void setStartYear(String startYear) {
		this.startYear = startYear;
	}

	public String getEndYear() {
		return endYear;
	}

	public void setEndYear(String endYear) {
		this.endYear = endYear;
	}
	
	
	
	
	
}
