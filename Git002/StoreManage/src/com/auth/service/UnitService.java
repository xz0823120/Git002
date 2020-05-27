package com.auth.service;

import java.util.List;

import com.auth.entity.Unit;

public interface UnitService {
	/**
	 * 查询所有单位信息
	 */
	List<Unit> selectUnitList();
}
