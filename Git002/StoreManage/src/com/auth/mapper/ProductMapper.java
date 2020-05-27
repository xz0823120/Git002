package com.auth.mapper;

import java.util.HashMap;
import java.util.List;

import com.auth.entity.Product;

public interface ProductMapper {
	
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
	 * 查找某个商品的库存
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月7日 下午6:33:09
	*@param empID
	*@param status
	*@version 1.0
	 */
	public Product findProductNum(Product product);
	
	//wy---------------------------
	/**
	 * 查询调货数量
	 * @param hashmap
	 * @return
	 */
	public Integer countProduct(Product product);
	/**
	 * 先将结果集插入到商品表，再修改插入的信息（仓库id,编号，数量）
	 *	下面两个sql语句需用事务保证一致性，注意product_id不同（查询插入是源商品id，修改时目标商品id）
	 * @param hashmap
	 * @return
	 */
	public Integer insertSelectResult(Product product);
	public Integer updateInsertInfo(Product product);
	public Integer getNewProductId();
	/**
	 * 根据商品编码查商品信息：调货编码验证
	 * @param hashmap
	 * @return
	 */
	public int  findProductByNum(Product product);
	
	
	/**
	 * @author Administrator
	 * @Description 根据商品id查商品信息
	 * @date 2017年12月12日上午11:05:42
	 * @param product
	 * @return
	 */
	public Product selectProductByPid(int productId);
	
}