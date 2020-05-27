package com.auth.service;

import java.util.HashMap;
import java.util.List;


import com.auth.entity.Brand;

public interface BrandService {

	
	/*
	 * 查询全部品牌
	 * */
	public List<Brand> selectBrand(HashMap<Object,Object> hm);
	
	/**
	 *查询所有品牌
	 */
	public List<Brand> selectAllBrand();
	
	/*
	 * 查询全部条件下的总条数
	 * */
	public int selectCount(HashMap<Object,Object> hm);
	
	/*
	 * 增加新品牌
	 * */
	public int addBrand(Brand brand);
	
	/*
	 * 对品牌名进行唯一校验
	 * */
	public List<Brand> selectBrandByName(Brand brand);
	
	/*
	 * 根据品牌id删除品牌
	 * */
	public int deleteBrand(Brand brand);
}
