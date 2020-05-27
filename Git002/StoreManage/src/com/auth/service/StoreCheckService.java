package com.auth.service;
import javax.servlet.http.HttpServletRequest;
import com.auth.entity.StoreCheck;
import com.auth.util.Page;

/**
 * 这是盘点业务的一些方法接口
 * @author 懒虫虫
 *
 */
public interface StoreCheckService {
	/*
	 * 查询所有的盘点记录，然后放到page中，方便分页显示
	 */
	Page getPageFromStoreCheck(HttpServletRequest request,StoreCheck storeCheck,Page page);
	/*
	 * 更改状态，返回一个int值，更改成功返回1，失败小于1；
	 */
	int StocktakingState(HttpServletRequest request);
	/*
	 * 提交
	 */
	int updateStocktakingState(HttpServletRequest request);
	/*
	 * 判断要求盘点的仓库以及商品在该月是否盘点过
	 */
	int isCheckedInTheMonth(StoreCheck storeCheck,String string);
	/*
	 * 添加数据
	 */
	int insertIntoStoreCheck(HttpServletRequest request,StoreCheck storeCheck);
}
