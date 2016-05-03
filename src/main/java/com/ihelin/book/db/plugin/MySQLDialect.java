/*
 * Copyright (c) 2012 duowan.com.
 *
 * All Rights Reserved.
 *
 * This program is the confidential and proprietary information of
 * duowan. ("Confidential Information").  You shall not disclose such
 * Confidential Information and shall use it only in accordance with
 * the terms of the license agreement you entered into with duowan.com.
 */
package com.ihelin.book.db.plugin;

import org.apache.commons.lang3.StringUtils;

/**
 * @author hecong
 */
public class MySQLDialect extends Dialect {

	public boolean supportsLimitOffset() {
		return true;
	}

	public boolean supportsLimit() {
		return true;
	}

	public String getLimitString(String sql, int offset, String offsetPlaceholder, int limit, String limitPlaceholder) {
		String limitStr = StringUtils.EMPTY;
		if (StringUtils.isNotBlank(sql)) {
			limitStr = sql + DEF_SQL_LIMIT;
			if (offset > 0) {
				limitStr += offsetPlaceholder + DEF_SQL_LIMIT_CONNECTOR + limitPlaceholder;
			} else {
				limitStr += limitPlaceholder;
			}
		}
		return limitStr;
	}
}
