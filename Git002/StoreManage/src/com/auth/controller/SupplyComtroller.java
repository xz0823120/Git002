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

import com.auth.entity.Supply;
import com.auth.service.SupplyService;
import com.auth.util.Page;

@Controller
@RequestMapping("/supply")
public class SupplyComtroller {

	@Autowired
	private SupplyService supplyService;
	/**
	 * 添加供应商
	 */
	@RequestMapping("/add")
	@ResponseBody
	public JSONObject addSupply(HttpServletRequest request,Supply supply){
		JSONObject json = new JSONObject();
		String supplyNum = supply.getSupplyNum();
		List<Supply> supply0 = supplyService.findSupplyByNum(supplyNum);
		if(supply0.size()>0){
			//用户已存在
			json.put("add", 0);
		}else{
			supplyService.addSupply(supply);	
			json.put("add", 1);
		}
		return json;
	}
	/**
	 * 分页
	 */
	@RequestMapping("/list")
	public ModelAndView PlacePageList(HttpServletRequest request, Supply supply) {

		ModelAndView mov = new ModelAndView("supply-list");
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
		hashmap.put("supply", supply);
		// 获取总条数
		int totalNum = supplyService.countSupply(hashmap);
		Page page = new Page(totalNum, currNo);
		// url
		String urlString = "supply/list.action";
		StringBuffer sb = new StringBuffer();
		// 将搜索框中的值储存在StringBuffer中
		if (StringUtils.isNotBlank(supply.getSupplyNum())) {
			sb.append("&placeName=").append(supply.getSupplyNum());
		}
		if (StringUtils.isNotBlank(supply.getSupplyName())) {
			sb.append("&placeName=").append(supply.getSupplyName());
		}
		if (StringUtils.isNotBlank(supply.getConcat())) {
			sb.append("&concat=").append(supply.getConcat());
		}
		String params = sb.toString();
		page.setUrlString(urlString);
		page.setParams(params);
		hashmap.put("Page", page);
		// 根据条件查询
		List<Supply> supplyList = supplyService.selectPage(hashmap);
		page.setResultList(supplyList);
		mov.addObject("supplyList", supplyList);
		mov.addObject("Page", page);
		return mov;
	}
	
	/**
	 * 删除供应商
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public JSONObject deleteSupply(Integer supplyId){
		int num = supplyService.deleteSupply(supplyId);
		JSONObject json = new JSONObject();
		json.put("delete", num);
		return json;
	}
	/**
	 * 修改供应商
	 */
	@RequestMapping("/update")
	@ResponseBody
	public JSONObject updateSupply(Supply supply){
		int num = supplyService.updateSupply(supply);
		JSONObject json = new JSONObject();
		json.put("num", num);
		return json;
	}
}
