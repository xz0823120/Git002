/**
 * @filename InstoreController.java
 * @author 冯琪
 * @date 2017年12月4日 下午9:14:56
 * @version 1.0
 * Copyright (C) 2017 冯琪
 */
package com.auth.controller;

import java.math.BigDecimal;
import java.text.ParseException;
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
import com.auth.entity.OutStoreInfo;
import com.auth.entity.Store;
import com.auth.service.OutStoreService;
import com.auth.service.StoreService;
import com.auth.util.Page;

@Controller
@RequestMapping("/outstore")
public class OutstoreController {
	@Autowired
	private OutStoreService outStoreService;
	@Autowired
	private StoreService storeService;
	/**
	 * 出库表列表显示
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月4日 下午10:41:41
	*@param empID
	*@param status
	*@version 1.0
	 * @throws ParseException 
	 */
	@RequestMapping("/outstore-list")
	public ModelAndView outStorePageList(HttpServletRequest request, OutStoreInfo outStoreInfo) throws ParseException {
		//获取仓库名称
		String getStoreName=request.getParameter("getStoreName");
		//获取产品名称
		String getProductName=request.getParameter("getProductName");
		//开始时间
		String dateStateTime=request.getParameter("dateStateTime");
		//System.out.println("开始时间:"+dateStateTime);
		//结束时间
		String dateEndTime=request.getParameter("dateEndTime");
		//System.out.println("结束时间:"+dateEndTime);
		//仓库ID
		String storeId=request.getParameter("storeId");
		String isOut=request.getParameter("isOutState");
		ModelAndView mov = new ModelAndView("outstore-list");
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
		outStoreInfo.setIsOut(isOut);
		outStoreInfo.setDateStateTime(dateStateTime);
		outStoreInfo.setDateEndTime(dateEndTime);
		outStoreInfo.setGetStoreName(getStoreName);
		outStoreInfo.setGetProductName(getProductName);
		outStoreInfo.setStoreId(storeId);
		System.out.println("仓库ID:"+storeId);
		// 根据前端的查询条件查询结果
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("outStoreInfo", outStoreInfo);
		// 获取总条数
		int totalNum = outStoreService.selectCount(hashmap);
		Page page = new Page(totalNum, currNo);
		// url
		String urlString = "outstore/outstore-list.action";
		StringBuffer sb = new StringBuffer();
		// 将下拉框中的值储存在StringBuffer中
		if (storeId != null && storeId != "0") {
			sb.append("&storeId=").append(storeId);
		}
		if (dateStateTime != null && dateStateTime != "0") {
			sb.append("&dateStateTime=").append(dateStateTime);
		}
		if (dateEndTime != null && dateEndTime != "0") {
			sb.append("&dateEndTime=").append(dateEndTime);
		}
		if (isOut != null && isOut != "0") {
			sb.append("&isOut=").append(isOut);
		}
		if (getProductName != null && getProductName != "0") {
			sb.append("&getProductName=").append(getProductName);
		}
		String params = sb.toString();
		page.setUrlString(urlString);
		page.setParams(params);
		hashmap.put("Page", page);
		// 根据条件查询
		List<OutStoreInfo> resultList = outStoreService.selectOutStorePage(hashmap);
		mov.addObject("outStoreInfoList", resultList);
		System.out.println("出库列表:"+resultList);
		//查询仓库列表
		List<Store> storeList =  storeService.chooseStore();
		mov.addObject("store", storeList);
		mov.addObject("Page", page);
		return mov;
	}
	/**
	 * 用户申请出库
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月6日 下午1:13:46
	*@param empID
	*@param status
	*@version 1.0
	 */
	@RequestMapping("/addOutStoreFrom")
	@ResponseBody
	public JSONObject addOutStoreFrom(HttpServletRequest request,OutStoreInfo outStoreInfo) {
		//获取出库单ID
		String outsId=request.getParameter("outsId");
		//获取产品ID
		String productId=request.getParameter("productId");
		//获取仓库ID
		String storeId=request.getParameter("storeId");
		System.out.println("商品ID:"+productId);
		//获取出库数量
		String outNum=request.getParameter("outNum");
		System.out.println("出库数量:"+outNum);
		outStoreInfo.setProductId(productId);
		outStoreInfo.setOutNum(outNum);
		outStoreInfo.setStoreId(storeId);
		outStoreInfo.setOutsId(outsId);
		OutStoreInfo count=outStoreService.findProductNum(outStoreInfo);
		BigDecimal productInvent=count.getProductInvent();
		System.out.println("库存数量:"+productInvent);
		BigDecimal bd=new BigDecimal(outNum);
		JSONObject json = new JSONObject();
		int pio=bd.compareTo(productInvent);
		if(pio==-1){
			//处理出库单(根据出库单ID修改出库状态)
			int num = outStoreService.updateOutStore(outStoreInfo);
			if(num>0){
				//根据商品ID和仓库ID更新商品数量
				int num1 = outStoreService.updateStoreNum(outStoreInfo);
				System.out.println("更改商品数量:"+num1);
				json.put("num", 1);
			}
		}else{
			json.put("num", 0);
		}
		return json;
	}
}

