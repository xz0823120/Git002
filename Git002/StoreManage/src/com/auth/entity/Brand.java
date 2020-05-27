package com.auth.entity;

public class Brand {

	private int brandId;
	private String brandName;
	private String brandLeter; // 品牌首字母
	private String brandDesc; // 品牌描述
	public int getBrandId() {
		return brandId;
	}
	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getBrandLeter() {
		return brandLeter;
	}
	public void setBrandLeter(String brandLeter) {
		this.brandLeter = brandLeter;
	}
	public String getBrandDesc() {
		return brandDesc;
	}
	public void setBrandDesc(String brandDesc) {
		this.brandDesc = brandDesc;
	}

	

}
