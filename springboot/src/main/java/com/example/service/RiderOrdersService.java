package com.example.service;

import com.example.entity.RiderOrders;
import com.example.mapper.RiderOrdersMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RiderOrdersService {

    @Resource
    private RiderOrdersMapper riderOrdersMapper;

    public void add(RiderOrders riderOrders) {
        riderOrdersMapper.insert(riderOrders);
    }

    public void deleteById(Integer id) {
        riderOrdersMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            riderOrdersMapper.deleteById(id);
        }
    }

    public void updateById(RiderOrders riderOrders) {
        riderOrdersMapper.updateById(riderOrders);
    }

    public RiderOrders selectById(Integer id) {
        return riderOrdersMapper.selectById(id);
    }

    public List<RiderOrders> selectAll(RiderOrders riderOrders) {
        return riderOrdersMapper.selectAll(riderOrders);
    }

    public PageInfo<RiderOrders> selectPage(RiderOrders riderOrders, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<RiderOrders> list = riderOrdersMapper.selectAll(riderOrders);
        return PageInfo.of(list);
    }
}
