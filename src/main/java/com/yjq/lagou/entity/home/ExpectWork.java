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
 * 期望工作实体类(每个用户最多填一个期望工作)
 *
 *
 */
@Entity
@Table(name="expect_work")
@EntityListeners(AuditingEntityListener.class)  //是用于监听实体类添加或者删除操作的。
public class ExpectWork extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String DEFAULT_TYPE = "全职"; //默认期望工作的性质
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;//期望工作所属用户
	
	@ValidateEntity(required=false)
	@Column(name="city")
	private String city;  //期望工作城市
	
	@ValidateEntity(required=false)
	@Column(name="position")
	private String position;  //期望工作职位
	
	@ValidateEntity(required=false)
	@Column(name="money")
	private String money;  //期望工作月薪

	@ValidateEntity(required=false)
	@Column(name="type")
	private String type = DEFAULT_TYPE;  //期望工作的性质


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getPosition() {
		return position;
	}


	public void setPosition(String position) {
		this.position = position;
	}


	public String getMoney() {
		return money;
	}


	public void setMoney(String money) {
		this.money = money;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	
	
	
}
