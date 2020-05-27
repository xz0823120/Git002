/**
 * @filename OutStoreServiceImp.java
 * @author 冯琪
 * @date 2017年12月4日 下午10:35:39
 * @version 1.0
 * Copyright (C) 2017 冯琪
 */
package com.auth.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.auth.entity.OutStoreInfo;
import com.auth.mapper.OutStoreMapper;

@Service
public class OutStoreServiceImp implements OutStoreService {
	@Autowired
	private OutStoreMapper outStoreMapper;
	
	@Override
	public int selectCount(HashMap<String, Object> hashmap) {
		return outStoreMapper.selectCount(hashmap);
	}

	@Override
	public List<OutStoreInfo> selectOutStorePage(HashMap<String, Object> hashmap) {
		return outStoreMapper.selectOutStorePage(hashmap);
	}
	
	@Override
	public int updateOutStore(OutStoreInfo outStoreInfo){
		return outStoreMapper.updateOutStore(outStoreInfo);
	}
	
	@Override
	public int updateStoreNum(OutStoreInfo outStoreInfo){
		return outStoreMapper.updateStoreNum(outStoreInfo);
	}
	
	@Override
	public OutStoreInfo findProductNum(OutStoreInfo outStoreInfo){
		return outStoreMapper.findProductNum(outStoreInfo);
	}
}

