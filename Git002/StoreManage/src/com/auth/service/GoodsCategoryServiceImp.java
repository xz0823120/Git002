package com.auth.service;

import java.util.List;
import net.sf.json.JSONObject;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.auth.entity.GoodsCategory;
import com.auth.mapper.GoodsCategoryMapper;

@Service
public class GoodsCategoryServiceImp implements GoodsCategoryService {

	@Autowired
	private GoodsCategoryMapper goodsCategoryMapper;

	/**
	 *按照父id查询分类数据
	 * @author Administrator
	 * @date2017年12月5日下午1:54:50
	 * @version 1.0
	 */
	@Override
	public List<GoodsCategory> queryAllType(int parentId) {
		return goodsCategoryMapper.queryAllType(parentId);
	}

	/**
	 * 商品分类的树形结构（z-Tree）
	 * @author Administrator
	 * @date2017年12月5日下午1:54:50
	 * @version 1.0
	 */
	@Override
	public JSONArray goodsCategoryTree() {
		//定义一个JSONArray来存放树的结构
				JSONArray jsonArray = new JSONArray(); 
				//查询到一级分类
				List<GoodsCategory> firstTypeList = goodsCategoryMapper.queryAllType(0);
				//做非空判断
				if(firstTypeList.size() != 0){
					for (GoodsCategory firstType : firstTypeList) {
						JSONObject firstJson = new JSONObject();
						firstJson.put("id", firstType.getTypeId());
						firstJson.put("pId", 0);
						firstJson.put("name", firstType.getTypeName());
						firstJson.put("open", false);
						jsonArray.put(firstJson);
						int firstParentId = firstType.getTypeId();
						//firstParentId的非空判断
						if(firstParentId != 0){
							//查询到二级分类
							List<GoodsCategory> secondTypeList = goodsCategoryMapper.queryAllType(firstParentId);
							//做非空判断
							if(secondTypeList.size() != 0){
								//把二级分类放到对应的一级分类的子类中
								firstType.setChildGoodsCategory(secondTypeList);
								for (GoodsCategory secondType : secondTypeList) {
									JSONObject secondJson = new JSONObject();
									secondJson.put("id", secondType.getTypeId());
									secondJson.put("pId", secondType.getParentId());
									secondJson.put("name", secondType.getTypeName());
									secondJson.put("open", false);
									jsonArray.put(secondJson);
								}
							}
							
						}
						
					}
					
				}
		return jsonArray;
	}

	/**
	 * 通过分类编号查询分类
	 * @author Administrator
	 * @date2017年12月5日下午4:13:31
	 * @version 1.0
	 */
	@Override
	public GoodsCategory queryByTypeCode(String typeCode) {
		return goodsCategoryMapper.queryByTypeCode(typeCode);
	}

	/**
	 * 保存新分类
	 * @author Administrator
	 * @date2017年12月5日下午4:16:01
	 * @version 1.0
	 */
	@Override
	public int saveType(GoodsCategory goodsCategory) {
		return goodsCategoryMapper.saveType(goodsCategory);
	}

	/**
	 * 更新分类信息
	 * @author Administrator
	 * @date2017年12月5日下午4:17:02
	 * @version 1.0
	 */
	@Override
	public int updateType(GoodsCategory goodsCategory) {
		return goodsCategoryMapper.updateType(goodsCategory);
	}

	/**
	 * 通过分类id 查找商品
	 * @author Administrator
	 * @date2017年12月5日下午9:54:44
	 * @version 1.0
	 */
	@Override
	public GoodsCategory queryByTypeId(int typeId) {
		return goodsCategoryMapper.queryByTypeId(typeId);
	}

	/**
	 * 通过父id查询子分类
	 * @author Administrator
	 * @date2017年12月7日下午2:39:07
	 * @version 1.0
	 */
	@Override
	public List<GoodsCategory> queryChildType(int parendId) {
		return goodsCategoryMapper.queryChildType(parendId);
	}
	
		
		
		
		
		
	


	


	
	
		
		
		
		
	
}
