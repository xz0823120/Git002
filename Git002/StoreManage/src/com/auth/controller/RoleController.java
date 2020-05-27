/**
 * @filename RoleController.java
 * @author Administrator
 * @date 2017年11月20日 下午6:17:50
 * @version 1.0
 * Copyright (C) 2017 
 */
package com.auth.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.auth.entity.Role;
import com.auth.entity.User;
import com.auth.service.RoleService;
import com.auth.util.Page;

@Controller
@RequestMapping("/role")
public class RoleController {
	@Autowired
	private RoleService roleService;

	/**
	 * 修改角色信息
	 * 
	 * @author Administrator
	 * @date 2017年11月21日 下午4:00:09
	 * @version 1.0
	 */
	@RequestMapping("/updateRole")
	@ResponseBody
	public JSONObject updateRole(HttpServletRequest request, Role role) {
		JSONObject json = new JSONObject();
		// 获取修改人id
		User user = (User) request.getSession().getAttribute("user");
		int updateBy = user.getUserId();
		role.setUpdateBy(updateBy);
		int num = roleService.updateRole(role);
		if (num > 0) {
			json.put("updateRole", 1);
		} else {
			json.put("uodateRole", 0);
		}
		return json;
	}

	/**
	 * 修改角色状态
	 * 
	 * @author Administrator
	 * @date 2017年11月21日 下午3:48:52
	 * @version 1.0
	 */
	@RequestMapping("/updateState")
	@ResponseBody
	public JSONObject updateState(Role role) {
		JSONObject json = new JSONObject();
		int num = roleService.updateState(role);
		json.put("updateState", num);
		return json;
	}

	/**
	 * 添加角色
	 * 
	 * @author Administrator
	 * @date 2017年11月21日 上午10:18:39
	 * @version 1.0
	 */
	@RequestMapping("/addRole")
	@ResponseBody
	public JSONObject addRole(HttpServletRequest request, Role role) {
		// 获取添加的角色Code
		String roleCode = role.getRoleCode();
		// 获取创建人id
		User user = (User) request.getSession().getAttribute("user");
		int createBy = user.getUserId();
		// 将创建人id设置到role对象中
		role.setCreateBy(createBy);
		// 检查该角色是否已经存在
		int num = roleService.findByCode(roleCode);
		JSONObject json = new JSONObject();
		if (num > 0) {
			json.put("addrole", 0);
		} else {
			roleService.insertRole(role);
			json.put("addrole", 1);
		}

		return json;
	}

	/**
	 * 查询角色
	 * 
	 * @author Administrator
	 * @date 2017年11月20日 下午6:20:35
	 * @version 1.0
	 */
	@RequestMapping("/list")
	public ModelAndView selectRose(HttpServletRequest request, Role role) {
		ModelAndView mav = new ModelAndView("role-list");
		// 每页显示条数
		String pageNum = request.getParameter("pageNum");
		if (StringUtils.isBlank(pageNum)) {
			pageNum = "6";
		}
		// 获取当前页
		String pageNo = request.getParameter("currNo");
		int currNo = 1;
		if (pageNo != null && !"".equals(pageNo)) {
			currNo = Integer.parseInt(pageNo);
		}
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("role", role);
		// 获取总条数
		int totalNum = roleService.roleCount(hashmap);
		Page page = new Page(totalNum, currNo);
		hashmap.put("page", page);
		// 设置url
		String urlString = "role/list.action";
		page.setUrlString(urlString);
		// 接受搜索框传来的参数
		StringBuffer sb = new StringBuffer();
		if (StringUtils.isNotBlank(role.getRoleCode())) {
			sb.append("&roleCode=").append(role.getRoleCode());
		}
		if (StringUtils.isNotBlank(role.getRoleState())) {
			sb.append("&roleState=").append(role.getRoleState());
		}
		String params = sb.toString();
		page.setParams(params);
		// 查询所有用户
		List<Role> roleList = roleService.selectRoles(hashmap);
		page.setResultList(roleList);
		mav.addObject("Page", page);
		mav.addObject("roleList", roleList);
		return mav;
	}
	/**
	 * 查询权限
	*@author Administrator
	*@date 2017年11月27日 上午10:09:19
	*@version 1.0
	 */
	@RequestMapping("/selectAuth")
	public ModelAndView selectAuth(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("role-updateAuth");
		try {
			String roleID = request.getParameter("roleId");
			int roleId = 0;
			if(StringUtils.isNotBlank(roleID)){
				roleId = Integer.parseInt(roleID);
			}
			String roleCode = request.getParameter("roleCode");
			roleService.ztree(request, roleId);
			mav.addObject("roleId", roleId);
			request.getSession().setAttribute("roleCode", roleCode);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return mav;
	}
	/**
	 * 更改权限
	*@author Administrator
	*@date 2017年11月27日 上午10:29:35
	*@version 1.0
	 */
	@RequestMapping("/grantAuth")
	public String grantAuth(HttpServletRequest request){
		try {
			//获取角色id
			String roleID = request.getParameter("roleId");
			int roleId = 0;
			//判断非空
			if(StringUtils.isNotBlank(roleID)){
				roleId = Integer.parseInt(roleID);
			}
			//根据角色id删除权限
			roleService.deletePermission(roleId);
			//获取权限id
			String authID = request.getParameter("authId");
			String[] authIds = null;
			//判断非空
			HashMap<String, Object> hashMap = new HashMap<String, Object>();
			if(StringUtils.isNotBlank(authID)){
				authIds = authID.split(",");
				hashMap.put("roleId", roleId);
				for (String authId : authIds) {
					hashMap.put("authId", authId);
					//授予权限
					roleService.grantPermission(hashMap);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "forward:/role/list.action";
	}
}
