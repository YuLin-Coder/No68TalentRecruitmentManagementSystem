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
import com.yjq.lagou.entity.common.Company;
import com.yjq.lagou.entity.common.Position;
import com.yjq.lagou.entity.common.User;
/**
 * 投递简历实体类
 *
 *
 */
@Entity
@Table(name="resume")
@EntityListeners(AuditingEntityListener.class)  //是用于监听实体类添加或者删除操作的。
public class Resume extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private static final String DEFAULT_POSITION_STATE = "wait"; //默认职位的状态 wait:待处理  out:不合适   effective:通知面试
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;//投递简历所属用户
	
	@ManyToOne
	@JoinColumn(name="position_id")
	private Position position;//投递简历所属职位
	
	@ManyToOne
	@JoinColumn(name="company_id")
	private Company company;//投递简历所属公司
	
	@ValidateEntity(required=false)
	@Column(name="state",nullable=false)
	private String state = DEFAULT_POSITION_STATE;  //职位状态

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Position getPosition() {
		return position;
	}

	public void setPosition(Position position) {
		this.position = position;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	
	
	
	
}
