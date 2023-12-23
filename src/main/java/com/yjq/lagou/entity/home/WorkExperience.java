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
 * 工作经历实体类（每个用户只能添加一个工作经历）
 *
 *
 */
@Entity
@Table(name="work_experience")
@EntityListeners(AuditingEntityListener.class)  //是用于监听实体类添加或者删除操作的。
public class WorkExperience extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;//工作经历所属用户
	
	@ValidateEntity(required=true,errorRequiredMsg="公司名称不能为空！")
	@Column(name="name",nullable=false)
	private String name;  //公司名称
	
	@ValidateEntity(required=true,errorRequiredMsg="职位名称不能为空！")
	@Column(name="position",nullable=false)
	private String position;  //所在公司职位
	
	@ValidateEntity(required=true,errorRequiredMsg="开始年份不能为空！")
	@Column(name="start_year",nullable=false)
	private String startYear;  //工作开始年份
	
	@ValidateEntity(required=true,errorRequiredMsg="结束年份不能为空！")
	@Column(name="end_year",nullable=false)
	private String endYear;  //工作结束年份
	
	@ValidateEntity(required=true,errorRequiredMsg="开始月份不能为空！")
	@Column(name="start_month",nullable=false)
	private String startMonth;  //工作开始月份
	
	@ValidateEntity(required=true,errorRequiredMsg="结束月份不能为空！")
	@Column(name="end_month",nullable=false)
	private String endMonth;  //工作结束月份

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
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

	public String getStartMonth() {
		return startMonth;
	}

	public void setStartMonth(String startMonth) {
		this.startMonth = startMonth;
	}

	public String getEndMonth() {
		return endMonth;
	}

	public void setEndMonth(String endMonth) {
		this.endMonth = endMonth;
	}
	
	
	
	

}
