package com.mvc.controller;

import java.math.BigDecimal;
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
import com.mvc.entity.Btc_deal_list;
import com.mvc.entity.Btc_user;
import com.mvc.service.AccountService;
import com.mvc.service.DealService;
import com.mvc.service.IndexService;
import com.mvc.service.RechargeService;
import com.mvc.service.UserService;
import com.mvc.util.CookieHelper;

@Controller
@RequestMapping("/index.htm")
public class IndexController {
	@Autowired
	private UserService us = new UserService();
	@Autowired
	private IndexService is = new IndexService();
	@Autowired
	private AccountService as = new AccountService();
	@Autowired
	private RechargeService rs = new RechargeService();
	@Autowired
	private DealService ds = new DealService();
	
	protected final transient Log log = LogFactory
	.getLog(IndexController.class);
	
	@RequestMapping
	public String load(ModelMap modelMap, HttpServletRequest request){
		CookieHelper cookieHelp = new CookieHelper();
		HttpSession session = request.getSession();
		Btc_deal_list bdl_show = ds.queryLatestDealOrder();
		BigDecimal latestDealOrder_show = bdl_show.getBtc_deal_Rate();
		session.setAttribute("latestDealOrder", latestDealOrder_show);
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
			Btc_account_book abook = as.getByUidForAcount(user.getUid());
			if(abook == null){
				session.setAttribute("ab_cny", "0.00");
				session.setAttribute("ab_btc", "0.0000");
				session.setAttribute("total_assets", "0.00");
			}else{
				BigDecimal ab_cny_show = abook.getAb_cny().setScale(2, BigDecimal.ROUND_HALF_UP); 
				BigDecimal ab_btc_show = abook.getAb_btc().setScale(4, BigDecimal.ROUND_HALF_UP); 
				Btc_deal_list bdl = ds.queryLatestDealOrder();
				BigDecimal latestDealOrder = bdl.getBtc_deal_Rate();
				BigDecimal total_assets_show = ab_btc_show.multiply(latestDealOrder).add(ab_cny_show).setScale(2, BigDecimal.ROUND_HALF_UP);
				session.setAttribute("ab_cny", ab_cny_show);
				session.setAttribute("ab_btc", ab_btc_show);
				session.setAttribute("total_assets", total_assets_show);
			}
		}
		if(is.listBuyingOrders()!=null){
			List<Object> btc_rechargeBTC_order_list = is.listBuyingOrders();
			session.setAttribute("buyingOders", btc_rechargeBTC_order_list);
		}else{
			session.setAttribute("buyingOders", null);
		}
		if(is.listSellOrders()!=null){
			List<Object> btc_sellBTC_order_list = is.listSellOrders();
			session.setAttribute("sellOders", btc_sellBTC_order_list);
		}else{
			Btc_deal_list bdl = ds.queryLatestDealOrder();
			session.setAttribute("sellOders", null);
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
		String username = session.getAttribute("uusername").toString();
		session.removeAttribute("uusername");
		session.removeAttribute("uname");
		session.removeAttribute("isRegister2");
		session.removeAttribute("ab_cny");
		session.removeAttribute("ab_btc");
		log.info(username+"已安全退出");
		request.setAttribute("msg", "已安全退出");
		request.setAttribute("href", "index.htm");
		return "index";
	}
	
	@RequestMapping(params = "rechargeBTC")
	public String buybtc(ModelMap modelmap, HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		if(session.getAttribute("uusername").toString()== null){
			request.setAttribute("msg", "登陆后才能进行此操作！");
			request.setAttribute("href", "index.htm");
			return "index";
		}else{
			String uusername = session.getAttribute("uusername").toString();
			Btc_user user = us.getByUsername(uusername);
			if(user.getUname()==null&&user.getUcertification()==null){
				return "register2";
			}else{
				return "rechargeBTC";
			}
		}
	}
	
	@RequestMapping(params = "recharge")
	public String recharge(ModelMap modelmap, HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		if(session.getAttribute("uusername").toString()== null){
			request.setAttribute("msg", "登陆后才能进行此操作！");
			request.setAttribute("href", "index.htm");
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
	
	@RequestMapping(params = "withdrawCNY")
	public String recharge(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		if(session.getAttribute("uusername").toString()== null){
			request.setAttribute("msg", "登陆后才能进行此操作！");
			request.setAttribute("href", "index.htm");
			return "index";
		}else{
			String uusername = session.getAttribute("uusername").toString();
			Btc_user user = us.getByUsername(uusername);
			if(user.getUname()==null&&user.getUcertification()==null){
				return "register2";
			}else{
				return "withdrawCNY";
			}
		}
	}
}
