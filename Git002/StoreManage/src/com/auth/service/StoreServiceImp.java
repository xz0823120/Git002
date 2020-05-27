package com.auth.service;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.auth.entity.Store;
import com.auth.mapper.StoreMapper;

@Service
public class StoreServiceImp implements StoreService {
	@Autowired
	private StoreMapper storeMapper;

	// 仓库列表
	@Override
	public List<Store> selectStore(HashMap<String, Object> hashMap){
		return storeMapper.selectStore(hashMap);
	}

	// 查询仓库总数
	@Override
	public int storeCount(HashMap<String, Object> hashMap) {
		return storeMapper.storeCount(hashMap);
	}

	// 添加仓库
	@Override
	public JSONObject addStore(HttpServletRequest request,Store store) {
		JSONObject json = new JSONObject();
		//添加仓库编码唯一性验证
		int storeNumCheck = storeMapper.findInfoByNum(store);
		if(storeNumCheck>0){
			//重复返回0
			json.put("addStore", 0);
		}else{
			//如果编码不重复 则可以添加
			//storeMapper.insertStore(store);
			json.put("addStore", 1);
		}
		return json;
	}

	// 修改仓库信息
	@Override
	public JSONObject updateStore(HttpServletRequest request,Store store) {
		JSONObject json = new JSONObject();
		if(store!=null){
			storeMapper.updateStore(store);
			json.put("updateStore", 1);
		}else{
			json.put("updateStore", 0);
		}
		return json;
	}


	// 修改回显（根据id查仓库信息）
	@Override
	public JSONObject updateReturnStore(HttpServletRequest request,Store store) {
		JSONObject json = new JSONObject();
		Store returnStore = storeMapper.returnStore(store);
		json.put("storename",returnStore.getStoreName());
		json.put("storeaddress",returnStore.getStoreAddress());
		json.put("concat",returnStore.getConcat());
		json.put("phone",returnStore.getPhone());
		return json;
	}
	//调货选择仓库
	@Override
	public List<Store> chooseStore() {
		return storeMapper.chooseStore();
	}

}
