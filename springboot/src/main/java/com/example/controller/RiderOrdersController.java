package com.example.controller;

import cn.hutool.core.util.ObjectUtil;
import com.example.common.Result;
import com.example.common.enums.ResultCodeEnum;
import com.example.entity.RiderOrders;
import com.example.service.RiderOrdersService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/riderOrders")
public class RiderOrdersController {

    @Resource
    private RiderOrdersService riderOrdersService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody RiderOrders riderOrders) {
        if (ObjectUtil.isEmpty(riderOrders.getRiderId()) || ObjectUtil.isEmpty(riderOrders.getOrderId())) {
            return Result.error(ResultCodeEnum.PARAM_LOST_ERROR);
        }
        riderOrdersService.add(riderOrders);
        return Result.success();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete/{id}")
    public Result deleteById(@PathVariable Integer id) {
        riderOrdersService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        riderOrdersService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result updateById(@RequestBody RiderOrders riderOrders) {
        riderOrdersService.updateById(riderOrders);
        return Result.success();
    }

    /**
     * 根据ID查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        RiderOrders riderOrders = riderOrdersService.selectById(id);
        return Result.success(riderOrders);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(RiderOrders riderOrders) {
        List<RiderOrders> list = riderOrdersService.selectAll(riderOrders);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(RiderOrders riderOrders,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<RiderOrders> page = riderOrdersService.selectPage(riderOrders, pageNum, pageSize);
        return Result.success(page);
    }

}
