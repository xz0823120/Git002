package com.auth.service;

import java.util.List;
import org.json.JSONArray;
import com.auth.entity.GoodsCategory;

public interface GoodsCategoryService {
	
	/**
	 *按照父id查询分类数据
	 * @author Administrator
	 * @date2017年12月5日下午1:54:50
	 * @version 1.0
	 */
	public List<GoodsCategory> queryAllType(int parentId);
	
	/**
	 * 商品分类的树形结构（z-Tree）
	 * @author Administrator
	 * @date2017年12月5日下午1:54:50
	 * @version 1.0
	 */
	public JSONArray goodsCategoryTree();
	

	/**
	 * 通过分类编号查询分类
	 * @author Administrator
	 * @date2017年12月5日下午4:13:31
	 * @version 1.0
	 */
	public GoodsCategory queryByTypeCode(String typeCode);
	
	/**
	 * 保存新分类
	 * @author Administrator
	 * @date2017年12月5日下午4:16:01
	 * @version 1.0
	 */
	public int saveType(GoodsCategory goodsCategory);
	
	/**
	 * 更新分类信息
	 * @author Administrator
	 * @date2017年12月5日下午4:17:02
	 * @version 1.0
	 */
	public int updateType(GoodsCategory goodsCategory);
	
	/**
	 * 通过分类id 查找商品
	 * @author Administrator
	 * @date2017年12月5日下午9:54:44
	 * @version 1.0
	 */
	public GoodsCategory queryByTypeId(int typeId);
	
	/**
	 * 通过父id查询子分类
	 * @author Administrator
	 * @date2017年12月7日下午2:39:07
	 * @version 1.0
	 */
	public List<GoodsCategory> queryChildType(int parendId);

	
}
