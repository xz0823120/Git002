/**
 * @filename OutStoreInfo.java
 * @author 冯琪
 * @date 2017年12月4日 下午10:15:15
 * @version 1.0
 * Copyright (C) 2017 冯琪
 */
package com.auth.entity;

import java.math.BigDecimal;
/**
 * 出库表
 *@comment
 *@author 冯琪
 *@date 2017年12月4日 下午10:21:58
 *@modifyUser Administrator
 *@modifyDate 2017年12月4日 下午10:21:58
 *@modifyDesc  TODO
 *@version TODO
 */
public class OutStoreInfo {
	private String outsId;
	private String productId;
	private String storeId;
	private String userId;
	private BigDecimal outPrice;
	private String outNum;
	private String createBy;
	private String createTime;
	private String isOut;
	private String getCode;
	private String getStoreName;
	private String getProductName;
	private String dateStateTime;
	private String dateEndTime;
	private BigDecimal productInvent;
	
	
	public OutStoreInfo() {
		super();
	}


	public String getOutsId() {
		return outsId;
	}


	public void setOutsId(String outsId) {
		this.outsId = outsId;
	}


	public String getProductId() {
		return productId;
	}


	public void setProductId(String productId) {
		this.productId = productId;
	}


	public String getStoreId() {
		return storeId;
	}


	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public BigDecimal getOutPrice() {
		return outPrice;
	}


	public void setOutPrice(BigDecimal outPrice) {
		this.outPrice = outPrice;
	}


	public String getOutNum() {
		return outNum;
	}


	public void setOutNum(String outNum) {
		this.outNum = outNum;
	}


	public String getCreateBy() {
		return createBy;
	}


	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}


	public String getCreateTime() {
		return createTime;
	}


	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}


	public String getIsOut() {
		return isOut;
	}


	public void setIsOut(String isOut) {
		this.isOut = isOut;
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


	public BigDecimal getProductInvent() {
		return productInvent;
	}


	public void setProductInvent(BigDecimal productInvent) {
		this.productInvent = productInvent;
	}


	public OutStoreInfo(String outsId, String productId, String storeId,
			String userId, BigDecimal outPrice, String outNum, String createBy,
			String createTime, String isOut, String getCode,
			String getStoreName, String getProductName, String dateStateTime,
			String dateEndTime, BigDecimal productInvent) {
		super();
		this.outsId = outsId;
		this.productId = productId;
		this.storeId = storeId;
		this.userId = userId;
		this.outPrice = outPrice;
		this.outNum = outNum;
		this.createBy = createBy;
		this.createTime = createTime;
		this.isOut = isOut;
		this.getCode = getCode;
		this.getStoreName = getStoreName;
		this.getProductName = getProductName;
		this.dateStateTime = dateStateTime;
		this.dateEndTime = dateEndTime;
		this.productInvent = productInvent;
	}
	
}

