package com.auth.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.auth.entity.Store;
import com.auth.entity.StoreCheck;
import com.auth.service.StoreCheckService;
import com.auth.service.StoreService;
import com.auth.util.Page;

/**
 * 负责商品的盘点和盘点表的所有功能
 * @author 懒虫虫
 *
 */
@Controller
@RequestMapping("/store")
public class StoreCheckController {
	/*查询所有的订单列表默认查1号仓库的所有商品
	 * 条件查询，使用动态SQL查询相对应的盘点信息
	 * 参数是Storecheck对象传递参数
	 * 返回的是分页对象，方便直接页面显示store/stocktaking
	 */
	@Autowired
	StoreService storeService;
	@Autowired
	private StoreCheckService storeCheckService;
	@RequestMapping("/stocktakingSearch")
	public ModelAndView getStocktaking(HttpServletRequest request,StoreCheck storeCheck,Page page){
		//System.out.println(request);
		Page toPage = storeCheckService.getPageFromStoreCheck(request,storeCheck,page);
		ModelAndView mav = new ModelAndView("storecheck-list");
		System.out.println(toPage);
		mav.addObject("Page", toPage);
		//查询仓库列表
		List<Store> storeList =  storeService.chooseStore();
		mav.addObject("store", storeList);	
		return mav;
	}
	/*
	 * 条件查询特定盘点表中，并更改状态信息
	 * 目前就有两个可以更改，一个是盘点状态，一旦更改就不能在修改
	 * 返回的json对象成功返回1，失败返回0
	 */
	@RequestMapping("/updatestocktakingstate")
	public ModelAndView updateStocktakingState(HttpServletRequest request,StoreCheck storeCheck,Page page){
		ModelAndView mav = new ModelAndView("storecheck-list");
		int result = storeCheckService.StocktakingState(request);
		if(result>0){
			Page toPage = storeCheckService.getPageFromStoreCheck(request,storeCheck,page);
			mav.addObject("Page", toPage);
		}
		return mav;	
	}
	@RequestMapping("/updatestocktakingstatetext")
	public ModelAndView updateStocktakingStateText(HttpServletRequest request,StoreCheck storeCheck,Page page){
		ModelAndView mav = new ModelAndView("storecheck-list");
		int result = storeCheckService.updateStocktakingState(request);
		if(result>0){
			Page toPage = storeCheckService.getPageFromStoreCheck(request,storeCheck,page);
			mav.addObject("Page", toPage);
		}
		return mav;	
	}
	/**
	 * 
	 * @param request
	 * @param store
	 * @param product
	 * @param page
	 * @return 一个盘点列表，遍历然后查找最早的盘点时间
	 */
	@RequestMapping("/toInsertMethod")
	public ModelAndView addStoreCheck(HttpServletRequest request){
		//判断当前的商品当月是否已经盘点过如果是，则传一个信息，不能盘点，如果当月没有盘点过，则可以盘点
		StoreCheck storeCheck = new StoreCheck();
		//这个是查询条件
		String storeId = request.getParameter("storeId");
		String productName = request.getParameter("productName");
		String productId = request.getParameter("productId");
		if(storeId!=null&&storeId!=""){
			storeCheck.setStoreId(Integer.parseInt(storeId));
		}
		
		//这是查询方法以及结果
	
		int result = storeCheckService.isCheckedInTheMonth(storeCheck,productName);
		ModelAndView mav = new ModelAndView("addStoreCheck");
		mav.addObject("storeId", storeId);
		mav.addObject("productName", productName);
		mav.addObject("productId", productId);
		if(result > 0){
			mav.addObject("msg","1");
		}else{
			mav.addObject("msg","0");
		}
		return mav;
	}
	
	@RequestMapping("/storecheckinsert")
	public String storecheckinsert(StoreCheck storeCheck,HttpServletRequest request){
		ModelAndView mav = new ModelAndView("storecheck-list");
		//这里拿到的是从前台拿到的值
		 System.out.println(storeCheck);
		 int result  = storeCheckService.insertIntoStoreCheck(request,storeCheck);
		/* if(result > 0){
				mav.addObject("addmsg","1");
			}else{
				mav.addObject("addmsg","0");
			}*/
		return "redirect:/store/stocktakingSearch.action?storeId=1";
	}
}

