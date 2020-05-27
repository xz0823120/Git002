package com.auth.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auth.entity.Supply;
import com.auth.mapper.SupplyMapper;

@Service
public class SupplyServiceImp implements SupplyService {
	//注入
	@Autowired
	private SupplyMapper supplyMapper;

	//查数量
	@Override
	public Integer countSupply(HashMap<?, ?> hashmap) {
		// TODO Auto-generated method stub
		return supplyMapper.countSupply(hashmap);
	}

	//分页
	@Override
	public List<Supply> selectPage(HashMap<?, ?> hashmap) {
		// TODO Auto-generated method stub
		return supplyMapper.selectPage(hashmap);
	}

	//添加
	@Override
	public Integer addSupply(Supply supply) {
		// TODO Auto-generated method stub
		return supplyMapper.addSupply(supply);
	}

	//删除
	@Override
	public Integer deleteSupply(Integer supplyId) {
		// TODO Auto-generated method stub
		return supplyMapper.deleteSupply(supplyId);
	}

	//修改
	@Override
	public Integer updateSupply(Supply supply) {
		// TODO Auto-generated method stub
		return supplyMapper.updateSupply(supply);
	}

	//全查
	@Override
	public List<Supply> findAll() {
		// TODO Auto-generated method stub
		return supplyMapper.findAll();
	}

	//根据编号查供货商信息
	@Override
	public List<Supply> findSupplyByNum(String supplyNum) {
		// TODO Auto-generated method stub
		return supplyMapper.findSupplyByNum(supplyNum);
	}

}
