package com.auth.entity;

import java.util.Date;
/**
 * 用户实体类
 * @author lg
 * @date 2018-01-06
 */
public class User {
	private int userId; // 用户id
	private String userName; // 用户名
	private String userCode; // 用户登录code
	private String userPwd; // 用户密码
	private String userType; // 用户类型
	private String userState;// 用户状态
	private String isDelete; // 删除状态
	private int createBy; // 创建人
	private Date createTime; // 创建时间
	private int updateBy; // 修改人
	private Date updateTime; // 修改时间
	private String getCode;

	public User() {
		super();
	}

	public User(int userId, String userName, String userCode, String userPwd,
			String userType, String userState, String isDelete, int createBy,
			Date createTime, int updateBy, Date updateTime) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userCode = userCode;
		this.userPwd = userPwd;
		this.userType = userType;
		this.userState = userState;
		this.isDelete = isDelete;
		this.createBy = createBy;
		this.createTime = createTime;
		this.updateBy = updateBy;
		this.updateTime = updateTime;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserState() {
		return userState;
	}

	public void setUserState(String userState) {
		this.userState = userState;
	}

	public String getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
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
		return "User [userId=" + userId + ", userName=" + userName
				+ ", userCode=" + userCode + ", userPwd=" + userPwd
				+ ", userType=" + userType + ", userState=" + userState
				+ ", isDelete=" + isDelete + ", createBy=" + createBy
				+ ", createTime=" + createTime + ", updateBy=" + updateBy
				+ ", updateTime=" + updateTime + "]";
	}

	public String getGetCode() {
		return getCode;
	}

	public void setGetCode(String getCode) {
		this.getCode = getCode;
	}
	
}
