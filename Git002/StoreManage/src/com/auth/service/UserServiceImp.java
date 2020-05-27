package com.auth.service;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import net.sf.json.JSONObject;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.auth.entity.Auth;
import com.auth.entity.User;
import com.auth.mapper.AuthMapper;
import com.auth.mapper.UserMapper;

@Service
public class UserServiceImp implements UserService {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private AuthMapper authMapper;
	/**
	 * 添加用户
	 */
	@Override
	public int addUser(User user) {
		return userMapper.addUser(user);
	}
	/**
	 * 删除用户
	 */
	@Override
	public int deleteUser(int userId) {
		return userMapper.deleteUser(userId);
	}

	/**
	 * 根据用户名查找用户
	 */
	@Override
	public User findUserByName(String userCode) {
		return userMapper.findUserByName(userCode);
	}

	/**
	 * 查询所有用户
	 */
	/*
	 * @Override public List<User> findAllUser() { return
	 * userMapper.findAllUser(); }
	 */
	/**
	 * 修改用户信息
	 */
	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.updateUser(user);
	}

	/**
	 * 重置密码
	 */
	@Override
	public int updatePwd(int userId) {
		// TODO Auto-generated method stub
		return userMapper.updatePwd(userId);
	}

	/**
	 * 修改用户状态
	 */
	@Override
	public int updateState(User user) {
		// TODO Auto-generated method stub
		return userMapper.updateState(user);
	}

	/**
	 * 查询用户个数
	 */
	@Override
	public int selectCount(HashMap<String, Object> hashmap) {
		// TODO Auto-generated method stub
		return userMapper.selectCount(hashmap);
	}

	/**
	 * 分页查询
	 */
	@Override
	public List<User> selectUserPage(HashMap<String, Object> hashmap) {
		// TODO Auto-generated method stub
		return userMapper.selectUserPage(hashmap);
	}

	/**
	 * 分配角色
	 */
	@Override
	public int assignRoles(HashMap<String, Object> hashMap) {
		// TODO Auto-generated method stub
		return userMapper.assignRoles(hashMap);
	}

	/**
	 * 删除已存在的角色
	 */
	@Override
	public int deleteRole(int userId) {
		// TODO Auto-generated method stub
		return userMapper.deleteRole(userId);
	}
	/**
	 * 根据用户id查询权限
	 */
	@Override
	public String findAuthByid(int userId) {
		// TODO Auto-generated method stub
		return userMapper.findAuthByid(userId);
	}
	/**
	 * 根据用户id删除权限
	 */
	@Override
	public int deleteAuthById(int userId) {
		// TODO Auto-generated method stub
		return userMapper.deleteAuthById(userId);
	}
	/**
	 * 修改权限
	 */
	@Override
	public int insertAuthById(HashMap<String, Object> hashMap) {
		// TODO Auto-generated method stub
		return userMapper.insertAuthById(hashMap);
	}
	/**
	 * zTree树
	 */
	@Override
	public void zTree(HttpServletRequest request, int userId) {
		// TODO Auto-generated method stub
		JSONArray jsonArray = new JSONArray();
		String authId = ",";
		if(userId != 0){
			authId += userMapper.findAuthByid(userId)+",";
		}
		// 查询一级权限
		List<Auth> firstList = authMapper.selectAllChild(0);
		// 遍历一级权限
		for (Auth firstauth : firstList) {
			// 查询一级权限的id
			int firsttId = firstauth.getAuthId();
			// 通过一级权限的id查找二级权限
			List<Auth> secondlist = authMapper.selectAllChild(firsttId);
			JSONObject firstJson = new JSONObject();
			if(firstauth.getAuthState().equals("1")){
				firstJson.put("name", firstauth.getAuthName());
				firstJson.put("id", firsttId);
				firstJson.put("pId", firstauth.getParentId());
				firstJson.put("open", false);
				if(authId != null && authId.indexOf(","+ firsttId+",") != -1){
					firstJson.put("checked", true);
				}
				jsonArray.put(firstJson);
			}
			// 遍历二级权限
			for (Auth secondauth : secondlist) {
				// 获取二级权限的id
				int secondId = secondauth.getAuthId();
				// 通过二级权限的id查询三级权限
				List<Auth> thirdlist = authMapper.selectAllChild(secondId);
				JSONObject secondjson = new JSONObject();
				if(secondauth.getAuthState().equals("1")){
					secondjson.put("id", secondId);
					secondjson.put("pId", secondauth.getParentId());
					secondjson.put("name", secondauth.getAuthName());
					secondjson.put("open", true);
					if(authId != null && authId.indexOf(","+ secondId+",") != -1){
						secondjson.put("checked", true);
					}
					jsonArray.put(secondjson);
				}
				// 遍历三级权限
				for (Auth thirdauth : thirdlist) {
					JSONObject thirdjson = new JSONObject();
					if(thirdauth.getAuthState().equals("1")){
						thirdjson.put("id", thirdauth.getAuthId());
						thirdjson.put("pId", thirdauth.getParentId());
						thirdjson.put("name", thirdauth.getAuthName());
						if(authId != null && authId.indexOf(","+ thirdauth.getAuthId()+",") != -1){
							thirdjson.put("checked", true);
						}
						jsonArray.put(thirdjson);
					}
				}
			}
		}
		request.getSession().setAttribute("jsonArray", jsonArray);
		
	}

}
