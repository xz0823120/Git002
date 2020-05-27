package com.auth.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.auth.entity.Purchase;
import com.auth.mapper.PurchaseMapper;


@Service
public class PurchaseServiceImp implements PurchaseService{
	
	@Autowired
	private PurchaseMapper purchaseMapper;

	/**
	 * 查询满足搜索条件的数据条数
	 * @author Administrator
	 * @date2017年12月6日上午10:04:55
	 * @version 1.0
	 */
	@Override
	public int selectCount(HashMap<String, Object> hashmap) {
		return purchaseMapper.selectCount(hashmap);
	}

	/**
	 * 分页查询的数据
	 * @author Administrator
	 * @date2017年12月6日上午10:06:35
	 * @version 1.0
	 */
	@Override
	public List<Purchase> purchasePageQuery(HashMap<String, Object> hashmap) {
		return purchaseMapper.purchasePageQuery(hashmap);
	}

	/**
	 * 生成入库单
	 * @author Administrator
	 * @date2017年12月6日下午8:53:44
	 * @version 1.0
	 */
	@Override
	public int getStoreTable(int buyId) {
		return purchaseMapper.getStoreTable(buyId);
	}

	/**
	 * 更新采购单
	 * @author Administrator
	 * @date2017年12月7日上午9:33:38
	 * @version 1.0
	 */
	@Override
	public int updateNums(Purchase purchase) {
		return purchaseMapper.updateNums(purchase);
	}

	/**
	 * 添加新的采购单
	 * @author Administrator
	 * @date2017年12月7日下午9:24:40
	 * @version 1.0
	 */
	@Override
	public int savePurchase(Purchase purchase) {
		return purchaseMapper.savePurchase(purchase);
	}
	
	
}
