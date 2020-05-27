package com.auth.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auth.entity.Product;
import com.auth.entity.Transshipment;
import com.auth.entity.User;
import com.auth.mapper.ProductMapper;
import com.auth.mapper.TransshipmentMapper;
import com.auth.service.ProductService;
@Service
public class ProductServiceImp implements ProductService{
	
	@Autowired
	ProductMapper productMapper;
	@Autowired
	private TransshipmentMapper transshipmentMapper;
	
	/**
	 * 查询商品信息
	 * @param hashmap
	 * @return
	 */
	@Override
	public List<Product> selectProductMess(HashMap<String, Object> hashmap) {
		List<Product> productList = productMapper.selectProductMess(hashmap);
		return productList;
	}
	
	/**
	 * 查询商品总数
	 * @param hashmap
	 * @return
	 */
	@Override
	public int selectCount(HashMap<String, Object> hashmap) {
		// TODO Auto-generated method stub
		return productMapper.selectCount(hashmap);
	}
	
	/**
	 * 修改商品
	 * @param hashmap
	 * @return
	 */
	@Override
	public int modificationProduct(HashMap<String,Object> hashmap){
		
		return productMapper.modificationProduct(hashmap);
	}
	
	/**
	 * 添加商品
	 * @param hashmap
	 * @return
	 */
	@Override
	public int addProduct(HashMap<String,Object> hashmap){
		return productMapper.addProduct(hashmap);
	}
	
	@Override
	public int insertOutStoreFrom(Product product){
		return productMapper.insertOutStoreFrom(product);
	}
	
	@Override
	public int updateProductNum(Product product){
		return productMapper.updateProductNum(product);
	}
	
	public Product findProductNum(Product product){
		return productMapper.findProductNum(product);
	}

	@Override
	public int changeState(Product product) {
		// TODO Auto-generated method stub
		return productMapper.changeState(product);
	}
	/**
	 * @author 吴垚
	 * @Description 查询编号、查询调货数量、插入结果集、修改该条数据、向调货表插入数据
	 * @param hashmap
	 * @return
	 */
	@Override
	public JSONObject countProduct(HttpServletRequest request ,Product product) {
		JSONObject jsson = new JSONObject();
		//--------sourceStoreId源仓库id
		Integer sourceStoreId = Integer.valueOf(request.getParameter("sourceStoreId"));
		//---------------目标仓库（要修改的仓库id）,set到product对象（即给那个仓库调货）
		Integer targetStoreId = Integer.parseInt(request.getParameter("targetStoreId"));
		//根据传来商品id查询商品库存
		System.out.println("商品id"+product.getProductId());
		Integer productCount = productMapper.countProduct(product);
		System.out.println("库存"+productCount);
		//System.out.println("调货数量:"+transNum);
		//如果商品编号正确 进行下一步操作
		Integer intNumResult = productMapper.findProductByNum(product);
		//如果根据输入的商品编号查询出来的信息为0 则证明编号不重复
		if(intNumResult==0){
			//-------源商品id
			Integer sourceProductId = product.getProductId();
			//传来的调货数量(字符串类型：进行非空非空串判断)
			String stringTransNum = request.getParameter("transNum");
			Double transNum=0.0;
			if(stringTransNum!=null && stringTransNum!=""){
				transNum = Double.valueOf(stringTransNum);
			}
			//如果调货数量大于0并小于库存 则进行下一步逻辑操作：insert into select
			if(transNum>0 &&transNum<productCount){
				//如果目标仓库和源仓库id相等
				if(sourceStoreId==targetStoreId){
					jsson.put("num", -3);
				}else{
					//如果调货数量正确，则先插入结果集
					Integer insertResult = productMapper.insertSelectResult(product);
					System.out.println("插入："+insertResult+"条数据");
					//插入后修改仓库id，商品编号，库存
					//如果插入成功，执行修改操作
					if(insertResult>0){
						//------------需要目标商品id(新插入数据的商品id)
						Integer targetProductId=productMapper.getNewProductId();
						System.out.println("目标productId:"+targetProductId);
						product.setProductId(targetProductId);
						//------------将Double类型的 transNum 转为BigDecimal（调货量）
						BigDecimal invent = BigDecimal.valueOf(transNum);
						//将调货量set到product对象中，`      
						product.setProductInvent(invent);
						
						product.setStoreId(targetStoreId);
						System.out.println("商品编号"+product.getProductNum());
						System.out.println("updatProduct:"+product);
						Integer updateResult = productMapper.updateInsertInfo(product);
						System.out.println("修改："+updateResult+"条数据");
						if(updateResult>0){
							//如果向商品表插入成功并修改成功 返回1 进行下一步操作：向调货表插入数据
							jsson.put("num", 1);
							//调货insertIntoTransshipment需要一个transshipment对象，所以new一个（也可以在方法后面加入Transshipment transshipment）
							Transshipment transshipment = new Transshipment();
							//向transshipment对象 set 需要的参数
							//源仓库
							transshipment.setSourceStoreId(sourceStoreId);
							//源商品id
							transshipment.setSourceProductId(sourceProductId);
							//目标仓库id
							transshipment.setTargetStoreId(targetStoreId);
							//目标商品id
							transshipment.setTargetProductId(targetProductId);
							//调货量
							transshipment.setTransNum(invent);
							//添加者
							User user = (User)request.getSession().getAttribute("user");
							transshipment.setCreateBy(user.getUserId());
							//执行添加方法，添加调货的数据到调货表
							System.out.println("修改的transshipment："+transshipment);
							transshipmentMapper.insertIntoTransshipment(transshipment);
						}
					}else{
						//返回0表示添加或修改方法执行失败（先复制一条信息添加到商品表，再修改商品表的信息：数量，仓库，编号）
						jsson.put("num", 0);
					}
				}
			}else{
				//返回-1表示数量输入不合法
				jsson.put("num", -1);
			}
		}else{
			//返回-2表示编号输入不合法
			jsson.put("num", -2);
		}
	
		return jsson;
	}

	
	/**
	 * 
	 * @author wuyao
	 * @Description 根据商品id查商品信息，返回product对象
	 * @date 2017年12月12日上午11:05:42
	 * @param product
	 * @return
	 */
	@Override
	public Product selectProductByPid(int productId) {
		return productMapper.selectProductByPid(productId);
	}
}
