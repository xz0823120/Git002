package com.auth.mapper;

import java.util.HashMap;
import java.util.List;

import com.auth.entity.Place;

public interface PlaceMapper {

	//全查
	public List<Place> findAll();
	public List<Place> findPlaceByNum(String placeNum);
	//查个数 
	public Integer countPlace(HashMap<?, ?> hashmap);
	//分页
	public List<Place> selectPage(HashMap<?, ?> hashmap);
	//添加产地
	public Integer addPlace(Place place);
	//修改信息
	public Integer updatePlace(Place place);
	//删除信息
	public Integer deletePlace(Integer placeId);
}
