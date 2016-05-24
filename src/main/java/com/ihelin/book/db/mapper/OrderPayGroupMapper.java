package com.ihelin.book.db.mapper;

import com.ihelin.book.db.entity.OrderPayGroup;

public interface OrderPayGroupMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderPayGroup record);

    int insertSelective(OrderPayGroup record);

    OrderPayGroup selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderPayGroup record);

    int updateByPrimaryKey(OrderPayGroup record);
}