package com.auth.entity;



public class Message {

	private int msgId;//站内信id
	private String msgTitle;//站内信标题
	private String msgContext;//站内信信息
	private String createTime;//创建时间
	
	//添加副表信息
	private int userMsgId;//关联表id
	private String fromUser;//关联表发送者
	private String state;//关联表状态
	private int toUser;//关联表发给谁
	private String userName;
	private String userId;
	public int getMsgId() {
		return msgId;
	}
	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}
	public String getMsgTitle() {
		return msgTitle;
	}
	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}
	public String getMsgContext() {
		return msgContext;
	}
	public void setMsgContext(String msgContext) {
		this.msgContext = msgContext;
	}
	
	
	public String getcreateTime() {
		return createTime;
	}
	public void setcreateTime(String createTime) {
		this.createTime = createTime;
	}
	public int getUserMsgId() {
		return userMsgId;
	}
	public void setUserMsgId(int userMsgId) {
		this.userMsgId = userMsgId;
	}
	
	public String getFromUser() {
		return fromUser;
	}
	public void setFromUser(String fromUser) {
		this.fromUser = fromUser;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getToUser() {
		return toUser;
	}
	public void setToUser(int toUser) {
		this.toUser = toUser;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	

	
	
	
	
}
