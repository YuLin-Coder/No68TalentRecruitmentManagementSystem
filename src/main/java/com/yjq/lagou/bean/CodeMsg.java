package com.yjq.lagou.bean;
/**
 * 错误码统一处理类，所有的错误码统一定义在这里
 *
 *
 */
public class CodeMsg {

	private int code;//错误码
	
	private String msg;//错误信息
	
	/**
	 * 构造函数私有化即单例模式
	 * 该类负责创建自己的对象，同时确保只有单个对象被创建。这个类提供了一种访问其唯一的对象的方式，可以直接访问，不需要实例化该类的对象。
	 * @param code
	 * @param msg
	 */
	public CodeMsg(int code,String msg){
		this.code = code;
		this.msg = msg;
	}
	
	public int getCode() {
		return code;
	}



	public void setCode(int code) {
		this.code = code;
	}



	public String getMsg() {
		return msg;
	}



	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	//通用错误码定义
	//处理成功消息码
	public static CodeMsg SUCCESS = new CodeMsg(0, "success");
	//公共非法数据错误码
	public static CodeMsg DATA_ERROR = new CodeMsg(-1, "非法数据！");
	public static CodeMsg VALIDATE_ENTITY_ERROR = new CodeMsg(-2, "");
	public static CodeMsg CPACHA_EMPTY = new CodeMsg(-3, "验证码不能为空!");
	public static CodeMsg CPACHA_ERROR = new CodeMsg(-4, "验证码输入错误!");
	public static CodeMsg SESSION_EXPIRED = new CodeMsg(-5, "还未登录或会话失效，请刷新页面或者重新登录！");
	public static CodeMsg UPLOAD_PHOTO_SUFFIX_ERROR = new CodeMsg(-6, "图片格式不正确！");
	public static CodeMsg UPLOAD_PHOTO_ERROR = new CodeMsg(-7, "图片上传错误！");
	public static CodeMsg SYSTEM_CPACHA_EMPTY = new CodeMsg(-8, "请先点击发送邮件验证码！");
	public static CodeMsg FOREIGN_KEY_RESTRAIN = new CodeMsg(-9, "该用户还存在外键约束，不可删除！");
	
	
	//用户数据错误码
	public static CodeMsg USER_NAME_EMPTY = new CodeMsg(-1000, "用户名不能为空");
	public static CodeMsg USER_PASSWORD_EMPTY = new CodeMsg(-1001, "密码不能为空!");
	public static CodeMsg USER_NO_EXIST = new CodeMsg(-1002, "用户不存在!");
	public static CodeMsg USER_PASSWORD_ERROR = new CodeMsg(-1003, "用户密码错误!");
	public static CodeMsg USER_EDIT_ID_EMPTY = new CodeMsg(-1004, "修改的用户不存在！请联系管理员！");
	public static CodeMsg USER_EDIT_ERROR = new CodeMsg(-1005, "修改失败！请联系管理员！");
	public static CodeMsg USER_EMAIL_EMPTY = new CodeMsg(-1006, "邮箱地址不能为空！");
	public static CodeMsg USER_EMAIL_TYPE_EMPTY = new CodeMsg(-1007, "邮件类别不能为空！请联系管理员！");
	public static CodeMsg USER_EMAIL_SEND_ERROR = new CodeMsg(-1008, "邮件发送失败！请联系管理员！");
	public static CodeMsg USER_EMAIL_TYPE_ERROR = new CodeMsg(-1009, "邮件类别获取失败！请联系管理员！");
	public static CodeMsg USER_REGISTER_TYPE_EMPTY = new CodeMsg(-1010, "注册拉勾网的目的不能为空！");
	public static CodeMsg USER_REGISTER_ERROR = new CodeMsg(-1011, "注册的目的不能为空！");
	public static CodeMsg USER_EMAIL_ALREADY_EXIST = new CodeMsg(-1012, "该邮箱已经注册了！");
	public static CodeMsg USER_NAME_ALREADY_EXIST = new CodeMsg(-1013, "该用户名已经注册了！");
	public static CodeMsg USER_EMAIL_NOT_EXIST = new CodeMsg(-1013, "该邮箱地址不存在！");
	public static CodeMsg USER_MOBILE_EMPTY = new CodeMsg(-1014, "手机号不能为空！");
	public static CodeMsg USER_SAVE_ERROR = new CodeMsg(-1015, "用户信息保存失败！请联系管理员");
	public static CodeMsg USER_UPDATE_TIME_ERROR = new CodeMsg(-1016, "最后一次修改时间更新失败！请联系管理员");
	public static CodeMsg USER_SAVE_SELF_DESCRIPTION_ERROR = new CodeMsg(-1017, "自我描述信息保存失败！请联系管理员");
	public static CodeMsg USER_MOBILE_NOT_CORRECT = new CodeMsg(-1018, "请输入正确的手机号长度的手机号！");
	public static CodeMsg USER_OLD_PASSWORD_NOT_CORRECT = new CodeMsg(-1019, "用户输入的旧密码不正确！");
	public static CodeMsg USER_NEW_PASSWORD_NOT_CORRECT = new CodeMsg(-1020, "用户输入的新密码长度要在6-16之间！");
	public static CodeMsg USER_CONFIRM_PASSWORD_NOT_CORRECT = new CodeMsg(-1021, "用户输入的确认密码和新密码不一致！");
	public static CodeMsg USER_NEW_PASSWORD_SAVE_ERROR = new CodeMsg(-1022, "新密码信息保存失败！请联系管理员！");
	
	
	
