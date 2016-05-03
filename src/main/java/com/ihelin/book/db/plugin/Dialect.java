package com.ihelin.book.db.plugin;

import org.apache.commons.lang3.StringUtils;

/**
 * @author hecong
 */
public abstract class Dialect {

	public static final String DEF_SQL_PLACEHOLDER = "?";

	protected static final String DEF_SQL_LIMIT = " limit ";

	protected static final String DEF_SQL_LIMIT_CONNECTOR = ",";

	public enum Type {

		MYSQL;

		public static Dialect getDialet(String dialectType) {
			if (StringUtils.isBlank(dialectType)) {
				throw new RuntimeException("The value of the dialect property of plugin in mybatis-config.xml is not defined!");
			}
			switch (valueOf(dialectType.trim().toUpperCase())) {
			case MYSQL:
				return new MySQLDialect();
			default:
				throw new RuntimeException("The dialect is not supported!");
			}
		}
	}

	public boolean supportsLimit() {
		return false;
	}

	public boolean supportsLimitOffset() {
		return supportsLimit();
	}

	/**
	 * getLimitString(sql, offset, Integer.toString(offset), limit, Integer.toString(limit))
	 * 
	 * @param sql
	 * @param offset
	 * @param limit
	 * @return
	 */
	public String getLimitString(String sql, int offset, int limit) {
		return getLimitString(sql, offset, Integer.toString(offset), limit, Integer.toString(limit));
	}

	/**
	 * select * from table limit offsetPlaceholder,limitPlaceholder
	 * 
	 * @param sql
	 * @param offset
	 * @param offsetPlaceholder
	 * @param limit
	 * @param limitPlaceholder
	 * @return
	 */
	public abstract String getLimitString(String sql, int offset, String offsetPlaceholder, int limit, String limitPlaceholder);

}
