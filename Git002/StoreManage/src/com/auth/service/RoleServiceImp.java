/**
 * @filename RoleServiceImp.java
 * @author Administrator
 * @date 2017年11月20日 下午6:08:56
 * @version 1.0
 * Copyright (C) 2017 
 */
package com.auth.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auth.entity.Auth;
import com.auth.entity.Role;
import com.auth.mapper.AuthMapper;
import com.auth.mapper.RoleMapper;

@Service
public class RoleServiceImp implements RoleService {
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private AuthMapper authMapper;
	/**
	 * 查询角色
	 * 
	 * @author Administrator
	 * @date 2017年11月20日 下午5:51:05
	 * @version 1.0
	 */
	@Override
	public List<Role> selectRoles(HashMap<String, Object> hashmap) {
		// TODO Auto-generated method stub
		return roleMapper.selectRoles(hashmap);
	}

	/**
	 * 查询总条数
	 * 
	 * @author Administrator
	 * @date 2017年11月20日 下午6:56:33
	 * @version 1.0
	 */
	@Override
	public int roleCount(HashMap<String, Object> hashmap) {
		// TODO Auto-generated method stub
		return roleMapper.roleCount(hashmap);
	}

	/**
	 * 根据角色code查找
	 * 
	 * @author Administrator
	 * @date 2017年11月21日 上午10:15:07
	 * @version 1.0
	 */
	public int findByCode(String roleCode) {
		return roleMapper.findByCode(roleCode);
	};

	/**
	 * 添加角色
	 * 
	 * @author Administrator
	 * @date 2017年11月21日 上午10:03:01
	 * @version 1.0
	 */
	@Override
	public int insertRole(Role role) {
		// TODO Auto-generated method stub
		return roleMapper.insertRole(role);
	}

	/**
	 * 修改角色状态
	 * 
	 * @author Administrator
	 * @date 2017年11月21日 下午1:14:05
	 * @version 1.0
	 */
	@Override
	public int updateState(Role role) {
		// TODO Auto-generated method stub
		return roleMapper.updateState(role);
	}

	/**
	 * 修改角色信息
	 * 
	 * @author Administrator
	 * @date 2017年11月21日 下午3:50:41
	 * @version 1.0
	 */
	@Override
	public int updateRole(Role role) {
		// TODO Auto-generated method stub
		return roleMapper.updateRole(role);
	}

	/**
	 * 查询未禁用角色
	 * 
	 * @author Administrator
	 * @date 2017年11月21日 下午6:21:15
	 * @version 1.0
	 */
	@Override
	public List<Role> queryRole() {
		// TODO Auto-generated method stub
		return roleMapper.queryRole();
	}

	/**
	 * 查询用户已有的角色
	 * 
	 * @author Administrator
	 * @date 2017年11月22日 上午11:19:28
	 * @version 1.0
	 */
	@Override
	public String userRole(int userId) {
		// TODO Auto-generated method stub
		return roleMapper.userRole(userId);
	}
	/**
	 * 根据角色id删除已有权限
	*@author Administrator
	*@date 2017年11月27日 上午9:56:44
	*@version 1.0
	 */
	@Override
	public int deletePermission(int roleId) {
		
		return roleMapper.deletePermission(roleId);
	}
	/**
	 * 授予权限
	*@author Administrator
	*@date 2017年11月27日 上午9:48:35
	*@version 1.0
	 */
	@Override
	public int grantPermission(HashMap<String, Object> hashMap) {
		// TODO Auto-generated method stub
		return roleMapper.grantPermission(hashMap);
	}
	/**
	 * 根据角色id查询角色权限
	*@author Administrator
	*@date 2017年11月27日 上午10:16:38
	*@version 1.0
	 */
	@Override
	public String roleAuth(int roleId) {
		// TODO Auto-generated method stub
		return roleMapper.roleAuth(roleId);
	}
	/**
	 * Ztree
	*@author Administrator
	*@date 2017年11月27日 上午10:16:38
	*@version 1.0
	 */
	@Override
	public void ztree(HttpServletRequest request,int roleId) {
		JSONArray jsonArray = new JSONArray();
		String authId = ",";
		if(roleId != 0){
			authId += roleMapper.roleAuth(roleId)+",";
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
