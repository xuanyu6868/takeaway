package com.example.service;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import com.example.common.enums.ResultCodeEnum;
import com.example.entity.Rider;
import com.example.exception.CustomException;
import com.example.mapper.RiderMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.List;
import java.util.Objects;

/**
 * 骑手表业务处理
 **/
@Service
public class RiderService {

    @Value("${server.port:9090}")
    private String port;

    @Value("${ip:localhost}")
    private String ip;

    @Resource
    private RiderMapper riderMapper;

    /**
     * 新增
     */
    public void add(Rider rider) {
        Rider dbRider = riderMapper.selectByRiderAccount(rider.getRiderAccount());
        if (ObjectUtil.isNotNull(dbRider)) {
            throw new CustomException(ResultCodeEnum.USER_EXIST_ERROR);
        }
        if (ObjectUtil.isEmpty(rider.getRiderName())) {
            rider.setRiderName(rider.getRiderAccount());
        }
        String http = "http://" + ip + ":" + port + "/files/";
        rider.setAvatar(http + "default-avatar.png");
        riderMapper.insert(rider);
    }

    /**
     * 删除
     */
    public void deleteById(Long id) {
        riderMapper.deleteById(id);
    }

    /**
     * 批量删除
     */
    public void deleteBatch(List<Long> ids) {
        for (Long id : ids) {
            riderMapper.deleteById(id);
        }
    }

    /**
     * 修改
     */
    public void updateById(Rider rider) {
        Rider dbRider2 = riderMapper.selectByRiderAccount(rider.getRiderAccount());
        if (ObjectUtil.isNotEmpty(dbRider2) && !Objects.equals(dbRider2.getId(), rider.getId())) {
            throw new CustomException(ResultCodeEnum.USER_EXIST_ERROR);
        }
        riderMapper.updateById(rider);
    }

    /**
     * 根据ID查询
     */
    public Rider selectById(Long id) {
        return riderMapper.selectById(id);
    }

    /**
     * 查询所有
     */
    public List<Rider> selectAll(Rider rider) {
        return riderMapper.selectAll(rider);
    }

    /**
     * 分页查询
     */
    public PageInfo<Rider> selectPage(Rider rider, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Rider> list = riderMapper.selectAll(rider);
        return PageInfo.of(list);
    }

    /**
     * 骑手登录
     */
    public Rider login(String account, String password) {
        Rider dbRider = riderMapper.selectByAccountAndPassword(account, password);
        if (dbRider == null) {
            throw new CustomException(ResultCodeEnum.USER_NOT_EXIST_ERROR);
        }
        if (!Objects.equals(password, dbRider.getRiderPassword())) {
            throw new CustomException(ResultCodeEnum.USER_ACCOUNT_ERROR);
        }
        // 生成token
        String tokenData = dbRider.getId() + "-RIDER";
        String token = TokenUtils.createToken(tokenData, dbRider.getRiderPassword());
        dbRider.setToken(token);
        return dbRider;
    }

    /**
     * 骑手注册
     */
    public boolean register(Rider rider) {
        Rider existingRider = riderMapper.selectByRiderAccount(rider.getRiderAccount());
        if (existingRider != null) {
            return false;
        }
        this.add(rider);
        return true;
    }

    private Rider selectByRiderAccount(String riderAccount) {
        Rider rider = new Rider();
        rider.setRiderAccount(riderAccount);
        List<Rider> riderList = this.selectAll(rider);
        return CollUtil.isEmpty(riderList) ? null : riderList.get(0);
    }
}
