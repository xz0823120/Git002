package com.auth.service;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import net.sf.json.JSONObject;
import com.auth.entity.Store;
public interface StoreService {
	// 查询所有仓库信息
	public List<Store> selectStore(HashMap<String, Object> hashMap);

	// 查询仓库总数
	public int storeCount(HashMap<String, Object> hashMap);

	// 添加仓库
	public JSONObject addStore(HttpServletRequest request,Store store);

	// 修改仓库信息
	public JSONObject updateStore(HttpServletRequest request,Store store);

	// 修改回显（根据id查仓库信息）
	public JSONObject updateReturnStore(HttpServletRequest request,Store store);
	
	
	//调货选择仓库
	public List<Store> chooseStore();
}
