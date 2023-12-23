package com.yjq.lagou.controller.common;

import java.io.IOException;
import java.util.Properties;

import javax.imageio.ImageIO;
import javax.mail.Address;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yjq.lagou.bean.CodeMsg;
import com.yjq.lagou.bean.Result;
import com.yjq.lagou.util.CpachaUtil;

/**
 * 系统验证码公用控制器
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/common/cpacha")
public class CpachaController {

	private Logger log = LoggerFactory.getLogger(CpachaController.class);
	
	@Value("${yjq.sender.email.username}")
	private String username;  //发件人的邮件帐户
	
	@Value("${yjq.sender.email.password}")
	private String password;  //发件人的邮件密码
	
	@Value("${yjq.sender.email.address}")
	private String senderAddress;  //发件人的邮件地址

	
	/**
	 * 通用验证码生成器
	 * @param vcodeLength
	 * @param fontSize
	 * @param width
	 * @param height
	 * @param method
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/generate_cpacha",method=RequestMethod.GET)
	public void generateCpacha(
			@RequestParam(name="vl",defaultValue="4")Integer vcodeLength,//vcodeLength,验证码长度
			@RequestParam(name="fs",defaultValue="21")Integer fontSize,//fontSize,验证码字体大小
			@RequestParam(name="w",defaultValue="98")Integer width,//width,图片宽度
			@RequestParam(name="h",defaultValue="33")Integer height,//height,图片高度
			@RequestParam(name="method")String method,//用来调用此方法的名称，以此名称为键，存入到session中
			HttpServletRequest request,
			HttpServletResponse response){
		CpachaUtil cpachaUtil = new CpachaUtil(vcodeLength,fontSize,width,height);
		String generatorVCode = cpachaUtil.generatorVCode(); //验证码的值
		//将生成的验证码放入session，以供放后面程序的验证使用
		request.getSession().setAttribute(method, generatorVCode);
		log.info("验证码成功生成，method=" + method + ",value=" + generatorVCode);
		try {
			ImageIO.write(cpachaUtil.generatorRotateVCodeImage(generatorVCode, true), "gif", response.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/generate_emailCpacha",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> generateEmailCpacha(HttpServletRequest request,String receiver,String type)
	{
		//判断接收人邮箱地址是否为空
		if(receiver == null || "".equals(receiver))
		{
			return Result.error(CodeMsg.USER_EMAIL_EMPTY);
		}
		//判断邮件类别是否为空
		if(type == null || "".equals(type))
		{
			return Result.error(CodeMsg.USER_EMAIL_TYPE_EMPTY);
		}
		//定义Properties对象,设置环境信息
		Properties props = System.getProperties();
		//设置邮件服务器的地址
		props.setProperty("mail.smtp.host", "smtp.163.com"); // 指定的smtp服务器
		props.setProperty("mail.smtp.auth", "true");
		props.setProperty("mail.transport.protocol", "smtp");//设置发送邮件使用的协议
		//创建Session对象,session对象表示整个邮件的环境信息
		Session session = Session.getInstance(props);
		//设置输出调试信息
		session.setDebug(true);
		try {
			//Message的实例对象表示一封电子邮件
			MimeMessage message = new MimeMessage(session);
			//设置发件人的地址
			message.setFrom(new InternetAddress(senderAddress));
			
			//如果邮件类别是用户注册验证
			if("user_register".equals(type))
			{
				//设置主题
				message.setSubject("用户注册邮箱验证");
				
				//获取邮箱验证码
				CpachaUtil cpachaUtil = new CpachaUtil(4);
				String generatorVCode = cpachaUtil.generatorVCode(); //验证码的值
				request.getSession().setAttribute(type, generatorVCode);
				log.info("邮箱验证码成功生成，method=" + type + ",value=" + generatorVCode);
				//设置邮件的文本内容
				//message.setText("Welcome to JavaMail World!");
				message.setContent((generatorVCode),"text/html;charset=utf-8");
			}else {
				return Result.error(CodeMsg.USER_EMAIL_TYPE_ERROR);
			}
			
			//设置附件
			//message.setDataHandler(dh);
			
			//从session的环境中获取发送邮件的对象
			Transport transport=session.getTransport();
			//连接邮件服务器
			transport.connect("smtp.163.com",25, username, password);
			//设置收件人地址,并发送消息
			transport.sendMessage(message,new Address[]{new InternetAddress(receiver)});
			transport.close();
		} catch (MessagingException e) {
			e.printStackTrace();
			return Result.error(CodeMsg.USER_EMAIL_SEND_ERROR);
		}
		
		return Result.success(true);
	}
}
