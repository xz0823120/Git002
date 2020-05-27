package com.auth.service;

import java.util.HashMap;
import java.util.List;

import com.auth.entity.Purchase;

public interface PurchaseService {

	/**
	 * 查询满足搜索条件的数据条数
	 * @author Administrator
	 * @date2017年12月6日上午10:04:55
	 * @version 1.0
	 */
	public int selectCount(HashMap<String, Object> hashmap);
	
	/**
	 * 分页查询的数据
	 * @author Administrator
	 * @date2017年12月6日上午10:06:35
	 * @version 1.0
	 */
	public List<Purchase> purchasePageQuery(HashMap<String, Object> hashmap);
	
	/**
	 * 生成入库单
	 * @author Administrator
	 * @date2017年12月6日下午8:53:44
	 * @version 1.0
	 */
	public int getStoreTable(int buyId);
	
	/**
	 * 更新采购单
	 * @author Administrator
	 * @date2017年12月7日上午9:33:38
	 * @version 1.0
	 */
	public int updateNums(Purchase purchase);
	
	/**
	 * 添加新的采购单
	 * @author Administrator
	 * @date2017年12月7日下午9:24:40
	 * @version 1.0
	 */
	public int savePurchase(Purchase purchase);
	
}
