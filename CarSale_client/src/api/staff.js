import request from '@/utils/request'

export function getStaffList() {
  return request({
    url: '/staff/all'
  })
}

export function StaffConditionQuery(query) {
  return request({
    url: '/staff/query',
    method: 'GET',
    params: query
  })
}

export function getStaffName() {
  return request({
    url: '/staff/name',
    method: 'GET'
  })
}

export function getStaffCount() {
  return request({
    url: '/staff/count',
    method: 'GET'
  })
}

