package com.auth.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.auth.entity.Transshipment;
import com.auth.mapper.TransshipmentMapper;

@Service
public class TransshipmentServiceImp implements TransshipmentService {
	@Autowired 
	private TransshipmentMapper transshipmentMapper;
	//查询所有的调货信息
	@Override
	public List<Transshipment> selectTransshipment(HashMap<String, Object> hashMap) {
		return transshipmentMapper.selectTransshipment(hashMap);
	}
	
	//总条数
	@Override
	public int transshipmentCount(HashMap<String, Object> hashMap) {
		return transshipmentMapper.transshipmentCount(hashMap);
	}
	//完成调货
	@Override
	public int confirmTransshipment(Transshipment transshipment) {
		return transshipmentMapper.confirmTransshipment(transshipment);
	}
	//完成调货修改源仓库原商品数量
	@Override
	public int updateSourceNum(Transshipment transshipment) {
		return transshipmentMapper.updateSourceNum(transshipment);
	}

}
