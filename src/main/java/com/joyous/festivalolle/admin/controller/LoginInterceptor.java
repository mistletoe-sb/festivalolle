package com.joyous.festivalolle.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.joyous.festivalolle.admin.model.AdminVO;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		try {
			
			/*
			HttpSession session = request.getSession();
			String contextName = request.getContextPath();
			String url = request.getRequestURI().replaceFirst(contextName, "");
			
			String param = request.getQueryString();
			
			if(!url.contains("/admin") && !url.contains("/admin/logout")) {
				session.setAttribute("url", url);
				session.setAttribute("param", param);
			} else {
				
			}*/
			
			
			
			
			//String admin= (String) request.getSession().getAttribute("loginUser");
			AdminVO admin = (AdminVO) request.getSession().getAttribute("loginAdmin");
			//int status = adminVO.getStatus();
			
			if(admin == null || admin.equals("")){
				response.sendRedirect(request.getContextPath()+"/admin/login");
				return false;
			} 
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
		
		
		
		
		
		
		
		//try {
		//	String email= (String) request.getSession().getAttribute("email");
		//	if(email == null || email.equals("")){
		//		response.sendRedirect(request.getContextPath()+"/member/login");
		//		return false;
		//	}
		//} catch (Exception e) {
		//	e.printStackTrace();
		//}
		//return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
	}

}