package com.auth.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import com.auth.entity.Product;

public interface ProductService {
	/**
	 * 查询商品信息
	 * @param hashmap
	 * @return
	 */
	List<Product> selectProductMess(HashMap<String, Object> hashmap);
	
	/**
	 * 查询商品总数
	 * @param hashmap
	 * @return
	 */
	int selectCount(HashMap<String, Object> hashmap);
	
	/**
	 * 修改商品
	 * @param hashmap
	 * @return
	 */
	int modificationProduct(HashMap<String,Object> hashmap);
	
	/**
	 * 添加商品
	 * @param hashmap
	 * @return
	 */
	int addProduct(HashMap<String,Object> hashmap);
	
	/**
	 * 改变商品的上下架状态
	 * @param product
	 * @return
	 */
	int changeState(Product product);
	
	/**
	 * 用户请求出库
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月7日 下午5:17:57
	*@param empID
	*@param status
	*@version 1.0
	 */
	public int insertOutStoreFrom(Product product);
	/**
	 * 出库成功后更新商品数量
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月7日 下午5:18:54
	*@param empID
	*@param status
	*@version 1.0
	 */
	public int updateProductNum(Product product);
	/**
	 * 根据商品ID和仓库ID查找商品数量
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月7日 下午6:37:24
	*@param empID
	*@param status
	*@version 1.0
	 */
	public Product findProductNum(Product product);
	
	
	
	
	/**
	 * @author Administrator 吴垚
	 * @Description 查询调货数量
	 * @param hashmap
	 * @return
	 */
	public JSONObject countProduct(HttpServletRequest request ,Product product);
	/**
	 * 
	 * @author Administrator 吴垚
	 * @Description 根据商品id查商品信息
	 * @date 2017年12月12日上午11:05:42
	 * @param product
	 * @return
	 */
	public Product selectProductByPid(int productId);
}
