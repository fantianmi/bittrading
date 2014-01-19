package com.mvc.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mvc.dao.EntityDao;
import com.mvc.entity.Btc_account_book;
import com.mvc.entity.Btc_rechargeBTC_order;
import com.mvc.entity.Btc_rechargeCNY_order;

/**
 * 充值处理类，负责人民币，比特币的买入卖出等增删改查等操作
 * @author 宜杰
 *
 */
@Service
public class RechargeService {
	@Autowired
	private EntityDao entityDao;
	
	/**
	 * 根据用户id查询人民币充值订单信息
	 * @param uid
	 * @return
	 */
	@Transactional
	public List<Object> getByUidForOrders(int uid){
		List<Object> list = entityDao.createQuery("select bro from Btc_rechargeCNY_order bro where bro.uid='" + uid + "'");
		if (list.size() != 0) {
			return list;
		}else{
			return null;
		}	
	}
	
	/**
	 * 根据用户id查询买入比特币订单
	 * @param uid
	 * @return
	 */
	public List<Object> getByUidForBTCOrders(int uid){
		List<Object> list = entityDao.createQuery("SELECT BRO_BTC FROM BTC_RECHARGEBTC_ORDER BRO_BTC WHERE BRO_BTC.UID='" + uid + "'");
		if (list.size() != 0) {
			return list;
		}else{
			return null;
		}	
	}
	
	/**
	 * 根据充值人民币id查询订单信息
	 * @param bro_id
	 * @return
	 */
	public Btc_rechargeCNY_order getByBroIdForOrders(int bro_id){
		Btc_rechargeCNY_order bro = new Btc_rechargeCNY_order();
		List<Object> list = entityDao.createQuery("select bro from Btc_rechargeCNY_order bro where bro.bro_id='" + bro_id + "'");
		if (list.size() != 0) {
			bro = (Btc_rechargeCNY_order) list.get(0);
			return bro;
		}else{
			return bro=null;
		}	
	}
	
	/**
	 * 根据买入比特币的单号查询订单信息
	 * @param bro_btc_id
	 * @return
	 */
	public Btc_rechargeBTC_order getByBroIdForBTCOrders(int bro_btc_id){
		Btc_rechargeBTC_order bro_btc = new Btc_rechargeBTC_order();
		List<Object> list = entityDao.createQuery("SELECT BRO_BTC FROM BTC_RECHARGEBTC_ORDER BRO WHERE BRO_BTC.BRO_BTC_ID='" + bro_btc_id + "'");
		if (list.size() != 0) {
			bro_btc = (Btc_rechargeBTC_order) list.get(0);
			return bro_btc;
		}else{
			return bro_btc=null;
		}	
	}
	
	/**
	 * 根据用户id查询对应账本信息
	 * @param uid
	 * @return
	 */
	public Btc_account_book getByUidForAcount(int uid){
		Btc_account_book bab = new Btc_account_book();
		List<Object> list = entityDao.createQuery("select bab from Btc_account_book bab where bab.uid='" + uid + "'");
		if (list.size() != 0) {
			bab = (Btc_account_book)list.get(0);
			return bab;
		}else{
			return bab = null;
		}	
	}
	
	/**
	 * 生成人民币充值订单
	 * @param bro
	 */
	public void rechargeCNY(Btc_rechargeCNY_order bro) {
		entityDao.save(bro);
	}
	
	/**
	 * 生成比特币充值订单
	 * @param bro_btc
	 */
	public void rechargeBTC(Btc_rechargeBTC_order bro_btc) {
		entityDao.save(bro_btc);
	}
	
	/**
	 * 给用户充值人民币之后将单号的状态改变成已处理
	 * @param bro
	 */
	public void updateRechargeCNY_Order(Btc_rechargeCNY_order bro) {
		entityDao.update(bro);
	}
	
	/**
	 * 给用户充值比特币之后将单号的状态改变成已处理
	 * @param bro_btc
	 */
	public void updateRechargeBTC_Order(Btc_rechargeBTC_order bro_btc) {
		entityDao.update(bro_btc);
	}
}
