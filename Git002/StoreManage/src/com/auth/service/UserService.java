package com.auth.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.auth.entity.User;

public interface UserService {
	/**
	 * 添加用户
	 * 
	 * @author Administrator
	 * @date 2017年11月17日 下午5:40:51
	 * @version 1.0
	 */
	public int addUser(User user);

	/**
	 * 删除用户
	 * 
	 * @author Administrator
	 * @date 2017年11月17日 下午5:40:57
	 * @version 1.0
	 */
	public int deleteUser(int userId);

	/**
	 * 根据用户名查找用户
	 * 
	 * @author Administrator
	 * @date 2017年11月17日 下午5:41:02
	 * @version 1.0
	 */
	public User findUserByName(String userCode);

	/**
	 * 全部查询
	 * 
	 * @author Administrator
	 * @date 2017年11月17日 下午5:41:07
	 * @version 1.0
	 */
	// public List<User> findAllUser();
	/**
	 * 根据用户Id修改用户昵称，类型
	 * 
	 * @author Administrator
	 * @date 2017年11月17日 下午5:41:13
	 * @version 1.0
	 */
	public int updateUser(User user);

	/**
	 * 根据用户id重置密码
	 * 
	 * @author Administrator
	 * @date 2017年11月17日 下午5:41:18
	 * @version 1.0
	 */
	public int updatePwd(int userId);

	/**
	 * 根据用户id修改用户状态
	 * 
	 * @author Administrator
	 * @date 2017年11月17日 下午5:41:24
	 * @version 1.0
	 */
	public int updateState(User user);

	/**
	 * 查询用户个数
	 * 
	 * @author Administrator
	 * @date 2017年11月17日 下午5:12:42
	 * @version 1.0
	 */
	public int selectCount(HashMap<String, Object> hashmap);

	/**
	 * 分页查询
	 * 
	 * @author Administrator
	 * @date 2017年11月17日 下午5:18:56
	 * @version 1.0
	 */
	public List<User> selectUserPage(HashMap<String, Object> hashmap);

	/**
	 * 分配角色
	 * 
	 * @author Administrator
	 * @date 2017年11月22日 上午9:31:15
	 * @version 1.0
	 */
	public int assignRoles(HashMap<String, Object> hashMap);

	/**
	 * 删除已存在的角色
	 * 
	 * @author Administrator
	 * @date 2017年11月22日 上午11:11:40
	 * @version 1.0
	 */
	public int deleteRole(int userId);
	/**
	 * 根据用户id查询权限
	*@author Administrator
	*@date 2017年11月27日 下午2:21:43
	*@version 1.0
	 */
	public String findAuthByid(int userId);
	/**
	 * 根据用户id删除权限
	*@author Administrator
	*@date 2017年11月27日 下午2:22:32
	*@version 1.0
	 */
	public int deleteAuthById(int userId);
	/**
	 * 修改权限
	*@author Administrator
	*@date 2017年11月27日 下午2:23:44
	*@version 1.0
	 */
	public int insertAuthById(HashMap<String, Object> hashMap);
	/**
	 * zTree树
	*@author Administrator
	*@date 2017年11月27日 下午2:49:22
	*@version 1.0
	 */
	public void zTree(HttpServletRequest request,int userId);
}
