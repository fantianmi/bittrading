package com.mvc.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.service.UserService;
import com.mvc.util.CookieHelper;

@Controller
@RequestMapping("/vertify.htm")
public class LoginController {
	@Autowired
	private UserService us;
	protected final transient Log log = LogFactory.getLog(LoginController.class);

	@RequestMapping
	public String vertify(HttpServletRequest request, ModelMap modelMap, HttpServletResponse response) {
		String uusername = request.getParameter("uusername");
		String upassword = request.getParameter("upassword");
		boolean flag = false;
		flag = us.vertify(uusername, upassword);
		if(uusername!=null&&upassword!=null){
			if (flag == true) {
				request.setAttribute("msg", "loginSucess");
				CookieHelper cookieHelp = new CookieHelper();
				Cookie cookieName = null;
				Cookie cookiePassword = null;
				cookieName = cookieHelp.createCookie("uusername", uusername,604800);
				cookiePassword = cookieHelp.createCookie("upassword",upassword, 604800);
				// 回写到客户端
				response.addCookie(cookieName);
				response.addCookie(cookiePassword);
				return "index";
			} else {
				modelMap.put("error", "用户名或者密码错误");
				return "login";
			}
		}else{
			modelMap.put("error", "请将信息填写完整");
			return "login";
		}
	}

	@RequestMapping(params = "Login")
	public String gLogin(ModelMap modelMap) {
		return "login";
	}
	
	@RequestMapping(params = "Register")
	public String gRegister(ModelMap modelMap) {
		return "register";
	}
}
