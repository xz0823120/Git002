package com.auth.util;

import java.util.List;




public class Page {  
	//每页显示条数
	private int pageNum=5;
	//总条数
	private int totalNum=0;
	//当前页码
	private int currNo=1;
	//总页数
	private int totalPage=0;	
	//查询下标位置，limit 中的第一个参数
	private int pageIndex=0;
	//存储返回的集合对象
	private List<?> resultList;
	//请求地址
	private String urlString;
	//请求参数
	private String params;
	public Page() {
		
	}
	
	public Page(int totalNum, int currNo) {
		super();
		this.totalNum = totalNum;
		this.currNo = currNo;
	}

	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	//当前页码
	public int getCurrNo() {
		if(currNo==0){
			currNo=1;
		}
		return currNo;
	}
	public void setCurrNo(int currNo) {
		this.currNo = currNo;
	}
	//总页数
	public int getTotalPage() {
		totalPage=(totalNum%pageNum==0)?(totalNum/pageNum):(totalNum/pageNum)+1;
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	//查询下标位置
	public int getPageIndex() {
		return pageNum*(currNo-1);
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public List<?> getResultList() {
		return resultList;
	}

	public void setResultList(List<?> resultList) {
		this.resultList = resultList;
	}

	public String getUrlString() {
		return urlString;
	}

	public void setUrlString(String urlString) {
		this.urlString = urlString;
	}

	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}
	
}  