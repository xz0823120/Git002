/**
 * @filename inStoreMapper.java
 * @author 冯琪
 * @date 2017年12月4日 下午10:23:58
 * @version 1.0
 * Copyright (C) 2017 冯琪
 */
package com.auth.mapper;
import java.util.HashMap;
import java.util.List;
import com.auth.entity.OutStoreInfo;
public interface OutStoreMapper {
	
	/**
	 * 查询出库单个数
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月4日 下午10:24:47
	*@param empID
	*@param status
	*@version 1.0
	 */
	public int selectCount(HashMap<String, Object> hashmap);
	/**
	 * 分页查询
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月4日 下午10:25:01
	*@param empID
	*@param status
	*@version 1.0
	 */
	public List<OutStoreInfo> selectOutStorePage(HashMap<String, Object> hashmap);
	/**
	 * 用户请求出库
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月5日 上午8:58:35
	*@param empID
	*@param status
	*@version 1.0
	 */
	public int updateOutStore(OutStoreInfo outStoreInfo);
	/**
	 * 更新商品数量
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月5日 上午9:53:12
	*@param empID
	*@param status
	*@version 1.0
	 */
	public int updateStoreNum(OutStoreInfo outStoreInfo);
	/**
	 * 查询商品数量
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月11日 下午9:35:53
	*@param empID
	*@param status
	*@version 1.0
	 */
	public OutStoreInfo findProductNum(OutStoreInfo outStoreInfo);
}

