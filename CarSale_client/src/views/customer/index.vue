<template>
  <div class="app-container">
    <div class="filter-container">
      <el-input
        v-model="listQuery.name"
        placeholder="客户姓名"
        style="width: 200px;margin-right: 10px"
        class="filter-item"
        clearable
        @keyup.enter.native="handleFilter"
      />
      <el-button v-waves class="filter-item" type="info" icon="el-icon-delete" @click="clearQuery">
        清空
      </el-button>
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
        搜索
      </el-button>
    </div>
    <el-table v-loading="listLoading" :data="list" row-key="id" border fit highlight-current-row style="width: 100%">
      <el-table-column align="center" label="客户ID" width="200">
        <template slot-scope="{row}">
          <span>{{ row.customerid }}</span>
        </template>
      </el-table-column>

      <el-table-column width="150px" align="center" label="客户姓名">
        <template slot-scope="{row}">
          <span>{{ row.name }}</span>
        </template>
      </el-table-column>
      <el-table-column min-width="200px" label="客户登记住址" align="center">
        <template slot-scope="{row}">
          <span>{{ row.address }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="联系方式(+86)" width="195">
        <template slot-scope="{row}">
          <span>{{ row.contact }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="操作" width="130">
        <template slot-scope="{row}">
          <el-button size="mini" type="success" @click="handlePrintLog(row)">
            联系记录
          </el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>

</template>

<script>
import { getCustomerList, customerConditionQuery, getRecordById } from '@/api/customer'
import { parseTime } from '@/utils'

export default {
  name: 'CustomerTable',
  data() {
    return {
      recordQuery: {
        id: undefined
      },
      record: null,
      list: null,
      total: null,
      downloadLoading: null,
      listLoading: true,
      listQuery: {
        page: 1,
        limit: 10,
        name: undefined
      }
    }
  },
  created() {
    this.getAllCustomerList()
  },
  methods: {
    getAllCustomerList() {
      getCustomerList().then((res) => {
        this.listLoading = true
        this.list = res.data
        this.listLoading = false
      })
    },
    handleFilter() {
      customerConditionQuery(this.listQuery).then((res) => {
        this.listLoading = true
        this.list = res.data
        this.listLoading = false
      })
    },
    clearQuery() {
      this.listQuery.name = undefined
      this.getAllCustomerList()
    },
    formatJson(filterVal) {
      return this.record.map(v => filterVal.map(j => {
        if (j === 'timestamp') {
          return parseTime(v[j])
        } else {
          return v[j]
        }
      }))
    },
    handlePrintLog(row) {
      this.getRecord(row.customerid)
      this.downloadLoading = true
      import('@/vendor/Export2Excel').then(excel => {
        const tHeader = ['聊天时间', '类型', '内容']
        const filterVal = ['time', 'type', 'content']
        const data = this.formatJson(filterVal)
        excel.export_json_to_excel({
          header: tHeader,
          data,
          filename: '导出业务联系记录'
        })
        this.downloadLoading = false
      })
    },
    async getRecord(customerid) {
      console.log(customerid)
      await getRecordById(customerid).then((res) => {
        this.record = res.data
        console.log(this.record)
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
