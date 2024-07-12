import request from '@/utils/request'

export function getCarList() {
  return request({
    url: '/car/all',
    method: 'GET'
  })
}

export function CarConditionalQuery(query) {
  return request({
    url: '/car/query',
    method: 'GET',
    params: query
  })
}

export function getCarCategory() {
  return request({
    url: '/car/category',
    method: 'GET'
  })
}

export function getUnsoldCarType() {
  return request({
    url: '/car/unsold',
    method: 'GET'
  })
}

export function getColorByUnsoldCarType(type) {
  return request({
    url: '/car/unsold/color',
    method: 'GET',
    params: {
      type: type
    }
  })
}

export function deleteCarById(id) {
  return request({
    url: '/car/delete',
    method: 'GET',
    params: {
      id: id
    }
  })
}

export function updateCarPrice(id, price) {
  return request({
    url: '/car/update',
    method: 'GET',
    params: {
      id: id,
      price: price
    }
  })
}

export function insertCar(id, type, color, factory, price) {
  return request({
    url: '/car/insert',
    method: 'POST',
    params: {
      id: id,
      type: type,
      color: color,
      factory: factory,
      price: price
    }
  })
}
