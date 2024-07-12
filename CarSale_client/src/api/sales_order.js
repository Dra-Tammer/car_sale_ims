import request from '@/utils/request'

export function getOrderList(page, limit) {
  return request({
    url: '/order/list',
    method: 'GET',
    params: { page, limit }
  })
}

export function orderConditionQuery(page, limit, id, type, name) {
  return request({
    url: '/order/query',
    method: 'GET',
    params: { page, limit, id, type, name }
  })
}

export function addOrder(data) {
  return request({
    url: '/order/add',
    method: 'POST',
    data: data
  })
}

export function DeleteOrder(sellid) {
  return request({
    url: `/order/delete?sellid=${sellid}`,
    method: 'DELETE'
  })
}

export function GetAll() {
  return request({
    url: '/order/all',
    method: 'GET'
  })
}

export function GetIncome() {
  return request({
    url: '/order/income',
    method: 'GET'
  })
}

export function GetCarCount() {
  return request({
    url: '/order/car/count',
    method: 'GET'
  })
}

export function GetTableData() {
  return request({
    url: '/order/year',
    method: 'GET'
  })
}
