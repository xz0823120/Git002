package com.auth.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;

import com.auth.entity.Auth;
import com.auth.entity.User;

public interface AuthService {
	/**
	 * 通过角色查询角色对应的一级权限
	 * 
	 * @author Administrator
	 * @date 2017年11月22日 下午5:18:20
	 * @version 1.0
	 */
	public List<Auth> findFirstAuth(HttpServletRequest request,User user);

	/**
	 * 通过父id查询子权限
	 * 
	 * @author Administrator
	 * @date 2017年11月22日 下午5:18:24
	 * @version 1.0
	 */
	public List<Auth> findChildAuth(HashMap<String, Integer> hashMap);

	/**
	 * 根据父id查询所有子权限
	 * 
	 * @author Administrator
	 * @date 2017年11月22日 下午5:15:15
	 * @version 1.0
	 */
	public List<Auth> selectAllChild(int parentId);
	/**
	 * 递归查询子权限
	*@author Administrator
	*@date 2017年11月30日 上午11:23:48
	*@version 1.0
	 */
	public JSONArray selectAllAuth(HttpServletRequest request,int parentId,JSONArray jsonArray);
	/**
	 * 检查Code是否唯一
	 * 
	 * @author Administrator
	 * @date 2017年11月24日 下午4:32:44
	 * @version 1.0
	 */
	public int findAuthByCode(String authCode);

	/**
	 * 添加权限
	 * 
	 * @author Administrator
	 * @date 2017年11月23日 上午10:33:05
	 * @version 1.0
	 */
	public int insertAuth(Auth auth);

	/**
	 * 修改权限状态
	 * 
	 * @author Administrator
	 * @date 2017年11月23日 下午4:38:52
	 * @version 1.0
	 */
	public int deleteAuth(HashMap<String, Object> hashMap);

	/**
	 * 修改权限
	 * 
	 * @author Administrator
	 * @date 2017年11月23日 下午5:34:59
	 * @version 1.0
	 */
	public int updateAuth(Auth auth);

	/**
	 * 通过权限id查找权限
	 * 
	 * @author Administrator
	 * @date 2017年11月24日 上午11:02:19
	 * @version 1.0
	 */
	public Auth findAuthById(int authId);
	/**
	 * 通过父Id查找权限
	*@author Administrator
	*@date 2017年11月29日 下午1:57:36
	*@version 1.0
	 */
	public int selectAuthByPId(int parentId);
}
