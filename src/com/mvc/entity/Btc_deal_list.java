package com.mvc.entity;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "btc_deal_list")
public class Btc_deal_list implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@Basic(optional = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "btc_deal_id", nullable = false)
	private Integer btc_deal_id;
	@Column(name = "btc_deal_Rate")
	private BigDecimal btc_deal_Rate;
	@Column(name = "btc_deal_quantity")
	private BigDecimal btc_deal_quantity;
	@Column(name="btc_deal_total")
	private BigDecimal btc_deal_total;
	@Column(name="bro_btc_id")
	private Integer bro_btc_id;
	@Column(name="bso_btc_id")
	private Integer bso_btc_id;
	@Column(name="btc_deal_time")
	private String btc_deal_time;


	public Integer getBtc_deal_id() {
		return btc_deal_id;
	}


	public void setBtc_deal_id(Integer btc_deal_id) {
		this.btc_deal_id = btc_deal_id;
	}


	public BigDecimal getBtc_deal_Rate() {
		return btc_deal_Rate;
	}


	public void setBtc_deal_Rate(BigDecimal btc_deal_Rate) {
		this.btc_deal_Rate = btc_deal_Rate;
	}


	public BigDecimal getBtc_deal_quantity() {
		return btc_deal_quantity;
	}


	public void setBtc_deal_quantity(BigDecimal btc_deal_quantity) {
		this.btc_deal_quantity = btc_deal_quantity;
	}


	public BigDecimal getBtc_deal_total() {
		return btc_deal_total;
	}


	public void setBtc_deal_total(BigDecimal btc_deal_total) {
		this.btc_deal_total = btc_deal_total;
	}


	public Integer getBro_btc_id() {
		return bro_btc_id;
	}


	public void setBro_btc_id(Integer bro_btc_id) {
		this.bro_btc_id = bro_btc_id;
	}


	public Integer getBso_btc_id() {
		return bso_btc_id;
	}


	public void setBso_btc_id(Integer bso_btc_id) {
		this.bso_btc_id = bso_btc_id;
	}


	public String getBtc_deal_time() {
		return btc_deal_time;
	}


	public void setBtc_deal_time(String btc_deal_time) {
		this.btc_deal_time = btc_deal_time;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
