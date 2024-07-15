<template>
  <div>
    <div class="search">
      <el-input placeholder="请输入账号查询" style="width: 200px" v-model="riderAccount"></el-input>
      <el-input placeholder="请输入姓名" style="width: 200px; margin-left: 10px" v-model="riderName"></el-input>
      <el-button type="info" plain style="margin-left: 10px" @click="load(1)">查询</el-button>
      <el-button type="warning" plain style="margin-left: 10px" @click="reset">重置</el-button>
      <el-button type="primary" plain style="margin-left: 10px" @click="handleAdd">新增</el-button>
      <el-button type="danger" plain style="margin-left: 10px" @click="delBatch">批量删除</el-button>
    </div>

    <div class="table">
      <el-table :data="tableData" stripe @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" align="center"></el-table-column>
        <el-table-column prop="id" label="序号" width="70" align="center" sortable></el-table-column>
        <el-table-column prop="avatar" label="头像">
          <template v-slot="scope">
            <div style="display: flex; align-items: center">
              <el-image style="width: 40px; height: 40px; border-radius: 50%" v-if="scope.row.avatar"
                        :src="scope.row.avatar" :preview-src-list="[scope.row.avatar]"></el-image>
            </div>
          </template>
        </el-table-column>
        <el-table-column prop="riderAccount" label="账号"></el-table-column>
        <el-table-column prop="riderName" label="姓名"></el-table-column>
        <el-table-column prop="vehicle" label="车辆"></el-table-column>
        <el-table-column prop="status" label="状态"></el-table-column>
        <el-table-column prop="phone" label="电话"></el-table-column>
        <el-table-column label="操作" align="center" width="180">
          <template v-slot="scope">
            <el-button size="mini" type="primary" plain @click="handleEdit(scope.row)">编辑</el-button>
            <el-button size="mini" type="danger" plain @click="del(scope.row.id)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <div class="pagination">
        <el-pagination
            background
            @current-change="handleCurrentChange"
            :current-page="pageNum"
            :page-sizes="[5, 10, 20]"
            :page-size="pageSize"
            layout="total, prev, pager, next"
            :total="total">
        </el-pagination>
      </div>
    </div>

    <el-dialog title="骑手" :visible.sync="fromVisible" width="40%" :close-on-click-modal="false" destroy-on-close>
      <el-form :model="form" label-width="100px" style="padding-right: 50px" :rules="rules" ref="formRef">
        <el-form-item label="头像">
          <el-upload
              class="avatar-uploader"
              :action="$baseUrl + '/files/upload'"
              :headers="{ token: user.token }"
              list-type="picture"
              :on-success="handleAvatarSuccess"
          >
            <el-button type="primary">上传头像</el-button>
          </el-upload>
        </el-form-item>
        <el-form-item label="账号" prop="riderAccount">
          <el-input v-model="form.riderAccount" placeholder="账号"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="riderPassword">
          <el-input v-model="form.riderPassword" placeholder="密码" show-password></el-input>
        </el-form-item>
        <el-form-item label="姓名" prop="riderName">
          <el-input v-model="form.riderName" placeholder="姓名"></el-input>
        </el-form-item>
        <el-form-item label="电话" prop="phone">
          <el-input v-model="form.phone" placeholder="电话"></el-input>
        </el-form-item>
        <el-form-item label="车辆" prop="vehicle">
          <el-select v-model="form.vehicle" placeholder="请选择车辆">
            <el-option label="电动车" value="电动车"></el-option>
            <el-option label="摩托车" value="摩托车"></el-option>
            <el-option label="自行车" value="自行车"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-select v-model="form.status" placeholder="请选择状态">
            <el-option label="空闲" value="空闲"></el-option>
            <el-option label="忙碌" value="忙碌"></el-option>
          </el-select>
        </el-form-item>
      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button @click="fromVisible = false">取消</el-button>
        <el-button type="primary" @click="save">确定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "Rider",
  data() {
    return {
      tableData: [],
      pageNum: 1,
      pageSize: 10,
      total: 0,
      riderAccount: null,
      riderName: null,
      fromVisible: false,
      form: {
        riderAccount: '',
        riderPassword: '',
        riderName: '',
        phone: '',
        vehicle: '',
        status: '',
        avatar: ''
      },
      user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
      rules: {
        riderAccount: [
          {required: true, message: '请输入账号', trigger: 'blur'},
        ],
        riderName: [
          {required: true, message: '请输入姓名', trigger: 'blur'},
        ],
        riderPassword: [
          {required: true, message: '请输入密码', trigger: 'blur'},
        ]
      },
      ids: []
    }
  },
  created() {
    this.load(1)
  },
  methods: {
    handleAdd() {
      this.form = {
        riderAccount: '',
        riderPassword: '',
        riderName: '',
        phone: '',
        vehicle: '',
        status: '',
        avatar: ''
      };
      this.fromVisible = true;
    },
    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row));
      this.fromVisible = true;
    },
    save() {
      this.$refs.formRef.validate((valid) => {
        if (valid) {
          this.$request({
            url: this.form.id ? '/riders/update' : '/riders/add',
            method: this.form.id ? 'PUT' : 'POST',
            data: this.form
          }).then(res => {
            if (res.code === '200') {
              this.$message.success('保存成功');
              this.load(1);
              this.fromVisible = false;
            } else {
              this.$message.error(res.msg);
            }
          });
        }
      });
    },
    del(id) {
      this.$confirm('您确定删除吗？', '确认删除', {type: "warning"}).then(() => {
        this.$request.delete('/riders/delete/' + id).then(res => {
          if (res.code === '200') {
            this.$message.success('删除成功');
            this.load(1);
          } else {
            this.$message.error(res.msg);
          }
        });
      }).catch(() => {
      });
    },
    handleSelectionChange(rows) {
      this.ids = rows.map(v => v.id);
    },
    delBatch() {
      if (!this.ids.length) {
        this.$message.warning('请选择数据');
        return;
      }
      this.$confirm('您确定批量删除这些数据吗？', '确认删除', {type: "warning"}).then(() => {
        this.$request.delete('/riders/delete/batch', {data: this.ids}).then(res => {
          if (res.code === '200') {
            this.$message.success('批量删除成功');
            this.load(1);
          } else {
            this.$message.error(res.msg);
          }
        });
      }).catch(() => {
      });
    },
    load(pageNum) {
      if (pageNum) this.pageNum = pageNum;
      this.$request.get('/riders/selectPage', {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          riderAccount: this.riderAccount,
          riderName: this.riderName,
        }
      }).then(res => {
        this.tableData = res.data?.list || [];
        this.total = res.data?.total || 0;
      });
    },
    reset() {
      this.riderAccount = null;
      this.riderName = null;
      this.load(1);
    },
    handleCurrentChange(pageNum) {
      this.load(pageNum);
    },
    handleAvatarSuccess(response, file, fileList) {
      this.form.avatar = response.data;
    }
  }
}
</script>

<style scoped>
</style>
