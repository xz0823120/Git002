package com.auth.controller;

import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.auth.entity.Auth;
import com.auth.entity.User;
import com.auth.service.AuthService;

@Controller
@RequestMapping("/auth")
public class AuthController {
	@Autowired
	private AuthService authService;

	/**
	 * 权限表全查
	 * 
	 * @author Administrator
	 * @date 2017年11月22日 下午5:20:23
	 * @version 1.0
	 */
	@RequestMapping("/authArray")
	public ModelAndView authArray(HttpServletRequest request) {
		JSONArray jsonArray = new JSONArray();
		jsonArray = authService.selectAllAuth(request, 0, jsonArray);
		ModelAndView mov = new ModelAndView("authTree");
		request.getSession().setAttribute("jsonArray", jsonArray);
		return mov;
	}
	/**
	 * 验证Code的唯一性
	*@author Administrator
	*@date 2017年11月28日 下午9:58:30
	*@version 1.0
	 */
	
	@RequestMapping("/checkCode")
	@ResponseBody
	public JSONObject checkCode(HttpServletRequest request) {
		// 获取authCode
		String authCode = request.getParameter("authCode");
		JSONObject json = new JSONObject();
		if (StringUtils.isNotBlank(authCode)) {
			int count = authService.findAuthByCode(authCode);
			if (count > 0) {
				json.put("num", 1);
			} else {
				json.put("num", 0);
			}
		} else {
			json.put("num", -1);
		}
		return json;
	}

	/**
	 * 添加权限
	 * 
	 * @author Administrator
	 * @date 2017年11月23日 下午4:56:06
	 * @version 1.0
	 */
	@RequestMapping("/addAuth")
	@ResponseBody
	public JSONObject addAuth(HttpServletRequest request, Auth auth) {
		// 获取创建人id
		User user = (User) request.getSession().getAttribute("user");
		int createBy = user.getUserId();
		// 放入auth对象中
		auth.setCreateBy(createBy);
		JSONObject json = new JSONObject();
		int num = authService.insertAuth(auth);
		json.put("num", num);
		return json;
	}

	/**
	 * 删除权限
	 * 
	 * @author Administrator
	 * @date 2017年11月23日 下午5:12:34
	 * @version 1.0
	 */
	@RequestMapping("/deleteAuth")
	@ResponseBody
	public JSONObject deleteAuth(HttpServletRequest request) {
		JSONObject json = new JSONObject();
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		String authID = request.getParameter("authId");
		String authState = request.getParameter("authState");
		hashMap.put("authState", authState);
		int authId = 0;
		if (StringUtils.isNotBlank(authID)) {
			authId = Integer.parseInt(authID);
			
			hashMap.put("authId", authId);
			int count = authService.selectAuthByPId(authId);
			if(count > 0){
				json.put("num", 0);
			}else{
				authService.deleteAuth(hashMap);
				json.put("num", 1);
			}
		}else{
			json.put("num", -1);
		}
		
		return json;
	}
	@RequestMapping("/restartAuth")
	@ResponseBody
	public JSONObject restartAuth(HttpServletRequest request){
		JSONObject json = new JSONObject();
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		String authID = request.getParameter("authId");
		String authState = request.getParameter("authState");
		hashMap.put("authState", authState);
		int authId = 0;
		if (StringUtils.isNotBlank(authID)) {
			authId = Integer.parseInt(authID);
			hashMap.put("authId", authId);
				authService.deleteAuth(hashMap);
				json.put("num", 1);
		}else{
			
			json.put("num", -1);
		}
		
		return json;
	}
	/**
	 * 修改权限
	 * 
	 * @author Administrator
	 * @date 2017年11月23日 下午5:53:57
	 * @version 1.0
	 */
	@RequestMapping("/updateAuth")
	@ResponseBody
	public JSONObject updateAuth(HttpServletRequest request, Auth auth) {
		JSONObject json = new JSONObject();
		// 获取修改人id
		User user = (User) request.getSession().getAttribute("user");
		int updateBy = user.getUserId();
		auth.setUpdateBy(updateBy);

		int num = authService.updateAuth(auth);
		json.put("num", num);

		return json;
	}

	/**
	 * 根据id查权限
	 * 
	 * @author Administrator
	 * @date 2017年11月24日 上午11:43:28
	 * @version 1.0
	 */
	@RequestMapping("/queryAuthById")
	@ResponseBody
	public JSONObject queryAuthById(HttpServletRequest request) {
		JSONObject json = new JSONObject();
		String authIdString = request.getParameter("authId");
		int authId = 0;
		if (StringUtils.isNotBlank(authIdString)) {
			authId = Integer.parseInt(authIdString);
			Auth auth = authService.findAuthById(authId);
			if (auth != null) {
				json.put("authName", auth.getAuthName());
				json.put("authDesc", auth.getAuthDesc());
				json.put("authOrder", auth.getAuthOrder());
				json.put("authUrl", auth.getAuthUrl());
				json.put("authCode", auth.getAuthCode());
				json.put("authType", auth.getAuthType());
				json.put("num", "1");
			}
		} else {
			json.put("num", "0");
		}
		return json;
	}

}
