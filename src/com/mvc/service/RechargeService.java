package com.mvc.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mvc.dao.EntityDao;
import com.mvc.entity.Btc_account_book;
import com.mvc.entity.Btc_rechargeCNY_order;


@Service
public class RechargeService {
	@Autowired
	private EntityDao entityDao;
	
	@Transactional
	public List<Object> getByUidForOrders(int uid){
		List<Object> list = entityDao.createQuery("select bro from Btc_rechargeCNY_order bro where bro.uid='" + uid + "'");
		if (list.size() != 0) {
			return list;
		}else{
			return null;
		}	
	}
	
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
	
	public void rechargeCNY(Btc_rechargeCNY_order bro) {
		entityDao.save(bro);
	}
	
	public void updateRechargeCNY_Order(Btc_rechargeCNY_order bro) {
		entityDao.update(bro);
	}
}
