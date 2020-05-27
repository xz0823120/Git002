/**
 * @filename StatServiceImp.java
 * @author Administrator
 * @date 2017年12月6日 下午9:26:59
 * @version 1.0
 * Copyright (C) 2017 
 */
package com.auth.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auth.entity.Stat;
import com.auth.mapper.StatMapper;

@Service
public class StatServiceImp implements StatService {
	@Autowired
	private StatMapper statMapper;
	/**
	 * 统计库存不足的商品列表
	 */
	@Override
	public List<Stat> statUnderstock(int storeId) {
		// TODO Auto-generated method stub
		return statMapper.statUnderstock(storeId);
	}
	/**
	 * 统计商品损耗比
	 */
	@Override
	public List<Stat> statLossRatio(HashMap<String, Object> hashMap) {
		// TODO Auto-generated method stub
		return statMapper.statLossRatio(hashMap);
	}
	/**
	 * 统计商品销售比
	 */
	@Override
	public List<Stat> statMarketRatio(Stat stat) {
		// TODO Auto-generated method stub
		return statMapper.statMarketRatio(stat);
	}
	/**
	 * 统计下架商品
	 */
	@Override
	public List<Stat> statOutProduct(int storeId) {
		// TODO Auto-generated method stub
		return statMapper.statOutProduct(storeId);
	}
	/**
	 * 统计规定时间内的采购量
	 */
	@Override
	public List<Stat> statPurchase(Stat stat) {
		// TODO Auto-generated method stub
		return statMapper.statPurchase(stat);
	}
	/**
	 * 统计不同分类下的商品库存
	 */
	@Override
	public List<Stat> statInvent(int storeId) {
		// TODO Auto-generated method stub
		return statMapper.statInvent(storeId);
	}

}
