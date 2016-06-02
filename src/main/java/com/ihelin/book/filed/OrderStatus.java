package com.ihelin.book.filed;

public enum OrderStatus {
	NOT_PAY(1),//未付款
	PAYED(2);//已付款
	
	private int value;
	
	private OrderStatus(int value){
		this.value = value;
	}
	
	public int getValue(){
		return this.value;
	}
}
