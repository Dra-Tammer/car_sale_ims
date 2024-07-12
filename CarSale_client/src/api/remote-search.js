import request from '@/utils/request'

export function searchUser(name) {
  return request({
    url: '/vue-element-admin/search/user',
    baseURL: process.env.VUE_APP_BASE_API, // url = base url + request url
    method: 'get',
    params: { name }
  })
}

export function transactionList(query) {
  return request({
    url: '/vue-element-admin/transaction/list',
    baseURL: process.env.VUE_APP_BASE_API, // url = base url + request url
    method: 'get',
    params: query
  })
}
