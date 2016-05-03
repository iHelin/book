package com.ihelin.book.config;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContextRootListener implements ServletContextListener {

	public void contextDestroyed(final ServletContextEvent event) {
		// Do nothing
	}

	public void contextInitialized(ServletContextEvent event) {
		ServletContext context = event.getServletContext();
		CommonConfig.init(context.getRealPath("/"), context.getContextPath());
	}
}