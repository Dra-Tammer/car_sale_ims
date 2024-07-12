<template>
  <div class="app-container">
    <div class="filter-container">
      <el-input
        v-model="listQuery.id"
        placeholder="订单ID"
        style="width: 200px;margin-right: 10px"
        class="filter-item"
        clearable
        @keyup.enter.native="handleFilter"
      />
      <el-select
        v-model="listQuery.type"
        placeholder="型号"
        clearable
        class="filter-item"
        style="width: 200px;margin-right: 10px"
      >
        <el-option v-for="item in typeOptions" :key="item.key" :label="item.label" :value="item.key" />
      </el-select>
      <el-select
        v-model="listQuery.name"
        placeholder="经办人"
        clearable
        class="filter-item"
        style="width: 200px;margin-right: 10px"
      >
        <el-option v-for="item in staffOptions" :key="item.key" :label="item.label" :value="item.key" />
      </el-select>
      <el-button class="filter-item" type="info" icon="el-icon-delete" @click="clearQuery">
        清空
      </el-button>
      <el-button class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
        搜索订单
      </el-button>
      <el-button
        class="filter-item"
        style="margin-left: 10px;"
        type="primary"
        icon="el-icon-edit"
        @click="handleAdd"
      >
        添加订单
      </el-button>
      <el-button
        :loading="downloadLoading"
        class="filter-item"
        type="primary"
        icon="el-icon-download"
        @click="handleDownload"
      >
        导出全部订单信息
      </el-button>
    </div>
    <el-table v-loading="listLoading" :data="list" row-key="id" border fit highlight-current-row style="width: 100%">
      <el-table-column align="center" label="订单ID" width="110">
        <template slot-scope="{row}">
          <span>{{ row.sellid }}</span>
        </template>
      </el-table-column>

      <el-table-column width="190px" align="center" label="交易时间">
        <template slot-scope="{row}">
          <span>{{ row.day }}</span>
        </template>
      </el-table-column>

      <el-table-column min-width="200px" label="车辆" align="center">
        <template slot-scope="{row}">
          <span>{{ row.type }} </span>
          <el-tag type="success">{{ row.color }}</el-tag>
        </template>
      </el-table-column>

      <el-table-column align="center" label="交易金额" width="120">
        <template slot-scope="{row}">
          <span>{{ row.price }}</span>
        </template>
      </el-table-column>

      <el-table-column width="95" align="center" label="交易数量">
        <template slot-scope="{row}">
          <span>{{ row.amount }}</span>
        </template>
      </el-table-column>

      <el-table-column width="130" align="center" label="经办人">
        <template slot-scope="{row}">
          <span>{{ row.name }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="操作" width="200">
        <template slot-scope="{row}">
          <el-button size="mini" type="success" @click="handlePrint(row)">
            打印报表
          </el-button>
          <el-button size="mini" type="danger" @click="handleDelete(row.sellid)">
            撤销订单
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="listQuery.page"
      :limit.sync="listQuery.limit"
      @pagination="getAllOrderList"
    />
    <el-dialog title="添加订单" :visible.sync="dialogFormVisible" @closed="dialogClose">
      <el-form :model="temp" label-position="left" label-width="70px" style="width: 400px; margin-left:50px;">
        <el-form-item label="汽车型号" prop="type">
          <el-select
            v-model="temp.type"
            placeholder="未售出的汽车型号"
            clearable
            class="filter-item"
            style="width: 200px;margin-right: 10px"
            @change="getColorByUnsoldCarType"
          >
            <el-option v-for="item in unsoldCarOptions" :key="item.key" :label="item.label" :value="item.key" />
          </el-select>
        </el-form-item>
        <el-form-item label="颜色" prop="color">
          <el-select
            v-model="temp.color"
            placeholder="库存颜色"
            clearable
            class="filter-item"
            style="width: 200px;margin-right: 10px"
          >
            <el-option v-for="item in typeColorOptions" :key="item.key" :label="item.label" :value="item.key" />
          </el-select>

        </el-form-item>
        <el-form-item label="数量" prop="amount">
          <el-input v-model="temp.amount" style="width: 200px;" disabled />
        </el-form-item>
        <el-form-item label="经手人" prop="name">
          <el-select
            v-model="temp.name"
            placeholder="经办人"
            clearable
            class="filter-item"
            style="width: 200px;margin-right: 10px"
          >
            <el-option v-for="item in staffOptions" :key="item.key" :label="item.label" :value="item.key" />
          </el-select>
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
import { addOrder, DeleteOrder, GetAll, getOrderList, orderConditionQuery } from '@/api/sales_order'
import Pagination from '@/components/Pagination/index.vue'
import { getCarCategory, getUnsoldCarType, getColorByUnsoldCarType } from '@/api/car'
import { getStaffName } from '@/api/staff'

export default {
  name: 'OrderTable',
  components: { Pagination },
  data() {
    return {
      temp: {
        type: '',
        color: '',
        amount: 1,
        name: ''
      },
      dialogFormVisible: false,
      plusDownLoadList: null,
      list: null,
      total: undefined,
      listLoading: true,
      listQuery: {
        page: 1,
        limit: 10,
        id: undefined,
        type: undefined,
        name: undefined
      },
      downloadList: [
        {
          sell_id: undefined,
          type: undefined,
          color: undefined,
          price: undefined,
          day: undefined,
          amount: undefined,
          handlingPerson: undefined
        }
      ],
      typeOptions: [],
      staffOptions: [],
      unsoldCarOptions: [],
      typeColorOptions: [],
      isCarTypeChose: false,
      carColorQueryType: ''
    }
  },
  created() {
    this.getAllOrderList()
    this.getListForDownLoad()
    this.getQueryItems()
  },
  methods: {
    dialogClose() {
      this.temp.type = ''
      this.temp.name = ''
      this.temp.color = ''
      this.typeColorOptions = []
    },

    getAllOrderList() {
      getOrderList(this.listQuery.page, this.listQuery.limit).then((res) => {
        this.listLoading = true
        this.list = res.data.records
        this.total = res.data.total
        setTimeout(() => {
          this.listLoading = false
        }, 0.5 * 1000)
      })
    },
    getColorByUnsoldCarType() {
      this.temp.color = ''
      this.typeColorOptions = []
      this.carColorQueryType = this.temp.type
      getColorByUnsoldCarType(this.carColorQueryType).then((res) => {
        const stringArray = res.data
        for (let i = 0; i < stringArray.length; i++) {
          const option = {
            label: stringArray[i],
            key: stringArray[i]
          }
          this.typeColorOptions.push(option)
        }
      })
    },
    handleAdd() {
      this.dialogFormVisible = true
    },
    cancel() {
      this.temp.amount = ''
      this.temp.type = ''
      this.temp.color = ''
      this.temp.name = ''
      this.dialogFormVisible = false
    },
    add() {
      this.dialogFormVisible = false
      addOrder(this.temp).then((res) => {
        this.getAllOrderList()
        this.$notify({
          title: '成功',
          message: '订单添加成功',
          type: 'success'
        })
        this.getAllOrderList()
        this.getListForDownLoad()
        this.getQueryItems()
        this.temp.color = ''
        this.typeColorOptions = []
      })
    },
    handleFilter() {
      orderConditionQuery(this.listQuery.page, this.listQuery.limit, this.listQuery.id, this.listQuery.type, this.listQuery.name)
        .then((res) => {
          this.listLoading = true
          this.list = res.data.records
          this.total = res.data.total
          this.listLoading = false
        })
    },
    clearQuery() {
      this.listQuery.id = undefined
      this.listQuery.type = undefined
      this.listQuery.name = undefined
      this.getAllOrderList()
    },
    handlePrint(row) {
      this.downloadList[0].sell_id = row.id
      this.downloadList[0].type = row.type
      this.downloadList[0].color = row.color
      this.downloadList[0].price = row.price
      this.downloadList[0].day = row.day
      this.downloadList[0].amount = row.amount
      this.downloadList[0].handlingPerson = row.name
      this.downloadLoading = true
      import('@/vendor/Export2Excel').then(excel => {
        const tHeader = ['客户id', '汽车型号', '颜色', '价格', '交易时间', '数量', '经手人']
        const filterVal = ['sellid', 'type', 'color', 'price', 'day', 'amount', 'handlingPerson']
        const data = this.formatJson(filterVal)
        excel.export_json_to_excel({
          header: tHeader,
          data,
          filename: '单个车辆销售报表'
        })
        this.downloadLoading = false
      })
    },

    getQueryItems() {
      getCarCategory().then((res) => {
        this.typeOptions = []
        const stringArray = res.data
        for (let i = 0; i < stringArray.length; i++) {
          const option = {
            label: stringArray[i],
            key: stringArray[i]
          }
          this.typeOptions.push(option)
        }
      })
      getStaffName().then((res) => {
        this.staffOptions = []
        const strArray = res.data
        for (let i = 0; i < strArray.length; i++) {
          const options = {
            label: strArray[i],
            key: strArray[i]
          }
          this.staffOptions.push(options)
        }
      })
      getUnsoldCarType().then((res) => {
        this.unsoldCarOptions = []
        const stringArray = res.data
        for (let i = 0; i < stringArray.length; i++) {
          const options = {
            label: stringArray[i],
            key: stringArray[i]
          }
          this.unsoldCarOptions.push(options)
        }
      })
    },

    formatJson(filterVal) {
      return this.downloadList.map(v => filterVal.map(j => {
        return v[j]
      }))
    },
    formatJsonPlus(filterVal) {
      return this.plusDownLoadList.map(v => filterVal.map(j => {
        return v[j]
      }))
    },
    getListForDownLoad() {
      GetAll().then((res) => {
        this.plusDownLoadList = res.data
      })
    },
    handleDownload() {
      this.downloadLoading = true
      import('@/vendor/Export2Excel').then(excel => {
        const tHeader = ['客户id', '汽车型号', '颜色', '价格', '交易时间', '数量', '经手人']
        const filterVal = ['sellid', 'type', 'color', 'price', 'day', 'amount', 'name']
        const data = this.formatJsonPlus(filterVal)
        excel.export_json_to_excel({
          header: tHeader,
          data,
          filename: '汽车销售信息总表'
        })
        this.downloadLoading = false
      })
    },
    handleDelete(sellid) {
      this.$confirm('确认要撤销订单 ？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        DeleteOrder(sellid).then(() => {
          this.$message({
            type: 'success',
            message: '订单撤销成功！'
          })
          this.getAllOrderList()
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '取消撤销订单'
        })
      })
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
</style>
