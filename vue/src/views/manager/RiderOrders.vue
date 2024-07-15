<template>
  <div>
    <div class="search">
      <el-input placeholder="请输入骑手ID查询" style="width: 200px" v-model="riderId"></el-input>
      <el-input placeholder="请输入订单ID查询" style="width: 200px; margin-left: 10px" v-model="orderId"></el-input>
      <el-button type="info" plain style="margin-left: 10px" @click="load(1)">查询</el-button>
      <el-button type="warning" plain style="margin-left: 10px" @click="reset">重置</el-button>
      <el-button type="primary" plain style="margin-left: 10px" @click="handleAdd">新增</el-button>
      <el-button type="danger" plain style="margin-left: 10px" @click="delBatch">批量删除</el-button>
    </div>

    <div class="table">
      <el-table :data="tableData" stripe @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" align="center"></el-table-column>
        <el-table-column prop="id" label="序号" width="70" align="center" sortable></el-table-column>
        <el-table-column prop="riderId" label="骑手ID"></el-table-column>
        <el-table-column prop="orderId" label="订单ID"></el-table-column>
        <el-table-column prop="status" label="状态"></el-table-column>
        <el-table-column prop="assignedAt" label="分配时间"></el-table-column>
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
            :total="total"
        />
      </div>
    </div>

    <el-dialog title="骑手订单" :visible.sync="formVisible" width="40%" :close-on-click-modal="false" destroy-on-close>
      <el-form :model="form" label-width="100px" style="padding-right: 50px" :rules="rules" ref="formRef">
        <el-form-item label="骑手ID" prop="riderId">
          <el-input v-model="form.riderId" placeholder="骑手ID"></el-input>
        </el-form-item>
        <el-form-item label="订单ID" prop="orderId">
          <el-input v-model="form.orderId" placeholder="订单ID"></el-input>
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-input v-model="form.status" placeholder="状态"></el-input>
        </el-form-item>
        <el-form-item label="分配时间" prop="assignedAt">
          <el-date-picker v-model="form.assignedAt" type="datetime" placeholder="选择日期时间"></el-date-picker>
        </el-form-item>
      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button @click="formVisible = false">取消</el-button>
        <el-button type="primary" @click="save">确定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "RiderOrders",
  data() {
    return {
      tableData: [],
      pageNum: 1,
      pageSize: 10,
      total: 0,
      riderId: null,
      orderId: null,
      formVisible: false,
      form: {
        riderId: '',
        orderId: '',
        status: '',
        assignedAt: ''
      },
      rules: {
        riderId: [
          { required: true, message: '请输入骑手ID', trigger: 'blur' }
        ],
        orderId: [
          { required: true, message: '请输入订单ID', trigger: 'blur' }
        ],
        status: [
          { required: true, message: '请输入状态', trigger: 'blur' }
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
        riderId: '',
        orderId: '',
        status: '',
        assignedAt: ''
      }
      this.formVisible = true
    },
    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.form.assignedAt = new Date(this.form.assignedAt)
      this.formVisible = true
    },
    save() {
      this.$refs.formRef.validate((valid) => {
        if (valid) {
          this.$request({
            url: this.form.id ? '/riderOrders/update' : '/riderOrders/add',
            method: this.form.id ? 'PUT' : 'POST',
            data: this.form
          }).then(res => {
            if (res.code === '200') {
              this.$message.success('保存成功')
              this.load(1)
              this.formVisible = false
            } else {
              this.$message.error(res.msg)
            }
          })
        }
      })
    },
    del(id) {
      this.$confirm('您确定删除吗？', '确认删除', { type: "warning" }).then(() => {
        this.$request.delete('/riderOrders/delete/' + id).then(res => {
          if (res.code === '200') {
            this.$message.success('删除成功')
            this.load(1)
          } else {
            this.$message.error(res.msg)
          }
        })
      }).catch(() => {})
    },
    handleSelectionChange(rows) {
      this.ids = rows.map(v => v.id)
    },
    delBatch() {
      if (!this.ids.length) {
        this.$message.warning('请选择数据')
        return
      }
      this.$confirm('您确定批量删除这些数据吗？', '确认删除', { type: "warning" }).then(() => {
        this.$request.delete('/riderOrders/delete/batch', { data: this.ids }).then(res => {
          if (res.code === '200') {
            this.$message.success('删除成功')
            this.load(1)
          } else {
            this.$message.error(res.msg)
          }
        })
      }).catch(() => {})
    },
    load(pageNum) {
      if (pageNum) this.pageNum = pageNum
      this.$request.get('/riderOrders/selectPage', {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          riderId: this.riderId,
          orderId: this.orderId
        }
      }).then(res => {
        this.tableData = res.data.list
        this.total = res.data.total
      })
    },
    reset() {
      this.riderId = null
      this.orderId = null
      this.load(1)
    },
    handleCurrentChange(pageNum) {
      this.load(pageNum)
    }
  }
}
</script>

<style scoped>
.search {
  margin-bottom: 20px;
}
</style>
