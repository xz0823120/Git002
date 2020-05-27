package com.auth.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Purchase {
		
		//采购id
		private Integer buyId;
		//商品id
	    private Integer productId;
	    //仓库id
	    private Integer storeId;
	    //预计购买数量
	    private BigDecimal buyNum;
	    //实际购买数量
	    private BigDecimal factBuyNum;
	    //采购时间
	    private Date buyTime;
	    //供货商id
	    private Integer supplyId;
	    //产地id
	    private Integer placeId;
	    //采购人
	    private String buyUser;
	    //采购人电话
	    private String phone;
	    //是否生成入库单
	    private String isIn;
	    //商品名称
	    private String productName;
	    //仓库名称
	    private String storeName;
	    //供货商名称
	    private String supplyName;
	    //产地名称
	    private String placeName;
	    //搜索开始时间
	    private String startTime;
	    //搜索结束时间
	    private String endTime;

	    public Purchase() {
	    	
		}
	    
		public Purchase(Integer buyId, Integer productId, Integer storeId,
				BigDecimal buyNum, BigDecimal factBuyNum, Date buyTime,
				Integer supplyId, Integer placeId, String buyUser,
				String phone, String isIn) {
			this.buyId = buyId;
			this.productId = productId;
			this.storeId = storeId;
			this.buyNum = buyNum;
			this.factBuyNum = factBuyNum;
			this.buyTime = buyTime;
			this.supplyId = supplyId;
			this.placeId = placeId;
			this.buyUser = buyUser;
			this.phone = phone;
			this.isIn = isIn;
		}


		public Integer getBuyId() {
	        return buyId;
	    }

	    public void setBuyId(Integer buyId) {
	        this.buyId = buyId;
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

	    public Integer getSupplyId() {
	        return supplyId;
	    }

	    public void setSupplyId(Integer supplyId) {
	        this.supplyId = supplyId;
	    }

	    public Integer getPlaceId() {
	        return placeId;
	    }

	    public void setPlaceId(Integer placeId) {
	        this.placeId = placeId;
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

		public String getProductName() {
			return productName;
		}

		public void setProductName(String productName) {
			this.productName = productName;
		}

		public String getStoreName() {
			return storeName;
		}

		public void setStoreName(String storeName) {
			this.storeName = storeName;
		}

		public String getSupplyName() {
			return supplyName;
		}

		public void setSupplyName(String supplyName) {
			this.supplyName = supplyName;
		}

		public String getPlaceName() {
			return placeName;
		}

		public void setPlaceName(String placeName) {
			this.placeName = placeName;
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

		@Override
		public String toString() {
			return "Purchase [buyId=" + buyId + ", productId=" + productId
					+ ", storeId=" + storeId + ", buyNum=" + buyNum
					+ ", factBuyNum=" + factBuyNum + ", buyTime=" + buyTime
					+ ", supplyId=" + supplyId + ", placeId=" + placeId
					+ ", buyUser=" + buyUser + ", phone=" + phone + ", isIn="
					+ isIn + ", productName=" + productName + ", storeName="
					+ storeName + ", supplyName=" + supplyName + ", placeName="
					+ placeName + ", startTime=" + startTime + ", endTime="
					+ endTime + "]";
		}

		
		
	    
}
