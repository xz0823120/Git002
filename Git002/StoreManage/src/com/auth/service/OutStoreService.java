/**
 * @filename inStoreService.java
 * @author 冯琪
 * @date 2017年12月4日 下午10:31:03
 * @version 1.0
 * Copyright (C) 2017 冯琪
 */
package com.auth.service;

import java.util.HashMap;
import java.util.List;
import com.auth.entity.OutStoreInfo;

public interface OutStoreService {
	
	/**
	 * 查询出库单个数
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月4日 下午10:33:42
	*@param empID
	*@param status
	*@version 1.0
	 */
	public int selectCount(HashMap<String, Object> hashmap);
	/**
	 * 分页查询
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月4日 下午10:34:15
	*@param empID
	*@param status
	*@version 1.0
	 */
	public List<OutStoreInfo> selectOutStorePage(HashMap<String, Object> hashmap);
	/**
	 * 用户请求出库
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月5日 上午9:00:34
	*@param empID
	*@param status
	*@version 1.0
	 */
	public int updateOutStore(OutStoreInfo outStoreInfo);
	/**
	 * 根据商品ID和仓库ID更新商品数量
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月5日 上午9:57:36
	*@param empID
	*@param status
	*@version 1.0
	 */
	public int updateStoreNum(OutStoreInfo outStoreInfo);
	/**
	 * 根据商品ID和仓库ID查找商品数量
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月11日 下午9:39:17
	*@param empID
	*@param status
	*@version 1.0
	 */
	public OutStoreInfo findProductNum(OutStoreInfo outStoreInfo);
}

