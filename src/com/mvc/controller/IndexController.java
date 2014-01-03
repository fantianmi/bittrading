package com.mvc.controller;

import java.util.List;

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

import com.mvc.entity.Btc_account_book;
import com.mvc.entity.Btc_user;
import com.mvc.service.RechargeService;
import com.mvc.service.UserService;
import com.mvc.util.CookieHelper;

@Controller
@RequestMapping("/index.htm")
public class IndexController {
	@Autowired
	private UserService us = new UserService();
	@Autowired
	private RechargeService rs = new RechargeService();
	protected final transient Log log = LogFactory
	.getLog(IndexController.class);
	
	@RequestMapping
	public String load(ModelMap modelMap, HttpServletRequest request){
		CookieHelper cookieHelp = new CookieHelper();
		HttpSession session = request.getSession();
		boolean cookie_username_flag = false;
		boolean cookie_password_flag = false;
		cookie_username_flag = cookieHelp.searchCookie(request,"uusername");
		cookie_password_flag = cookieHelp.searchCookie(request,"upassword");
		if((cookie_username_flag==true)&&(cookie_password_flag==true)){
			String uusername = cookieHelp.getCookie(request, "uusername").getValue();
			Btc_user user = us.getByUsername(uusername);
			if(user.getUname()==null){
				session.setAttribute("isRegister2", "false");
			}else{
				session.setAttribute("isRegister2", "true");
			}
			
			session.setAttribute("uusername", user.getUusername());
			session.setAttribute("uname", user.getUname());
			session.setAttribute("uid", user.getUid());
			Btc_account_book abook = rs.getByUidForAcount(user.getUid());
			if(abook == null){
				session.setAttribute("ab_cny", "0.00");
				session.setAttribute("ab_btc", "0.00");
			}else{
				session.setAttribute("ab_btc", abook.getAb_btc());
				session.setAttribute("ab_cny", abook.getAb_cny());
			}
		}
		return "index";
	}
	@RequestMapping(params = "Login")
	public String gLogin(ModelMap modelMap, HttpServletRequest request){
		HttpSession session = request.getSession();
		if(session.getAttribute("uusername")!=null){
			return "index";
		}else{
			return "login";
		}
	}
	
	@RequestMapping(params = "logout")
	public String logout(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();
		CookieHelper cookieHelp = new CookieHelper();
		Cookie cookieName=cookieHelp.removeCookie(request,"uusername");
		Cookie cookiePassword=cookieHelp.removeCookie(request,"upassword");
		response.addCookie(cookieName);
		response.addCookie(cookiePassword);
		session.removeAttribute("uusername");
		session.removeAttribute("uname");
		session.removeAttribute("isRegister2");
		request.setAttribute("msg", "logoutSucess");
		return "index";
	}
	
	@RequestMapping(params = "buybtc")
	public String buybtc(ModelMap modelmap, HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		if(session.getAttribute("uusername").toString()== null){
			request.setAttribute("msg", "loginfirst");
			return "index";
		}else{
			String uusername = session.getAttribute("uusername").toString();
			Btc_user user = us.getByUsername(uusername);
			if(user.getUname()==null&&user.getUcertification()==null){
				return "register2";
			}else{
				return "buybtc";
			}
		}
	}
	
	@RequestMapping(params = "recharge")
	public String recharge(ModelMap modelmap, HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		if(session.getAttribute("uusername").toString()== null){
			request.setAttribute("msg", "loginfirst");
			return "index";
		}else{
			String uusername = session.getAttribute("uusername").toString();
			Btc_user user = us.getByUsername(uusername);
			if(user.getUname()==null&&user.getUcertification()==null){
				return "register2";
			}else{
				int uid = Integer.parseInt(session.getAttribute("uid").toString());
				List<Object> listOrder = rs.getByUidForOrders(uid);
				modelmap.put("listOrder", listOrder);
				return "rechargeCNY";
			}
		}
	}
}
