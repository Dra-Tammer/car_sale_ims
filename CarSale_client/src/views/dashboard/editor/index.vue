<template>
  <div className="dashboard-editor-container">
    <panel-group @handleSetLineChartData="handleSetLineChartData"/>
    <div className="statistics_picture">
      <div id="volume" className="sale_volume" style="width: 100%; height: 510px;"/>
    </div>
  </div>
</template>

<script>
import PanelGroup from './components/PanelGroup'
import { GetTableData } from '@/api/sales_order'

const lineChartData = {
  newVisitis: {},
  messages: {
    expectedData: [200, 192, 120, 144, 160, 130, 140],
    actualData: [180, 160, 151, 106, 145, 150, 130]
  },
  purchases: {
    expectedData: [80, 100, 121, 104, 105, 90, 100],
    actualData: [120, 90, 100, 138, 142, 130, 130]
  },
  shoppings: {
    expectedData: [130, 140, 141, 142, 145, 150, 160],
    actualData: [120, 82, 91, 154, 162, 140, 130]
  }
}

export default {
  name: 'DashboardAdmin',
  components: {
    PanelGroup
  },
  data() {
    return {
      lineChartData: lineChartData.newVisitis,
      year: [],
      count: []
    }
  },
  mounted() {
    this.getData()
  },
  methods: {
    drawSaleVolume() {
      const myChart = this.$echarts.init(document.getElementById('volume'))
      myChart.setOption({
        color: ['#2ec7c9', '#006fff', '#8bb4b9', '#f7ff00', '#91c7ae', '#749f83', '#ca8622', '#bda29a', '#6e7074', '#546570', '#c4ccd3'],
        legend: {
          data: ['销量']
        },
        grid: {
          left: 40,
          right: 50,
          bottom: 40,
          top: 50,
          containLabel: true
        },
        xAxis: {
          type: 'category',
          name: '年份',
          data: this.year,
          axisPointer: {
            type: 'shadow'
          }
        },
        yAxis: {
          type: 'value',
          name: '销量',
          min: 0,
          max: Math.max(...this.count) + 1,
          axisLabel: {
            formatter: '{value}'
          }
        },
        series: [
          {
            data: this.count,
            type: 'bar',
            showBackground: true,
            backgroundStyle: {
              color: 'rgba(180, 180, 180, 0.2)'
            }

          },
          {
            name: '销量',
            data: this.count,
            smooth: true,
            type: 'line',
            itemStyle: {
              normal: {
                color: '#000000',
                lineStyle: {
                  color: '#1531e3',
                  width: 2
                },
                areaStyle: {
                  color: '#f3f8ff'
                }
              }
            },
            label: {
              show: true,
              position: 'top',
              textStyle: {
                fontSize: 16
              }
            }
          }
        ]
      })
    },
    handleSetLineChartData(type) {
      this.lineChartData = lineChartData[type]
    },
    getData() {
      this.year = []
      this.count = []
      GetTableData().then((res) => {
        res.data.sort((a, b) => a.year - b.year)
        for (let i = 0; i < res.data.length; i++) {
          this.year.push(res.data[i].year)
          this.count.push(res.data[i].count)
        }
        this.drawSaleVolume()
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.empty {
  font-size: 20px;
  height: 200px;
  border: rgb(182, 183, 185) 1px solid;
  border-radius: 20px;
  padding: 20px 20px 800px;
  color: gray;
}

.dashboard-editor-container {
  padding: 32px;
  background-color: rgb(240, 242, 245);
  position: relative;

  .github-corner {
    position: absolute;
    border: 0;
    right: 0;
  }

  .chart-wrapper {
    background: #fff;
    padding: 16px 16px 0;
    margin-bottom: 32px;
  }
}

@media (max-width: 1024px) {
  .chart-wrapper {
    padding: 8px;
  }
}

.statistics_picture {
  width: 100%;
}

.sale_volume {
  background-color: white;
  color: #666;
  box-shadow: 4px 4px 40px rgba(0, 0, 0, .05);
  border-color: rgba(0, 0, 0, .05);
  padding-top: 20px;
}

.dashboard-editor-container {
  height: 100vh;
}
</style>
