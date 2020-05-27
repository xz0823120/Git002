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

import com.auth.entity.Store;
import com.auth.service.StoreService;
import com.auth.util.Page;
@RequestMapping("/store")
@Controller
public class StoreController {
@Autowired 
private StoreService storeService;
	
	//仓库列表
	@RequestMapping("/queryStore")
	@ResponseBody
	public ModelAndView selectStore(HttpServletRequest request, Store store) {
		ModelAndView mav = new ModelAndView("store-list");
		// 每页显示条数
		String pageNum = request.getParameter("pageNum");
		if (StringUtils.isBlank(pageNum)) {
			pageNum = "1";
		}
		
		// 获取当前页
		String pageNo = request.getParameter("currNo");
		int currNo = 1;
		if (pageNo != null && !"".equals(pageNo)) {
			currNo = Integer.parseInt(pageNo);
		}
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("store", store);
		// 获取总条数
		int totalNum = storeService.storeCount(hashmap);
		Page page = new Page(totalNum, currNo);
		hashmap.put("page", page);
		// 设置url
		String urlString = "store/queryStore.action";
		page.setUrlString(urlString);
		// 接受搜索框传来的参数
		// 仓库名称、仓库地址、联系人、联系电话
		StringBuffer sb = new StringBuffer();
		if (StringUtils.isNotBlank(store.getStoreName())) {
			sb.append("&storeName=").append(store.getStoreName());
		}
		if (StringUtils.isNotBlank(store.getStoreName())) {
			sb.append("&storeAddress=").append(store.getStoreAddress());
		}
		if (StringUtils.isNotBlank(store.getStoreAddress())) {
			sb.append("&concat=").append(store.getConcat());
		}
		if (StringUtils.isNotBlank(store.getPhone())) {
			sb.append("&phone=").append(store.getPhone());
		}

		String params = sb.toString();
		page.setParams(params);
		// 查询所有用户
		List<Store> storeList = storeService.selectStore(hashmap);
		page.setResultList(storeList);
		mav.addObject("Page", page);
		mav.addObject("storeList", storeList);
		return mav;
	}
	
	//添加仓库（ 并对仓库编号进行唯一性校验）
	@RequestMapping("/addStore")
	@ResponseBody
	public JSONObject addStore(HttpServletRequest request,Store store) {
		return storeService.addStore(request, store);
	}
	
	//修改仓库回显
	@RequestMapping("/updateReturnStore")
	@ResponseBody
	public JSONObject updateReturnStore(HttpServletRequest request,Store store) {
		return storeService.updateReturnStore(request, store);
	}
	//修改仓库信息
	@RequestMapping("/updateStore")
	@ResponseBody
	public JSONObject updateStore(HttpServletRequest request,Store store) {
		return storeService.updateStore(request, store);
	}
	
}
