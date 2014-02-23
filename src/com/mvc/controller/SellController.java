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
import com.mvc.entity.Btc_sellBTC_order;
import com.mvc.entity.Btc_user;
import com.mvc.service.AccountService;
import com.mvc.service.MatchAlgorithmService;
import com.mvc.service.SellService;
import com.mvc.service.UserService;
import com.mvc.util.MatchAlgorithmUtil;

@Controller
@RequestMapping("/sell.htm")
public class SellController {
	@Autowired
	private UserService us = new UserService();
	@Autowired
	private SellService ss = new SellService();
	@Autowired
	private AccountService as = new AccountService();
	@Autowired
	private MatchAlgorithmUtil matchAlgorithmUtil = new MatchAlgorithmUtil();
	
	protected final transient Log log = LogFactory
	.getLog(SellController.class);
	
	@RequestMapping
	public String load(ModelMap modelMap, HttpServletRequest request){
		return "index";
	}
//	@RequestMapping(params = "CNY")
//	public String rechargeCNY(ModelMap modelMap, HttpServletRequest request){
//		HttpSession session = request.getSession();
//		if(session.getAttribute("uusername")!=null){
//			String uusername = session.getAttribute("uusername").toString();
//			if(request.getParameter("utpassword")==null){
//				request.setAttribute("msg", "交易密码输入错误，请确认后重新输入");
//				request.setAttribute("href", "index.htm");
//				return "rechargeCNY";
//			}else{
//				String utpassword = request.getParameter("utpassword").toString();
//				Btc_user user = us.getByUsername(uusername);
//				if(user.getUtpasswod()== utpassword) {
//					request.setAttribute("msg", "交易密码输入错误，请确认后重新输入");
//					request.setAttribute("href", "index.htm");
//					return "rechargeCNY";
//				}else{
//					BigDecimal bro_recharge_acount = new BigDecimal(request.getParameter("bro_recharge_acount").toString());
//					bro_recharge_acount.setScale(2,BigDecimal.ROUND_HALF_UP);
//					BigDecimal bro_factorage = bro_recharge_acount.multiply(new BigDecimal(0.003));
//					bro_factorage.setScale(2,BigDecimal.ROUND_HALF_UP);
//					String bro_sname = request.getParameter("bro_sname").toString();
//					String bro_recharge_way = request.getParameter("bro_recharge_way").toString();	
//					SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd hh:mm:ss");
//					String bro_recharge_time = format.format(new Date());
//					int uid = user.getUid();
//					Btc_rechargeCNY_order bro = new Btc_rechargeCNY_order();
//					bro.setBro_recharge_acount(bro_recharge_acount);
//					bro.setBro_sname(bro_sname);
//					bro.setBro_recharge_time(bro_recharge_time);
//					bro.setBro_recharge_way(bro_recharge_way);
//					bro.setUid(uid);
//					bro.setBro_factorage(bro_factorage);
//					rs.rechargeCNY(bro);
//					request.setAttribute("msg", "恭喜您，充值成功！我们确认收到您的汇款之后会立即给您充入到平台账户中");
//					request.setAttribute("href", "index.htm");
//					return "index";
//				}
//			}
//		}else{
//			request.setAttribute("msg", "登陆后才能进行此操作！");
//			request.setAttribute("href", "index.htm");
//			return "login";
//		}
//	}
	
//	/**
//	 * 选择买入比特币链接，判断符合条件才能进入充值界面
//	 * @param modelmap
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@RequestMapping(params = "buybtc")
//	public String buybtc(ModelMap modelmap, HttpServletRequest request, HttpServletResponse response){
//		HttpSession session = request.getSession();
//		if(session.getAttribute("uusername").toString()== null){
//			request.setAttribute("msg", "登陆后才能进行此操作！");
//			request.setAttribute("href", "index.htm");
//			return "index";
//		}else{
//			String uusername = session.getAttribute("uusername").toString();
//			Btc_user user = us.getByUsername(uusername);
//			if(user.getUname()==null&&user.getUcertification()==null){
//				return "register2";
//			}else{
//				return "buybtc";
//			}
//		}
//	}
	
//	/**
//	 * 选择充值人民币链接，判断符合要求才能进入充值页面
//	 * @param modelmap
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@RequestMapping(params = "recharge")
//	public String recharge(ModelMap modelmap, HttpServletRequest request, HttpServletResponse response){
//		HttpSession session = request.getSession();
//		if(session.getAttribute("uusername").toString()== null){
//			request.setAttribute("msg", "登陆后才能进行此操作！");
//			request.setAttribute("href", "index.htm");
//			return "index";
//		}else{
//			String uusername = session.getAttribute("uusername").toString();
//			Btc_user user = us.getByUsername(uusername);
//			if(user.getUname()==null&&user.getUcertification()==null){
//				return "register2";
//			}else{
//				return "recharge";
//			}
//		}
//	}
	
