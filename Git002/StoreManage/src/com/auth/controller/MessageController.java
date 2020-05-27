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

import com.auth.entity.Message;
import com.auth.entity.User;
import com.auth.service.MessageService;
import com.auth.service.UserService;
import com.auth.util.Page;

@Controller
@RequestMapping("/message")
public class MessageController {

	@Autowired
	private MessageService messageService;
	@Autowired
	private UserService userService;

	/*
	 * 添加站内信
	 */
	@RequestMapping("/addMessage")
	@ResponseBody
	public JSONObject addMessage(Message message, HttpServletRequest request) {
		JSONObject json = new JSONObject();
		HashMap<Object, Object> hm = new HashMap<Object, Object>();
		int num = messageService.addMessage(message);
		if (num > 0) {
			json.put("num", 1);// 成功
			// 查询最大id，并且给关联表插入数据
			int maxId = messageService.selectMaxId();
			System.out.println("关联表插入数据的id="+maxId);
			hm.put("msgId", maxId);
			// 获取站内信接受者的id字符串数组
			String[] userIdStr = (String[]) request.getSession().getAttribute(
					"useridstr");
			// 获取session中保存的用户信息，拿到id，可以表示from_id
			User user = (User) request.getSession().getAttribute("user");
			int userId = user.getUserId();
			hm.put("fromUser", userId);
			// 遍历id数组，进行关联表数据插入
			for (int i = 0; i < userIdStr.length; i++) {
				int toUser = Integer.parseInt(userIdStr[i]);
				hm.put("userId", toUser);
				hm.put("toUser", toUser);
				int userMessageNum = messageService.insertUserMessage(hm);
			}
		}
		return json;
	}

	/*
	 * 查询站内信
	 */
	@RequestMapping("/selectMessage")
	public ModelAndView selectMessage(HashMap<Object, Object> hm, Page page,
			Message message, HttpServletRequest request) {
		// 将页面传过来的查询信息放进集合中
		hm.put("message", message);
		// 查询总条数
		int messageCount = messageService.selectMessageCount(hm);
		// 获取当前页，进行判断
		String pageNo = request.getParameter("currNo");
		int currNo = 1;
		if (pageNo != null && pageNo != "") {
			currNo = Integer.parseInt(pageNo);
		}
		// 定义StringBuffer
		StringBuffer sb = new StringBuffer();
		// 请求地址
		String urlString = "message/selectMessage.action";
		// 请求参数
		String msgTitle = message.getMsgTitle();
		if (StringUtils.isNotBlank(msgTitle)) {
			sb.append("&msgTitle=").append(msgTitle);
		}
		String createTime = message.getcreateTime();
		if (StringUtils.isNotBlank(createTime)) {
			sb.append("&createTime=").append(createTime);
		}
		// 进行站内信查询
		hm.put("page", page);
		List<Message> messageList = messageService.selectMessage(hm);
		page.setResultList(messageList);
		// 封装参数
		Page pages = new Page(messageCount, page.getCurrNo());
		pages.setUrlString(urlString);
		pages.setParams(sb.toString());
		ModelAndView mav = new ModelAndView("message");
		mav.addObject("Page", pages);
		mav.addObject("messageList", messageList);
		System.out.println("站内信总条数-----=" + pages.getTotalNum());
		return mav;
	};

	/*
	 * 查询用户
	 */
	@RequestMapping("/idandnamecode")
	public ModelAndView tiao(HttpServletRequest request) {
		// 接受用户页面传过来的id,name字符串
		String uidstr = request.getParameter("ids");
		String namestr = request.getParameter("names");
		String useridstr = uidstr.substring(5, uidstr.length());
		String usernamestr = namestr.substring(5, namestr.length());
		String[] userIdStr = useridstr.split(",");
		request.getSession().setAttribute("useridstr", userIdStr);
		String[] nameCodeStr = usernamestr.split(",");
		ModelAndView mav = new ModelAndView("message");
		mav.addObject("nameCodeStr", nameCodeStr);
		return mav;
	}

	/*
	 * 跳转页面
	 */
	@RequestMapping("/mes-list")
	@ResponseBody
	public ModelAndView jump() {
		ModelAndView mav = new ModelAndView("user-list");
		return mav;
	}

	/*
	 * 查询关联表数据
	 */
	@RequestMapping("/selectUserMessage")
	public ModelAndView selectUserMessage(HttpServletRequest request,
			HashMap<Object, Object> hm, Page page, Message message) {
		// 获取保存在session中的用户信息，拿到用户id
		User user = (User) request.getSession().getAttribute("user");
		int userId = user.getUserId();
		hm.put("userId", userId);
		hm.put("message", message);
		int totalNum = messageService.selectMyCount(hm);// 拿到总条数
		// 获取当前页，进行判断
		String pageNo = request.getParameter("currNo");
		int currNo = 1;
		if (pageNo != null && pageNo != "") {
			currNo = Integer.parseInt(pageNo);
		}
		hm.put("page", page);
		// 定义StringBuffer
		StringBuffer sb = new StringBuffer();
		// 请求地址
		String urlString = "message/selectUserMessage.action";
		// 请求参数
		String createTime = message.getcreateTime()+"";
		System.out.println("拿到了时间+"+createTime);
		if (StringUtils.isNotBlank(createTime)) {
			sb.append("&createTime=").append(createTime);
		}
		String userName = message.getUserName();
		if (StringUtils.isNotBlank(userName)) {
			sb.append("&userName=").append(userName);
		}
		String state = message.getState();
		if (StringUtils.isNotBlank(state)) {
			sb.append("&state=").append(state);
		}
		String msgTitle = message.getMsgTitle();
		if (StringUtils.isNotBlank(msgTitle)) {
			sb.append("&msgTitle=").append(msgTitle);
		}
		System.out.println("时间" + createTime);
		System.out.println("发送者" + userName);
		System.out.println("状态" + state);
		System.out.println("标题" + msgTitle);
		// 进行站内信查询
		hm.put("toUser", userId);
		List<Message> userMessageList = messageService.selectUserMessage(hm);
		// 封装参数
		Page pages = new Page(totalNum, page.getCurrNo());
		pages.setUrlString(urlString);
		pages.setParams(sb.toString());
		ModelAndView mav = new ModelAndView("MyMessage");
		mav.addObject("userMessageList", userMessageList);
		mav.addObject("userId", userId);
		mav.addObject("Page", pages);
		return mav;
	}

	/*
	 * 修改我的站内信状态
	 */
	@RequestMapping("/updateState")
	@ResponseBody
	public JSONObject updateState(Message message, HttpServletRequest request) {
		JSONObject json = new JSONObject();
		int num = messageService.updateState(message);
		System.out.println("------------=" + num);
		if (num == 1) {
			json.put("num", num);
		}
		return json;
	}
}
