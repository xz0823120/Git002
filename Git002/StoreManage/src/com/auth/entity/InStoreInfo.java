/**
 * @filename inStoreInfo.java
 * @author 冯琪
 * @date 2017年12月4日 下午8:39:11
 * @version 1.0
 * Copyright (C) 2017 冯琪
 */
package com.auth.entity;

import java.math.BigDecimal;
/**
 * 入库表
 *@comment
 *@author 冯琪
 *@date 2017年12月4日 下午8:46:24
 *@modifyUser Administrator
 *@modifyDate 2017年12月4日 下午8:46:24
 *@modifyDesc  TODO
 *@version TODO
 */
public class InStoreInfo {
	/**
	 * 入库单ID
	 */
	private String insId;
	/**
	 * 仓库ID
	 */
	private String storeId;
	/**
	 * 商品ID
	 */
	private String productId;
	/**
	 * 入库价格
	 */
	private BigDecimal inPrice;
	/**
	 * 入库数量
	 */
	private String inNum;
	/**
	 * 创建人
	 */
	private Integer createBy;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 是否入库
	 */
	private String isIn;
	/**
	 * 用户名
	 */
	private String getCode;
	/**
	 * 获取仓库名
	 */
	private String getStoreName;
	/**
	 * 商品名
	 */
	private String getProductName;
	/**
	 * 创建人
	 */
	private String createId1;
	public InStoreInfo(String insId, String storeId, String productId,
			BigDecimal inPrice, String inNum, Integer createBy,
			String createTime, String isIn, String getCode,
			String getStoreName, String getProductName, String createId1,
			String dateStateTime, String dateEndTime) {
		super();
		this.insId = insId;
		this.storeId = storeId;
		this.productId = productId;
		this.inPrice = inPrice;
		this.inNum = inNum;
		this.createBy = createBy;
		this.createTime = createTime;
		this.isIn = isIn;
		this.getCode = getCode;
		this.getStoreName = getStoreName;
		this.getProductName = getProductName;
		this.createId1 = createId1;
		this.dateStateTime = dateStateTime;
		this.dateEndTime = dateEndTime;
	}



	public String getCreateId1() {
		return createId1;
	}



	public void setCreateId1(String createId1) {
		this.createId1 = createId1;
	}



	/**
	 * 起始时间
	 */
	private String dateStateTime;
	/**
	 * 结束时间
	 */
	private String dateEndTime;
	
	
	
	public InStoreInfo() {
		super();
	}



	public String getInsId() {
		return insId;
	}



	public void setInsId(String insId) {
		this.insId = insId;
	}



	public String getStoreId() {
		return storeId;
	}



	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}



	public String getProductId() {
		return productId;
	}



	public void setProductId(String productId) {
		this.productId = productId;
	}



	public BigDecimal getInPrice() {
		return inPrice;
	}



	public void setInPrice(BigDecimal inPrice) {
		this.inPrice = inPrice;
	}



	public String getInNum() {
		return inNum;
	}



	public void setInNum(String inNum) {
		this.inNum = inNum;
	}



	public Integer getCreateBy() {
		return createBy;
	}



	public void setCreateBy(Integer createBy) {
		this.createBy = createBy;
	}



	public String getCreateTime() {
		return createTime;
	}



	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}



	public String getIsIn() {
		return isIn;
	}



	public void setIsIn(String isIn) {
		this.isIn = isIn;
	}



	public String getGetCode() {
		return getCode;
	}



	public void setGetCode(String getCode) {
		this.getCode = getCode;
	}



	public String getGetStoreName() {
		return getStoreName;
	}



	public void setGetStoreName(String getStoreName) {
		this.getStoreName = getStoreName;
	}



	public String getGetProductName() {
		return getProductName;
	}



	public void setGetProductName(String getProductName) {
		this.getProductName = getProductName;
	}



	public String getDateStateTime() {
		return dateStateTime;
	}



	public void setDateStateTime(String dateStateTime) {
		this.dateStateTime = dateStateTime;
	}



	public String getDateEndTime() {
		return dateEndTime;
	}



	public void setDateEndTime(String dateEndTime) {
		this.dateEndTime = dateEndTime;
	}



	public InStoreInfo(String insId, String storeId, String productId,
			BigDecimal inPrice, String inNum, Integer createBy,
			String createTime, String isIn, String getCode,
			String getStoreName, String getProductName, String dateStateTime,
			String dateEndTime) {
		super();
		this.insId = insId;
		this.storeId = storeId;
		this.productId = productId;
		this.inPrice = inPrice;
		this.inNum = inNum;
		this.createBy = createBy;
		this.createTime = createTime;
		this.isIn = isIn;
		this.getCode = getCode;
		this.getStoreName = getStoreName;
		this.getProductName = getProductName;
		this.dateStateTime = dateStateTime;
		this.dateEndTime = dateEndTime;
	}



	@Override
	public String toString() {
		return "InStoreInfo [insId=" + insId + ", storeId=" + storeId
				+ ", productId=" + productId + ", inPrice=" + inPrice
				+ ", inNum=" + inNum + ", createBy=" + createBy
				+ ", createTime=" + createTime + ", isIn=" + isIn
				+ ", getCode=" + getCode + ", getStoreName=" + getStoreName
				+ ", getProductName=" + getProductName + ", dateStateTime="
				+ dateStateTime + ", dateEndTime=" + dateEndTime + "]";
	}
	
	
}

