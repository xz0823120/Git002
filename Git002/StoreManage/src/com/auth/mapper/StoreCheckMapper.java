package com.auth.mapper;

import java.util.HashMap;
import java.util.List;

import com.auth.entity.StoreCheck;

public interface StoreCheckMapper {
	/**
	 * 这是关于查询所有的盘点列表的一个方法，查询符合要求的所有信息
	 * 参数就是要求，符合参数的全部查询出来
	 */
	List<StoreCheck> findStoreCheck(HashMap<?,?> hashMap);
	/*
	 * 这是查询符合条件的所有信息的个数
	 */
	int findStoreCheckNum(HashMap<?,?> hashMap);
	/*
	 * 通过batchId 查找batchNum
	 */
	String findBatchNumByBatchId(int i);
	/*
	 * 通过RecordId 查找CheckState
	 */
	String findCheckStateByRecordId(int i);
	/*
	 * 通过StoreId 查找StoreName
	 */
	String findStoreNameByStoreId(int i);
	/*
	 * 通过batchId 查找batchName
	 */
	String findProductNameByProductId(int i);
	/*
	 * 传两个值，一个是recordId，一个loseNum如果有值，则进行更改，没有就不更改
	 */
	int updateStocktakingState(HashMap <?,?> hashMap);
	/*
	 * 插入batch，
	 */
	int insertBatch(HashMap <?,?> hashMap);
	/*
	 * 查询batch_id,通过bathcNum查找batch_id
	 */
	Integer	findBatchId(HashMap <?,?> hashMap);
	/*
	 * 插入record
	 */
	int insertRecord(HashMap <?,?> hashMap);
	/*
	 * 查找recordId，通过batchId
	 */
	int findRecordId(HashMap <?,?> hashMap);
	/*
	 * 插入storeCheck
	 */
	int insertStoreCheck(HashMap <?,?> hashMap);
	/*
	 * 该更状态
	 */
	int updateStocktakingText(HashMap <?,?> hashMap);
}
