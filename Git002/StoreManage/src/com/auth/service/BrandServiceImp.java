package com.auth.service;

import java.util.HashMap;
import java.util.List;


import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auth.entity.Brand;
import com.auth.mapper.BrandMapper;


@Service
public class BrandServiceImp implements BrandService{

	@Autowired
	private BrandMapper brandMapper;

	
	/*
	 * 查询全部条件下的总条数
	 * */
	public int selectCount(HashMap<Object,Object> hm){
		//获取到页面传过来的查询条件
		int totalNum = brandMapper.selectCount(hm);
		return totalNum;
	};
	
	/**
	 *查询所有品牌
	 */
	public List<Brand> selectAllBrand(){
		return brandMapper.selectAllBrand();
	}
	/*
	 * 查询全部品牌
	 * */
	@Override
	public List<Brand> selectBrand(HashMap<Object,Object> hm){
		List<Brand> brandlist = brandMapper.selectBrand(hm);
		return brandlist;
	};
	
	
	/*
	 * 对品牌名进行唯一校验
	 * */
	public List<Brand> selectBrandByName(Brand brand){
		List<Brand> brandlist = brandMapper.selectBrandByName(brand);
		return brandlist;
	};
	
	
	/*
	 * 增加新品牌
	 * */
	public int addBrand(Brand brand){
		String name1 = brand.getBrandName();
		String name2 = "";
        char[] nameChar = name1.toCharArray();  
        HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();  
        defaultFormat.setCaseType(HanyuPinyinCaseType.UPPERCASE);  
        defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);  
        for (int i = 0; i < nameChar.length; i++) {  
            if (nameChar[i] > 128) {  
                try {  
                	name2 += PinyinHelper.toHanyuPinyinStringArray(  
                            nameChar[i], defaultFormat)[0].charAt(0);  
                } catch (BadHanyuPinyinOutputFormatCombination e) {  
                    e.printStackTrace();  
                }  
            } else {  
            	name2 += nameChar[i];  
            }  
        }  
        
		String brandLeter = (name2.charAt(0)+"").toUpperCase();
		brand.setBrandLeter(brandLeter);
		System.out.println(brandLeter);
		int num = brandMapper.addBrand(brand);
		return num;
	};
	

	/*
	 * 根据品牌id删除品牌
	 * */
	public int deleteBrand(Brand brand){
		int num = brandMapper.deleteBrand(brand);
		return num;
	};
}
