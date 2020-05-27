package com.auth.entity;

public class Store {
	// 仓库Id
	private Integer storeId;
	// 仓库名称
	private String storeName;
	// 仓库编号
	private String storeNum;
	// 仓库地址
	private String storeAddress;
	// 仓库联系人
	private String concat;
	// 联系电话
	private String phone;
	@Override
	public String toString() {
		return "Store [storeId=" + storeId + ", storeName=" + storeName
				+ ", storeNum=" + storeNum + ", storeAddress=" + storeAddress
				+ ", concat=" + concat + ", phone=" + phone + "]";
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
	public String getStoreNum() {
		return storeNum;
	}
	public void setStoreNum(String storeNum) {
		this.storeNum = storeNum;
	}
	public String getStoreAddress() {
		return storeAddress;
	}
	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}
	public String getConcat() {
		return concat;
	}
	public void setConcat(String concat) {
		this.concat = concat;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	//无参构造
	public Store() {
		super();
	}
	//带参构造
	public Store(Integer storeId, String storeName, String storeNum,
			String storeAddress, String concat, String phone) {
		super();
		this.storeId = storeId;
		this.storeName = storeName;
		this.storeNum = storeNum;
		this.storeAddress = storeAddress;
		this.concat = concat;
		this.phone = phone;
	}
	
}
