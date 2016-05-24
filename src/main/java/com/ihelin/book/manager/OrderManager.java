package com.ihelin.book.manager;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ihelin.book.db.entity.OrderItem;
import com.ihelin.book.db.entity.OrderPayGroup;
import com.ihelin.book.db.mapper.OrderItemMapper;
import com.ihelin.book.db.mapper.OrderPayGroupMapper;

@Service
public class OrderManager {
	@Resource
	private OrderPayGroupMapper opgMapper;
	@Resource
	private OrderItemMapper orderItemMapper;
	
	public int insertOrderItem(OrderItem record){
		return orderItemMapper.insert(record);
	}
	
	public int insertOrderPayGroup(OrderPayGroup record){
		return opgMapper.insert(record);
	}
	
	public int insertOrderSelective(OrderPayGroup record){
		return opgMapper.insertSelective(record);
	}

}
