package com.auth.entity;

import java.util.List;

public class GoodsCategory {
		//商品分类id
	 	private Integer typeId;
	 	//商品分类父id
	    private Integer parentId;
	    //商品分类名称
	    private String typeName;
	    //商品分类描述
	    private String typeDesc;
	    //商品分类编码（唯一标识）
	    private String typeCode;
	    //子分类
	    private List<GoodsCategory> childGoodsCategory;

		public GoodsCategory() {

		}

		public GoodsCategory(Integer typeId, Integer parentId, String typeName,
				String typeDesc, String typeCode) {
			this.typeId = typeId;
			this.parentId = parentId;
			this.typeName = typeName;
			this.typeDesc = typeDesc;
			this.typeCode = typeCode;
		}

		public Integer getTypeId() {
			return typeId;
		}

		public void setTypeId(Integer typeId) {
			this.typeId = typeId;
		}

		public Integer getParentId() {
			return parentId;
		}

		public void setParentId(Integer parentId) {
			this.parentId = parentId;
		}

		public String getTypeName() {
			return typeName;
		}

		public void setTypeName(String typeName) {
			this.typeName = typeName;
		}

		public String getTypeDesc() {
			return typeDesc;
		}

		public void setTypeDesc(String typeDesc) {
			this.typeDesc = typeDesc;
		}

		public String getTypeCode() {
			return typeCode;
		}

		public void setTypeCode(String typeCode) {
			this.typeCode = typeCode;
		}

		public List<GoodsCategory> getChildGoodsCategory() {
			return childGoodsCategory;
		}

		public void setChildGoodsCategory(List<GoodsCategory> childGoodsCategory) {
			this.childGoodsCategory = childGoodsCategory;
		}

		@Override
		public String toString() {
			return "GoodsCategory [typeId=" + typeId + ", parentId=" + parentId
					+ ", typeName=" + typeName + ", typeDesc=" + typeDesc
					+ ", typeCode=" + typeCode + ", childGoodsCategory="
					+ childGoodsCategory + "]";
		}

		

	  
}
