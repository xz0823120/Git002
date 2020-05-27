package com.auth.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.auth.entity.GoodsCategory;
import com.auth.service.GoodsCategoryService;

@Controller
@RequestMapping("/goodsCategory")
public class GoodsCategoryController {
	
	@Autowired
	private GoodsCategoryService goodsCategoryService;
	
	/**
	 * 商品分类的树形结构
	 * @author Administrator
	 * @date2017年12月5日下午4:19:56
	 * @version 1.0
	 */
	@RequestMapping("/tree")
	public ModelAndView showGoodsCategoryTree(HttpServletRequest requset){
		ModelAndView modelAndView = new ModelAndView("goods-category");
		JSONArray goodsCategoryTree = goodsCategoryService.goodsCategoryTree();
		requset.getSession().setAttribute("goodsCategoryTree", goodsCategoryTree.toString());
		return modelAndView;
	}
	
	/**
	 * 商品添加的typeCode唯一验证
	 * @author Administrator
	 * @date2017年12月5日下午4:19:56
	 * @version 1.0
	 */
	@RequestMapping("/verifyTypeCode")
	@ResponseBody
	public JSONObject verifyTypeCode(HttpServletRequest request){
		JSONObject jsonObject = new JSONObject();
		String typeCode = request.getParameter("typeCode");
		//非空验证
		if(StringUtils.isNotBlank(typeCode)){
			GoodsCategory type = goodsCategoryService.queryByTypeCode(typeCode);
			if(null != type){
				jsonObject.put("mark", "exit");
			}
		}
		return jsonObject;
	}

	/**
	 * 保存分类信息
	 * @author Administrator
	 * @date2017年12月5日下午9:13:29
	 * @version 1.0
	 */
	@RequestMapping("/saveType")
	@ResponseBody
	public JSONObject save(GoodsCategory type){
		//System.out.println(type);
		JSONObject jsonObject = new JSONObject();
		//非空验证
		if(null != type){
			int mark = goodsCategoryService.saveType(type);
				jsonObject.put("mark", mark);
		}
		return jsonObject;
	}

	/**
	 * 修改分类的数据回显
	 * @author Administrator
	 * @date2017年12月5日下午10:24:26
	 * @version 1.0
	 */
	@RequestMapping("/updateTypeShow")
	@ResponseBody
	public JSONObject updateShow(HttpServletRequest request){
		JSONObject jsonObject = new JSONObject();
		String typeIdStr = request.getParameter("typeId");
		//非空验证
		if(StringUtils.isNotBlank(typeIdStr)){
			int typeId = Integer.parseInt(typeIdStr);
			GoodsCategory type = goodsCategoryService.queryByTypeId(typeId);
			//System.out.println(type);
			jsonObject.put("typeId", type.getTypeId());
			jsonObject.put("typeCode", type.getTypeCode());
			jsonObject.put("typeName", type.getTypeName());
			jsonObject.put("typeDesc", type.getTypeDesc());
		}
		return jsonObject;
	}
	
	/**
	 * 修改商品分类
	 * @author Administrator
	 * @date2017年12月5日下午10:50:06
	 * @version 1.0
	 */
	@RequestMapping("/updateType")
	@ResponseBody
	public JSONObject updateType(GoodsCategory type){
		JSONObject jsonObject = new JSONObject();
		//非空验证
		if(null != type){
			int mark = goodsCategoryService.updateType(type);
			jsonObject.put("mark",mark);
		}
		return jsonObject;
	}
	
	@RequestMapping("/verifyChildType")
	@ResponseBody
	public JSONObject queryChildByParentId(HttpServletRequest request){
		JSONObject jsonObject = new JSONObject();
		String parendIdStr = request.getParameter("parentId");
		if(StringUtils.isNotBlank(parendIdStr)){
			int parendId = Integer.parseInt(parendIdStr);
			List<GoodsCategory> list = goodsCategoryService.queryChildType(parendId);
			if(list.size() != 0){
				jsonObject.put("mark","ok");
			}else{
				jsonObject.put("mark","no");
			}
		}
		return jsonObject;
	}
	
	
}
