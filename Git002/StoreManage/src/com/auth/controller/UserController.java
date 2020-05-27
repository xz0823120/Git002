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

import com.auth.entity.Auth;
import com.auth.entity.Role;
import com.auth.entity.Store;
import com.auth.entity.User;
import com.auth.service.AuthService;
import com.auth.service.MessageService;
import com.auth.service.RoleService;
import com.auth.service.StoreService;
import com.auth.service.UserService;
import com.auth.util.MD5;
import com.auth.util.Page;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private AuthService authService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private StoreService storeService;
	@Autowired
	private MessageService messageService;
	/**
	 * 登录跳转方法
	 * 
	 * @param req
	 * @return
	 * 
	 */
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request) {
		String error = null;
		// 跳转到登录页面
		ModelAndView mav = new ModelAndView("login");
		mav.addObject("error", error);
		return mav;
	}

	/**
	 * ajax验证码的验证方法
	 * 
	 * @param req
	 * @return
	 */
	@RequestMapping("/validCode")
	@ResponseBody
	public JSONObject validCode(HttpServletRequest request, User user) {
		String rand = (String) request.getSession().getAttribute("rand01");
		String vCode = request.getParameter("vCode");
		// String userName=request.getParameter("userName");
		// User user=userService.getUserByUserName(userName);
		// 定义json对象
		JSONObject json = new JSONObject();
		if (vCode != null && vCode.equals(rand)) {
			json.put("msg", "1");
		} else {
			json.put("msg", "0");
		}
		return json;
	}

	/**
	 * 验证用户名和密码
	 * 
	 * @author Administrator
	 * @date 2017年11月16日 下午5:15:25
	 * @version 1.0
	 */
	@RequestMapping("/testPwd")
	@ResponseBody
	public JSONObject validCode2(HttpServletRequest request, User user) {
		// 获取session中存储的验证码
		String rand = (String) request.getSession().getAttribute("rand01");
		String vCode = request.getParameter("vCode");
		String userCode = request.getParameter("user_code");
		String userPwd = request.getParameter("user_pwd");
		// 定义json对象
		JSONObject json = new JSONObject();
		user = userService.findUserByName(userCode);
		// 校验验证码是否正确
		if (vCode != null && vCode.equals(rand)) {
			if (null != user.getUserPwd()) {
				// 密码判断
				String password = MD5.createPassword(userPwd);
				if (user.getUserState().equals("1")) {
					if (password.equals(user.getUserPwd())) {
						json.put("pwd", "1");// 用户名、密码正确
						request.getSession().setAttribute("user", user);
						List<Auth> firstList = authService.findFirstAuth(request,user);
						request.getSession().setAttribute("firstList",
								firstList);
					} else {
						json.put("pwd", "0");// 用户名或密码不正确
					}
				} else {
					// 用户未审核
					json.put("pwd", "-1");
				}
			}
		}
		return json;
	}

	/**
	 * 用户退出
	 * 
	 * @author Administrator
	 * @date 2017年11月16日 下午5:16:09
	 * @version 1.0
	 */
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request) {
		request.getSession().invalidate();
		List<Store> storeList = storeService.chooseStore();
		request.getSession().setAttribute("storeList",storeList);
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}

	/**
	 * 欢迎页面
	 * 
	 * @author Administrator
	 * @date 2017年11月16日 下午5:16:32
	 * @version 1.0
	 */
	@RequestMapping("/welcome")
	public ModelAndView welcome(HttpServletRequest request) {
		//查询我的站内信未读条数
		//拿到当前登录的用户id
		User users = (User) request.getSession().getAttribute("user");
		int toUser = users.getUserId();
		System.out.println("用户id="+toUser);
		//进行查询
		int MyMessageCount = messageService.selectMyMessageCount(toUser);
		//System.out.println("条数="+MyMessageCount);
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("MyMessageCount", MyMessageCount);
		return mav;
	}
	/**
	 * 导出数据
	*@author Administrator
	*@date 2017年11月24日 下午6:23:01
	*@version 1.0
	 */
	@RequestMapping("/exportTable")
	public ModelAndView exportTable(HttpServletRequest request,Page page,User user){
		ModelAndView mav = new ModelAndView("user-list-download"); 
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("Page", page);
		hashMap.put("user", user);
		List<User> userList = userService.selectUserPage(hashMap);
		mav.addObject("users", userList);
		return mav;
	}
	/**
	 * 添加用户
	 * 
	 * @author Administrator
	 * @date 2017年11月17日 下午2:05:21
	 * @version 1.0
	 */
	@RequestMapping("/addUser")
	@ResponseBody
	public JSONObject addUser(HttpServletRequest request, User user) {
		// 获取用户名
		String userCode = user.getUserCode();
		// 获取创建人id
		User user2 = (User) request.getSession().getAttribute("user");
		int userId = user2.getUserId();
		// 将查到的用户id设置到创建人属性中
		user.setCreateBy(userId);
		// 通过用户名查找用户，判断是否存在
		User user1 = userService.findUserByName(userCode);
		JSONObject json = new JSONObject();
		if (user1 != null) {
			// 用户已存在
			json.put("insert", 0);
		} else {
			userService.addUser(user);
			json.put("insert", 1);
		}
		return json;
	}

	/**
	 * 删除用户
	 * 
	 * @author Administrator
	 * @date 2017年11月17日 下午2:05:46
	 * @version 1.0
	 */
	@RequestMapping("/deleteUser")
	@ResponseBody
	public JSONObject deleteById(int userId) {
		int num = userService.deleteUser(userId);
		JSONObject json = new JSONObject();
		json.put("delete", num);
		return json;
	}

	/**
	 * 修改用户信息
	 * 
	 * @author Administrator
	 * @date 2017年11月17日 下午2:05:57
	 * @version 1.0
	 */
	@RequestMapping("/updateUser")
	@ResponseBody
	public JSONObject updateUser(HttpServletRequest request, User user) {
		User user1 = (User) request.getSession().getAttribute("user");
		int updateBy = user1.getUserId();
		user.setUpdateBy(updateBy);
		int num = userService.updateUser(user);
		JSONObject json = new JSONObject();
		json.put("updateUser", num);
		return json;
	}

	/**
	 * 重置密码
	 * 
	 * @author Administrator
	 * @date 2017年11月17日 下午2:42:16
	 * @version 1.0
	 */
	@RequestMapping("/updatePwd")
	@ResponseBody
	public JSONObject updatePwd(int userId) {
		int num = userService.updatePwd(userId);
		JSONObject json = new JSONObject();
		json.put("updatePwd", num);
		return json;
	}

	/**
	 * 修改用户状态
	 * 
	 * @author Administrator
	 * @date 2017年11月17日 下午2:51:41
	 * @version 1.0
	 */
	@RequestMapping("/updateState")
	@ResponseBody
	public JSONObject updateState(User user) {
		int num = userService.updateState(user);
		JSONObject json = new JSONObject();
		json.put("updateState", num);
		return json;
	}

	/**
	 * 分页查询
	 * 
	 * @author Administrator
	 * @date 2017年11月17日 下午6:10:38
	 * @version 1.0
	 */
	@RequestMapping("/list")
	public ModelAndView UserPageList(HttpServletRequest request, User user) {

		ModelAndView mov = new ModelAndView("user-list");
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
		// 根据前端的查询条件查询结果
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("user", user);
		// 获取总条数
		int totalNum = userService.selectCount(hashmap);
		Page page = new Page(totalNum, currNo);
		// url
		String urlString = "user/list.action";
		StringBuffer sb = new StringBuffer();
		// 将搜索框中的值储存在StringBuffer中
		if (StringUtils.isNotBlank(user.getUserCode())) {
			sb.append("&userCode=").append(user.getUserCode());
		}
		if (StringUtils.isNotBlank(user.getUserType())) {
			sb.append("&userType=").append(user.getUserType());
		}
		if (StringUtils.isNotBlank(user.getUserState())) {
			sb.append("&userState=").append(user.getUserState());
		}
		String params = sb.toString();
		page.setUrlString(urlString);
		page.setParams(params);
		hashmap.put("Page", page);
		// 根据条件查询
		List<User> resultList = userService.selectUserPage(hashmap);
		mov.addObject("users", resultList);
		mov.addObject("Page", page);
		// 获取角色信息
		List<Role> roleList = roleService.queryRole();
		mov.addObject("roleList", roleList);
		return mov;
	}

	/**
	 * 分配角色
	 * 
	 * @author Administrator
	 * @date 2017年11月22日 下午3:07:04
	 * @version 1.0
	 */
	@RequestMapping("/assignRole")
	@ResponseBody
	public JSONObject userRole(HttpServletRequest request) {
		JSONObject json = new JSONObject();
		// 从前台获取参数
		String userId = request.getParameter("userId");
		String roleId = request.getParameter("roleId");
		// 将字符串分割
		String[] roleIdArray = roleId.split(",");
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("userId", userId);
		// 先清空已有角色
		userService.deleteRole(Integer.parseInt(userId));
		int num = 0;
		for (int i = 0; i < roleIdArray.length; i++) {
			hashMap.put("roleId", roleIdArray[i]);
			num += userService.assignRoles(hashMap);
		}
		if (num == roleIdArray.length) {
			json.put("assign", "1");
		} else {
			json.put("assign", "0");
		}
		return json;
	}

	@RequestMapping("/findRole")
	@ResponseBody
	public JSONObject findRole(HttpServletRequest request) {
		// 获取用户id
		String userid = request.getParameter("userId");
		// 判断非空
		int userId = 0;
		if (StringUtils.isNotBlank(userid)) {
			userId = Integer.parseInt(userid);
		}
		// 通过用户id查询已有角色id
		String roleid = roleService.userRole(userId);
		JSONObject json = new JSONObject();
		json.put("RoleID", roleid);
		return json;
	}
	/**
	 * 回显
	*@author Administrator
	*@date 2017年11月27日 下午3:08:42
	*@version 1.0
	 */
	@RequestMapping("/updateAuth")
	public ModelAndView updateAuth(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("user-updateAuth");
		try {
			//获取用户id
			String userID = request.getParameter("userId");
			String userCode = request .getParameter("userCode");
			int userId = 0;
			//非空验证
			if(StringUtils.isNotBlank(userID)){
				userId = Integer.parseInt(userID);
			}
			//数据回显
			userService.zTree(request, userId);
			mav.addObject("userId",userId);
			request.getSession().setAttribute("userCode", userCode);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return mav;
	}
	/**
	 * 修改权限
	*@author Administrator
	*@date 2017年11月27日 下午3:36:53
	*@version 1.0
	 */
	@RequestMapping("/grantAuth")
	public String grantAuth(HttpServletRequest request){
		try {
			HashMap<String , Object> hashMap = new HashMap<String, Object>();
			//获取用户id
			String userID = request.getParameter("userId");
			int userId = 0;
			//非空验证
			if(StringUtils.isNotBlank(userID)){
				userId = Integer.parseInt(userID);
			}
			//根据id删除原有权限
			userService.deleteAuthById(userId);
			hashMap.put("userId", userId);
			//获取复选框选中的权限id
			String authID = request.getParameter("authId");
			String[] authIds = null;
			//非空验证
			if(StringUtils.isNotBlank(authID)){
				authIds = authID.split(",");
			}
			for (String authId : authIds) {
				hashMap.put("authId", authId);
				//修改权限
				userService.insertAuthById(hashMap);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "forward:/user/list.action";
	}
}
