package com.ihelin.book.utils;

import java.util.List;

import com.fasterxml.jackson.databind.JavaType;


public class JSON {

	private static JsonMapper mapper = new JsonMapper();
	
	public static String toJson(Object object) {
		return mapper.toJson(object);
	}

	public static <T> T parseObject(String jsonString, Class<T> clazz) {
		return mapper.fromJson(jsonString, clazz);
	}
	
	public static <T> List<T> parseArray(String jsonString, Class<T> clazz) {
		JavaType jt = mapper.createCollectionType(List.class, clazz);
		return mapper.fromJson(jsonString, jt);
	}
}
