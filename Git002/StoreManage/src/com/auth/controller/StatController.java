/**
 * @filename CensusController.java
 * @author Administrator
 * @date 2017年12月5日 下午3:14:41
 * @version 1.0
 * Copyright (C) 2017 
 */
package com.auth.controller;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.auth.entity.Stat;
import com.auth.entity.StoreCheck;
import com.auth.service.StatService;
import com.auth.service.StoreCheckService;
import com.auth.util.Page;

@Controller
@RequestMapping("/stat")
public class StatController {
	
	@Autowired
	private StatService statService;
	@Autowired
	private StoreCheckService storeCheckService;
	/**
	 * 统计列表
	*@author Administrator
	*@date 2017年12月7日 上午9:42:00
	*@version 1.0
	 */
	@RequestMapping("/list")
	public ModelAndView statList(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("stat-list");
		Page page = new Page();
		StoreCheck storeCheck = new StoreCheck();
		storeCheck.setCheckState("1");
		Page page1 = storeCheckService.getPageFromStoreCheck(request,storeCheck,page);
		List<?> checkList = page1.getResultList();
		mav.addObject("checkList", checkList);
		return mav;
	}
	
	/**
	 * 导出下架的商品列表
	*@author Administrator
	*@date 2017年12月7日 下午3:29:50
	*@version 1.0
	 */
	@RequestMapping("/outProduct")
	public ModelAndView exportOutProduct(HttpServletRequest request){
		ModelAndView mav =null;
		String storeID = request.getParameter("storeId");
		int storeId = 0;
		if(StringUtils.isNotBlank(storeID)){
			storeId = Integer.parseInt(storeID);
		}
		List<Stat> outList = statService.statOutProduct(storeId);
		if(outList.size()>0){
			mav = new ModelAndView("outProduct-download");
			mav.addObject("outList", outList);
		}else{
			mav = new ModelAndView("404");
		}
		return mav;
	}
	/**
	 * 导出库存不足的商品列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/understock")
	public ModelAndView exportUnderstock(HttpServletRequest request){
		ModelAndView mav = null;
		String storeID = request.getParameter("storeId");
		int storeId = 0;
		if(StringUtils.isNotBlank(storeID)){
			storeId = Integer.parseInt(storeID);
		}
		List<Stat> underList = statService.statUnderstock(storeId);
		if(underList.size() >0){
			mav = new ModelAndView("understock-download");
			mav.addObject("underList", underList);			
		}else{
			mav = new ModelAndView("404");
		}
		return mav;
	}
	/**
	 * 导出不同分类下的商品库存
	 * @param request
	 * @return
	 */
	@RequestMapping("/invent")
	public ModelAndView exportInvent(HttpServletRequest request){
		ModelAndView mav =null;
		String storeID = request.getParameter("storeId");
		int storeId = 0;
		if(StringUtils.isNotBlank(storeID)){
			storeId = Integer.parseInt(storeID);
		}
		List<Stat> inventList = statService.statInvent(storeId);
		if(inventList.size()>0){
			mav = new ModelAndView("invent-download");
			mav.addObject("inventList", inventList);
		}else{
			mav = new ModelAndView("404");
		}
		return mav;
	}
	/**
	 * 导出规定批次的损耗比
	 * @param request
	 * @return
	 */
	@RequestMapping("/lossRatio")
	public ModelAndView exportLossRatio(HttpServletRequest request){
		String storeID = request.getParameter("storeId");
		String batchID = request.getParameter("batchId");
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		int storeId = 0;
		int batchId = 0;
		if(StringUtils.isNotBlank(storeID)){
			storeId = Integer.parseInt(storeID);
		}
		if(StringUtils.isNotBlank(batchID)){
			batchId = Integer.parseInt(batchID);
		}
		hashMap.put("storeId", storeId);
		hashMap.put("batchId", batchId);
		List<Stat> lossList = statService.statLossRatio(hashMap);
		ModelAndView mav = null;
		if(lossList.size() > 0){
			mav = new ModelAndView("lossRatio-downLoad");
			mav.addObject("lossList", lossList);
		}else{
			mav = new ModelAndView("404");
		}
		return mav;
	}
	/**
	 * 导出规定时间内的销售比
	 * @param stat
	 * @return
	 */
	@RequestMapping("/marketRatio")
	public ModelAndView exportMarketRatio(Stat stat){
		ModelAndView mav = null;
		List<Stat> marketList = statService.statMarketRatio(stat);
		if(marketList.size()>0){
			mav = new ModelAndView("market-download");
			mav.addObject("marketList", marketList);
		}else{
			mav = new ModelAndView("404");
		}
		return mav;
	}
	/**
	 * 导出规定时间内的采购量
	 * @param stat
	 * @return
	 */
	@RequestMapping("/purchase")
	public ModelAndView exportPurchase(Stat stat){
		ModelAndView mav = null;
		List<Stat> purList =  statService.statPurchase(stat);
		if(purList.size()>0){
			mav = new ModelAndView("purchase-download");
			mav.addObject("purList", purList);
		}else{
			mav = new ModelAndView("404");
		}
		return mav;
	}
}
