package com.mvc.controller;

import java.math.BigDecimal;
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

import com.mvc.entity.Btc_rechargeBTC_order;
import com.mvc.entity.Btc_rechargeCNY_order;
import com.mvc.entity.Btc_user;
import com.mvc.service.RechargeService;
import com.mvc.service.UserService;
import com.mvc.util.CookieHelper;

@Controller
@RequestMapping("/recharge.htm")
public class RechargeController {
	@Autowired
	private UserService us = new UserService();
	@Autowired
	private RechargeService rs = new RechargeService();
	protected final transient Log log = LogFactory
	.getLog(RechargeController.class);
	
	@RequestMapping
	public String load(ModelMap modelMap, HttpServletRequest request){
		return "index";
	}
	@RequestMapping(params = "CNY")
	public String rechargeCNY(ModelMap modelMap, HttpServletRequest request){
		HttpSession session = request.getSession();
		if(session.getAttribute("uusername")!=null){
			String uusername = session.getAttribute("uusername").toString();
			if(request.getParameter("utpassword")==null){
				request.setAttribute("msg", "utpasswordwrong");
				return "rechargeCNY";
			}else{
				String utpassword = request.getParameter("utpassword").toString();
				Btc_user user = us.getByUsername(uusername);
				if(user.getUtpasswod()== utpassword) {
					System.out.println("****************"+user.getUtpasswod()+"="+utpassword);
					request.setAttribute("msg", "utpasswordwrong");
					return "rechargeCNY";
				}else{
					BigDecimal bro_recharge_acount = new BigDecimal(request.getParameter("bro_recharge_acount").toString());
					BigDecimal bro_factorage = bro_recharge_acount.multiply(new BigDecimal(0.003));
					String bro_sname = request.getParameter("bro_sname").toString();
					String bro_recharge_way = request.getParameter("bro_recharge_way").toString();	
					SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd hh:mm:ss");
					String bro_recharge_time = format.format(new Date());
					int uid = user.getUid();
					Btc_rechargeCNY_order bro = new Btc_rechargeCNY_order();
					bro.setBro_recharge_acount(bro_recharge_acount);
					bro.setBro_sname(bro_sname);
					bro.setBro_recharge_time(bro_recharge_time);
					bro.setBro_recharge_way(bro_recharge_way);
					bro.setUid(uid);
					bro.setBro_factorage(bro_factorage);
					rs.rechargeCNY(bro);
					request.setAttribute("msg", "rechargesucess");
					return "index";
				}
			}
		}else{
			request.setAttribute("msg", "loginfirst");
			return "login";
		}
	}
	
	/**
	 * 选择买入比特币链接，判断符合条件才能进入充值界面
	 * @param modelmap
	 * @param request
	 * @param response
	 * @return
	 */
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
	
	/**
	 * 选择充值人民币链接，判断符合要求才能进入充值页面
	 * @param modelmap
	 * @param request
	 * @param response
	 * @return
	 */
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
				return "recharge";
			}
		}
	}
	
	/**
	 * 生成比特币充值订单
	 * @param modelmap
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "recharge_BTC")
	public String recharge_btc(ModelMap modelmap, HttpServletRequest request, HttpServletResponse response){
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
				BigDecimal bro_btc_buyingRate = new BigDecimal(request.getParameter("buyingRate").toString());
				BigDecimal bro_btc_buyQuantity = new BigDecimal(request.getParameter("buyQuantity").toString());
				BigDecimal bro_btc_exchange = bro_btc_buyingRate.multiply(bro_btc_buyQuantity);
				BigDecimal bro_btc_poundage = bro_btc_buyQuantity.multiply(new BigDecimal(0.002));
				SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd hh:mm:ss");
				String bro_btc_recharge_time = format.format(new Date());
				
				Btc_rechargeBTC_order bro_btc = new Btc_rechargeBTC_order();
				bro_btc.setBro_btc_buyingRate(bro_btc_buyingRate);
				bro_btc.setBro_btc_buyQuantity(bro_btc_buyQuantity);
				bro_btc.setBro_btc_exchange(bro_btc_exchange);
				bro_btc.setBro_btc_poundage(bro_btc_poundage);
				bro_btc.setBro_btc_recharge_time(bro_btc_recharge_time);
				bro_btc.setUid(user.getUid());
				
				rs.rechargeBTC(bro_btc);
				request.setAttribute("msg", "买单已挂出");
				return "index";
			}
		}
	}
}
