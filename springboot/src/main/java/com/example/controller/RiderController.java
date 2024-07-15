package com.example.controller;

import cn.hutool.core.util.ObjectUtil;
import com.example.common.Result;
import com.example.common.enums.ResultCodeEnum;
import com.example.entity.Rider;
import com.example.service.RiderService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;

/**
 * 骑手表前端操作接口
 **/
@RestController
@RequestMapping("/riders")
public class RiderController {

    @Resource
    private RiderService riderService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody Rider rider) {
        // 数据校验
        if (ObjectUtil.isEmpty(rider.getRiderAccount()) || ObjectUtil.isEmpty(rider.getRiderPassword())) {
            return Result.error(ResultCodeEnum.PARAM_LOST_ERROR);
        }
        riderService.add(rider);
        return Result.success();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete/{id}")
    public Result deleteById(@PathVariable Long id) {
        riderService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result deleteBatch(@RequestBody List<Long> ids) {
        riderService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result updateById(@RequestBody Rider rider) {
        riderService.updateById(rider);
        return Result.success();
    }

    /**
     * 根据ID查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Long id) {
        Rider rider = riderService.selectById(id);
        return Result.success(rider);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(Rider rider ) {
        List<Rider> list = riderService.selectAll(rider);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(Rider rider,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Rider> page = riderService.selectPage(rider, pageNum, pageSize);
        return Result.success(page);
    }
}