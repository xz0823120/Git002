package com.auth.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auth.entity.StoreCheck;
import com.auth.entity.User;
import com.auth.mapper.StoreCheckMapper;
import com.auth.service.StoreCheckService;
import com.auth.util.Page;
@Service
public class StoreCheckServiceImp implements StoreCheckService{
	/**
	 * 这是查询的所有方法，返回的是page，他里面有所有查询出来的盘点表
	 */
	@Autowired
	public StoreCheckMapper storeCheckMapper;
	@Override
	public Page getPageFromStoreCheck(HttpServletRequest request,StoreCheck storeCheck,Page page) {
		
		 //* 首先查到所有的盘点表，默认查询仓库1号
		 //* <!--四表联查，storeCheck（check）仓库Id，时间（一个是自己的Javabean中的，另一个是单独查过来的）
		 //* checkRecord时间，根据盘点批次，使用AJAX提交
		//（check）商品名称，（record）状态  hsahMap(storeCheck（对象），checkTimeTo（时间字段），checkState（状态字段），productName(商品名称字段))-->
		 
		//从前端拿到相关参数
		//
		String productId = request.getParameter("productId");
		String storeId = request.getParameter("storeId");
		//终止时间
		String timeToEnd = request.getParameter("timeToEnd");
		//System.out.println("终止时间:"+timeToEnd);
		//起始时间
		String timeToBegin = request.getParameter("timeToBegin");
		//System.out.println("起始时间:"+timeToBegin);
		String checkState = request.getParameter("checkState");
		String productName = request.getParameter("productName");
		HashMap<Object,Object> hashMap = new HashMap<Object, Object>();
		hashMap.put("storeCheck", storeCheck);
		hashMap.put("page", page);
		hashMap.put("timeToBegin", timeToBegin);
		hashMap.put("timeToEnd", timeToEnd);
		hashMap.put("checkState", checkState);
		hashMap.put("productName", productName);
		System.out.println(hashMap);
		//这是根据条件查出来的盘点表
		List<StoreCheck> list = storeCheckMapper.findStoreCheck(hashMap);
		//System.out.println(list);
		//因为不想写check_record和check_batch所以在store_check 中添加了两个属性checkState 和batchNum，productName,storeName
		//遍历所有的storeCheck添加这四个属性
		int i = 0;
		String str = "";
		for (StoreCheck storecheck : list) {
			i =storecheck.getBatchId();
			//System.out.println(i);
			str = storeCheckMapper.findBatchNumByBatchId(i);
			//System.out.println(str);
			storecheck.setBatchNum(str);
			String state = storeCheckMapper.findCheckStateByRecordId(storecheck.getCheckId());
			storecheck.setCheckState(storeCheckMapper.findCheckStateByRecordId(storecheck.getRecordId()));
			
			storecheck.setProductName(storeCheckMapper.findProductNameByProductId(storecheck.getProductId()));
			storecheck.setStoreName(storeCheckMapper.findStoreNameByStoreId(storecheck.getStoreId()));
			System.out.println(storecheck);
		}
		//这是查出来的数量
		//System.out.println(list);
		Integer totalNum = storeCheckMapper.findStoreCheckNum(hashMap);
		//开始赋值
		Page toPage = new Page(totalNum,page.getCurrNo());
		String urlString = "store/stocktakingSearch.action";
		StringBuffer sb = new StringBuffer();
		// 将搜索框中的值储存在StringBuffer中
		if (StringUtils.isNotBlank(timeToEnd)) {
			sb.append("&timeToEnd=").append(timeToEnd);
		}
		if (StringUtils.isNotBlank(timeToBegin)) {
			sb.append("&timeToBegin=").append(timeToBegin);
		}
		if (StringUtils.isNotBlank(checkState)) {
			sb.append("&checkState=").append(checkState);
		}
		if (StringUtils.isNotBlank(productName)) {
			sb.append("&productName=").append(productName);
		}
		if (totalNum!=null) {
			sb.append("&totalNum=").append(totalNum);
		}
		if (productId!=null) {
			sb.append("&productId=").append(productId);
		}
		if (storeId!=null) {
			sb.append("&storeId=").append(storeId);
		}
		//toString
		String params = sb.toString();
		//赋值
		toPage.setUrlString(urlString);
		toPage.setParams(params);
		toPage.setResultList(list);
		return toPage;
	}

