import request from '@/utils/request'

export function getRoutes() {
  return request({
    url: '/vue-element-admin/routes',
    baseURL: process.env.VUE_APP_BASE_API, // url = base url + request url
    method: 'get'
  })
}

export function getRoles() {
  return request({
    url: '/vue-element-admin/roles',
    baseURL: process.env.VUE_APP_BASE_API, // url = base url + request url
    method: 'get'
  })
}

export function addRole(data) {
  return request({
    url: '/vue-element-admin/role',
    baseURL: process.env.VUE_APP_BASE_API, // url = base url + request url
    method: 'post',
    data
  })
}

export function updateRole(id, data) {
  return request({
    url: `/vue-element-admin/role/${id}`,
    method: 'put',
    data
  })
}

export function deleteRole(id) {
  return request({
    url: `/vue-element-admin/role/${id}`,
    method: 'delete'
  })
}
