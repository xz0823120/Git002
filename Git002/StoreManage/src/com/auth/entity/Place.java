package com.auth.entity;

//产地
public class Place {

	private Integer placeId;
	private String placeName;
	private String placeNum;
	private String introduce;
	private String isDelete;
	
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
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
	public String getPlaceNum() {
		return placeNum;
	}
	public void setPlaceNum(String placeNum) {
		this.placeNum = placeNum;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	@Override
	public String toString() {
		return "Place [placeId=" + placeId + ", placeName=" + placeName
				+ ", placeNum=" + placeNum + ", introduce=" + introduce
				+ ", isDelete=" + isDelete + "]";
	}
	
}
