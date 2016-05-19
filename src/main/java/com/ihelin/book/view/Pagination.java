package com.ihelin.book.view;

public class Pagination {

	private int totalCount;
	private int totalPageNum;
	private int endPage;
	private int currentPage;
	private int startPage;
	
	private static final int PRE_AFT_PAGE_NUM = 3;
	
	public Pagination(int totalCount, int currentPage, int pageLength) {
		if (totalCount <= 0) totalCount = 0;
		if (currentPage <= 0) currentPage = 1;
		
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		
		if (pageLength <= 0) pageLength = 1;
		this.totalPageNum = (int) Math.ceil((double)totalCount / pageLength);
		startPage = currentPage - PRE_AFT_PAGE_NUM;
		if (startPage <= 0) startPage = Math.min(1, totalPageNum);
		endPage = currentPage + PRE_AFT_PAGE_NUM;
		if (endPage > totalPageNum) endPage = totalPageNum;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	
	public int getTotalPageNum() {
		return totalPageNum;
	}
}
