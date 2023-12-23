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
/**
 * 公司实体类
 *
 *
 */
@Entity
@Table(name="company")
@EntityListeners(AuditingEntityListener.class)  //是用于监听实体类添加或者删除操作的。
public class Company extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private static final String DEDAULT_STATE = "未认证"; //默认公司申请状态
	private static final String DEDAULT_FINANCE = "未融资"; //默认公司融资阶段
	private static final String DEDAULT_PHOTO = "common/logo_default.png"; //默认公司图片
	private static final String DEDAULT_PRODUCT_PHOTO = "common/product_default.png"; //默认公司产品图片
	private static final String DEFAULT_FOUNDER_PHOTO = "common/default_headpic.png";  //默认创始人头像
	
	@Column(name="name",length=30)
	private String name;//公司名称
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;//公司申请认证所属用户
	
	@Column(name="value",length=50)
	private String value;//公司价值观
	
	@Column(name="tags",length=30)
	private String tags;//公司标签
	
	@Column(name="state",length=10)
	private String state = DEDAULT_STATE; //公司申请状态：待审核、未认证、已认证
	
	@Column(name="photo",length=128)
	private String photo = DEDAULT_PHOTO;//公司图片
	
	@Column(name="product_photo",length=128)
	private String productPhoto = DEDAULT_PRODUCT_PHOTO;//公司产品图片
	
	@Column(name="product_title",length=15)
	private String productTitle;//公司产品标题
	
	@Lob
    @Basic(fetch = FetchType.LAZY)   //类型为longtext
	private String productContent; //产品简介
	
	@Lob
    @Basic(fetch = FetchType.LAZY)   //类型为longtext
	private String introduction; //公司介绍
	
	@Column(name="locale")
	private String locale;//公司地点
	
	@Column(name="territory")
	private String territory;//公司领域
	
	@Column(name="scale")
	private String scale;//公司规模
	
	@Column(name="url")
	private String url;//公司主页网址
	
	@Column(name="finance")
	private String finance = DEDAULT_FINANCE;//公司默认融资阶段
	
	@Column(name="founder_name",length=10)
	private String founderName;//公司创始人姓名
	
	@Column(name="founder_position",length=15)
	private String founderPosition;//公司创始人职位
	
	
	
	@Column(name="founder_photo",length=128)
	private String founderPhoto = DEFAULT_FOUNDER_PHOTO;//创始人头像

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getProductPhoto() {
		return productPhoto;
	}

	public void setProductPhoto(String productPhoto) {
		this.productPhoto = productPhoto;
	}

	public String getProductTitle() {
		return productTitle;
	}

	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}

	public String getProductContent() {
		return productContent;
	}

	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getLocale() {
		return locale;
	}

	public void setLocale(String locale) {
		this.locale = locale;
	}

	public String getTerritory() {
		return territory;
	}

	public void setTerritory(String territory) {
		this.territory = territory;
	}

	public String getScale() {
		return scale;
	}

	public void setScale(String scale) {
		this.scale = scale;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getFinance() {
		return finance;
	}

	public void setFinance(String finance) {
		this.finance = finance;
	}

	public String getFounderName() {
		return founderName;
	}

	public void setFounderName(String founderName) {
		this.founderName = founderName;
	}

	public String getFounderPosition() {
		return founderPosition;
	}

	public void setFounderPosition(String founderPosition) {
		this.founderPosition = founderPosition;
	}

	
	public String getFounderPhoto() {
		return founderPhoto;
	}

	public void setFounderPhoto(String founderPhoto) {
		this.founderPhoto = founderPhoto;
	}
	
	
	
}
