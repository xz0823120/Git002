/**
 * @filename Stat.java
 * @author Administrator
 * @date 2017年12月7日 上午8:40:45
 * @version 1.0
 * Copyright (C) 2017 
 */
package com.auth.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Stat {
	//商品Id
    private Integer productId;
    //仓库ID
    private Integer storeId;
    //仓库名称
    private String storeName;
    //品牌ID
    private Integer brandId;
    //品牌Name
    private String brandName;
    //商品名称
    private String productName;
    //商品编号
    private String productNum;
    //库存
    private BigDecimal productInvent;
    //商品类型ID
    private Integer typeId;
    //商品类型name
    private String typeName;
    //供应商ID
    private Integer supplyId;
    //供应商Name
    private String supplyName;
    //产地ID
    private Integer placeId;
    //产地NAME
    private String placeName;
    //单位ID
    private Integer unitId;
    //单位NAME
    private String unitName;
    //上下架状态
    private String upDownState;
    //创建时间
    private Date createTime;
    //售价
    private BigDecimal salePrice;
    //损耗比
    private BigDecimal getLossNum;
    //销售比
    private BigDecimal getMarketRatio;
  //采购id
	private Integer buyId;
    //预计购买数量
    private BigDecimal buyNum;
    //实际购买数量
    private BigDecimal factBuyNum;
    //采购时间
    private Date buyTime;
    //采购人
    private String buyUser;
    //采购人电话
    private String phone;
    //是否生成入库单
    private String isIn;
    //搜索开始时间
    private String startTime;
    //搜索结束时间
    private String endTime;
	public Stat() {
		super();
	}
	public Stat(Integer productId, Integer storeId, String storeName,
			Integer brandId, String brandName, String productName,
			String productNum, BigDecimal productInvent, Integer typeId,
			String typeName, Integer supplyId, String supplyName,
			Integer placeId, String placeName, Integer unitId, String unitName,
			String upDownState, BigDecimal getLossNum,
			BigDecimal getMarketRatio, Integer buyId, BigDecimal buyNum,
			BigDecimal factBuyNum, Date buyTime, String buyUser, String phone,
			String isIn, String startTime, String endTime) {
		super();
		this.productId = productId;
		this.storeId = storeId;
		this.storeName = storeName;
		this.brandId = brandId;
		this.brandName = brandName;
		this.productName = productName;
		this.productNum = productNum;
		this.productInvent = productInvent;
		this.typeId = typeId;
		this.typeName = typeName;
		this.supplyId = supplyId;
		this.supplyName = supplyName;
		this.placeId = placeId;
		this.placeName = placeName;
		this.unitId = unitId;
		this.unitName = unitName;
		this.upDownState = upDownState;
		this.getLossNum = getLossNum;
		this.getMarketRatio = getMarketRatio;
		this.buyId = buyId;
		this.buyNum = buyNum;
		this.factBuyNum = factBuyNum;
		this.buyTime = buyTime;
		this.buyUser = buyUser;
		this.phone = phone;
		this.isIn = isIn;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public Integer getStoreId() {
		return storeId;
	}
	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public Integer getBrandId() {
		return brandId;
	}
	public void setBrandId(Integer brandId) {
		this.brandId = brandId;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductNum() {
		return productNum;
	}
	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}
	public BigDecimal getProductInvent() {
		return productInvent;
	}
	public void setProductInvent(BigDecimal productInvent) {
		this.productInvent = productInvent;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public Integer getSupplyId() {
		return supplyId;
	}
	public void setSupplyId(Integer supplyId) {
		this.supplyId = supplyId;
	}
	public String getSupplyName() {
		return supplyName;
	}
	public void setSupplyName(String supplyName) {
		this.supplyName = supplyName;
	}
	public Integer getPlaceId() {
		return placeId;
	}
	public void setPlaceId(Integer placeId) {
		this.placeId = placeId;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public Integer getUnitId() {
		return unitId;
	}
	public void setUnitId(Integer unitId) {
		this.unitId = unitId;
	}
	public String getUnitName() {
		return unitName;
	}
	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}
	public String getUpDownState() {
		return upDownState;
	}
	public void setUpDownState(String upDownState) {
		this.upDownState = upDownState;
	}
	public BigDecimal getGetLossNum() {
		return getLossNum;
	}
	public void setGetLossNum(BigDecimal getLossNum) {
		this.getLossNum = getLossNum;
	}
	public BigDecimal getGetMarketRatio() {
		return getMarketRatio;
	}
	public void setGetMarketRatio(BigDecimal getMarketRatio) {
		this.getMarketRatio = getMarketRatio;
	}
	public Integer getBuyId() {
		return buyId;
	}
	public void setBuyId(Integer buyId) {
		this.buyId = buyId;
	}
	public BigDecimal getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(BigDecimal buyNum) {
		this.buyNum = buyNum;
	}
	public BigDecimal getFactBuyNum() {
		return factBuyNum;
	}
	public void setFactBuyNum(BigDecimal factBuyNum) {
		this.factBuyNum = factBuyNum;
	}
	public Date getBuyTime() {
		return buyTime;
	}
	public void setBuyTime(Date buyTime) {
		this.buyTime = buyTime;
	}
	public String getBuyUser() {
		return buyUser;
	}
	 public void setBuyUser(String buyUser) {
	        this.buyUser = buyUser == null ? null : buyUser.trim();
	    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getIsIn() {
        return isIn;
    }

    public void setIsIn(String isIn) {
        this.isIn = isIn == null ? null : isIn.trim();
    }
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public BigDecimal getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(BigDecimal salePrice) {
		this.salePrice = salePrice;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "Stat [productId=" + productId + ", storeId=" + storeId
				+ ", storeName=" + storeName + ", brandId=" + brandId
				+ ", brandName=" + brandName + ", productName=" + productName
				+ ", productNum=" + productNum + ", productInvent="
				+ productInvent + ", typeId=" + typeId + ", typeName="
				+ typeName + ", supplyId=" + supplyId + ", supplyName="
				+ supplyName + ", placeId=" + placeId + ", placeName="
				+ placeName + ", unitId=" + unitId + ", unitName=" + unitName
				+ ", upDownState=" + upDownState + ", createTime=" + createTime
				+ ", salePrice=" + salePrice + ", getLossNum=" + getLossNum
				+ ", getMarketRatio=" + getMarketRatio + ", buyId=" + buyId
				+ ", buyNum=" + buyNum + ", factBuyNum=" + factBuyNum
				+ ", buyTime=" + buyTime + ", buyUser=" + buyUser + ", phone="
				+ phone + ", isIn=" + isIn + ", startTime=" + startTime
				+ ", endTime=" + endTime + "]";
	}
    
}
