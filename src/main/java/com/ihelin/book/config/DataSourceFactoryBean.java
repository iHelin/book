package com.ihelin.book.config;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.FactoryBean;

public class DataSourceFactoryBean implements FactoryBean<BasicDataSource>, DisposableBean {

	private static final int DBCP_INITIAL_SIZE = 5;
	private static final int DBCP_MAX_ACTIVE = 30;
	private static final int DBCP_MIN_IDLE = 5;
	private static final int DBCP_MAX_IDLE = 10;
	private static final int DBCP_MAX_WAIT = 20000;
	private static final int DBCP_TIME_BETWEEN_EVICTION_RUNS_MILLIS = 300000;
	private static final int DBCP_MIN_EVICTABLE_IDLE_TIME_MILLIS = 320000;
	private static final int DBCP_REMOVE_ABANDONED_TIMEOUT = 150;

	private BasicDataSource dataSource;

	@Override
	public BasicDataSource getObject() throws Exception {
		final String driver = "com.mysql.jdbc.Driver";

		dataSource = new BasicDataSource();
		dataSource.setDriverClassName(driver);
		String cfgUrl = CommonConfig.getDBUrl();
		if (cfgUrl != null && cfgUrl.contains("?"))
			cfgUrl += "&allowMultiQueries=true";
		else
			cfgUrl += "?allowMultiQueries=true";
		dataSource.setUrl(cfgUrl);
		dataSource.setUsername(CommonConfig.getDBUser());
		dataSource.setPassword(CommonConfig.getDBPwd());

		dataSource.setInitialSize(DBCP_INITIAL_SIZE);
		dataSource.setMaxActive(DBCP_MAX_ACTIVE);
		dataSource.setMinIdle(DBCP_MIN_IDLE);
		dataSource.setMaxIdle(DBCP_MAX_IDLE);
		dataSource.setMaxWait(DBCP_MAX_WAIT);
		dataSource.setPoolPreparedStatements(true);
		dataSource.setValidationQuery("select 1");
		dataSource.setTestOnBorrow(true);
		dataSource.setTestWhileIdle(true);
		dataSource.setTimeBetweenEvictionRunsMillis(DBCP_TIME_BETWEEN_EVICTION_RUNS_MILLIS);
		dataSource.setMinEvictableIdleTimeMillis(DBCP_MIN_EVICTABLE_IDLE_TIME_MILLIS);
		dataSource.setRemoveAbandoned(true);
		dataSource.setRemoveAbandonedTimeout(DBCP_REMOVE_ABANDONED_TIMEOUT);
		dataSource.setLogAbandoned(true);
		return dataSource;
	}

	@Override
	public Class<BasicDataSource> getObjectType() {
		return BasicDataSource.class;
	}

	@Override
	public boolean isSingleton() {
		return true;
	}

	@Override
	public void destroy() throws Exception {
		if (dataSource != null) {
			dataSource.close();
		}
	}

}