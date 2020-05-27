package com.auth.entity;

public class Unit {
	private int unitId;
	private String unitName;
	private String unitDesc;
	public int getUnitId() {
		return unitId;
	}
	public void setUnitId(int unitId) {
		this.unitId = unitId;
	}
	public String getUnitName() {
		return unitName;
	}
	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}
	public String getUnitDesc() {
		return unitDesc;
	}
	public void setUnitDesc(String unitDesc) {
		this.unitDesc = unitDesc;
	}
	@Override
	public String toString() {
		return "Unit [unitId=" + unitId + ", unitName=" + unitName
				+ ", unitDesc=" + unitDesc + "]";
	}
	
}