	/**
	 * 生成比特币卖出单，并从用户帐本中扣除相应的比特币
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "sell_BTC")
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
				BigDecimal bso_btc_sellRate = new BigDecimal(request.getParameter("sellingRate").toString());
				bso_btc_sellRate.setScale(2, BigDecimal.ROUND_HALF_UP);
				BigDecimal bso_btc_sellQuantity = new BigDecimal(request.getParameter("sellQuantity").toString());
				bso_btc_sellQuantity.setScale(4, BigDecimal.ROUND_HALF_UP);
				if(bso_btc_sellRate.compareTo(new BigDecimal(0))==0||bso_btc_sellQuantity.compareTo(new BigDecimal(0))==0){
					request.setAttribute("msg", "卖单中卖出价或卖出量不能为0");
					request.setAttribute("href", "index.htm");
					return "index";
				}else{
					BigDecimal bso_btc_exchange = bso_btc_sellRate.multiply(bso_btc_sellQuantity);
					bso_btc_exchange.setScale(2, BigDecimal.ROUND_HALF_UP);
					BigDecimal bso_btc_poundage = bso_btc_exchange.multiply(new BigDecimal(0.002));
					bso_btc_poundage.setScale(2, BigDecimal.ROUND_HALF_UP);
					//查询比特币是否足够生成卖单,公式：用户比特币余额-比特币卖出量
					Btc_account_book btc_account_book = as.getByUidForAcount(Integer.parseInt(session.getAttribute("uid").toString()));
					BigDecimal ab_btc = btc_account_book.getAb_btc();
					if(ab_btc.compareTo(bso_btc_sellQuantity)==-1){
						request.setAttribute("msg", "您的平台上比特币余额不足，请重新下单");
						request.setAttribute("href", "index.htm");
						return "index";
					}else{
						SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd hh:mm:ss");
						log.info(bso_btc_sellRate+":"+bso_btc_sellQuantity+":"+bso_btc_exchange+":"+
								bso_btc_poundage);
						String bso_btc_sell_time = format.format(new Date());
						//生成卖单并存入数据库
						Btc_sellBTC_order bso_btc = new Btc_sellBTC_order();
						bso_btc.setBso_btc_sellRate(bso_btc_sellRate);
						bso_btc.setBso_btc_sellQuantity(bso_btc_sellQuantity);
						bso_btc.setBso_btc_exchange(bso_btc_exchange);
						bso_btc.setBso_btc_poundage(bso_btc_poundage);
						bso_btc.setBso_btc_sell_time(bso_btc_sell_time);
						bso_btc.setUid(user.getUid());
						bso_btc.setBso_btc_sell_state(1);
						ss.sellBTC(bso_btc);
						//更新用户帐本信息以及全局session中的账户余额
						ab_btc = ab_btc.subtract(bso_btc_sellQuantity);
						ab_btc.setScale(4, BigDecimal.ROUND_HALF_UP);
						btc_account_book.setAb_btc(ab_btc);
						as.updateAccount_Book(btc_account_book);
						log.info("***修改"+ session.getAttribute("uusername") +"账户比特币余额为："+ab_btc);
						BigDecimal ab_btc_show = ab_btc.setScale(4, BigDecimal.ROUND_HALF_UP); 
						session.setAttribute("ab_btc", ab_btc_show);
						request.setAttribute("msg", "卖单已挂出");
						request.setAttribute("href", "index.htm");
						matchAlgorithmUtil.matchAlgorithm();
						return "index";
					}
				}
			}
		}
	}
}
