package com.auth.service;

import java.util.HashMap;
import java.util.List;


import com.auth.entity.Transshipment;
public interface TransshipmentService {
	//查询所有仓库信息
		public List<Transshipment> selectTransshipment(HashMap<String, Object> hashMap);

		//查询仓库总数
		public int transshipmentCount(HashMap<String, Object> hashMap);
		
		//完成调货
		public int confirmTransshipment(Transshipment transshipment);
		
		//完成调货修改源仓库原商品数量
		public int updateSourceNum(Transshipment transshipment);
}
