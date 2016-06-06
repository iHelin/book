package com.ihelin.book.db.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.ihelin.book.db.entity.OrderPayGroup;

public interface OrderPayGroupMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderPayGroup record);

    int insertSelective(OrderPayGroup record);

    OrderPayGroup selectByPrimaryKey(Integer id);
    
    List<OrderPayGroup> selectByCondition(Map<String, Object> param, RowBounds rowBounds);
    
    int listOpgCount(Map<String, Object> param);

    int updateByPrimaryKeySelective(OrderPayGroup record);

    int updateByPrimaryKey(OrderPayGroup record);
    
}