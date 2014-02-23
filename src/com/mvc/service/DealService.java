package com.mvc.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mvc.dao.EntityDao;
import com.mvc.entity.Btc_deal_list;

/**
 * 成交单的service层，负责成交单的增删改查
 * @author 宜杰
 *
 */
@Service
public class DealService {
	@Autowired
	private EntityDao entityDao;
	
	
	/**
	 * 查询最新的成交价，根据id来判断
	 * @param bro
	 */
	@Transactional
	public Btc_deal_list queryLatestDealOrder() {
		Btc_deal_list bdl = new Btc_deal_list();
		List<Object> list = entityDao.createQuery("SELECT bdl from Btc_deal_list bdl where bdl.btc_deal_id=(select max(bdl.btc_deal_id) from Btc_deal_list bdl)");
		if (list.size() != 0) {
			bdl = (Btc_deal_list)list.get(0);
			return bdl;
		}else{
			return bdl = null;
		}	
	}
	
	/**
	 * 生成成交单
	 * @param bro
	 */
	public void saveDealOrder(Btc_deal_list bdl) {
		entityDao.save(bdl);
	}
	
	/**
	 * 修改成交单
	 * @param bro
	 */
	public void updateDealOrder(Btc_deal_list bdl) {
		entityDao.update(bdl);
	}
}