	//职业管理和职位保存错误码
	public static CodeMsg POSITION_CATEGORY_PARENT_EMPTY = new CodeMsg(-2000, "职业类别父类不能为空，请联系管理员！");
	public static CodeMsg POSITION_CATEGORY_ADD_ERROR = new CodeMsg(-2001, "职业类别添加失败，请联系管理员！");
	public static CodeMsg POSITION_CATEGORY_EDIT_ID_EMPTY = new CodeMsg(-2002, "职业类别编辑id获取失败，请联系管理员！");
	public static CodeMsg POSITION_CATEGORY_EDIT_ERROR = new CodeMsg(-2003, "职业类别编辑失败，请联系管理员！");
	public static CodeMsg POSITION_CATEGORY_DELETE_ID_EMPTY = new CodeMsg(-2004, "职业类别删除获取id失败，请联系管理员！");
	public static CodeMsg POSITION_CATEGORY_DELETE_ERROR = new CodeMsg(-2005, "职业类别删除失败，请联系管理员！");
	public static CodeMsg POSITION_CATEGORY_PARENT_DELETE_ERROR = new CodeMsg(-2006, "该职业类别有子类，请先删除子类！");
	public static CodeMsg POSITION_SAVE_ERROR = new CodeMsg(-2007, "职位保存失败，请联系管理员！");
	public static CodeMsg POSITION_MONEY_NOT_CORRECT = new CodeMsg(-2008, "职位最低薪资不能大于最高薪资！");
	public static CodeMsg POSITION_DELETE_ERROR = new CodeMsg(-2009, "职位删除失败！请联系管理员！");
	public static CodeMsg POSITION_CHANGE_STATE_TO_OUT_ERROR = new CodeMsg(-2010, "职位下线失败！请联系管理员！");
	public static CodeMsg POSITION_CHANGE_STATE_TO_WAIT_ERROR = new CodeMsg(-2010, "职位上线失败！请联系管理员！");
	public static CodeMsg POSITION_CHANGE_STATE_ERROR = new CodeMsg(-2011, "职位状态改变失败！请联系管理员！");
	
	
	//操作日志数据错误码
	public static CodeMsg OPERATERLOG_DELETE_ID_EMPTY = new CodeMsg(-3000, "获取删除操作日志id失败，请联系管理员！");
	public static CodeMsg OPERATERLOG_DELETE_ERROR = new CodeMsg(-3001, "删除操作日志失败，请联系管理员！");
	
