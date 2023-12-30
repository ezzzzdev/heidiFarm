package com.spring.farm.product;

public class OrderProdVO {
	private String orderprod_num;
	private String pro_num;
	private int orderprod_amount;
	private int orderprod_totalp;
	private int user_num;
	private String orderprod_delivery;
	private String orderprod_cancel;
	
	public String getOrderprod_num() {
		return orderprod_num;
	}
	public void setOrderprod_num(String orderprod_num) {
		this.orderprod_num = orderprod_num;
	}
	public String getPro_num() {
		return pro_num;
	}
	public void setPro_num(String pro_num) {
		this.pro_num = pro_num;
	}
	public int getOrderprod_amount() {
		return orderprod_amount;
	}
	public void setOrderprod_amount(int orderprod_amount) {
		this.orderprod_amount = orderprod_amount;
	}
	public int getOrderprod_totalp() {
		return orderprod_totalp;
	}
	public void setOrderprod_totalp(int orderprod_totalp) {
		this.orderprod_totalp = orderprod_totalp;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getOrderprod_delivery() {
		return orderprod_delivery;
	}
	public void setOrderprod_delivery(String orderprod_delivery) {
		this.orderprod_delivery = orderprod_delivery;
	}
	public String getOrderprod_cancel() {
		return orderprod_cancel;
	}
	public void setOrderprod_cancel(String orderprod_cancel) {
		this.orderprod_cancel = orderprod_cancel;
	}
	@Override
	public String toString() {
		return "OrderProdVO [orderprod_num=" + orderprod_num + ", pro_num=" + pro_num + ", orderprod_amount="
				+ orderprod_amount + ", orderprod_totalp=" + orderprod_totalp + ", user_num=" + user_num
				+ ", orderprod_delivery=" + orderprod_delivery + ", orderprod_cancel=" + orderprod_cancel + "]";
	}

	
}
