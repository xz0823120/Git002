/**
 * @filename AuthFilter.java
 * @author Administrator
 * @date 2017年11月28日 下午1:48:47
 * @version 1.0
 * Copyright (C) 2017 
 */
package com.auth.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.auth.entity.User;

public class AuthFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest)req;
		User user = (User) request.getSession().getAttribute("user");
		String uri = request.getRequestURI();
		if(uri.endsWith(".action") && user == null 
				&& !uri.endsWith("login.action") && !uri.endsWith("validCode.action")){
			//没有登录
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().println("<script>alert('请登录！');location.href='"+request.getContextPath()+"/user/login.action';</script>");
			return;
		}else{
			//判断有没有权限
			if(uri.endsWith(".action") && !uri.endsWith("login.action") &&
					!uri.endsWith("validCode.action")){
				//获取当前用户拥有的权限
				String authUrls=request.getSession().getAttribute("authUrls")+"";
	    		if(!(authUrls.indexOf(uri)!=-1)){
	    			//没有权限
	    			response.setContentType("text/html; charset=UTF-8");
	    			response.getWriter().println("<script>alert('请登录！');location.href='"+request.getContextPath()+"/user/login.action';</script>");
	    			return;
	    		}
			}
		}
		chain.doFilter(req, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
