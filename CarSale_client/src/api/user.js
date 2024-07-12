import request from '@/utils/request'

export function login(data) {
  return request({
    url: '/vue-element-admin/user/login',
    baseURL: process.env.VUE_APP_BASE_API, // url = base url + request url
    method: 'post',
    data
  })
}

export function getInfo(token) {
  return request({
    url: '/vue-element-admin/user/info',
    baseURL: process.env.VUE_APP_BASE_API, // url = base url + request url
    method: 'get',
    params: { token }
  })
}

export function logout() {
  return request({
    url: '/vue-element-admin/user/logout',
    baseURL: process.env.VUE_APP_BASE_API, // url = base url + request url
    method: 'post'
  })
}
