package com.example.mapper;

import com.example.entity.Rider;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface RiderMapper {

    /**
     * 新增
     */
    int insert(Rider rider);

    /**
     * 删除
     */
    int deleteById(Long id);

    /**
     * 修改
     */
    int updateById(Rider rider);

    /**
     * 根据ID查询
     */
    Rider selectById(Long id);

    /**
     * 查询所有
     */
    List<Rider> selectAll(Rider rider);

    @Select("SELECT * FROM riders WHERE rider_account = #{riderAccount}")
    Rider selectByRiderAccount(@Param("riderAccount") String riderAccount);

    @Select("SELECT * FROM riders WHERE rider_account = #{account} AND rider_password = #{password}")
    Rider selectByAccountAndPassword(@Param("account") String account, @Param("password") String password);
}
