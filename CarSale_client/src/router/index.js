import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

import Layout from '@/layout'

export const constantRoutes = [
  {
    path: '/redirect',
    component: Layout,
    hidden: true,
    children: [
      {
        path: '/redirect/:path(.*)',
        component: () => import('@/views/redirect/index')
      }
    ]
  },
  {
    path: '/login',
    component: () => import('@/views/login/index'),
    hidden: true
  },
  {
    path: '/auth-redirect',
    component: () => import('@/views/login/auth-redirect'),
    hidden: true
  },
  {
    path: '/404',
    component: () => import('@/views/error-page/404'),
    hidden: true
  },
  {
    path: '/401',
    component: () => import('@/views/error-page/401'),
    hidden: true
  },
  {
    path: '/',
    component: Layout,
    redirect: '/dashboard',
    children: [
      {
        path: 'dashboard',
        component: () => import('@/views/dashboard/index'),
        name: 'Dashboard',
        meta: { title: 'Dashboard', icon: 'dashboard', affix: true }
      }
    ]
  },
  {
    path: '/sales_order',
    component: Layout,
    children: [
      {
        path: 'index',
        component: () => import('@/views/sales_order/index'),
        name: 'SalesOrder',
        meta: { title: '销售订单', icon: 'form' }
      }
    ]
  }
]

export const asyncRoutes = [
  {
    path: '/car',
    component: Layout,
    children: [
      {
        path: 'index',
        component: () => import('@/views/car/index'),
        name: 'CarTable',
        meta: { title: '汽车', icon: 'dashboard', roles: ['admin'] }
      }
    ]
  },

  {
    path: '/customer',
    component: Layout,
    children: [
      {
        path: 'index',
        component: () => import('@/views/customer/index'),
        name: 'CustomerTable',
        meta: { title: '客户', icon: 'peoples'}
      }
    ]
  },

  {
    path: '/staff',
    component: Layout,
    children: [
      {
        path: 'index',
        component: () => import('@/views/staff/index'),
        name: 'StaffTable',
        meta: { title: '员工', icon: 'user', roles: ['admin'] }
      }
    ]
  },

  {
    path: '/error',
    component: Layout,
    redirect: 'noRedirect',
    name: 'ErrorPages',
    hidden: true,
    meta: {
      title: 'Error Pages',
      icon: '404'
    },
    children: [
      {
        path: '401',
        component: () => import('@/views/error-page/401'),
        name: 'Page401',
        meta: { title: '401', noCache: true }
      },
      {
        path: '404',
        component: () => import('@/views/error-page/404'),
        name: 'Page404',
        meta: { title: '404', noCache: true }
      }
    ]
  },

  { path: '*', redirect: '/404', hidden: true }
]

const createRouter = () => new Router({
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRoutes
})

const router = createRouter()

export function resetRouter() {
  const newRouter = createRouter()
  router.matcher = newRouter.matcher // reset router
}

export default router
