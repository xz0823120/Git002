/**
 * @filename inStoreService.java
 * @author 冯琪
 * @date 2017年12月4日 下午9:06:56
 * @version 1.0
 * Copyright (C) 2017 冯琪
 */
package com.auth.service;

import java.util.HashMap;
import java.util.List;

import com.auth.entity.InStoreInfo;

public interface InStoreService {
	
	/**
	 * 查询入库单个数
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月4日 下午8:50:29
	*@param empID
	*@param status
	*@version 1.0
	 */
	public int selectCount(HashMap<String, Object> hashmap);
	/**
	 * 分页查询
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月4日 下午8:51:12
	*@param empID
	*@param status
	*@version 1.0
	 */
	public List<InStoreInfo> selectInStorePage(HashMap<String, Object> hashmap);

	/**
	 * 用户请求入库
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月6日 下午2:21:10
	*@param empID
	*@param status
	*@version 1.0
	 */
	public int updateInsIdStore(InStoreInfo inStoreInfo);
	/**
	 * 更新商品数量
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月6日 下午2:22:41
	*@param empID
	*@param status
	*@version 1.0
	 */
	public int updateStoreNum(InStoreInfo inStoreInfo);
	/**
	 * 生成入库单
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月7日 上午8:28:13
	*@param empID
	*@param status
	*@version 1.0
	 */
	public int addInStoreFrom(InStoreInfo inStoreInfo);
	
	/**
	 * 生成入库单已审核
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月7日 上午8:13:22
	*@param empID
	*@param status
	*@version 1.0
	 */
	public int addInStoreFrom1(InStoreInfo inStoreInfo);
}

