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

import com.auth.entity.Purchase;
import com.auth.entity.Store;
import com.auth.service.PurchaseService;
import com.auth.service.StoreService;
import com.auth.util.Page;


@Controller
@RequestMapping("/purchase")
public class PurchaseController {

	@Autowired
	private PurchaseService purchaseService;
	@Autowired
	private StoreService storeService;
	
	/**
	 * 分页查询
	 * @author Administrator
	 * @date 2017年11月17日 下午6:10:38
	 * @version 1.0
	 */
	@RequestMapping("/list")
	public ModelAndView purchaseList(HttpServletRequest request, Purchase purchase) {
		ModelAndView mov = new ModelAndView("purchase-list");
		// 每页显示条数
		String pageNum = request.getParameter("pageNum");
		if (StringUtils.isBlank(pageNum)) {
			pageNum = "5";
		}
		// 获取当前页
		String pageNo = request.getParameter("currNo");
		int currNo = 1;
		if (pageNo != null && !"".equals(pageNo)) {
			currNo = Integer.parseInt(pageNo);
		}
		// 根据前端的查询条件查询结果
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("purchase", purchase);
		// 获取总条数
		int totalNum = purchaseService.selectCount(hashmap);
		System.out.println(totalNum);
		Page page = new Page(totalNum, currNo);
		// url
		String urlString = "purchase/list.action";
		StringBuffer sb = new StringBuffer("");
		// 将搜索框中的值储存在StringBuffer中
		if (purchase.getStoreId() != null && purchase.getStoreId() != 0) {
			sb.append("&storeId=").append(purchase.getStoreId());
		}
		if (StringUtils.isNotBlank(purchase.getProductName())) {
			sb.append("&ProductName=").append(purchase.getProductName());
		}
		if (StringUtils.isNotBlank(purchase.getBuyUser())) {
			sb.append("&buyUser=").append(purchase.getBuyUser());
		}
		if (StringUtils.isNotBlank(purchase.getIsIn())) {
			sb.append("&isIn=").append(purchase.getIsIn());
		}
		if(StringUtils.isNotBlank(purchase.getStartTime())){
			sb.append("&startTime=").append(purchase.getStartTime());
		}
		if (StringUtils.isNotBlank(purchase.getEndTime())) {
			purchase.setEndTime(purchase.getEndTime()+" 24:59:59");
			sb.append("&endTime=").append(purchase.getEndTime());
		}
		System.out.println("purchase=="+purchase);
		String params = sb.toString();
		page.setUrlString(urlString);
		page.setParams(params);
		hashmap.put("Page", page);
		// 根据条件查询
		List<Purchase> resultList = purchaseService.purchasePageQuery(hashmap);
		mov.addObject("purchases", resultList);
		System.out.println(resultList);
		mov.addObject("Page", page);
		//全查仓库表
		List<Store> stores = storeService.chooseStore();
		mov.addObject("storeList", stores);
		return mov;
	}
	@RequestMapping("/update")
	@ResponseBody
	public JSONObject updatePurchase(Purchase purchase){
		JSONObject jsonObject = new JSONObject();
		if(null != purchase ){
			int mark = purchaseService.updateNums(purchase);
			jsonObject.put("mark", mark);
		}
		return jsonObject;
	}
	
	@RequestMapping("/saveParams")
	public ModelAndView saveParams(Purchase purchase){
		ModelAndView modelAndView = new ModelAndView("save-purchase-table");
		System.out.println("---------------------"+purchase);
		int productId = purchase.getProductId();
		int storeId = purchase.getStoreId();
		int placeId = purchase.getPlaceId();
		int supplyId = purchase.getSupplyId();
		//对四个id进行非空判断
		if(productId != 0 && storeId != 0 && placeId != 0 && supplyId != 0){
			modelAndView.addObject("purchase", purchase);
		}
		return modelAndView;
	}
	
	@RequestMapping("/save")
	public String savePurchase(Purchase purchase){
		System.out.println(purchase);
		purchaseService.savePurchase(purchase);
		return "redirect:/purchase/list.action?storeId=1";
	}
	
}