	//简历管理数据错误码
	public static CodeMsg RESUME_EXPECT_WORK_ERROR = new CodeMsg(-4000, "期望工作信息保存失败，请联系管理员！");
	public static CodeMsg RESUME_WORK_EXPERIENCE_ERROR = new CodeMsg(-4001, "工作经历信息保存失败，请联系管理员！");
	public static CodeMsg RESUME_WORK_EXPERIENCE_COMPANY_NAME_EMPTY = new CodeMsg(-4002, "工作经历的公司名称不能为空！");
	public static CodeMsg RESUME_WORK_EXPERIENCE_POSITION_NAME_EMPTY = new CodeMsg(-4003, "工作经历的职位名称不能为空！");
	public static CodeMsg RESUME_WORK_EXPERIENCE_START_TIME_EMPTY = new CodeMsg(-4004, "工作经历的开始时间不能为空！");
	public static CodeMsg RESUME_WORK_EXPERIENCE_END_TIME_EMPTY = new CodeMsg(-4005, "工作经历的结束时间不能为空！");
	public static CodeMsg RESUME_WORK_EXPERIENCE_TIME_NOT_CORRECT = new CodeMsg(-4006, "工作经历的开始时间不能大于结束时间！");
	public static CodeMsg RESUME_PROJECT_EXPERIENCE_START_TIME_EMPTY = new CodeMsg(-4007, "项目经验的开始时间不能为空！");
	public static CodeMsg RESUME_PROJECT_EXPERIENCE_END_TIME_EMPTY = new CodeMsg(-4008, "项目经验的结束时间不能为空！");
	public static CodeMsg RESUME_PROJECT_EXPERIENCE_TIME_NOT_CORRECT = new CodeMsg(-4009, "项目经验的开始时间不能大于结束时间！");
	public static CodeMsg RESUME_PROJECT_EXPERIENCE_PROJECT_NAME_EMPTY = new CodeMsg(-4010, "项目经验的项目名称不能为空！");
	public static CodeMsg RESUME_PROJECT_EXPERIENCE_POSITION_NAME_EMPTY = new CodeMsg(-4011, "项目经验的职务名称不能为空！");
	public static CodeMsg RESUME_PROJECT_EXPERIENCE_ERROR = new CodeMsg(-4012, "项目经验信息保存失败，请联系管理员！");
	public static CodeMsg RESUME_EDUCATION_BACKGROUND_START_TIME_EMPTY = new CodeMsg(-4013, "教育背景的开始年份不能为空！");
	public static CodeMsg RESUME_EDUCATION_BACKGROUND_END_TIME_EMPTY = new CodeMsg(-4014, "教育背景的结束年份不能为空！");
	public static CodeMsg RESUME_EDUCATION_BACKGROUND_SCHOOL_NAME_EMPTY = new CodeMsg(-4015, "教育背景的学校名称不能为空！");
	public static CodeMsg RESUME_EDUCATION_BACKGROUND_MAJOR_EMPTY = new CodeMsg(-4016, "教育背景的专业名称不能为空！");
	public static CodeMsg RESUME_EDUCATION_BACKGROUND_ERROR = new CodeMsg(-4017, "教育背景信息保存失败，请联系管理员！");
	public static CodeMsg RESUME_EDUCATION_BACKGROUND_TIME_NOT_CORRECT = new CodeMsg(-4018, "教育背景的开始年份不能大于结束年份！");
	public static CodeMsg RESUME_WORK_SHOW_SAVE_ERROR = new CodeMsg(-4019, "作品展示信息保存失败！请联系管理员！");
	public static CodeMsg RESUME_ALREADY_SUBMIT = new CodeMsg(-4020, "该职位已经提交过简历，请换一个职位吧！");
	public static CodeMsg RESUME_STATE_SAVE_ERROR = new CodeMsg(-4021, "简历状态信息保存失败！请联系管理员！");
	public static CodeMsg RESUME_DELETE_ERROR = new CodeMsg(-4022, "简历删除失败！请联系管理员！");
	public static CodeMsg RESUME_WRITE_NOT_COMPLETE = new CodeMsg(-4023, "简历填写不完整，请先完善简历！");
	
	
	//公司管理类错误码
	public static CodeMsg COMPANY_NAME_EMPTY = new CodeMsg(-5000, "公司名称不能为空！");
	public static CodeMsg COMPANY_VALUE_EMPTY = new CodeMsg(-5001, "公司价值观不能为空！");
	public static CodeMsg COMPANY_NAME_WORD_OVER = new CodeMsg(-5002, "公司名称字数不能超过30个！");
	public static CodeMsg COMPANY_VALUE_WORD_OVER= new CodeMsg(-5003, "公司价值观字数不能超过50个！");
	public static CodeMsg COMPANY_NAME_ALREADY_EXIST= new CodeMsg(-5004, "公司名称已经存在，请换一个！");
	public static CodeMsg COMPANY_NAME_AND_VALUE_SAVE_ERROR= new CodeMsg(-5005, "公司名称和价值观保存失败，请联系管理员！");
	public static CodeMsg COMPANY_TAGS_SAVE_ERROR= new CodeMsg(-5006, "公司标签保存失败，请联系管理员！");
	public static CodeMsg COMPANY_TAGS_WORD_OVER = new CodeMsg(-5007, "公司标签字数不能超过30个！");
	public static CodeMsg COMPANY_NAME_AND_VALUE_PRIORITY = new CodeMsg(-5008, "请先填写公司名称和价值观！");
	public static CodeMsg COMPANY_PRODUCT_NAME_WORD_OVER = new CodeMsg(-5009, "公司产品标题字数不能超过11个！");
	public static CodeMsg COMPANY_PRODUCT_SAVE_ERROR = new CodeMsg(-5010, "公司产品信息保存失败！请联系管理！");
	public static CodeMsg COMPANY_INTRODUCTION_SAVE_ERROR = new CodeMsg(-5011, "公司介绍信息保存失败！请联系管理！");
	public static CodeMsg COMPANY_LOCALE_EMPTY = new CodeMsg(-5012, "公司地点不能为空！");
	public static CodeMsg COMPANY_TERRITORY_EMPTY = new CodeMsg(-5013, "公司领域不能为空！");
	public static CodeMsg COMPANY_URL_EMPTY = new CodeMsg(-5014, "公司网址不能为空！");
	public static CodeMsg COMPANY_BASIC_SAVE_ERROR = new CodeMsg(-5015, "公司地点、领域、规模和网页信息保存失败！请联系管理！");
	public static CodeMsg COMPANY_SCALE_EMPTY = new CodeMsg(-5016, "公司规模不能为空！");
	public static CodeMsg COMPANY_FINANCE_SAVE_ERROR = new CodeMsg(-5017, "公司融资阶段信息保存失败！请联系管理员！");
	public static CodeMsg COMPANY_FOUNDER_SAVE_ERROR = new CodeMsg(-5018, "公司创始人信息保存失败！请联系管理员！");
	public static CodeMsg COMPANY_FOUNDER_NAME_EMPTY = new CodeMsg(-5019, "公司创始人姓名不能为空！");
	public static CodeMsg COMPANY_FOUNDER_POSITION_EMPTY = new CodeMsg(-5020, "公司创始人职位不能为空！");
	public static CodeMsg COMPANY_FOUNDER_NAME_WORD_OVER = new CodeMsg(-5021, "公司创始人姓名字数不能大于10个！");
	public static CodeMsg COMPANY_FOUNDER_POSITION_WORD_OVER = new CodeMsg(-5022, "公司创始人职位字数不能大于15个！");
	public static CodeMsg COMPANY_APPLY_SAVE_ERROR = new CodeMsg(-5023, "公司认证信息保存失败，请联系管理员！");
	public static CodeMsg COMPANY_CHANGE_STATE_ERROR = new CodeMsg(-5024, "公司状态改变失败！请联系管理员！");
}
