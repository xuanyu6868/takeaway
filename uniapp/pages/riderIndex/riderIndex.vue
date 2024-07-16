<!-- pages/riderIndex/riderIndex.vue -->
<template>
  <view>
    <view class="tab-bar">
      <view class="tab-item" @click="switchTab('home')" :class="{active: activeTab === 'home'}">首页</view>
      <view class="tab-item" @click="switchTab('orders')" :class="{active: activeTab === 'orders'}">订单</view>
      <view class="tab-item" @click="switchTab('me')" :class="{active: activeTab === 'me'}">我的</view>
    </view>
    <view>
      <view v-if="activeTab === 'home'">
        <rider-home></rider-home>
      </view>
      <view v-if="activeTab === 'orders'">
        <rider-orders></rider-orders>
      </view>
      <view v-if="activeTab === 'me'">
        <rider-me></rider-me>
      </view>
    </view>
  </view>
</template>

<script>
import RiderHome from '@/pages/riderHome/riderHome.vue'
import RiderOrders from '@/pages/riderOrders/riderOrders.vue'
import RiderMe from '@/pages/riderMe/riderMe.vue'

export default {
  data() {
    return {
      activeTab: 'home'
    }
  },
  components: {
    RiderHome,
    RiderOrders,
    RiderMe
  },
  methods: {
    switchTab(tab) {
      this.activeTab = tab
    }
  }
}
</script>

<style scoped>
.tab-bar {
  display: flex;
  justify-content: space-around;
  background-color: #fff;
  border-top: 1px solid #ccc;
}
.tab-item {
  padding: 10px 0;
  text-align: center;
  flex: 1;
}
.tab-item.active {
  color: #00BFFF;
  border-bottom: 2px solid #00BFFF;
}
</style>
