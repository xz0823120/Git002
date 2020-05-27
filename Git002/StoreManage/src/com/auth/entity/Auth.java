package com.auth.entity;

import java.util.Date;
import java.util.List;

public class Auth {
	private int authId;// 权限id
	private int parentId;// 权限父id
	private String authName;
	private String authDesc;
	private int authGrade;
	private String authType;
	private String authUrl;
	private String authCode;
	private int authOrder;
	private String authState;
	private int createBy;
	private Date createTime;
	private int updateBy;
	private Date updateTime;

	// 加入子权限的类属性
	private List<Auth> childAuth;

	public List<Auth> getChildAuth() {
		return childAuth;
	}

	public void setChildAuth(List<Auth> childAuth) {
		this.childAuth = childAuth;
	}

	public Auth() {
		super();
	}

	public Auth(int authId, int parentId, String authName, String authDesc,
			int authGrade, String authType, String authUrl, String authCode,
			int authOrder, String authState, int createBy, Date createTime,
			int updateBy, Date updateTime) {
		super();
		this.authId = authId;
		this.parentId = parentId;
		this.authName = authName;
		this.authDesc = authDesc;
		this.authGrade = authGrade;
		this.authType = authType;
		this.authUrl = authUrl;
		this.authCode = authCode;
		this.authOrder = authOrder;
		this.authState = authState;
		this.createBy = createBy;
		this.createTime = createTime;
		this.updateBy = updateBy;
		this.updateTime = updateTime;
	}

	public int getAuthId() {
		return authId;
	}

	public void setAuthId(int authId) {
		this.authId = authId;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public String getAuthName() {
		return authName;
	}

	public void setAuthName(String authName) {
		this.authName = authName;
	}

	public String getAuthDesc() {
		return authDesc;
	}

	public void setAuthDesc(String authDesc) {
		this.authDesc = authDesc;
	}

	public int getAuthGrade() {
		return authGrade;
	}

	public void setAuthGrade(int authGrade) {
		this.authGrade = authGrade;
	}

	public String getAuthType() {
		return authType;
	}

	public void setAuthType(String authType) {
		this.authType = authType;
	}

	public String getAuthUrl() {
		return authUrl;
	}

	public void setAuthUrl(String authUrl) {
		this.authUrl = authUrl;
	}

	public String getAuthCode() {
		return authCode;
	}

	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}

	public int getAuthOrder() {
		return authOrder;
	}

	public void setAuthOrder(int authOrder) {
		this.authOrder = authOrder;
	}

	public String getAuthState() {
		return authState;
	}

	public void setAuthState(String authState) {
		this.authState = authState;
	}

	public int getCreateBy() {
		return createBy;
	}

	public void setCreateBy(int createBy) {
		this.createBy = createBy;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public int getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(int updateBy) {
		this.updateBy = updateBy;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Override
	public String toString() {
		return "Auth [authId=" + authId + ", parentId=" + parentId
				+ ", authName=" + authName + ", authDesc=" + authDesc
				+ ", authGrade=" + authGrade + ", authType=" + authType
				+ ", authUrl=" + authUrl + ", authCode=" + authCode
				+ ", authOrder=" + authOrder + ", authState=" + authState
				+ ", createBy=" + createBy + ", createTime=" + createTime
				+ ", updateBy=" + updateBy + ", updateTime=" + updateTime
				+ ", childAuth=" + childAuth + "]";
	}

}
