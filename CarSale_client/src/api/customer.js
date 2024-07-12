import request from '@/utils/request'

export function getCustomerList() {
  return request({
    url: '/customer/all'
  })
}

export function customerConditionQuery(query) {
  return request({
    url: '/customer/query',
    method: 'GET',
    params: query
  })
}

export function getRecordById(customerid) {
  return request({
    url: `/customer/content?customerid=${customerid}`,
    method: 'GET'
  })
}

export function getCount() {
  return request({
    url: '/customer/count',
    method: 'GET'
  })
}


