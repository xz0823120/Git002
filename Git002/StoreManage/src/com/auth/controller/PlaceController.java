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

import com.auth.entity.Place;
import com.auth.service.PlaceService;
import com.auth.util.Page;

@Controller
@RequestMapping("/place")
public class PlaceController {

	@Autowired
	private PlaceService placeService;
	/**
	 * 添加产地
	 */
	@RequestMapping("/addPlace")
	@ResponseBody
	public JSONObject addPlace(HttpServletRequest request,Place place){
		String placeNum = place.getPlaceNum();
		/*System.out.println(placeNum);
		System.out.println(place);*/
		List<Place> place0 = placeService.findPlaceByNum(placeNum);
		//System.out.println(place0);
		JSONObject json = new JSONObject();
		if (place0.size() > 0) {
			// 用户已存在
			json.put("add", 0);
		} else {
			placeService.addPlace(place);
			
			json.put("add", 1);
		}
		return json;
	}
	/**
	 * 分页
	 */
	@RequestMapping("/list")
	public ModelAndView PlacePageList(HttpServletRequest request, Place place) {

		ModelAndView mov = new ModelAndView("place-list");
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
		hashmap.put("place", place);
		//System.out.println("===================="+place);
		// 获取总条数
		int totalNum = placeService.countPlace(hashmap);
		Page page = new Page(totalNum, currNo);
		// url
		String urlString = "place/list.action";
		StringBuffer sb = new StringBuffer();
		// 将搜索框中的值储存在StringBuffer中
		if (StringUtils.isNotBlank(place.getPlaceName())) {
			sb.append("&placeName=").append(place.getPlaceName());
		}
		if (StringUtils.isNotBlank(place.getPlaceNum())) {
			sb.append("&placeNum=").append(place.getPlaceNum());
		}
		String params = sb.toString();
		page.setUrlString(urlString);
		page.setParams(params);
		hashmap.put("Page", page);
		// 根据条件查询
		List<Place> placeList = placeService.selectPage(hashmap);
		page.setResultList(placeList);
		mov.addObject("placeList", placeList);
		
		mov.addObject("Page", page);
		return mov;
	}
	
	/**
	 * 删除产地
	 * @param placeId
	 * @return
	 */
	@RequestMapping("/deletePlace")
	@ResponseBody
	public JSONObject dalatePlace(Integer placeId){
		int num = placeService.deletePlace(placeId);
		JSONObject json = new JSONObject();
		json.put("delete", num);
		
		
		return json;
		
	}
	/**
	 * 修改产地
	 */
	@RequestMapping("/update")
	@ResponseBody
	public JSONObject updatePlace(Place place){
		//System.out.println(place);
		int num = placeService.updatePlace(place);
		JSONObject json = new JSONObject();
		json.put("num", num);
		return json;
		
	}
}
