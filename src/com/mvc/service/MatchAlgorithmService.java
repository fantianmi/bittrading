package com.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mvc.dao.EntityDao;

/**
 * 撮合算法service层，操作数据库卖单，买单等
 * @author 宜杰
 *
 */
@Service
public class MatchAlgorithmService {
	@Autowired
	private EntityDao entityDao;
	
	/**
	 * 获取挂载中的买单
	 * @return List<Object>
	 */
	@Transactional
	public List<Object> getBuyingOrders(){
		List<Object> list = entityDao.createQuery("select bro from Btc_rechargeBTC_order bro where bro.bro_btc_state=0 OEDER BY bro.bro_btc_buyingRate DESC , bro.bro_btc_recharge_time DESC");
		if (list.size() != 0) {
			return list;
		}else{
			return null;
		}	
	}
	
	/**
	 * 获取挂载中的卖单
	 * @return List<Object>
	 */
	public List<Object> getSellingOrders(){
		List<Object> list = entityDao.createQuery("select bso from Btc_sellBTC_order bso where bso.bso_btc_state=0 OEDER BY bso.bso_btc_sellRate ASC , bso.bso_btc_sell_time ASC");
		if (list.size() != 0) {
			return list;
		}else{
			return null;
		}	
	}
	

}
