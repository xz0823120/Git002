package com.auth.mapper;

import java.util.HashMap;
import java.util.List;
import com.auth.entity.Auth;
public interface AuthMapper {
	/**
	 * 通过角色查询角色对应的一级权限
	 * 
	 * @author Administrator
	 * @date 2017年11月22日 下午5:14:13
	 * @version 1.0
	 */
	public List<Auth> findFirstAuth(HashMap<String, Integer> hashMap);

	/**
	 * 通过父id和用户id查询子权限
	 * 
	 * @author Administrator
	 * @date 2017年11月22日 下午5:14:20
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
	 * 添加权限
	 * 
	 * @author Administrator
	 * @date 2017年11月23日 上午10:33:05
	 * @version 1.0
	 */
	public int insertAuth(Auth auth);

	/**
	 * 检查Code是否唯一
	 * 
	 * @author Administrator
	 * @date 2017年11月24日 下午4:32:44
	 * @version 1.0
	 */
	public int findAuthByCode(String authCode);

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
