/**
 * @filename StatMapper.java
 * @author Administrator
 * @date 2017年12月5日 下午6:35:50
 * @version 1.0
 * Copyright (C) 2017 
 */
package com.auth.mapper;


import java.util.HashMap;
import java.util.List;
import com.auth.entity.Stat;

public interface StatMapper {
	/**
	 * 查询库存不足的商品
	*@author Administrator
	*@date 2017年12月5日 下午8:53:51
	*@version 1.0
	 */
	public List<Stat> statUnderstock(int storeId);
	/**
	 * 统计商品的损耗比
	*@author Administrator
	*@date 2017年12月5日 下午9:17:19
	*@version 1.0
	 */
	public List<Stat> statLossRatio(HashMap<String, Object> hashMap);
	/**
	 * 统计商品的销售比
	*@author Administrator
	*@date 2017年12月6日 下午9:06:24
	*@version 1.0
	 */
	public List<Stat> statMarketRatio(Stat stat);
	/**
	 * 统计下架商品
	*@author Administrator
	*@date 2017年12月7日 上午11:09:22
	*@version 1.0
	 */
	public List<Stat> statOutProduct(int storeId);
	/**
	 * 统计规定时间内的采购量
	*@author Administrator
	*@date 2017年12月7日 上午11:20:35
	*@version 1.0
	 */
	public List<Stat> statPurchase(Stat stat);
	/**
	 * 统计不同分类下的商品库存
	*@author Administrator
	*@date 2017年12月7日 下午2:08:52
	*@version 1.0
	 */
	public List<Stat> statInvent(int storeId);
}
