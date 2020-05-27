package com.auth.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auth.mapper.PlaceMapper;
import com.auth.entity.Place;
@Service
public class PlaceServiceImp implements PlaceService {

	@Autowired
	private PlaceMapper placeMapper;
	/**
	 * 查数量
	 */
	@Override
	public Integer countPlace(HashMap<?, ?> hashmap) {
		// TODO Auto-generated method stub
		return placeMapper.countPlace(hashmap);
	}

	/**
	 * 分页
	 */
	@Override
	public List<Place> selectPage(HashMap<?, ?> hashmap) {
		// TODO Auto-generated method stub
		return placeMapper.selectPage(hashmap);
	}

	/**
	 * 添加
	 */
	@Override
	public Integer addPlace(Place place) {
		// TODO Auto-generated method stub
		return placeMapper.addPlace(place);
	}

	/**
	 * 修改
	 */
	@Override
	public Integer updatePlace(Place place) {
		// TODO Auto-generated method stub
		return placeMapper.updatePlace(place);
	}

	/**
	 * 删除
	 */
	@Override
	public Integer deletePlace(Integer placeId) {
		// TODO Auto-generated method stub
		return placeMapper.deletePlace(placeId);
	}

	/**
	 * 全查
	 */
	@Override
	public List<Place> findAll() {
		// TODO Auto-generated method stub
		return placeMapper.findAll();
	}

	/**
	 * 根据编号查产地信息
	 */
	@Override
	public List<Place> findPlaceByNum(String placeNum) {
		// TODO Auto-generated method stub
		return placeMapper.findPlaceByNum(placeNum);
	}

}
