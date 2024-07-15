<template>
  <div>
    <div class="card" style="padding: 15px">
      您好，{{ user?.name }}！欢迎使用本系统
    </div>

    <div style="display: flex; margin: 10px 0">
      <div style="width: 50%;" class="card">
        <div style="margin-bottom: 30px; font-size: 20px; font-weight: bold">公告列表</div>
        <div>
          <el-timeline reverse slot="reference">
            <el-timeline-item v-for="item in notices" :key="item.id" :timestamp="item.time">
              <el-popover
                  placement="right"
                  width="200"
                  trigger="hover"
                  :content="item.content">
                <span slot="reference">{{ item.title }}</span>
              </el-popover>
            </el-timeline-item>
          </el-timeline>
        </div>
      </div>
    </div>

    <div style="margin: 10px 0">
      <button @click="getLocation">获取当前位置</button>
      <p v-if="location">纬度: {{ location.latitude }}, 经度: {{ location.longitude }}</p>
      <p v-if="error">{{ error }}</p>
      <div v-if="location" id="map" style="width: 70%; height: 400px; margin-top: 20px;"></div>
    </div>
  </div>
</template>

<script>
import { getCurrentPosition } from '../../utils/geolocation';
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';

export default {
  name: 'Home',
  data() {
    return {
      user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
      notices: [],
      location: null,
      error: null,
      map: null,
    };
  },
  created() {
    this.$request.get('/notice/selectAll').then(res => {
      this.notices = res.data || [];
    });
  },
  methods: {
    async getLocation() {
      try {
        const position = await getCurrentPosition();
        this.location = {
          latitude: position.coords.latitude,
          longitude: position.coords.longitude,
        };
        this.$nextTick(() => {
          this.initMap();
        });
      } catch (error) {
        this.error = error.message;
      }
    },
    initMap() {
      if (this.map) {
        this.map.setView([this.location.latitude, this.location.longitude], 13);
        return;
      }
      this.map = L.map('map').setView([this.location.latitude, this.location.longitude], 13);

      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
      }).addTo(this.map);

      L.marker([this.location.latitude, this.location.longitude]).addTo(this.map)
          .bindPopup('You are here')
          .openPopup();
    },
  },
};
</script>

<style scoped>
#map {
  width: 100%;
  height: 400px;
  margin-top: 20px;
}
</style>
