package com.auth.mapper;

import java.util.List;

import com.auth.entity.Unit;

public interface UnitMapper {
	/**
	 * 查询所有单位信息
	 */
	List<Unit> selectUnitList();
}
