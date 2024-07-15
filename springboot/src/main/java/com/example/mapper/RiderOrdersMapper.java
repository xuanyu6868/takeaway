package com.example.mapper;

import com.example.entity.RiderOrders;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface RiderOrdersMapper {

    /**
     * 新增
     */
    int insert(RiderOrders riderOrders);

    /**
     * 删除
     */
    int deleteById(Integer id);

    /**
     * 修改
     */
    int updateById(RiderOrders riderOrders);

    /**
     * 根据ID查询
     */
    RiderOrders selectById(Integer id);

    /**
     * 查询所有
     */
    List<RiderOrders> selectAll(RiderOrders riderOrders);

    @Select("select * from rider_orders where rider_id = #{riderId}")
    List<RiderOrders> selectByRiderId(Integer riderId);
}
