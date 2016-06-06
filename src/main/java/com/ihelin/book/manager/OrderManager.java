package com.ihelin.book.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.ihelin.book.db.entity.OrderItem;
import com.ihelin.book.db.entity.OrderPayGroup;
import com.ihelin.book.db.mapper.OrderItemMapper;
import com.ihelin.book.db.mapper.OrderPayGroupMapper;
import com.ihelin.book.utils.JSON;

@Service
public class OrderManager {
	@Resource
	private OrderPayGroupMapper opgMapper;
	@Resource
	private OrderItemMapper orderItemMapper;

	public int insertOrderItem(OrderItem record) {
		return orderItemMapper.insert(record);
	}
	
	public int deleteOrderDetailById(Integer id){
		return orderItemMapper.deleteByPrimaryKey(id);
	}
	
	public OrderItem selectOrderItemById(Integer id){
		return orderItemMapper.selectByPrimaryKey(id);
	}

	public int insertOrderPayGroup(OrderPayGroup record) {
		return opgMapper.insert(record);
	}

	public int insertOrderSelective(OrderPayGroup record) {
		return opgMapper.insertSelective(record);
	}
	
	public int deleteOrderById(Integer id){
		OrderPayGroup opg = seleteOrderPayGroupById(id);
		String oids = opg.getOrderIds();
		List<Integer> oidList = JSON.parseArray(oids, Integer.class);
		for (Integer oid : oidList) {
			deleteOrderDetailById(oid);
		}
		return opgMapper.deleteByPrimaryKey(id);
	}
	
	public OrderPayGroup seleteOrderPayGroupById(Integer id){
		return opgMapper.selectByPrimaryKey(id);
	}
	
	public int updateOrderPayGroup(OrderPayGroup orderPayGroup){
		return opgMapper.updateByPrimaryKey(orderPayGroup);
	}

	public List<OrderPayGroup> selectOpgByCondition(Integer creatorId,Integer status,int offset, int size) {
		Map<String, Object> param = new HashMap<String, Object>();
		if (creatorId != null) {
			param.put("creatorId", creatorId);
		}
		if (status != null) {
			param.put("status", status);
		}
		return opgMapper.selectByCondition(param,new RowBounds(offset, size));
	}
	
	public int listOpgCount(Integer creatorId,Integer status) {
		Map<String, Object> param = new HashMap<String, Object>();
		if (creatorId != null) {
			param.put("creatorId", creatorId);
		}
		if (status != null) {
			param.put("status", status);
		}
		return opgMapper.listOpgCount(param);
	}

}
