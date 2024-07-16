<template>
  <view class="container">
    <view class="card">
      <view class="card-title">实时订单</view>
    </view>
    <view class="order-list">
      <view class="box" v-for="item in ordersList" :key="item.id" style="margin-bottom: 10rpx;">
        <view style="display: flex; align-items: baseline; margin-bottom: 10rpx;">
          <navigator :url="'/pages/detail/detail?businessId=' + item.businessId"
                     style="flex: 1; font-size: 32rpx; ">{{ item.businessName }}
            <uni-icons type="right" size="16" color="#666"
                       style="position: relative; top: 2rpx;"></uni-icons>
          </navigator>
          <view style="font-size: 24rpx; color: #666;">{{ item.status }}</view>
        </view>
        <view style="display: flex; align-items: center; grid-gap: 20rpx; margin-bottom: 10rpx;"  @click="goOrdersItem(item.id)">
          <view>
            <image style="display: block; width: 160rpx; height: 160rpx; border-radius: 10rpx;"
                   :src="item.cover"></image>
          </view>
          <view style="flex: 1;">{{ item.name }}</view>
          <view>实付￥<text style="font-size: 36rpx; font-weight: bold; color: red;">{{ item.actual }}</text>
          </view>
        </view>
        <view style="display: flex; min-height: 40rpx;">
          <view style="flex: 1;">
            <view v-if="item.status === '已取消' || item.status === '已完成' || item.status === '已退款'"
                  @click="del(item.id)">
              <uni-icons type="trash" size="16" color="#666"
                         style="position: relative; top: 2rpx;"></uni-icons>
              <text style="font-size: 24rpx; color: #666;">删除</text>
            </view>
          </view>
          <view style="flex: 1; text-align: right;">
            <uni-tag v-if="item.status === '待取货'" text="确认取货" size="mini" type="primary"
                     @click="changeStatus(item, '配送中')"></uni-tag>
            <uni-tag v-if="item.status === '配送中'" text="确认送达" size="mini" type="warning"
                     @click="changeStatus(item, '已完成')"></uni-tag>
          </view>
        </view>
      </view>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {
      current: 0,
      items: ['全部', '待取货', '配送中', '已完成'],
      ordersList: [],
      rider: uni.getStorageSync('xm-user')
    }
  },
  onShow() {
    this.loadOrders()
  },
  methods: {
    goOrdersItem(orderId) {
      uni.navigateTo({
        url: '/pages/riderOrderItem/riderOrderItem?orderId=' + orderId
      })
    },
    del(orderId) {
      this.$request.del('/riderOrders/delete/' + orderId).then(res => {
        if (res.code === '200') {
          uni.showToast({
            icon: "success",
            title: '操作成功'
          })
          this.loadOrders()
        } else {
          uni.showToast({
            icon: "error",
            title: res.msg
          })
        }
      })
    },
    changeStatus(orders, status) {
      let form = JSON.parse(JSON.stringify(orders))
      form.status = status
      this.$request.put('/riderOrders/update', form).then(res => {
        if (res.code === '200') {
          uni.showToast({
            icon: "success",
            title: '操作成功'
          })
          this.loadOrders()
        } else {
          uni.showToast({
            icon: "error",
            title: res.msg
          })
        }
      })
    },
    loadOrders() {
      let status = '全部'
      switch (this.current) {
        case 0:
          status = '全部';
          break
        case 1:
          status = '待取货';
          break
        case 2:
          status = '配送中';
          break
        case 3:
          status = '已完成';
          break
      }
      this.$request.get('/riderOrders/selectAll', {
        riderId: this.rider.id,
        status: status
      }).then(res => {
        this.ordersList = res.data || []
      })
    },
    onClickItem(e) {
      if (this.current != e.currentIndex) {
        this.current = e.currentIndex;
        this.loadOrders()
      }
    }
  }
}
</script>

<style scoped>
.container {
  padding: 40rpx;
}

.card {
  padding: 20rpx;
  margin-bottom: 20rpx;
  background-color: #fff;
  box-shadow: 0 10rpx 10rpx rgba(65, 105, 225, .1);
  border-radius: 40rpx;
}

.card-title {
  margin: 50rpx 30rpx;
  font-size: 40rpx;
}

.order-list {
  margin-top: 20rpx;
}
</style>
