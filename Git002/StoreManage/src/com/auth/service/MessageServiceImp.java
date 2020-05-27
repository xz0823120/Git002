package com.auth.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.auth.entity.Message;
import com.auth.mapper.MessageMapper;

@Service
public class MessageServiceImp implements MessageService {

	@Autowired
	private MessageMapper messageMapper;

	/*
	 * 新增站内信
	 */
	@Override
	public int addMessage(Message message) {
		return messageMapper.addMessage(message);
	}

	/*
	 * 查询站内信总条数
	 */
	public int selectMessageCount(HashMap<Object, Object> hm) {
		return messageMapper.selectMessageCount(hm);
	};

	/*
	 * 查询站内信
	 */
	@Override
	public List<Message> selectMessage(HashMap<Object, Object> hm) {
		return messageMapper.selectMessage(hm);
	};
	
	
	/*
	 * 查询最大id
	 * */
	@Override
	public int selectMaxId(){
		return messageMapper.selectMaxId();
	};
	
	/*
	 * 关联表插入数据
	 * */
	@Override
	public int insertUserMessage(HashMap<Object,Object> hm){
		return messageMapper.insertUserMessage(hm);
	};
	
	
	
	/*
	 * 查询关联表数据
	 * */
	@Override
	public List<Message> selectUserMessage(HashMap<Object,Object> hm){
		return messageMapper.selectUserMessage(hm);
	};
	
	
	/*
	 * 修改我的站内信状态
	 * */
	@Override
	public int updateState(Message message){
		int num = messageMapper.updateState(message);
		return num;
	};
	
	
	/*
	 * 查询我的站内信条数
	 * */
	@Override
	public int selectMyCount(HashMap<Object,Object> hm){
		return messageMapper.selectMyCount(hm);
	};
	
	
	/*
	 * 查询我的站内信未读条数
	 * */
	@Override
	public int selectMyMessageCount(Integer integer){
		return messageMapper.selectMyMessageCount(integer);
	};

	
	/*
	 * 根据user_message中的form_user查询用户表的name,显示发信人 
	 */
	@Override
	public List<Message> selectuserNameByfromUser(HashMap<Object,Object> hm){
		return messageMapper.selectuserNameByfromUser(hm);
	};
}
