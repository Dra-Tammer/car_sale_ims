<template>
  <div class="app-container">
    <div class="filter-container">
      <el-input
        v-model="listQuery.name"
        placeholder="员工姓名"
        style="width: 200px;margin-right: 10px"
        class="filter-item"
        clearable
        @keyup.enter.native="handleFilter"
      />
      <el-select
        v-model="listQuery.sex"
        placeholder="性别"
        clearable
        style="width: 90px;margin-right: 10px"
        class="filter-item"
      >
        <el-option v-for="item in sexoptions" :key="item.key" :label="item.label" :value="item.key" />
      </el-select>
      <el-select
        v-model="listQuery.education"
        placeholder="学历"
        clearable
        style="width: 190px;margin-right: 10px"
        class="filter-item"
      >
        <el-option v-for="item in educationOptions" :key="item.key" :label="item.label" :value="item.key" />
      </el-select>
      <el-button v-waves class="filter-item" type="info" icon="el-icon-delete" @click="clearQuery">
        清空
      </el-button>
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
        搜索
      </el-button>
    </div>
    <el-table v-loading="listLoading" :data="list" row-key="id" border fit highlight-current-row style="width: 100%">
      <el-table-column align="center" label="员工ID" width="200">
        <template slot-scope="{row}">
          <span>{{ row.staffid }}</span>
        </template>
      </el-table-column>

      <el-table-column width="150px" align="center" label="员工姓名">
        <template slot-scope="{row}">
          <span>{{ row.name }}</span>
        </template>
      </el-table-column>

      <el-table-column width="100px" label="性别" align="center">

        <template slot-scope="{row}">
          <el-tag :type="row.sex | statusFilter">
            {{ row.sex }}
          </el-tag>
        </template>
      </el-table-column>

      <el-table-column width="200px" align="center" label="年龄">
        <template slot-scope="{row}">
          <span>{{ row.age }}</span>
        </template>
      </el-table-column>

      <el-table-column min-width="200px" label="籍贯" align="center">
        <template slot-scope="{row}">
          <span>{{ row.origin }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="学历" width="195">
        <template slot-scope="{row}">
          <span>{{ row.education }}</span>
        </template>
      </el-table-column>
    </el-table>
  </div>

</template>

<script>
import { getStaffList, StaffConditionQuery } from '@/api/staff'

export default {
  name: 'CarTable',
  filters: {
    statusFilter(status) {
      const statusMap = {
        '男': 'success'
      }
      return statusMap[status]
    }
  },
  data() {
    return {
      list: null,
      total: null,
      listLoading: true,
      listQuery: {
        page: 1,
        limit: 10,
        name: undefined,
        sex: undefined,
        education: undefined
      },
      sexoptions: [{ label: '男', key: '男' }, { label: '女', key: '女' }],
      educationOptions: [{ label: '研究生', key: '研究生' }, { label: '本科', key: '本科' }, { label: '专科', key: '专科' }, {
        label: '高中',
        key: '高中'
      }, { label: '初中', key: '初中' }, { label: '小学', key: '小学' }]
    }
  },
  created() {
    this.getAllStaffList()
  },
  methods: {
    getAllStaffList() {
      getStaffList().then((res) => {
        console.log(res.data)
        this.listLoading = true
        this.list = res.data
        this.listLoading = false
      })
    },
    handleFilter() {
      StaffConditionQuery(this.listQuery).then((res) => {
        this.listLoading = true
        console.log(res.data)
        this.list = res.data
        this.listLoading = false
      })
    },
    clearQuery() {
      this.listQuery.sex = undefined
      this.listQuery.education = undefined
      this.listQuery.name = undefined
      this.getAllStaffList()
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
