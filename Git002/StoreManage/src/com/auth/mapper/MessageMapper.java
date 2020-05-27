package com.auth.mapper;

import java.util.HashMap;
import java.util.List;
import com.auth.entity.Message;

public interface MessageMapper {

	/*
	 * 创建新的站内信
	 * */
	public int addMessage(Message message);
	
	/*
	 * 查询站内信
	 * */
	public List<Message> selectMessage(HashMap<Object,Object> hm);
	
	/*
	 * 查询站内信总条数
	 * */
	public int selectMessageCount(HashMap<Object,Object> hm);
	
	
	/*
	 * 查询最大id
	 * */
	public int selectMaxId();
	
	
	/*
	 * 关联表插入数据
	 * */
	public int insertUserMessage(HashMap<Object,Object> hm);
	
	
	/*
	 * 查询关联表数据
	 * */
	public List<Message> selectUserMessage(HashMap<Object,Object> hm);
	
	/*
	 * 修改我的站内信状态
	 * */
	public int updateState(Message message);
	
	/*
	 * 查询我的站内信条数
	 * */
	public int selectMyCount(HashMap<Object,Object> hm);
	
	/*
	 * 查询我的站内信未读条数
	 * */
	public int selectMyMessageCount(Integer integer);
	
	
	/*
	 * 根据user_message中的form_user查询用户表的name,显示发信人 
	 */
	public List<Message> selectuserNameByfromUser(HashMap<Object,Object> hm);
}
