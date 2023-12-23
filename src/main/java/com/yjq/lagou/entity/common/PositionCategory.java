package com.yjq.lagou.entity.common;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.yjq.lagou.annotion.ValidateEntity;

/**
 * 职位类别实体类
 *
 *
 */
@Entity
@Table(name="position_category")
@EntityListeners(AuditingEntityListener.class)  //是用于监听实体类添加或者删除操作的。
public class PositionCategory extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@ManyToOne   //多个子类对应一个父类
	@JoinColumn(name="parent_id")
	private PositionCategory parentId;//菜单父分类
	
	private Long _parentId;
	
	@ValidateEntity(required=true,requiredMaxLength=true,requiredMinLength=true,minLength=1,maxLength=18,errorRequiredMsg="职位类别名称不能为空!",errorMinLengthMsg="职位类别名称长度需大于0!",errorMaxLengthMsg="职位类别名称长度不能大于18!")
	@Column(name="name",nullable=false,length=18)
	private String name;//职位类别名称
	
	@ValidateEntity(required=false)
	@Column(name="url",length=128)
	private String url;//职位类别url

	

	public PositionCategory getParentId() {
		return parentId;
	}

	public void setParentId(PositionCategory parentId) {
		this.parentId = parentId;
	}

	public Long get_parentId() {
		return _parentId;
	}

	public void set_parentId(Long _parentId) {
		this._parentId = _parentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "PositionCategory [parentId=" + parentId + ", _parentId=" + _parentId + ", name=" + name + ", url=" + url
				+ "]";
	}
	
	
	
}
