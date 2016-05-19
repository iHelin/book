package com.ihelin.book.filed;

public enum BookType {
	NOVEL(1),//小说
	LITERATURE(2),//文学
	ART(3),//艺术与摄影
	BIOGRAPHY(4),//传记
	INSPIRATION(5),//励志与成功
	ECONOMY(6),//经济管理
	COMPUTER(7),//计算机
	CHILD(8),//少儿
	FASHION(9),//时尚娱乐
	LAW(10),//法律
	PSYCHOLOGY(11),//心理学
	HISTORY(12),//历史
	POLITICS(13),//政治与军事
	PHILOSOPHY(14),//哲学与宗教
	SOCIETY(15),//社会科学
	DIET(16),//饮食
	OTHER(17);//其他
	
	private int value;
	
	private BookType(int value){
		this.value = value;
	}
	
	public int getValue(){
		return this.value;
	}

}
