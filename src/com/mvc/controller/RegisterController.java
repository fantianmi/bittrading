package com.mvc.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mvc.entity.Btc_user;
import com.mvc.service.UserService;
import com.mvc.util.CookieHelper;

@Controller
@RequestMapping("/register.htm")
public class RegisterController {
	@Autowired
	private UserService us;
	protected final transient Log log = LogFactory.getLog(RegisterController.class);

	@RequestMapping
	public String registerStep1(HttpServletRequest request, HttpServletResponse response,  ModelMap modelMap) throws IOException {
		Btc_user userVertify = new Btc_user();
		Btc_user user = new Btc_user();
		String uusername = request.getParameter("uusername");
		String upassword = request.getParameter("upassword");
		SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd hh:mm:ss");
		String usdtime = format.format(new Date());
		String uemail = request.getParameter("uemail");
		userVertify = us.getByUsername(uusername);
		if(userVertify==null){
			CookieHelper cookieHelp = new CookieHelper();
			Cookie cookieName = null;
			Cookie cookiePassword = null;
			cookieName = cookieHelp.createCookie("uusername", uusername,604800);
			cookiePassword = cookieHelp.createCookie("upassword",upassword, 604800);
			// 回写到客户端
			response.addCookie(cookieName);
			response.addCookie(cookiePassword);
			
			user.setUusername(uusername);
			user.setUpassword(upassword);
			user.setUsdtime(usdtime);
			user.setUemail(uemail);
			try{
				us.register_step1(user);
				request.setAttribute("msg", "注册成功!点击[确定]回到首页");
				request.setAttribute("href", "index.htm");
				return "index";
			}
			catch(Exception e){
				log.error(e.getMessage());
				modelMap.put("regisetState", "注册失败，请确认信息填写准确！");
				return "register";
			}
		}else{
			request.setAttribute("msg", "对不起，该用户名已被注册！");
			return "register";
		}
	}
	
	@RequestMapping(params = "promote")
	public String promoteRegister(HttpServletResponse response, HttpServletRequest request, ModelMap modelmap) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String uusername = session.getAttribute("uusername").toString();
		Btc_user user = us.getByUsername(uusername);
		String utpassword = request.getParameter("utpassword");
		String usafequestion = request.getParameter("usafequestion");
		String usafequestionanswer = request.getParameter("usafequestionanswer");
		String uname = request.getParameter("uname");
		String uphone = request.getParameter("uphone");
		String ucertification = request.getParameter("ucertification");
		String ucertificationcategory = request.getParameter("ucertificationcategory");
		user.setUtpasswod(utpassword);
		user.setUsafequestion(usafequestion);
		user.setUsafequestionanswer(usafequestionanswer);
		user.setUname(uname);
		user.setUphone(uphone);
		user.setUcertification(ucertification);
		user.setUcertificationcategory(ucertificationcategory);
		us.register_step2(user);
		request.setAttribute("msg", "谢谢完善资料，现在您可以开始自由交易了!点击[确定]回到首页");
		request.setAttribute("href", "index.htm");
		
		return "index";
	}
	
	@RequestMapping(params = "Login")
	public String gLogin(ModelMap modelMap) {
		return "login";
	}
	
	@RequestMapping(params = "step2")
	public String registerStep2(ModelMap modelMap) {
		return "login";
	}
}
