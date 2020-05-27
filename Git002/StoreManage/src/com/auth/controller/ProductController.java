package com.auth.controller;

import java.io.File;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.auth.entity.Brand;
import com.auth.entity.Place;
import com.auth.entity.Product;
import com.auth.entity.Store;
import com.auth.entity.Supply;
import com.auth.entity.Unit;
import com.auth.service.BrandService;
import com.auth.service.GoodsCategoryService;
import com.auth.service.PlaceService;
import com.auth.service.ProductService;
import com.auth.service.StoreService;
import com.auth.service.SupplyService;
import com.auth.service.UnitService;
import com.auth.util.Page;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	ProductService productService;
	@Autowired
	StoreService storeService;
	@Autowired
	BrandService brandService;
	@Autowired
	GoodsCategoryService goodsCategoryService;
	@Autowired
	UnitService unitService;
	@Autowired
	PlaceService placeService;
	@Autowired
	SupplyService supplyService;
	
	@RequestMapping("/product-list")
	public ModelAndView productList(Product product,HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView("product-list");
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("pro", product);

		// 获取当前页
		String pageNo = request.getParameter("currNo");
		int currNo = 1;
		if (pageNo != null && !"".equals(pageNo)) {
			currNo = Integer.parseInt(pageNo);
		}

		// 获取总条数
		int totalNum = productService.selectCount(hashmap);
		Page page = new Page(totalNum, currNo);
		// url
		String urlString = "product/product-list.action?storeId=1";
		StringBuffer sb = new StringBuffer();
		// 将搜索框中的值储存在StringBuffer中
		if (StringUtils.isNotBlank(product.getProductName())) {
			sb.append("&productName=").append(product.getProductName());
		}
		if (StringUtils.isNotBlank(product.getBrandName())) {
			sb.append("&brandName=").append(product.getBrandName());
		}
		if (StringUtils.isNotBlank(product.getTypeName())) {
			sb.append("&typeName=").append(product.getTypeName());
		}
		if (StringUtils.isNotBlank(product.getSupplyName())) {
			sb.append("&supplyName=").append(product.getSupplyName());
		}
		if (StringUtils.isNotBlank(product.getPlaceName())) {
			sb.append("&placeName=").append(product.getPlaceName());
		}
		if (StringUtils.isNotBlank(product.getUpDownState())) {
			sb.append("&upDownState=").append(product.getUpDownState());
		}
		if (StringUtils.isNotBlank(product.getIsOverDate())) {
			sb.append("&isOverDate=").append(product.getIsOverDate());
		}
		String params = sb.toString();
		page.setUrlString(urlString);
		page.setParams(params);
		hashmap.put("Page", page);
		
		//System.out.println(product);
		//查询商品信息
		List<Product> productList = productService.selectProductMess(hashmap);
	//	System.out.println(productList);
		modelAndView.addObject("productList", productList);
		
		//查询仓库列表
		List<Store> storeList =  storeService.chooseStore();
		modelAndView.addObject("store", storeList);
		modelAndView.addObject("Page", page);
		
		return modelAndView;
	}
	
	/**
	 * 跳转到修改页面
	 * @param product
	 * @return
	 */
	@RequestMapping("/reverseProduct")
	public ModelAndView reverseProduct(Product product,HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView("reverseProduct");
		modelAndView.addObject("product", product);
		
		//查询仓库列表
		List<Store> storeList =  storeService.chooseStore();
		modelAndView.addObject("store", storeList);
		//查询品牌列表
		List<Brand> brandList = brandService.selectAllBrand();
		modelAndView.addObject("brand", brandList);
		//查询商品种类的树
		JSONArray typeTree = goodsCategoryService.goodsCategoryTree();
		System.out.println(typeTree);
		modelAndView.addObject("typeTree", typeTree);
		//request.getSession().setAttribute("typeTree", typeTree);
		//获取单位列表
		List<Unit> unitList = unitService.selectUnitList();
		System.out.println(unitList);
		modelAndView.addObject("unitList", unitList);
		//获取供货商列表
		List<Place> placeList = placeService.findAll();
		modelAndView.addObject("placeList", placeList);
		System.out.println(placeList);
		//获取产地列表
		List<Supply> supplyList = supplyService.findAll();
		modelAndView.addObject("supplyList", supplyList);
		System.out.println(supplyList);
		return modelAndView;
	}
	
	/**
	 * 确认商品修改
	 * @param product
	 * @param request
	 * @return
	 */
	@RequestMapping("/modification")
	public String modification(Product product,HttpServletRequest request){
		System.out.println(product);
		
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("product", product);
		
		int a = productService.modificationProduct(hashmap);
		if(a>0){
			System.out.println("修改成功");
		}
		return "redirect:/product/product-list.action?storeId=1";
	}
	
	/**
	 * 上传图片
	 * 先上传图片--->改变数据库中Img字段的值
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping("/upLoadImg")
	public ModelAndView upLoadImg(@RequestParam("file") MultipartFile file,HttpServletRequest request,Product product) {  
        // 判断文件是否为空  
		//System.out.println(product.getProductId());
        if (!file.isEmpty()) {  
            try {  
                // 文件保存路径  
            	//file.getOriginalFilename() 获取上传文件的原始名称
                String filePath = request.getSession().getServletContext().getRealPath("/")+"static/img/"+file.getOriginalFilename();  
                //将文件路径存到product对象中
                product.setImgs("/static/img/"+file.getOriginalFilename());
                // 转存文件  
                System.out.println(product);
                file.transferTo(new File(filePath));  
                HashMap<String, Object> hashmap = new HashMap<String, Object>();
                hashmap.put("product", product);
                //修改图片路径
                productService.modificationProduct(hashmap);
            } catch (Exception e) {  
                e.printStackTrace();
            }  
        }
		
		return null;
	}
	
	/**
	 * 添加商品
	 * @return
	 */
	@RequestMapping("/jumpAddProductJsp")
	public ModelAndView jumpAddProductJsp(){
		ModelAndView modelAndView = new ModelAndView("addProduct");
		//查询仓库列表
		List<Store> storeList =  storeService.chooseStore();
		modelAndView.addObject("store", storeList);			
		//查询品牌列表
		List<Brand> brandList = brandService.selectAllBrand();
		modelAndView.addObject("brand", brandList);
		//查询种类树
		JSONArray typeTree = goodsCategoryService.goodsCategoryTree();
		//System.out.println(typeTree);
		modelAndView.addObject("typeTree", typeTree);
		//查询单位列表
		List<Unit> unitList = unitService.selectUnitList();
		//System.out.println(unitList);
		modelAndView.addObject("unitList", unitList);
		//查询供应商列表
		List<Place> placeList = placeService.findAll();
		modelAndView.addObject("placeList", placeList);
		//System.out.println(placeList);
		//查询产地列表
		List<Supply> supplyList = supplyService.findAll();
		modelAndView.addObject("supplyList", supplyList);
		//System.out.println(supplyList);
		return modelAndView;
	}
	
	/**
	 * 确认添加商品
	 * @return
	 */
	@RequestMapping("/addPruduct")
	public String addPruduct(Product product){
		System.out.println(product);
		HashMap<String, Object> hashmap= new HashMap<String, Object>(); 
		hashmap.put("product", product);
		productService.addProduct(hashmap);
		return "redirect:/product/product-list.action?storeId=1";
	}
	
	@RequestMapping("/addOutStoreFrom")
	@ResponseBody
	public JSONObject addInStoreFrom(HttpServletRequest request,Product product) {
		//获取理货员ID
		String createby=request.getParameter("createBy");
		int createBy=1;
		if(createby!=null && createby!=""){
			createBy=Integer.parseInt(createby);
		}
		//获取产品ID
		String productid=request.getParameter("productId");
		int productId=1;
		if(productid!=null && productid!=""){
			productId=Integer.parseInt(productid);
		}
		//获取仓库ID
		String storeid=request.getParameter("storeId");
		int storeId=1;
		if(storeid!=null && storeid!=""){
			storeId=Integer.parseInt(storeid);
		}
		System.out.println("商品ID:"+productId);
		//获取出库数量
		String outNum=request.getParameter("outNum");
		
		System.out.println("出库数量:"+outNum);
		product.setStoreId(storeId);
		product.setProductId(productId);
		product.setCreateBy(createBy);
		product.setOutNum(outNum);;
		int num = productService.insertOutStoreFrom(product);
		JSONObject json = new JSONObject();
		json.put("delete", num);
		return json;
	}
	/**
	 * 检查输入数量是否正确
	*@comment 更改人员状态
	*@author 冯琪
	*@date 2017年12月7日 下午9:09:12
	*@param empID
	*@param status
	*@version 1.0
	 */
	@RequestMapping("/checkProductInvent")
	@ResponseBody
	public JSONObject checkProductInvent(HttpServletRequest request,Product product) {
		// 获取商品ID
		String productid = request.getParameter("productId");
		int productId=1;
		if(productid!=null && productid!=""){
			productId=Integer.parseInt(productid);
		}
		//获取仓库ID
		String storeid = request.getParameter("storeId");
		int storeId=1;
		if(storeid!=null && storeid!=""){
			storeId=Integer.parseInt(storeid);
		}
		//获取数量
		String productInventOld =request.getParameter("productInvent");
		JSONObject json = new JSONObject();
		product.setStoreId(storeId);
		product.setProductId(productId);
		if (storeId!=0 && productId!=0 &&  StringUtils.isNotBlank(productInventOld)) {
			Product count = productService.findProductNum(product);
			System.out.println("商品数量:"+count.getProductInvent());
			BigDecimal productInventNew=count.getProductInvent();
			//前台接收的字符串转为BigDecimal
			BigDecimal bd=new BigDecimal(productInventOld);
			//前台数值和数据库中的数值进行比较，数量正确返回-1，错误返回1
			int pio=bd.compareTo(productInventNew);
			System.out.println("pio:"+pio);
			if(pio==-1){
				json.put("num", 1);
			}else{
				json.put("num", 0);
			}
		} else {
			json.put("num", -1);
		}
		return json;
	}
	
	/**
	 * 改变上下架状态
	 * @return
	 */
	@RequestMapping("/changeState")
	public String changeState(Product product){
		System.out.println("++++++++++++"+product);
		int a = productService.changeState(product);
		if(a>0){
			System.out.println("修改成功");
		}else{
			System.out.println("修改失败");
		}
		return "redirect:/product/product-list.action?storeId=1";
	}
	//--------------------------	
	/**
	 * @author 吴垚
	 * 点击调货按钮显示调货列表 
	 * @return
	 */
		@RequestMapping("/showStoreProduct")
		public ModelAndView showStoreProduct(HttpServletRequest request,Product product){
			ModelAndView modelAndView = new ModelAndView("new-list");
			//如果request.getParameter("targetStoreId")不为空（说明是从调货按钮过来的） 把argetStoreId传到new-list页面
			String stringTargetStoreId = request.getParameter("targetStoreId");
			if(stringTargetStoreId!=null && stringTargetStoreId !=""){
				request.getSession().setAttribute("targetStoreId", stringTargetStoreId);
			}
				String storeid = request.getParameter("storeId");
				Integer storeId =1;
				if(storeid!=null && storeid!=""){
					storeId = Integer.parseInt(storeid);
				}
				product.setStoreId(storeId);
				
				HashMap<String, Object> hashmap = new HashMap<String, Object>();
				hashmap.put("pro", product);
				// 获取当前页
				String pageNo = request.getParameter("currNo");
				int currNo = 1;
				if (pageNo != null && !"".equals(pageNo)) {
					currNo = Integer.parseInt(pageNo);
				}

				// 获取总条数
				int totalNum = productService.selectCount(hashmap);
				Page page = new Page(totalNum, currNo);
				// url
				String urlString = "product/showStoreProduct.action";
				StringBuffer sb = new StringBuffer();
				// 将搜索框中的值储存在StringBuffer中
				if (StringUtils.isNotBlank(storeid)) {
					sb.append("&storeId=").append(storeid);
				}
				if (StringUtils.isNotBlank(product.getProductName())) {
					sb.append("&productName=").append(product.getProductName());
				}
				if (StringUtils.isNotBlank(product.getBrandName())) {
					sb.append("&brandName=").append(product.getBrandName());
				}
				if (StringUtils.isNotBlank(product.getTypeName())) {
					sb.append("&typeName=").append(product.getTypeName());
				}
				if (StringUtils.isNotBlank(product.getSupplyName())) {
					sb.append("&supplyName=").append(product.getSupplyName());
				}
				if (StringUtils.isNotBlank(product.getPlaceName())) {
					sb.append("&placeName=").append(product.getPlaceName());
				}
				String params = sb.toString();
				page.setUrlString(urlString);
				page.setParams(params);
				hashmap.put("Page", page);
				List<Product> productList = productService.selectProductMess(hashmap);
				modelAndView.addObject("tansProductList", productList);
				modelAndView.addObject("Page", page);
				//查询仓库列表
				List<Store> storeList =  storeService.chooseStore();
				modelAndView.addObject("store", storeList);
				
			return modelAndView;
		}
		
		/**
		 * @author 吴垚
		 * 调货数量检查、插入结果集、修改该条数据
		 * @return
		 */
		@RequestMapping("/transStore")
		@ResponseBody
		public JSONObject countProduct(HttpServletRequest request ,Product product){
			System.out.println("ctr。。");
			return productService.countProduct(request, product);
		}
}
