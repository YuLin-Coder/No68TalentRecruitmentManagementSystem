package com.yjq.lagou.entity.admin;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.yjq.lagou.entity.common.BaseEntity;
/**
 * 公共日志类
 *
 *
 */
@Entity
@Table(name="operater_log")
@EntityListeners(AuditingEntityListener.class)  //是用于监听实体类添加或者删除操作的。
public class OperaterLog extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	@Column(name="operator",nullable=false,length=18)
	private String operator;//操作者
	
	@Column(name="content",nullable=false,length=512)
	private String content;//操作日志内容

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	
}
