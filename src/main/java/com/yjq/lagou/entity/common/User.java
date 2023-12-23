package com.yjq.lagou.entity.common;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.FetchType;
import javax.persistence.Lob;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.yjq.lagou.annotion.ValidateEntity;
/**
 * 用户实体类
 *
 *
 */
@Entity
@Table(name="user")
@EntityListeners(AuditingEntityListener.class)  //是用于监听实体类添加或者删除操作的。
public class User extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private static final int USER_SEX_MAN = 1;//性别男
	
	private static final int USER_SEX_WOMAN = 2;//性别女
	
	private static final int USER_SEX_UNKONW = 0;//性别未知
	
	private static final String DEFAULT_WORK_EXPERIENCE = "应届毕业生"; //默认工作经验
	private static final String DEFAULT_DEGREE = "其他"; //默认学历
	private static final String DEFAULT_HEAD_IMAGE = "common/default_img.jpg";  //默认用户头像

	
	@ValidateEntity(required=true,requiredMaxLength=true,requiredMinLength=true,minLength=1,maxLength=6,errorRequiredMsg="用户昵称不能为空!",errorMinLengthMsg="用户昵称长度需大于0!",errorMaxLengthMsg="用户昵称长度不能大于6!")
	@Column(name="username",nullable=false,length=6)
	private String username;//用户昵称
	
	@ValidateEntity(required=true,requiredMaxLength=true,requiredMinLength=true,minLength=6,maxLength=16,errorRequiredMsg="用户密码不能为空!",errorMinLengthMsg="用户密码长度需大于5!",errorMaxLengthMsg="用户密码长度不能大于16!")
	@Column(name="Password",nullable=false,length=16)
	private String Password;//用户昵称
	
	@ValidateEntity(required=true,errorRequiredMsg="用户邮箱地址不能为空!")
	@Column(name="Email",nullable=false)
	private String Email;//用户邮箱地址
	
	@ValidateEntity(required=false)
	@Column(name="head_pic",length=128)
	private String headPic = DEFAULT_HEAD_IMAGE;//用户头像
	
	@ValidateEntity(required=false)
	@Column(name="work_experience",length=10)
	private String workExperience = DEFAULT_WORK_EXPERIENCE ; //工作经验：默认是应届毕业生
	
	@ValidateEntity(required=false)
	@Column(name="degree",length=10)
	private String degree = DEFAULT_DEGREE ; //学历：默认是其他
	
	@ValidateEntity(required=false)
	@Column(name="sex",length=1)
	private int sex = USER_SEX_UNKONW;//用户性别
	
	@ValidateEntity(required=true,requiredMaxLength=true,requiredMinLength=true,minLength=11,maxLength=11,errorMinLengthMsg="请输入手机号正确的11位长度!",errorMaxLengthMsg="请输入手机号正确的11位长度!")
	@Column(name="mobile",length=12)
	private String mobile;//用户手机号
	
	@ValidateEntity(required=false)
	@Column(name="type",length=1,nullable=false)
	private Long type;//用户类别：0：应聘者，1：招聘者
	
	@Lob
    @Basic(fetch = FetchType.LAZY)   //类型为longtext
	private String content; //自我描述


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getHeadPic() {
		return headPic;
	}

	public void setHeadPic(String headPic) {
		this.headPic = headPic;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Long getType() {
		return type;
	}

	public void setType(Long type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWorkExperience() {
		return workExperience;
	}

	public void setWorkExperience(String workExperience) {
		this.workExperience = workExperience;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}
	
	
}
