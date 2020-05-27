package com.auth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auth.entity.Unit;
import com.auth.mapper.UnitMapper;
@Service
public class UnitServiceImp implements UnitService{
	
	@Autowired
	UnitMapper unitMapper;
	
	@Override
	public List<Unit> selectUnitList() {
		// TODO Auto-generated method stub
		return unitMapper.selectUnitList();
	}

}
