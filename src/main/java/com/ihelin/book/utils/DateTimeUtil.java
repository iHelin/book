package com.ihelin.book.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateTimeUtil {

	private static final String MONTH_FORMAT = "yyyy-MM";
	private static final String DATE_FORMAT = "yyyy-MM-dd";
	private static final String DATETIME_FORMAT = "yyyy-MM-dd HH:mm";
	private static final String DATESEC_FORMAT = "yyyy-MM-dd HH:mm:ss";
	
	public static Date parseMonth(String dateStr){
		if (dateStr == null || dateStr.length() <= 0) return null;
		try {
			return new SimpleDateFormat(MONTH_FORMAT).parse(dateStr);
		} catch (ParseException e) {
			return null;
		}
	}
	
	public static String formatMonth(Date date) {
		if (date == null) return null;
		return new SimpleDateFormat(MONTH_FORMAT).format(date);
	}
	
	public static Date parseDate(String dateStr)  {
		if (dateStr == null || dateStr.length() <= 0) return null;
		try {
			return new SimpleDateFormat(DATE_FORMAT).parse(dateStr);
		} catch (ParseException e) {
		}
		return null;
	}
	
	public static String formatDate(Date date) {
		if (date == null) return null;
		return new SimpleDateFormat(DATE_FORMAT).format(date);
	}
	
	public static Date parseMinute(String timeStr)  {
		if (timeStr == null || timeStr.length() <= 0) return null;
		try {
			return new SimpleDateFormat(DATETIME_FORMAT).parse(timeStr);
		} catch (ParseException e) {
		}
		return null;
	}
	
	public static String formatMinute(Date time) {
		if (time == null) return null;
		return new SimpleDateFormat(DATETIME_FORMAT).format(time);
	}
	
	public static Date parseSecond(String timeStr)  {
		if (timeStr == null || timeStr.length() <= 0) return null;
		try {
			return new SimpleDateFormat(DATESEC_FORMAT).parse(timeStr);
		} catch (ParseException e) {
		}
		return null;
		
	}
	
	public static String formatSecond(Date time) {
		if (time == null) return null;
		return new SimpleDateFormat(DATESEC_FORMAT).format(time);
	}
	
	/**
	 * 在某个日期的基础上增加num的天数，num可以为负数
	 * 
	 * @param date
	 * @param num
	 * @return
	 */
	public static Date addDay(Date date, int num) {
		if (date == null) return null;
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.DAY_OF_MONTH, num);
		return c.getTime();
	}
	
	/**
	 * 在某个日期的基础上增加num的月数，num可以为负数
	 * @param date
	 * @param num
	 * @return
	 */
	public static Date addMonth(Date date, int num) {
		if (date == null) return null;
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.MONTH, num);
		return c.getTime();
	}
	
	public static Date getDayStart(Date date) {
		if (date == null) return null;
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.SECOND, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.MILLISECOND, 0);
		return c.getTime();
	}
	
	public static Date getDayEnd(Date date) {
		if (date == null) return null;
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.HOUR_OF_DAY, 23);
		c.set(Calendar.SECOND, 59);
		c.set(Calendar.MINUTE, 59);
		c.set(Calendar.MILLISECOND, 999);
		return c.getTime();
	}
}
