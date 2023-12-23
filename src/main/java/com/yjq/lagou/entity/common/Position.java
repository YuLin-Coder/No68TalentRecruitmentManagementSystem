package com.yjq.lagou.entity.common;

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
/**
 * 职位实体类
 *
 *
 */
@Entity
@Table(name="position")
@EntityListeners(AuditingEntityListener.class)  //是用于监听实体类添加或者删除操作的。
public class Position extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private static final String DEFAULT_WORK_TYPE = "全职"; //默认职位工作的性质
	
	private static final String DEFAULT_POSITION_STATE = "wait"; //默认职位的状态 wait:待审核  out:已下线   effective:有效
	
	
	@ManyToOne
	@JoinColumn(name="company_id")
	private Company company;//职位所属公司
	
	@ValidateEntity(required=true,requiredMaxLength=true,requiredMinLength=true,minLength=1,maxLength=18,errorRequiredMsg="职位类别不能为空!",errorMinLengthMsg="职位类别长度需大于0!",errorMaxLengthMsg="职位类别长度不能大于18!")
	@Column(name="type",nullable=false,length=18)
	private String type;//职位类别
	
	@ValidateEntity(required=true,requiredMaxLength=true,requiredMinLength=true,minLength=1,maxLength=18,errorRequiredMsg="职位名称不能为空!",errorMinLengthMsg="职位名称长度需大于0!",errorMaxLengthMsg="职位名称长度不能大于18!")
	@Column(name="name",nullable=false,length=18)
	private String name;//职位名称
	
	@ValidateEntity(required=false)
	@Column(name="department")
	private String department;//职位所属部门

	@ValidateEntity(required=false)
	@Column(name="work_type",nullable=false)
	private String workType = DEFAULT_WORK_TYPE;  //职位工作的性质
	
	@ValidateEntity(required=true,requiredMaxValue=true,requiredMinValue=true,minValue=1,maxValue=1000,errorRequiredMsg="职位最低薪资不能为空!",errorMinValueMsg="职位最低薪资要大于0k!",errorMaxValueMsg="职位最低薪资不能大于1000k!")
	@Column(name="min_money",nullable=false)
	private int minMoney;  //职位最低薪资(以k为单位)
	
	@ValidateEntity(required=true,requiredMaxValue=true,requiredMinValue=true,minValue=1,maxValue=1000,errorRequiredMsg="职位最高薪资不能为空!",errorMinValueMsg="职位最高薪资要大于0k!",errorMaxValueMsg="职位最高薪资不能大于1000k!")
	@Column(name="max_money",nullable=false)
	private int maxMoney;  //职位最高薪资(以k为单位)
	
	@ValidateEntity(required=true,errorRequiredMsg="职位工作城市不能为空!")
	@Column(name="city",nullable=false)
	private String city;  //职位工作城市
	
	@ValidateEntity(required=true,errorRequiredMsg="职位工作经验要求不能为空!")
	@Column(name="work_experience",nullable=false)
	private String workExperience;  //职位工作经验要求
	
	@ValidateEntity(required=true,errorRequiredMsg="职位学历要求不能为空!")
	@Column(name="degree",nullable=false)
	private String degree;  //职位学历要求
	
	@ValidateEntity(required=true,errorRequiredMsg="职位诱惑不能为空!")
	@Column(name="advantage",nullable=false)
	private String advantage;  //职位诱惑
	
	@ValidateEntity(required=false)
	@Column(name="state",nullable=false)
	private String state = DEFAULT_POSITION_STATE;  //职位状态
	
	@ValidateEntity(required=true,errorRequiredMsg="职位描述不能为空!")
	@Lob
    @Basic(fetch = FetchType.LAZY)   //类型为longtext
	private String description; //职位描述
	
	@ValidateEntity(required=true,errorRequiredMsg="职位工作地址不能为空!")
	@Column(name="address",nullable=false)
	private String address;  //职位工作地址
	
	@ValidateEntity(required=false)
	@Column(name="number")
	private int number = 0;  //职位接收工作简历的个数

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getWorkType() {
		return workType;
	}

	public void setWorkType(String workType) {
		this.workType = workType;
	}

	public int getMinMoney() {
		return minMoney;
	}

	public void setMinMoney(int minMoney) {
		this.minMoney = minMoney;
	}

	public int getMaxMoney() {
		return maxMoney;
	}

	public void setMaxMoney(int maxMoney) {
		this.maxMoney = maxMoney;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
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

	public String getAdvantage() {
		return advantage;
	}

	public void setAdvantage(String advantage) {
		this.advantage = advantage;
	}


	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}
	
	
	
	
	
}
