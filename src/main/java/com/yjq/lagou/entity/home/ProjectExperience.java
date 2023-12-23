package com.yjq.lagou.entity.home;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.yjq.lagou.annotion.ValidateEntity;
import com.yjq.lagou.entity.common.BaseEntity;
import com.yjq.lagou.entity.common.User;
/**
 * 项目经验实体类(每个用户只能填一个项目经验)
 *
 *
 */
@Entity
@Table(name="project_experience")
@EntityListeners(AuditingEntityListener.class)  //是用于监听实体类添加或者删除操作的。
public class ProjectExperience extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;//项目经验所属用户
	
	@ValidateEntity(required=true,errorRequiredMsg="项目名称不能为空！")
	@Column(name="name",nullable=false)
	private String name;  //项目名称
	
	@ValidateEntity(required=true,errorRequiredMsg="担任职务不能为空！")
	@Column(name="position",nullable=false)
	private String position;  //所在项目担任职务
	
	@ValidateEntity(required=true,errorRequiredMsg="开始年份不能为空！")
	@Column(name="start_year",nullable=false)
	private String startYear;  //项目经验开始年份
	
	@ValidateEntity(required=true,errorRequiredMsg="结束年份不能为空！")
	@Column(name="end_year",nullable=false)
	private String endYear;  //项目经验结束年份
	
	@ValidateEntity(required=true,errorRequiredMsg="开始月份不能为空！")
	@Column(name="start_month",nullable=false)
	private String startMonth;  //项目经验开始月份
	
	@ValidateEntity(required=true,errorRequiredMsg="结束月份不能为空！")
	@Column(name="end_month",nullable=false)
	private String endMonth;  //项目经验结束月份
	
	@Lob
    @Basic(fetch = FetchType.LAZY)   //类型为longtext
	private String content; //项目描述

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
