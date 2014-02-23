package com.mvc.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.mvc.entity.Btc_rechargeBTC_order;
import com.mvc.entity.Btc_rechargeCNY_order;
import com.mvc.entity.Btc_user;
import com.mvc.service.AccountService;
import com.mvc.service.MatchAlgorithmService;
import com.mvc.service.RechargeService;
import com.mvc.service.UserService;
import com.mvc.util.MatchAlgorithmUtil;

@Controller
@RequestMapping("/recharge.htm")
public class RechargeController {
	@Autowired
	private UserService us = new UserService();
	@Autowired
	private RechargeService rs = new RechargeService();
	@Autowired
	private AccountService as = new AccountService();
	@Autowired
	private MatchAlgorithmUtil matchAlgorithmUtil = new MatchAlgorithmUtil();
	
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
				request.setAttribute("msg", "交易密码输入错误，请确认后重新输入");
				request.setAttribute("href", "index.htm");
				return "rechargeCNY";
			}else{
				String utpassword = request.getParameter("utpassword").toString();
				Btc_user user = us.getByUsername(uusername);
				if(user.getUtpasswod()== utpassword) {
					request.setAttribute("msg", "交易密码输入错误，请确认后重新输入");
					request.setAttribute("href", "index.htm");
					return "rechargeCNY";
				}else{
					BigDecimal bro_recharge_acount = new BigDecimal(request.getParameter("bro_recharge_acount").toString());
					bro_recharge_acount.setScale(2,BigDecimal.ROUND_HALF_UP);
					BigDecimal bro_factorage = bro_recharge_acount.multiply(new BigDecimal(0.003));
					bro_factorage.setScale(2,BigDecimal.ROUND_HALF_UP);
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
					request.setAttribute("msg", "恭喜您，充值成功！我们确认收到您的汇款之后会立即给您充入到平台账户中");
					request.setAttribute("href", "index.htm");
					return "index";
				}
			}
		}else{
			request.setAttribute("msg", "登陆后才能进行此操作！");
			request.setAttribute("href", "index.htm?Login");
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
			request.setAttribute("msg", "登陆后才能进行此操作！");
			request.setAttribute("href", "index.htm?Login");
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
			request.setAttribute("msg", "登陆后才能进行此操作！");
			request.setAttribute("href", "index.htm?Login");
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
	 * 生成比特币充值订单，并从用户帐本中扣除相应费用
	 * @param modelmap
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "recharge_BTC")
	public String recharge_btc(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		if(session.getAttribute("uusername")== null){
			request.setAttribute("msg", "登陆后才能进行此操作！");
			request.setAttribute("href", "index.htm?Login");
			return "index";
		}else{
			String uusername = session.getAttribute("uusername").toString();
			Btc_user user = us.getByUsername(uusername);
			if(user.getUname()==null&&user.getUcertification()==null){
				return "register2";
			}else{
				BigDecimal bro_btc_buyingRate = new BigDecimal(request.getParameter("buyingRate").toString());
				bro_btc_buyingRate.setScale(2, BigDecimal.ROUND_HALF_UP);
				BigDecimal bro_btc_buyQuantity = new BigDecimal(request.getParameter("buyQuantity").toString());
				bro_btc_buyQuantity.setScale(4, BigDecimal.ROUND_HALF_UP);
				if(bro_btc_buyingRate.compareTo(new BigDecimal(0))==0||bro_btc_buyQuantity.compareTo(new BigDecimal(0))==0){
					request.setAttribute("msg", "买单中买入价或买入量不能为0");
					request.setAttribute("href", "index.htm");
					return "index";
				}else{
					BigDecimal bro_btc_exchange = bro_btc_buyingRate.multiply(bro_btc_buyQuantity);
					bro_btc_exchange.setScale(2, BigDecimal.ROUND_HALF_UP);
					BigDecimal bro_btc_poundage = bro_btc_exchange.multiply(new BigDecimal(0.002));
					bro_btc_poundage.setScale(2, BigDecimal.ROUND_HALF_UP);
					BigDecimal totalCost = bro_btc_exchange.add(bro_btc_poundage);
					//查询余额是否能够支付,公式：用户余额-（手续费+兑换额）
					Btc_account_book btc_account_book = as.getByUidForAcount(Integer.parseInt(session.getAttribute("uid").toString()));
					BigDecimal ab_cny = btc_account_book.getAb_cny();
					if(ab_cny.compareTo(totalCost)==-1){
						request.setAttribute("msg", "您的平台上余额(人民币)不足，请先充值");
						request.setAttribute("href", "index.htm?recharge");
						return "index";
					}else{
						SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd hh:mm:ss");
						log.info(bro_btc_buyingRate+":"+bro_btc_buyQuantity+":"+bro_btc_exchange+":"+bro_btc_exchange+":"+
								bro_btc_poundage);
						String bro_btc_recharge_time = format.format(new Date());
						//生成买单并存入数据库
						Btc_rechargeBTC_order bro_btc = new Btc_rechargeBTC_order();
						bro_btc.setBro_btc_buyingRate(bro_btc_buyingRate);
						bro_btc.setBro_btc_buyQuantity(bro_btc_buyQuantity);
						bro_btc.setBro_btc_exchange(bro_btc_exchange);
						bro_btc.setBro_btc_poundage(bro_btc_poundage);
						bro_btc.setBro_btc_recharge_time(bro_btc_recharge_time);
						bro_btc.setUid(user.getUid());
						bro_btc.setBro_btc_pay_state(1);
						rs.rechargeBTC(bro_btc);
						//更新用户帐本信息以及全局session中的账户余额
						ab_cny = ab_cny.subtract(totalCost);
						ab_cny.setScale(2, BigDecimal.ROUND_HALF_UP);
						btc_account_book.setAb_cny(ab_cny);
						as.updateAccount_Book(btc_account_book);
						log.info("***修改"+ session.getAttribute("uusername") +"账户余额为："+ab_cny);
						BigDecimal ab_cny_show = ab_cny.setScale(2, BigDecimal.ROUND_HALF_UP); 
						session.setAttribute("ab_cny", ab_cny_show);
						request.setAttribute("msg", "买单已挂出");
						request.setAttribute("href", "index.htm");
						matchAlgorithmUtil.matchAlgorithm();
						return "index";
					}
				}
			}
		}
	}
}
