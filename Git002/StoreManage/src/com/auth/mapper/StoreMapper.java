package com.auth.mapper;
import java.util.HashMap;
import java.util.List;
import com.auth.entity.Store;
public interface StoreMapper {
	
	//查询所有仓库信息
	public List<Store> selectStore(HashMap<String, Object> hashMap);

	//查询仓库总数
	public int storeCount(HashMap<String, Object> hashMap);
	
	//添加仓库
	public void insertStore(Store store);

	//修改仓库信息
	public void updateStore(Store store);
	
	//添加仓库验证
	public int  findInfoByNum(Store store);
	
	//修改回显（根据id查仓库信息）
	public Store returnStore(Store store);
	
	//调货选择仓库
	public List<Store> chooseStore();
	
	
}
