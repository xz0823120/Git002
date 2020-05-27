package com.auth.mapper;

import java.util.HashMap;


import java.util.List;

import com.auth.entity.Supply;

public interface SupplyMapper {

	//全查
	public List<Supply> findAll();
	public List<Supply> findSupplyByNum(String supplyNum);
	//查个数
	public Integer countSupply(HashMap<?, ?> hashmap);
	//分页
	public List<Supply> selectPage(HashMap<?, ?> hashmap);
	//添加供货商
	public Integer addSupply(Supply supply);
	//删除供货商
	public Integer deleteSupply(Integer supplyId);
	//修改供货商信息
	public Integer updateSupply(Supply supply);
}
