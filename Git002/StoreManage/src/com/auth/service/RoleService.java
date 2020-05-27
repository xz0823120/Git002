/**
 * @filename RoleService.java
 * @author Administrator
 * @date 2017年11月20日 下午6:03:44
 * @version 1.0
 * Copyright (C) 2017 
 */
package com.auth.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.auth.entity.Role;

public interface RoleService {
	/**
	 * 查询角色
	 * 
	 * @author Administrator
	 * @date 2017年11月20日 下午5:51:05
	 * @version 1.0
	 */
	public List<Role> selectRoles(HashMap<String, Object> hashmap);

	/**
	 * 查询总条数
	 * 
	 * @author Administrator
	 * @date 2017年11月20日 下午6:56:33
	 * @version 1.0
	 */
	public int roleCount(HashMap<String, Object> hashmap);

	/**
	 * 根据角色code查找是否存在
	 * 
	 * @author Administrator
	 * @date 2017年11月21日 上午10:15:07
	 * @version 1.0
	 */
	public int findByCode(String roleCode);

	/**
	 * 添加角色
	 * 
	 * @author Administrator
	 * @date 2017年11月21日 上午10:03:01
	 * @version 1.0
	 */
	public int insertRole(Role role);

	/**
	 * 修改角色状态
	 * 
	 * @author Administrator
	 * @date 2017年11月21日 下午1:14:05
	 * @version 1.0
	 */
	public int updateState(Role role);

	/**
	 * 修改角色信息
	 * 
	 * @author Administrator
	 * @date 2017年11月21日 下午3:50:41
	 * @version 1.0
	 */
	public int updateRole(Role role);

	/**
	 * 查询未禁用角色
	 * 
	 * @author Administrator
	 * @date 2017年11月21日 下午6:21:15
	 * @version 1.0
	 */
	public List<Role> queryRole();

	/**
	 * 查询用户已有的角色
	 * 
	 * @author Administrator
	 * @date 2017年11月22日 上午11:19:28
	 * @version 1.0
	 */
	public String userRole(int userId);
	/**
	 * 根据角色id查询角色权限
	*@author Administrator
	*@date 2017年11月27日 上午10:16:38
	*@version 1.0
	 */
	public String roleAuth(int roleId); 
	/**
	 * 根据角色id删除已有权限
	*@author Administrator
	*@date 2017年11月27日 上午9:56:44
	*@version 1.0
	 */
	public int deletePermission(int roleId);
	/**
	 * 授予权限
	*@author Administrator
	*@date 2017年11月27日 上午9:48:35
	*@version 1.0
	 */
	public int grantPermission(HashMap<String, Object > hashMap);
	/**
	 * 修改权限的权限树
	*@author Administrator
	*@date 2017年11月27日 上午10:50:02
	*@version 1.0
	 */
	public void ztree(HttpServletRequest request,int roleId);
}
