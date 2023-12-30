package com.spring.farm.product;

import java.sql.Date;

public class OrderInfoVO {
	private String orderprod_num;
	private String orderinfo_address;
	private Date orderinfo_date;
	private String user_tel;
	private int user_num;
	private String orderinfo_total;
	public String getOrderprod_num() {
		return orderprod_num;
	}
	public void setOrderprod_num(String orderprod_num) {
		this.orderprod_num = orderprod_num;
	}
	public String getOrderinfo_address() {
		return orderinfo_address;
	}
	public void setOrderinfo_address(String orderinfo_address) {
		this.orderinfo_address = orderinfo_address;
	}
	public Date getOrderinfo_date() {
		return orderinfo_date;
	}
	public void setOrderinfo_date(Date orderinfo_date) {
		this.orderinfo_date = orderinfo_date;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getOrderinfo_total() {
		return orderinfo_total;
	}
	public void setOrderinfo_total(String orderinfo_total) {
		this.orderinfo_total = orderinfo_total;
	}
	
	@Override
	public String toString() {
		return "OrderInfoVO [orderprod_num=" + orderprod_num + ", orderinfo_address=" + orderinfo_address
				+ ", orderinfo_date=" + orderinfo_date + ", user_tel=" + user_tel + ", user_num=" + user_num
				+ ", orderinfo_total=" + orderinfo_total + "]";
	}

	
}
