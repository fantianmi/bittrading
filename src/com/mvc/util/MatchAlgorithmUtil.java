package com.mvc.util;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.entity.Btc_account_book;
import com.mvc.entity.Btc_deal_list;
import com.mvc.entity.Btc_rechargeBTC_order;
import com.mvc.entity.Btc_sellBTC_order;
import com.mvc.service.AccountService;
import com.mvc.service.DealService;
import com.mvc.service.IndexService;
import com.mvc.service.RechargeService;
import com.mvc.service.SellService;
/**
 * 撮合算法实现
 * 每次有新的买单和卖单生成时，执行下面的撮合算法
 * @author 宜杰
 *
 */
@Service
public class MatchAlgorithmUtil {
	@Autowired
	private IndexService is = new IndexService();
	@Autowired
	private AccountService as = new AccountService();
	@Autowired
	private DealService ds = new DealService();
	@Autowired
	private RechargeService rs = new RechargeService();
	@Autowired
	private SellService ss = new SellService();
	
	public void matchAlgorithm(){
		List<Object> buyingOrderList = is.listBuyingOrders();
		List<Object> sellingOrderList = is.listSellOrders();
		List<Btc_deal_list> btc_deal_list = new ArrayList<Btc_deal_list>();
		int deal_list_index = 0;
		int buying_list_index = 0;
		int selling_list_index = 0;
		
		Btc_deal_list bsl = ds.queryLatestDealOrder();
		BigDecimal latestDealRate = bsl.getBtc_deal_Rate();
		BigDecimal dealRate = new BigDecimal(0);
		Btc_rechargeBTC_order bro = null;
		Btc_sellBTC_order bso = null;
		Btc_account_book buyer_Account = null;
		Btc_account_book seller_Account = null;
		if(buyingOrderList!=null&&sellingOrderList!=null){
			for(int i=buying_list_index;i<buyingOrderList.size();i++){
				//获取买单的买价和买入量
				bro = (Btc_rechargeBTC_order) buyingOrderList.get(i);
				BigDecimal buyingRate = bro.getBro_btc_buyingRate();
				BigDecimal buyingQuantity = bro.getBro_btc_buyQuantity();
				for(int j=selling_list_index;j<sellingOrderList.size();j++){
					//获取卖单的卖价和卖出量
					bso = (Btc_sellBTC_order)sellingOrderList.get(j);
					BigDecimal sellingRate = bso.getBso_btc_sellRate();
					BigDecimal sellingQuantity = bso.getBso_btc_sellQuantity();
					if(buyingRate.compareTo(sellingRate)>=0){
						//如果买单购买的数量大于卖单出售的数量，这个时候交易成功一笔之后会继续购买下一张卖单，这里注意要判断else
						//当买单购买的数量小于卖单时候这个时候跳出循环到下一张买单
						if(buyingQuantity.compareTo(sellingQuantity)>=0){
							//确定成交价，根据撮合算法：
							//如果前一笔成交价低于或等于卖出价，则最新成交价就是卖出价
							//如果前一笔成交价高于或等于买入价，则最新成交价就是买入价
							//如果前一笔成交价在卖出价与买入价之间，则最新成交价就是前一笔的成交价
							if(latestDealRate.compareTo(buyingRate)>=0){
								dealRate = buyingRate;
							}else if(latestDealRate.compareTo(sellingRate)<=0){
								dealRate = sellingRate;
							}else if(latestDealRate.compareTo(buyingRate)==-1||latestDealRate.compareTo(sellingRate)==1){
								dealRate = latestDealRate;
							}
							latestDealRate = dealRate;
							buyingQuantity = buyingQuantity.subtract(sellingQuantity);
							//确定成交价之后就开始交易
							//--如果买单还没有交易完，则改变该节点的单的状态和删除掉卖单这个节点的数据并进入下一张卖单
							if(buyingQuantity.compareTo(new BigDecimal(0))==1){
								//这个状态下,一笔交易完成后的买单状态
								//一.操作买单的状态：
								//1.减去买单的购买数量
								bro.setBro_btc_buyQuantity(buyingQuantity);
								//一.操作卖单的状态：
								//1.减去卖单的卖出数量
								//2.改变卖单的交易状态为1
								//3.设置卖单的交易成功时间
								bso.setBso_btc_sellQuantity(new BigDecimal(0));
								bso.setBso_btc_state(1);
								buyingOrderList.set(i, bro);
								SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd hh:mm:ss");
								String bso_btc_sell_sucess_time = format.format(new Date());
								bso.setBso_btc_sell_sucess_time(bso_btc_sell_sucess_time);
								sellingOrderList.set(j, bso);
								//保存成交队列
								bsl.setBro_btc_id(bro.getBro_btc_id());
								bsl.setBso_btc_id(bso.getBso_btc_id());
								bsl.setBtc_deal_quantity(sellingQuantity);
								bsl.setBtc_deal_Rate(dealRate);
								bsl.setBtc_deal_time(bso_btc_sell_sucess_time);
								bsl.setBtc_deal_total(sellingQuantity.multiply(dealRate));
								btc_deal_list.add(deal_list_index,bsl);
								deal_list_index++;
								selling_list_index++;
								continue;
							}else{
								SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd hh:mm:ss");
								String deal_sucess_time = format.format(new Date());
								//这个状态下,一笔交易完成后的买单状态
								//一.操作买单的状态：
								//1.减去买单的购买数量
								//2.改变买单的交易状态为1
								//3.设置买单的交易成功时间
								bro.setBro_btc_buyQuantity(buyingQuantity);
								bro.setBro_btc_state(1);
								bro.setBro_btc_recharge_sucess_time(deal_sucess_time);
								//二.操作卖单的状态：
								//1.减去卖单的卖出数量
								//2.改变卖单的交易状态为1
								//3.设置卖单的交易成功时间
								bso.setBso_btc_sellQuantity(new BigDecimal(0));
								bso.setBso_btc_state(1);
								buyingOrderList.set(i, bro);
								bso.setBso_btc_sell_sucess_time(deal_sucess_time);
								sellingOrderList.set(j, bso);
								//保存成交队列
								bsl.setBro_btc_id(bro.getBro_btc_id());
								bsl.setBso_btc_id(bso.getBso_btc_id());
								bsl.setBtc_deal_quantity(sellingQuantity);
								bsl.setBtc_deal_Rate(dealRate);
								bsl.setBtc_deal_time(deal_sucess_time);
								bsl.setBtc_deal_total(sellingQuantity.multiply(dealRate));
								btc_deal_list.add(deal_list_index,bsl);
								deal_list_index++;
								buying_list_index++;
								selling_list_index++;
								break;
							}//if(buyingQuantity.compareTo(new BigDecimal(0)))
						}//if(buyingQuantity.compareTo(sellingQuantity)>=0)
						else{
						  //确定成交价，根据撮合算法：
							//如果前一笔成交价低于或等于卖出价，则最新成交价就是卖出价
							//如果前一笔成交价高于或等于买入价，则最新成交价就是买入价
							//如果前一笔成交价在卖出价与买入价之间，则最新成交价就是前一笔的成交价
							if(latestDealRate.compareTo(buyingRate)>=0){
								dealRate = buyingRate;
							}else if(latestDealRate.compareTo(sellingRate)<=0){
								dealRate = sellingRate;
							}else if(latestDealRate.compareTo(buyingRate)==-1||latestDealRate.compareTo(sellingRate)==1){
								dealRate = latestDealRate;
							}
							latestDealRate = dealRate;
							sellingQuantity = sellingQuantity.subtract(buyingQuantity);
							//确定成交价之后就开始交易
							//--如果买单还没有交易完，则改变该节点的单的状态和删除掉卖单这个节点的数据并进入下一张卖单
							//这个状态下,一笔交易完成后的买单状态
							//一.操作买单的状态：
							//1.减去买单的购买数量
							SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd hh:mm:ss");
							String deal_sucess_time = format.format(new Date());
							bro.setBro_btc_buyQuantity(new BigDecimal(0));
							bro.setBro_btc_state(1);
							bro.setBro_btc_recharge_sucess_time(deal_sucess_time);
							//一.操作卖单的状态：
							//1.减去卖单的卖出数量
							//2.改变卖单的交易状态为1
							//3.设置卖单的交易成功时间
							bso.setBso_btc_sellQuantity(sellingQuantity);
							buyingOrderList.set(i, bro);
							sellingOrderList.set(j, bso);
							//保存成交队列
							bsl.setBro_btc_id(bro.getBro_btc_id());
							bsl.setBso_btc_id(bso.getBso_btc_id());
							bsl.setBtc_deal_quantity(sellingQuantity);
							bsl.setBtc_deal_Rate(dealRate);
							bsl.setBtc_deal_time(deal_sucess_time);
							bsl.setBtc_deal_total(sellingQuantity.multiply(dealRate));
							btc_deal_list.add(deal_list_index,bsl);
							deal_list_index++;
							buying_list_index++;
							break;
						}//else(buyingQuantity.compareTo(sellingQuantity)>=0)
					}//if(buyingRate.compareTo(sellingRate)>=0)
					else{
						break;
					}
				}//for(卖单循环)
			}//for(买单循环)
			//等所有交易完成后进行数据库的操作，涉及数据表：
			//1.买单表；
			//2.卖单表；
			//3.成交表；
			//4.用户账户表;
			Btc_deal_list btc_deal_list_db = new Btc_deal_list();
			for(int i=0;i<btc_deal_list.size();i++){
				btc_deal_list_db = btc_deal_list.get(i);
				ds.saveDealOrder(btc_deal_list_db);
				//根据成交列表对用户账户进行操作
				int bro_btc_id = btc_deal_list_db.getBro_btc_id();
				int bso_btc_id = btc_deal_list_db.getBso_btc_id();
				bro = rs.getByBroIdForBTCOrders(bro_btc_id);
				bso = ss.getByBso_btc_idForBTCOrders(bso_btc_id);
				int buyer_id = bro.getUid();
				int seller_id = bso.getUid();
				buyer_Account = as.getByUidForAcount(buyer_id);
				seller_Account = as.getByUidForAcount(seller_id);
				//修改购买人的比特币数量和人民币数量
				//人民币数量增加=（买价-成交价）* 成交量
				buyer_Account.setAb_btc(buyer_Account.getAb_btc().add(btc_deal_list_db.getBtc_deal_quantity()));
				BigDecimal deal_rate = btc_deal_list_db.getBtc_deal_Rate();
				BigDecimal deal_quantity = btc_deal_list_db.getBtc_deal_quantity();
				BigDecimal bro_buyingRate = bro.getBro_btc_buyingRate();
				buyer_Account.setAb_cny(buyer_Account.getAb_cny().add(bro_buyingRate.subtract(deal_rate).multiply(deal_quantity)));
				//修改出卖人的人民币数量
				//人民币数量增加=成交价*成交量
				seller_Account.setAb_cny(seller_Account.getAb_cny().add(deal_rate.multiply(deal_quantity)));
				as.updateAccount_Book(buyer_Account);
				as.updateAccount_Book(seller_Account);
			}
			Btc_rechargeBTC_order btc_reachargeBTC_order_db = new Btc_rechargeBTC_order();
			for(int i=0;i<buyingOrderList.size();i++){
				btc_reachargeBTC_order_db = (Btc_rechargeBTC_order) buyingOrderList.get(i);
				rs.updateRechargeBTC_Order(btc_reachargeBTC_order_db);
			}
			Btc_sellBTC_order btc_sellBTC_order_db = new Btc_sellBTC_order();
			for(int i=0;i<sellingOrderList.size();i++){
				btc_sellBTC_order_db = (Btc_sellBTC_order) sellingOrderList.get(i);
				ss.updateSellBTC_Order(btc_sellBTC_order_db);
			}
		}
	}
}
