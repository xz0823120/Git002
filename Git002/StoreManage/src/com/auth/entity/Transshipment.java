package com.auth.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Transshipment {

	// 调货单Id
	private Integer transId;
	// 源仓库Id
	private Integer sourceStoreId;
	// 源商品id
	private Integer sourceProductId;
	//目标仓库id
	private  Integer targetStoreId;
	//目标商品id
	private Integer targetProductId;
	// 调货数量
	private BigDecimal transNum;
	// 审核状态
	private String auditState;
	// 创建人
	private Integer createBy;
	// 创建时间
	private Date createTime;
	//源仓库名称
	private String sourceStoreName;
	//源商品名称
	private String sourceProductName;
	//目标仓库名称
	private String targetStoreName;
	//目标商品名称
	private String targetProductName;
	//创建者姓名
	private String createName;
	//toString
	@Override
	public String toString() {
		return "Transshipment [transId=" + transId + ", sourceStoreId="
				+ sourceStoreId + ", sourceProductId=" + sourceProductId
				+ ", targetStoreId=" + targetStoreId + ", targetProductId="
				+ targetProductId + ", transNum=" + transNum + ", auditState="
				+ auditState + ", createBy=" + createBy + ", createTime="
				+ createTime + ", sourceStoreName=" + sourceStoreName
				+ ", sourceProductName=" + sourceProductName
				+ ", targetStoreName=" + targetStoreName
				+ ", targetProductName=" + targetProductName + ", createName="
				+ createName + "]";
	}
	//set get
	public Integer getTransId() {
		return transId;
	}
	public void setTransId(Integer transId) {
		this.transId = transId;
	}
	public Integer getSourceStoreId() {
		return sourceStoreId;
	}
	public void setSourceStoreId(Integer sourceStoreId) {
		this.sourceStoreId = sourceStoreId;
	}
	public Integer getSourceProductId() {
		return sourceProductId;
	}
	public void setSourceProductId(Integer sourceProductId) {
		this.sourceProductId = sourceProductId;
	}
	public Integer getTargetStoreId() {
		return targetStoreId;
	}
	public void setTargetStoreId(Integer targetStoreId) {
		this.targetStoreId = targetStoreId;
	}
	public Integer getTargetProductId() {
		return targetProductId;
	}
	public void setTargetProductId(Integer targetProductId) {
		this.targetProductId = targetProductId;
	}
	public BigDecimal getTransNum() {
		return transNum;
	}
	public void setTransNum(BigDecimal transNum) {
		this.transNum = transNum;
	}
	public String getAuditState() {
		return auditState;
	}
	public void setAuditState(String auditState) {
		this.auditState = auditState;
	}
	public Integer getCreateBy() {
		return createBy;
	}
	public void setCreateBy(Integer createBy) {
		this.createBy = createBy;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getSourceStoreName() {
		return sourceStoreName;
	}
	public void setSourceStoreName(String sourceStoreName) {
		this.sourceStoreName = sourceStoreName;
	}
	public String getSourceProductName() {
		return sourceProductName;
	}
	public void setSourceProductName(String sourceProductName) {
		this.sourceProductName = sourceProductName;
	}
	public String getTargetStoreName() {
		return targetStoreName;
	}
	public void setTargetStoreName(String targetStoreName) {
		this.targetStoreName = targetStoreName;
	}
	public String getTargetProductName() {
		return targetProductName;
	}
	public void setTargetProductName(String targetProductName) {
		this.targetProductName = targetProductName;
	}
	public String getCreateName() {
		return createName;
	}
	public void setCreateName(String createName) {
		this.createName = createName;
	}
	//构造
	public Transshipment() {
		super();
	}
	public Transshipment(Integer transId, Integer sourceStoreId,
			Integer sourceProductId, Integer targetStoreId,
			Integer targetProductId, BigDecimal transNum, String auditState,
			Integer createBy, Date createTime, String sourceStoreName,
			String sourceProductName, String targetStoreName,
			String targetProductName, String createName) {
		super();
		this.transId = transId;
		this.sourceStoreId = sourceStoreId;
		this.sourceProductId = sourceProductId;
		this.targetStoreId = targetStoreId;
		this.targetProductId = targetProductId;
		this.transNum = transNum;
		this.auditState = auditState;
		this.createBy = createBy;
		this.createTime = createTime;
		this.sourceStoreName = sourceStoreName;
		this.sourceProductName = sourceProductName;
		this.targetStoreName = targetStoreName;
		this.targetProductName = targetProductName;
		this.createName = createName;
	}
	
}
