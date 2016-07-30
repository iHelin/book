package com.ihelin.book.config;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class CountLineListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		System.out.println("创建session......");
		ServletContext context = arg0.getSession().getServletContext();
		Integer count = (Integer) context.getAttribute("count");
		if (count == null) {
			count = 1;
		} else {
			count++;
		}
		context.setAttribute("count", count);// 保存人数
		System.out.println("在线人数：" + count);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		System.out.println("销毁session......");
		ServletContext context = arg0.getSession().getServletContext();
		Integer count = (Integer) context.getAttribute("count");
		context.setAttribute("count", count--);
		System.out.println("在线人数：" + count);
	}

}
