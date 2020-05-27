/**
 * @filename InstoreController.java
 * @author 冯琪
 * @date 2017年12月4日 下午9:14:56
 * @version 1.0
 * Copyright (C) 2017 冯琪
 */
package com.auth.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.auth.entity.InStoreInfo;
import com.auth.entity.Store;
import com.auth.service.InStoreService;
import com.auth.service.PurchaseService;
import com.auth.service.StoreService;
import com.auth.util.Page;

@Controller
@RequestMapping("/instore")
public class InstoreController {
	@Autowired
	private InStoreService inStoreService;
	@Autowired
	StoreService storeService;
	@Autowired
	private PurchaseService purchaseService;
	@RequestMapping("/instore-list")
	public ModelAndView inStorePageList(HttpServletRequest request, InStoreInfo inStoreInfo) {
		ModelAndView mov = new ModelAndView("instore-list");
		// 每页显示条数
		String pageNum = request.getParameter("pageNum");
		if (StringUtils.isBlank(pageNum)) {
			pageNum = "6";
		}
		// 获取当前页
		String pageNo = request.getParameter("currNo");
		int currNo = 1;
		if (pageNo != null && !"".equals(pageNo)) {
			currNo = Integer.parseInt(pageNo);
		}
		//入库状态
		String isIn = request.getParameter("isInState");
		//仓库名称
		String getStoreName=request.getParameter("getStoreName");
		//产品名称
		String getProductName=request.getParameter("getProductName");
		//开始时间
		String dateStateTime=request.getParameter("dateStateTime");
		//结束时间
		String dateEndTime=request.getParameter("dateEndTime");
		//仓库ID
		String storeId=request.getParameter("storeId");
		inStoreInfo.setIsIn(isIn);
		inStoreInfo.setGetProductName(getProductName);
		inStoreInfo.setGetStoreName(getStoreName);
		inStoreInfo.setDateStateTime(dateStateTime);
		inStoreInfo.setDateEndTime(dateEndTime);
		inStoreInfo.setStoreId(storeId);
		// 根据前端的查询条件查询结果
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("inStoreInfo", inStoreInfo);
		// 获取总条数
		int totalNum = inStoreService.selectCount(hashmap);
		Page page = new Page(totalNum, currNo);
		// url
		String urlString = "instore/instore-list.action";
		StringBuffer sb = new StringBuffer();
		if (storeId != null && storeId != "0") {
			sb.append("&storeId=").append(storeId);
		}
		if (dateStateTime != null && dateStateTime != "0") {
			sb.append("&dateStateTime=").append(dateStateTime);
		}
		if (dateEndTime != null && dateEndTime != "0") {
			sb.append("&dateEndTime=").append(dateEndTime);
		}
		if (getProductName != null && getProductName != "0") {
			sb.append("&getProductName=").append(getProductName);
		}
		String params = sb.toString();
		page.setUrlString(urlString);
		page.setParams(params);
		hashmap.put("Page", page);
		// 根据条件查询
		List<InStoreInfo> resultList = inStoreService.selectInStorePage(hashmap);
		//查询仓库列表
		List<Store> storeList =  storeService.chooseStore();
		mov.addObject("store", storeList);
		mov.addObject("inStoreInfo", resultList);
		mov.addObject("Page", page);
		return mov;
	}
	
	@RequestMapping("/updateInsStore")
	@ResponseBody
	public JSONObject updateInsStore(HttpServletRequest request,InStoreInfo inStoreInfo) {
		String insId=request.getParameter("insId");
		String storeId=request.getParameter("storeId");
		String productId=request.getParameter("productId");
		System.out.println("商品ID:"+productId);
		String inNum=request.getParameter("inNum");
		System.out.println("出库数量:"+inNum);
		inStoreInfo.setInsId(insId);
		inStoreInfo.setStoreId(storeId);
		inStoreInfo.setProductId(productId);
		inStoreInfo.setInNum(inNum);
		int num = inStoreService.updateInsIdStore(inStoreInfo);
		inStoreInfo.setProductId(productId);
		inStoreInfo.setStoreId(storeId);
		if(num>0){
			int num1 = inStoreService.updateStoreNum(inStoreInfo);
			System.out.println("更改商品数量:"+num1);
		}
		JSONObject json = new JSONObject();
		json.put("delete", num);
		return json;
	}
	
	@RequestMapping("/InsertInStore")
	@ResponseBody
	public JSONObject InsertInStorefrom(HttpServletRequest request,InStoreInfo inStoreInfo) {
		String inNum=request.getParameter("inNum");
		String storeId=request.getParameter("storeId");
		String productId=request.getParameter("productId");
		String createId=request.getParameter("userId");
		System.out.println("创建人:"+createId);
		String buyId=request.getParameter("buyId");
		int buyId1=0;
		int createId1=0;
		if(createId!=null && createId!=""){
			createId1=Integer.parseInt(createId);
		}
		if(buyId!=null && buyId!=""){
			buyId1=Integer.parseInt(buyId);
		}
		inStoreInfo.setInNum(inNum);
		inStoreInfo.setStoreId(storeId);
		inStoreInfo.setProductId(productId);
		inStoreInfo.setCreateBy(createId1);
		int num = inStoreService.addInStoreFrom(inStoreInfo);
		if(num>0){
			purchaseService.getStoreTable(buyId1);
		}
		JSONObject json = new JSONObject();
		json.put("delete", num);
		return json;
	}
}

