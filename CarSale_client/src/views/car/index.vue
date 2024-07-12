<template>
  <div class="app-container">
    <div class="filter-container">
      <el-select
        v-model="listQuery.type"
        placeholder="型号"
        clearable
        class="filter-item"
        style="width: 200px;margin-right: 10px"
      >
        <el-option v-for="item in typeOptions" :key="item.key" :label="item.label" :value="item.key"/>
      </el-select>
      <el-select
        v-model="listQuery.color"
        placeholder="颜色"
        clearable
        class="filter-item"
        style="width: 130px;margin-right: 10px"
      >
        <el-option v-for="item in colorOptions" :key="item.key" :label="item.label" :value="item.key"/>
      </el-select>
      <el-select
        v-model="listQuery.status"
        style="width: 140px;margin-right: 10px"
        clearable
        placeholder="状态"
        class="filter-item"
      >
        <el-option v-for="item in statusOptions" :key="item.key" :label="item.label" :value="item.key"/>
      </el-select>
      <el-button class="filter-item" type="info" icon="el-icon-delete" @click="clearQuery">
        清空
      </el-button>
      <el-button class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
        搜索
      </el-button>
      <el-button
        class="filter-item"
        style="margin-left: 10px;"
        type="primary"
        icon="el-icon-edit"
        @click="handleAdd"
      >
        添加车辆
      </el-button>
    </div>
    <el-table
      v-loading="listLoading"
      :data="list"
      border
      fit
      highlight-current-row
      style="width: 100%"
    >
      <el-table-column align="center" label="ID" width="90">
        <template slot-scope="{row}">
          <span>{{ row.carid }}</span>
        </template>
      </el-table-column>

      <el-table-column width="130px" align="center" label="出厂日期">
        <template slot-scope="{row}">
          <span>{{ row.createtime.substring(0, 10) }}</span>
        </template>
      </el-table-column>

      <el-table-column min-width="160px" label="汽车型号" align="center">
        <template slot-scope="{row}">
          <span>{{ row.type }}</span>
        </template>
      </el-table-column>

      <el-table-column width="200px" align="center" label="颜色">
        <template slot-scope="{row}">
          <span>{{ row.color }}</span>
        </template>
      </el-table-column>

      <el-table-column width="200px" label="制造厂商" align="center">
        <template slot-scope="{row}">
          <span>{{ row.factory }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="价格" width="200">
        <template slot-scope="{row}">
          <template v-if="row.edit">
            <el-input v-model="row.price" class="edit-input" size="small"/>
            <el-button
              class="cancel-btn"
              size="small"
              icon="el-icon-refresh"
              type="warning"
              @click="cancelEdit(row)"
            >
              取消
            </el-button>
          </template>
          <span v-else>{{ row.price }}</span>
        </template>
      </el-table-column>

      <el-table-column class-name="status-col" label="状态" width="80">
        <template slot-scope="{row}">
          <el-tag :type="row.status | statusFilter">
            {{ row.status === 'sold' ? '已售出' : '未售出' }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="200">
        <template slot-scope="{row}">
          <el-button
            v-if="row.edit"
            type="success"
            size="small"
            icon="el-icon-circle-check-outline"
            @click="handleUpdate(row)"
          >修改
          </el-button>

          <el-button v-if="row.status === 'unsold' && !row.edit" type="primary" size="mini" @click="openEdit(row)">更新价格
          </el-button>

          <el-button v-if="row.status === 'unsold' && !row.edit" type="danger" size="mini" @click="handleDelete(row)">删除
          </el-button>
          <el-button v-if="!(row.status === 'unsold') && !row.edit" type="primary" size="mini" disabled>更新价格
          </el-button>
          <el-button v-if="!(row.status === 'unsold') && !row.edit" type="danger" size="mini" disabled>删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-dialog title="添加车辆" :visible.sync="dialogVisible" @closed="dialogClosed">
      <el-form :model="newCar" label-position="left" label-width="70px" style="width: 300px;margin-left: 60px;">
        <el-form-item label="唯一标识" prop="id">
          <el-input v-model="newCar.id" style="width: 200px;margin-left: 20px;"/>
        </el-form-item>
        <el-form-item label="型号" prop="id">
          <el-input v-model="newCar.type" style="width: 200px;margin-left: 20px;"/>
        </el-form-item>
        <el-form-item label="颜色" prop="id">
          <el-input v-model="newCar.color" style="width: 200px;margin-left: 20px;"/>
        </el-form-item>
        <el-form-item label="厂商" prop="id">
          <el-input v-model="newCar.factory" style="width: 200px;margin-left: 20px;"/>
        </el-form-item>
        <el-form-item label="标价" prop="id">
          <el-input v-model="newCar.price" style="width: 200px;margin-left: 20px;"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancel">
          取消
        </el-button>
        <el-button type="primary" @click="add">
          添加
        </el-button>
      </div>
    </el-dialog>
  </div>

</template>

<script>
import { CarConditionalQuery, getCarList, getCarCategory, deleteCarById, updateCarPrice, insertCar } from '@/api/car'

export default {
  name: 'CarTable',
  filters: {
    statusFilter(status) {
      const statusMap = {
        'unsold': 'success',
        'sold': 'info'
      }
      return statusMap[status]
    }
  },
  data() {
    return {
      newCar: {
        id: '',
        type: '',
        color: '',
        factory: '',
        price: ''
      },
      dialogVisible: false,
      prePrice: '',
      tempPrice: '',
      list: null,
      total: null,
      listLoading: true,
      statusOptions: [{ label: '已售出', key: 'sold' }, { label: '未售出', key: 'unsold' }],
      colorOptions: [
        { label: '暗夜黑', key: '暗夜黑' },
        { label: '黑灰双拼（限定）', key: '黑灰双拼（限定）' },
        { label: '墨灰色', key: '墨灰色' }, { label: '经典白', key: '经典白' }, {
          label: '宝格丽蓝',
          key: '宝格丽蓝'
        }, {
          label: '宝石青',
          key: '宝石青'
        }, { label: 'GT 银金属漆', key: 'GT 银金属漆' }, { label: '竞速黄', key: '竞速黄' }],
      typeOptions: [],
      listQuery: {
        page: 1,
        limit: 10,
        type: undefined,
        color: undefined,
        status: undefined
      }
    }
  },
  created() {
    this.getAllCarList()
    this.getCarType()
  },
  methods: {
    cancel() {
      this.newCar.id = ''
      this.newCar.type = ''
      this.newCar.color = ''
      this.newCar.factory = ''
      this.newCar.price = ''
      this.dialogVisible = false
    },
    add() {
      insertCar(this.newCar.id, this.newCar.type, this.newCar.color, this.newCar.factory, this.newCar.price).then((res) => {
        if (res.data === 1) {
          this.$notify({
            title: '成功',
            message: '新增车辆信息',
            type: 'success'
          })
        } else {
          this.$notify({
            title: '失败',
            message: '服务器问题',
            type: 'warning'
          })
        }
        this.newCar.id = ''
        this.newCar.type = ''
        this.newCar.color = ''
        this.newCar.factory = ''
        this.newCar.price = ''
        this.dialogVisible = false
        this.getAllCarList()
      })
    },

    dialogClosed() {
      this.newCar.id = ''
      this.newCar.type = ''
      this.newCar.color = ''
      this.newCar.factory = ''
      this.newCar.price = ''
    },

    handleAdd() {
      this.dialogVisible = true
    },

    cancelEdit(row) {
      row.price = this.prePrice
      row.edit = false
      this.$message({
        message: '取消修改价格',
        type: 'warning'
      })
      this.getAllCarList()
    },

    handleUpdate(row) {
      updateCarPrice(row.carid, row.price).then((res) => {
        if (res.data === 1) {
          row.edit = false
          this.$message({
            message: '汽车的价格被修改',
            type: 'success'
          })
          this.getAllCarList()
        } else {
          this.$message({
            message: '修改失败',
            type: 'warning'
          })
        }
      })
    },

    openEdit(row) {
      row.edit = true
      this.prePrice = row.price
    },

    handleDelete(row) {
      this.$confirm('确认删除车辆信息？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteCarById(row.carid).then((res) => {
          this.listLoading = true
          if (res.data === 1) {
            this.$notify({
              title: '删除',
              message: '汽车信息删除成功',
              type: 'warning'
            })
          }
          this.getAllCarList()
          setTimeout(() => {
            this.listLoading = false
          }, 0.5 * 1000)
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '取消删除车辆'
        })
      })
    },

    async getAllCarList() {
      await getCarList().then((res) => {
        this.listLoading = true
        this.list = res.data
        for (let i = 0; i < this.list.length; i++) this.list[i].edit = false
        this.listLoading = false
      })
    },
    getCarType() {
      getCarCategory().then((res) => {
        const stringArray = res.data
        for (let i = 0; i < stringArray.length; i++) {
          const option = {
            label: stringArray[i],
            key: stringArray[i]
          }
          this.typeOptions.push(option)
        }
      })
    },
    handleFilter() {
      CarConditionalQuery(this.listQuery)
        .then((res) => {
          this.listLoading = true
          const { data } = res
          this.list = data
          this.listLoading = false
        })
    },
    clearQuery() {
      this.listQuery.type = undefined
      this.listQuery.color = undefined
      this.listQuery.status = undefined
      this.getAllCarList()
    }
  }
}
</script>

<style>
.sortable-ghost {
  opacity: .8;
  color: #fff !important;
  background: #42b983 !important;
}
</style>

<style scoped>
.icon-star {
  margin-right: 2px;
}

.drag-handler {
  width: 20px;
  height: 20px;
  cursor: pointer;
}

.edit-input {
  padding-right: 100px;
}

.cancel-btn {
  position: absolute;
  right: 15px;
  top: 10px;
}
</style>
