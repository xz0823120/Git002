package com.auth.entity;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 盘点表的javabean
 * @author 懒虫虫
 *
 */
public class StoreCheck {
	Integer checkId;//盘点表的主键
	Integer storeId;//仓库Id
	Integer recordId;//盘点状态
	Integer productId;//盘点商品ID
	Integer batchId;//盘点批次ID
	BigDecimal checkNum; //盘点数量
	Date checkTime;//盘点时间
	String checkUser;//盘点人
	BigDecimal lossNum;//损失
	String reson; //原因
	String checkState;//提交状态
	String batchNum;//批次num
	String productName;//商品名称
	String storeName;//仓库名称
	
	public String getCheckState() {
		return checkState;
	}

	public String getBatchNum() {
		return batchNum;
	}

	public String getProductName() {
		return productName;
	}

	public String getStoreName() {
		return storeName;
	}


	public void setCheckState(String checkState) {
		this.checkState = checkState;
	}

	public void setBatchNum(String batchNum) {
		this.batchNum = batchNum;
	}
	
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	@Override
	public String toString() {
		return "StoreCheck [checkId=" + checkId + ", storeId=" + storeId
				+ ", recordId=" + recordId + ", productId=" + productId
				+ ", batchId=" + batchId + ", checkNum=" + checkNum
				+ ", checkTime=" + checkTime + ", checkUser=" + checkUser
				+ ", lossNum=" + lossNum + ", reson=" + reson + ", checkState="
				+ checkState + ", batchNum=" + batchNum + ", productName="
				+ productName + ", storeName=" + storeName + "]";
	}

	public Integer getCheckId() {
		return checkId;
	}
	public void setCheckId(Integer checkId) {
		this.checkId = checkId;
	}
	public Integer getStoreId() {
		return storeId;
	}
	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}
	public Integer getRecordId() {
		return recordId;
	}
	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public Integer getBatchId() {
		return batchId;
	}
	public void setBatchId(Integer batchId) {
		this.batchId = batchId;
	}
	public BigDecimal getCheckNum() {
		return checkNum;
	}
	public void setCheckNum(BigDecimal checkNum) {
		this.checkNum = checkNum;
	}
	public Date getCheckTime() {
		return checkTime;
	}
	public void setCheckTime(Date checkTime) {
		this.checkTime = checkTime;
	}
	public String getCheckUser() {
		return checkUser;
	}
	public void setCheckUser(String checkUser) {
		this.checkUser = checkUser;
	}
	public BigDecimal getLossNum() {
		return lossNum;
	}
	public void setLossNum(BigDecimal lossNum) {
		this.lossNum = lossNum;
	}
	public String getReson() {
		return reson;
	}
	public void setReson(String reson) {
		this.reson = reson;
	}
}
