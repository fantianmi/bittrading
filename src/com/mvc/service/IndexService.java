package com.mvc.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mvc.dao.EntityDao;


@Service
public class IndexService {
	@Autowired
	private EntityDao entityDao;
	
	@Transactional
	public List<Object> listBuyingOrders(){
		List<Object> list = entityDao.createQuery("select bro_btc from Btc_rechargeBTC_order bro_btc where bro_btc.bro_btc_state=0 order by bro_btc.bro_btc_recharge_time desc");
		if (list.size() != 0) {
			return list;
		}else{
			return null;
		}	
	}
	
}
