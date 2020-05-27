package com.auth.mapper;

import java.util.HashMap;
import java.util.List;
import com.auth.entity.Transshipment;
public interface TransshipmentMapper {
	//向调货表插入数据
	public Integer insertIntoTransshipment(Transshipment transshipment);
	
	//查询所有仓库信息
	public List<Transshipment> selectTransshipment(HashMap<String, Object> hashMap);

	//查询仓库总数
	public int transshipmentCount(HashMap<String, Object> hashMap);
	
	//完成调货
	public int confirmTransshipment(Transshipment transshipment);
	
	//完成调货修改源仓库原商品数量
	public int updateSourceNum(Transshipment transshipment);
}
