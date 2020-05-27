/**
 * @filename inStoreServiceImp.java
 * @author 冯琪
 * @date 2017年12月4日 下午9:09:46
 * @version 1.0
 * Copyright (C) 2017 冯琪
 */
package com.auth.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auth.entity.InStoreInfo;
import com.auth.mapper.InStoreMapper;
@Service
public class InStoreServiceImp implements InStoreService {
	@Autowired
	private InStoreMapper inStoreMapper;
	
	@Override
	public int selectCount(HashMap<String, Object> hashmap) {
		return inStoreMapper.selectCount(hashmap);
	}

	@Override
	public List<InStoreInfo> selectInStorePage(HashMap<String, Object> hashmap) {
		return inStoreMapper.selectInStorePage(hashmap);
	}
	
	@Override
	public int updateInsIdStore(InStoreInfo inStoreInfo){
		return inStoreMapper.updateInsIdStore(inStoreInfo);
	}
	
	@Override
	public int updateStoreNum(InStoreInfo inStoreInfo){
		return inStoreMapper.updateStoreNum(inStoreInfo);
	}
	/**
	 * 入库单
	 */
	@Override
	public int addInStoreFrom(InStoreInfo inStoreInfo){
		return inStoreMapper.addInStoreFrom(inStoreInfo);
	}
	/**
	 * 入库单
	 */
	@Override
	public int addInStoreFrom1(InStoreInfo inStoreInfo){
		return inStoreMapper.addInStoreFrom1(inStoreInfo);
	}
}