	@Override
	public int StocktakingState(HttpServletRequest request) {
		String recordId = request.getParameter("recordId");
		String lossNum = request.getParameter("lossNum");
		String checkNum = request.getParameter("checkNum");
		String reson = request.getParameter("reson");
		System.out.println("recordId"+recordId+"lossNum"+lossNum+"checkNum"+checkNum+"reson"+reson);
		HashMap<String,Object> hashMap = new HashMap<String, Object>(); 
		hashMap.put("recordId", recordId);
		hashMap.put("lossNum", lossNum);
		hashMap.put("checkNum", checkNum);
		hashMap.put("reson", reson);
		int n = storeCheckMapper.updateStocktakingState(hashMap);
		//;
		return n;
	}

	@Override
	public int isCheckedInTheMonth(StoreCheck storeCheck,String productName) {
		//当前时间
		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, -1);
		//上个月的时间
		Date oldDate = calendar.getTime();
		//标识符
		int flag = 1;
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("storeCheck", storeCheck);
		hashMap.put("productName", productName);
		Page page = new Page();
		hashMap.put("page", page);
		List<StoreCheck> storeCheckList = storeCheckMapper.findStoreCheck(hashMap);
		for (StoreCheck StoreCheck : storeCheckList) {
			if(!oldDate.after(StoreCheck.getCheckTime())){
				flag = 0;
			}
		}
		return flag;
	}

	@Override
	public int insertIntoStoreCheck(HttpServletRequest request,StoreCheck storeCheck) {
		int flag = 0;
		HashMap<String,Object> hashMap = new HashMap<String,Object>();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
		String dstr = sdf.format(date);
		System.out.println(dstr);
		//开始讲流程，首先创建Check_batch批次号是时间，仓库ID有创建时间是插入的时间，创建人是session里面的用户
		//request.getSession().setAttribute("user", user);
		User user= (User) request.getSession().getAttribute("user");
		String createUser = user.getUserCode();
		int StoreId = Integer.parseInt(request.getParameter("storeId"));
		int productId = Integer.parseInt(request.getParameter("productId"));
		String productName = request.getParameter("productName");
		hashMap.put("createUser", createUser);
		hashMap.put("storeId", StoreId);
		hashMap.put("productName", productName);
		
		int batchResult = storeCheckMapper.insertBatch(hashMap);
		//然后就是拿到check_batch的ID，仓库ID和商品ID状态默认为0
		if(batchResult>0){
			
			hashMap.put("batchNum", dstr);
			Integer batchId = storeCheckMapper.findBatchId(hashMap);
			
			if(batchId!=null){
				hashMap.put("batchId", batchId);
				hashMap.put("productId", productId);
				int recordResult = storeCheckMapper.insertRecord(hashMap);
				if(recordResult>0){
					//然后拿到batchid 和checkid ，仓库Id，商品ID，盘点数目，时间是系统时间，创建人
					Integer recordId = storeCheckMapper.findRecordId(hashMap);
					if(recordId!=null){
						hashMap.put("recordId", recordId);
						hashMap.put("checkNum", storeCheck.getCheckNum());
						hashMap.put("checkUser", storeCheck.getCheckUser());
						hashMap.put("lossName", storeCheck.getLossNum());
						hashMap.put("reson", storeCheck.getReson());
						storeCheckMapper.insertStoreCheck(hashMap);
						flag=1;
					}
				}
			}
		}
		
		return flag;
	}

	@Override
	public int updateStocktakingState(HttpServletRequest request) {
		HashMap<String,Object> hashMap = new HashMap<String,Object>();
		String recordId = request.getParameter("recordId");
		hashMap.put("recordId", recordId);
		int n = storeCheckMapper.updateStocktakingText(hashMap);
		return n;
	}

}
