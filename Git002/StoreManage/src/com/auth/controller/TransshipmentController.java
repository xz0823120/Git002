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
import com.auth.entity.Product;
import com.auth.entity.Transshipment;
import com.auth.entity.User;
import com.auth.service.InStoreService;
import com.auth.service.ProductService;
import com.auth.service.TransshipmentService;
import com.auth.util.Page;
@RequestMapping("/trans")
@Controller
public class TransshipmentController {
@Autowired
private TransshipmentService transshipmentService;
@Autowired
ProductService productService;
@Autowired
private InStoreService inStoreService;
	//仓库列表
		@RequestMapping("/queryTransshipment")
		@ResponseBody
		public ModelAndView selectTransshipment(HttpServletRequest request, Transshipment transshipment) {
			ModelAndView mav = new ModelAndView("trans-list");
			//sourceStoreId
//			String stringSourceStoreId = request.getParameter("sourceStoreId");
//			Integer sourceStoreId =1;
//			if(stringSourceStoreId!=null && stringSourceStoreId!=""){
//				sourceStoreId = Integer.parseInt(stringSourceStoreId);
//				transshipment.setSourceStoreId(sourceStoreId);
//			}
//			
//			//targetStoreId
//			String stringtargetStoreId = request.getParameter("targetStoreId");
//			Integer targetStoreId =1;
//			if(stringtargetStoreId!=null && stringtargetStoreId!=""){
//				targetStoreId = Integer.parseInt(stringtargetStoreId);
//				transshipment.settargetStoreId(targetStoreId);
//			}
			
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
			HashMap<String, Object> hashmap = new HashMap<String, Object>();
			hashmap.put("transshipment", transshipment);
			// 获取总条数
			int totalNum = transshipmentService.transshipmentCount(hashmap);
			Page page = new Page(totalNum, currNo);
			hashmap.put("page", page);
			// 设置url
			String urlString = "trans/queryTransshipment.action";
			page.setUrlString(urlString);
			// 接受搜索框传来的参数
			StringBuffer sb = new StringBuffer();
			if (StringUtils.isNotBlank(request.getParameter("sourceStoreId"))) {
				sb.append("&sourceStoreId=").append(request.getParameter("sourceStoreId"));
			}
			if (StringUtils.isNotBlank(request.getParameter("targetStoreId"))) {
				sb.append("&targetStoreId=").append(request.getParameter("targetStoreId"));
			}
			
			
			
			
			
			if (StringUtils.isNotBlank(transshipment.getCreateName())) {
				sb.append("&createName=").append(transshipment.getCreateName());
			}
			
			if (StringUtils.isNotBlank(transshipment.getSourceProductName())) {
				sb.append("&sourceProductName=").append(transshipment.getSourceProductName());
			}
			if (StringUtils.isNotBlank(transshipment.getTargetProductName())) {
				sb.append("&targetProductName=").append(transshipment.getTargetProductName());
			}
			
			String params = sb.toString();
			page.setParams(params);
			// 查询所有调货信息
			List<Transshipment> transshipmentList = transshipmentService.selectTransshipment(hashmap);
			page.setResultList(transshipmentList);
			mav.addObject("Page", page);
			mav.addObject("transshipmentList", transshipmentList);
			System.out.println("transshipment"+transshipment);
			return mav;
		}
		
		//确认调货
		@RequestMapping("/confirmTransshipment")
		@ResponseBody
		public JSONObject confirmTransshipment(HttpServletRequest request, Transshipment transshipment){
			JSONObject json =new JSONObject();
			System.out.println("原商品id"+transshipment.getSourceProductId());
			System.out.println("源仓库id"+transshipment.getSourceStoreId());
			System.out.println("目标商品id:"+transshipment.getTargetProductId());
			System.out.println("transId"+transshipment.getTransId());
			int updateSourceNum = transshipmentService.updateSourceNum(transshipment);
			System.out.println("updateSourceNum修改源商品数量："+updateSourceNum+"(调货量"+transshipment.getTransNum()+")");
			//加入到入库单
			//根据原商品id查询商品对象
			Product  inStoreProduct = productService.selectProductByPid(transshipment.getTargetProductId());
			
			//创建InstoreInfo对象(调用inStoreService接口的addInStoreFrom方法需要一个对象)
			System.out.println("inStoreProduct:"+inStoreProduct);
			InStoreInfo inStore = new InStoreInfo();
			//addInStoreFrom方法的 storeId
			String stringStoreid = String.valueOf(inStoreProduct.getStoreId());
			inStore.setStoreId(stringStoreid);
			//productId
			inStore.setProductId(transshipment.getTargetProductId()+"");
			//inNum
			inStore.setInNum(transshipment.getTransNum()+"");
			//createBy
			User user = (User)request.getSession().getAttribute("user");
			inStore.setCreateBy(user.getUserId());
			//调用addInStoreFrom方法（已审核）
			int returnInStore = inStoreService.addInStoreFrom1(inStore);
			int isSuccess = transshipmentService.confirmTransshipment(transshipment);
			System.out.println("confirmTransshipment确认调货："+isSuccess);
			if(isSuccess>0 && updateSourceNum>0 && returnInStore>0){
				json.put("isSuccess", 1);
			}else{
				json.put("isSuccess", -1);
			}
			return json;
		}
}
