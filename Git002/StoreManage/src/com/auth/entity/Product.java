package com.auth.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Product {
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
    
    //上下架
    private String upDownState;
    //进价
	private BigDecimal inPrice;
	//售价
    private BigDecimal salePrice;
    //会员价
    private BigDecimal memPrice;
    //创建时间
    private Date createTime;
    //修改时间
    private Date updateTime;
    //创建人
    private Integer createBy;
    //修改人
    private Integer updateBy;
    //商品图片
    private String imgs;
    //生产日期
    private Date productDate;
    //保质期
    private Date suppDate;
    //商品介绍
    private String introduce;
    //有两个值   “>”  或    “<”
    private String isOverDate;
    private String outNum;
    private String userId;
  
	public Product() {
		super();
	}

	public String getIsOverDate() {
		return isOverDate;
	}

	public void setIsOverDate(String isOverDate) {
		this.isOverDate = isOverDate;
	}
	
	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
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

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
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

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public String getProductName() {
        return productName;
    }

    public Product(Integer productId, Integer storeId, String storeName,
			Integer brandId, String brandName, String productName,
			String productNum, BigDecimal productInvent, Integer typeId,
			String typeName, Integer supplyId, String supplyName,
			Integer placeId, String placeName, Integer unitId, String unitName,
			String upDownState, BigDecimal inPrice, BigDecimal salePrice,
			BigDecimal memPrice, Date createTime, Date updateTime,
			Integer createBy, Integer updateBy, String imgs, Date productDate,
			Date suppDate, String introduce, String isOverDate, String outNum,
			String userId) {
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
		this.inPrice = inPrice;
		this.salePrice = salePrice;
		this.memPrice = memPrice;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.createBy = createBy;
		this.updateBy = updateBy;
		this.imgs = imgs;
		this.productDate = productDate;
		this.suppDate = suppDate;
		this.introduce = introduce;
		this.isOverDate = isOverDate;
		this.outNum = outNum;
		this.userId = userId;
	}

	public String getOutNum() {
		return outNum;
	}

	public void setOutNum(String outNum) {
		this.outNum = outNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setProductName(String productName) {
        this.productName = productName == null ? null : productName.trim();
    }

    public String getProductNum() {
        return productNum;
    }

    public void setProductNum(String productNum) {
        this.productNum = productNum == null ? null : productNum.trim();
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

    public Integer getUnitId() {
        return unitId;
    }

    public void setUnitId(Integer unitId) {
        this.unitId = unitId;
    }

    public String getUpDownState() {
        return upDownState;
    }

    public void setUpDownState(String upDownState) {
        this.upDownState = upDownState == null ? null : upDownState.trim();
    }

    public BigDecimal getInPrice() {
        return inPrice;
    }

    public void setInPrice(BigDecimal inPrice) {
        this.inPrice = inPrice;
    }

    public BigDecimal getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(BigDecimal salePrice) {
        this.salePrice = salePrice;
    }

    public BigDecimal getMemPrice() {
        return memPrice;
    }

    public void setMemPrice(BigDecimal memPrice) {
        this.memPrice = memPrice;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Integer createBy) {
        this.createBy = createBy;
    }

    public Integer getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(Integer updateBy) {
        this.updateBy = updateBy;
    }

    public String getImgs() {
        return imgs;
    }

    public void setImgs(String imgs) {
        this.imgs = imgs == null ? null : imgs.trim();
    }

    public Date getProductDate() {
        return productDate;
    }

    public void setProductDate(Date productDate) {
        this.productDate = productDate;
    }

    public Date getSuppDate() {
        return suppDate;
    }

    public void setSuppDate(Date suppDate) {
        this.suppDate = suppDate;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", storeId=" + storeId
				+ ", storeName=" + storeName + ", brandId=" + brandId
				+ ", brandName=" + brandName + ", productName=" + productName
				+ ", productNum=" + productNum + ", productInvent="
				+ productInvent + ", typeId=" + typeId + ", typeName="
				+ typeName + ", supplyId=" + supplyId + ", supplyName="
				+ supplyName + ", placeId=" + placeId + ", placeName="
				+ placeName + ", unitId=" + unitId + ", unitName=" + unitName
				+ ", upDownState=" + upDownState + ", inPrice=" + inPrice
				+ ", salePrice=" + salePrice + ", memPrice=" + memPrice
				+ ", createTime=" + createTime + ", updateTime=" + updateTime
				+ ", createBy=" + createBy + ", updateBy=" + updateBy
				+ ", imgs=" + imgs + ", productDate=" + productDate
				+ ", suppDate=" + suppDate + ", introduce=" + introduce
				+ ", isOverDate=" + isOverDate + "]";
	}
    
    
    
}