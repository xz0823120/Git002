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

@Service
public class AuthServiceImp implements AuthService {
	@Autowired
	private AuthMapper authMapper;

	/**
	 * 通过用户查询用户对应的一级权限
	 * 
	 * @author Administrator
	 * @date 2017年11月22日 下午5:18:20
	 * @version 1.0
	 */
	@Override
	public List<Auth> findFirstAuth(HttpServletRequest request,User user) {
		HashMap<String, Integer> hashMap = new HashMap<String, Integer>();
		int userId = user.getUserId();
		hashMap.put("userId", userId);
		// TODO Auto-generated method stub
		List<Auth> firstList = authMapper.findFirstAuth(hashMap);
		StringBuffer sbf = new StringBuffer();
		for (Auth firstAuth : firstList) {
			int authId = firstAuth.getAuthId();
			hashMap.put("authId", authId);
			// 根据一级权限的id查询二级权限
			List<Auth> secondList = authMapper.findChildAuth(hashMap);
			// 将二级权限放入一级权限集合属性中
			firstAuth.setChildAuth(secondList);
			// 循环遍历二级权限
			for (Auth secondAuth : secondList) {
				// 根据二级权限的id查询三级权限
				int secondAuthId = secondAuth.getAuthId();
				hashMap.put("authId", secondAuthId);
				// 查询子权限，通过二级找三级
				List<Auth> thirdList = authMapper.findChildAuth(hashMap);
				// 将三级权限放入二级权限集合属性中
				for (Auth thirdAuth : thirdList) {
					String authCode = thirdAuth.getAuthCode();
					sbf.append(authCode+",");
				}
				secondAuth.setChildAuth(thirdList);
			}
		}
		request.getSession().setAttribute("sbf", sbf);
		return firstList;

	}

	/**
	 * 通过父id查询子权限
	 * 
	 * @author Administrator
	 * @date 2017年11月22日 下午5:18:24
	 * @version 1.0
	 */
	@Override
	public List<Auth> findChildAuth(HashMap<String, Integer> hashMap) {
		// TODO Auto-generated method stub
		return authMapper.findChildAuth(hashMap);
	}

	/**
	 * 根据父id查询所有子权限
	 * 
	 * @author Administrator
	 * @date 2017年11月22日 下午5:15:15
	 * @version 1.0
	 */
	@Override
	public List<Auth> selectAllChild(int parentId) {
		// TODO Auto-generated method stub
		return authMapper.selectAllChild(parentId);
	}
	/**
	 * 递归查询子权限
	*@author Administrator
	*@date 2017年11月30日 上午11:23:48
	*@version 1.0
	 */
	@Override
	public JSONArray selectAllAuth(HttpServletRequest request,int parentId,JSONArray jsonArray) {
		// TODO Auto-generated method stub
		List<Auth> firstList = authMapper.selectAllChild(parentId);
		// 遍历一级权限
		if(firstList.size() > 0){
			for (Auth firstauth : firstList) {
				// 查询一级权限的id
				int firsttId = firstauth.getAuthId();
				JSONObject firstJson = new JSONObject();
				if (firstauth.getAuthState().equals("0")) {
					firstJson.put("name", firstauth.getAuthName());
					firstJson.put("font", "{'color':'#A9A9A9'}");
				} else {
					firstJson.put("name", firstauth.getAuthName());
				}
				firstJson.put("id", firsttId);
				firstJson.put("pId", firstauth.getParentId());
				firstJson.put("open", false);
				jsonArray.put(firstJson);
				
				jsonArray = selectAllAuth(request,firsttId,jsonArray);
			}
		}
		return jsonArray;
	}
	/**
	 * 检查Code是否唯一
	 * 
	 * @author Administrator
	 * @date 2017年11月24日 下午4:32:44
	 * @version 1.0
	 */
	@Override
	public int findAuthByCode(String authCode) {
		return authMapper.findAuthByCode(authCode);
	}

	/**
	 * 添加权限
	 * 
	 * @author Administrator
	 * @date 2017年11月23日 上午10:33:05
	 * @version 1.0
	 */
	@Override
	public int insertAuth(Auth auth) {
		// TODO Auto-generated method stub
		return authMapper.insertAuth(auth);
	}

	/**
	 * 修改权限状态
	 * 
	 * @author Administrator
	 * @date 2017年11月23日 下午4:38:52
	 * @version 1.0
	 */
	@Override
	public int deleteAuth(HashMap<String, Object> hashMap) {
		// TODO Auto-generated method stub
		return authMapper.deleteAuth(hashMap);
	}

	/**
	 * 修改权限
	 * 
	 * @author Administrator
	 * @date 2017年11月23日 下午5:34:59
	 * @version 1.0
	 */
	@Override
	public int updateAuth(Auth auth) {
		// TODO Auto-generated method stub
		return authMapper.updateAuth(auth);
	}

	/**
	 * 通过权限id查找权限
	 * 
	 * @author Administrator
	 * @date 2017年11月24日 上午11:02:19
	 * @version 1.0
	 */
	@Override
	public Auth findAuthById(int authId) {
		// TODO Auto-generated method stub
		return authMapper.findAuthById(authId);
	}
	/**
	 * 通过父Id查找权限
	*@author Administrator
	*@date 2017年11月29日 下午1:57:36
	*@version 1.0
	 */
	@Override
	public int selectAuthByPId(int parentId) {
		// TODO Auto-generated method stub
		return authMapper.selectAuthByPId(parentId);
	}

}
