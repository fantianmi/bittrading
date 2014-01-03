package com.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mvc.dao.EntityDao;
import com.mvc.entity.Btc_user;

@Service
public class UserService {
	@Autowired
	private EntityDao entityDao;

	@Transactional
	public boolean vertify(String uusername, String upassword) {
		List<Object> list = entityDao.createQuery("select u from Btc_user u where u.uusername='" + uusername + "'");
		Btc_user user = new Btc_user();
		if (list.size() != 0) {
			user = (Btc_user) list.get(0);
		}
		return upassword.equals(user.getUpassword());
	}
	
	public Btc_user getByUsername(String uusername){
		Btc_user user = new Btc_user();
		List<Object> list = entityDao.createQuery("select u from Btc_user u where u.uusername='" + uusername + "'");
		if (list.size() != 0) {
			user = (Btc_user) list.get(0);
			return user;
		}else{
			return user=null;
		}	
	}

	public void register_step1(Btc_user user) {
		entityDao.save(user);
	}
	
	public void register_step2(Btc_user user) {
		entityDao.update(user);
	}
}
