package com.ihelin.book.filed;

public enum AccountType {
	GENERAL(0),//普通用户
	ADMIN(1);//管理员
	
	private int value;
	
	private AccountType(int value){
		this.value = value;
	}
	
	public int getValue(){
		return this.value;
	}

}
