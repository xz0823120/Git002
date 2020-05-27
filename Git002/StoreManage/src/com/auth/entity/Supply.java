package com.auth.entity;

//供货商
public class Supply {

	private Integer supplyId;
	private String supplyNum;
	private String supplyName;
	private String supplyIntroduce;
	private String concat;
	private String phone;
	private String address;
	private String isDelete;
	
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	public Integer getSupplyId() {
		return supplyId;
	}
	public void setSupplyId(Integer supplyId) {
		this.supplyId = supplyId;
	}
	public String getSupplyNum() {
		return supplyNum;
	}
	public void setSupplyNum(String supplyNum) {
		this.supplyNum = supplyNum;
	}
	public String getSupplyName() {
		return supplyName;
	}
	public void setSupplyName(String supplyName) {
		this.supplyName = supplyName;
	}
	public String getSupplyIntroduce() {
		return supplyIntroduce;
	}
	public void setSupplyIntroduce(String supplyIntroduce) {
		this.supplyIntroduce = supplyIntroduce;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "Supply [supplyId=" + supplyId + ", supplyNum=" + supplyNum
				+ ", supplyName=" + supplyName + ", supplyIntroduce="
				+ supplyIntroduce + ", concat=" + concat + ", phone=" + phone
				+ ", address=" + address + ", isDelete=" + isDelete + "]";
	}
}
