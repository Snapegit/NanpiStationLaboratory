	import {
		createRouter,
		createWebHashHistory
	} from 'vue-router'
	import shiyanshuju from '@/views/shiyanshuju/list'
	import shebeiweihu from '@/views/shebeiweihu/list'
	import yangpinxinxi from '@/views/yangpinxinxi/list'
	import yusuanyuzijin from '@/views/yusuanyuzijin/list'
	import keyanxiangmu from '@/views/keyanxiangmu/list'
	import weihurichenganpai from '@/views/weihurichenganpai/list'
	import shiyanshebei from '@/views/shiyanshebei/list'
	import haocaikucun from '@/views/haocaikucun/list'
	import keyanrenyuanRegister from '@/views/keyanrenyuan/register'
	import keyanrenyuanCenter from '@/views/keyanrenyuan/center'
	import weihurenyuanRegister from '@/views/weihurenyuan/register'
	import weihurenyuanCenter from '@/views/weihurenyuan/center'

export const routes = [{
		path: '/login',
		name: 'login',
		component: () => import('../views/login.vue')
	},{
		path: '/',
		name: '首页',
		component: () => import('../views/index'),
		children: [{
			path: '/',
			name: '首页Home',
			component: () => import('../views/HomeView.vue'),
			meta: {
				affix: true
			}
		}, {
			path: '/updatepassword',
			name: '修改密码',
			component: () => import('../views/updatepassword.vue')
		}
		
		,{
			path: '/keyanrenyuanCenter',
			name: '科研人员个人中心',
			component: keyanrenyuanCenter
		}
		,{
			path: '/weihurenyuanCenter',
			name: '维护人员个人中心',
			component: weihurenyuanCenter
		}
		,{
			path: '/shiyanshuju',
			name: '实验数据',
			component: shiyanshuju
		}
		,{
			path: '/shebeiweihu',
			name: '设备维护',
			component: shebeiweihu
		}
		,{
			path: '/yangpinxinxi',
			name: '样品信息',
			component: yangpinxinxi
		}
		,{
			path: '/yusuanyuzijin',
			name: '预算与资金',
			component: yusuanyuzijin
		}
		,{
			path: '/keyanxiangmu',
			name: '科研项目',
			component: keyanxiangmu
		}
		,{
			path: '/weihurichenganpai',
			name: '维护日程安排',
			component: weihurichenganpai
		}
		,{
			path: '/shiyanshebei',
			name: '实验设备',
			component: shiyanshebei
		}
		,{
			path: '/haocaikucun',
			name: '耗材库存',
			component: haocaikucun
		}
		]
	},
	{
		path: '/keyanrenyuanRegister',
		name: '科研人员注册',
		component: keyanrenyuanRegister
	},
	{
		path: '/weihurenyuanRegister',
		name: '维护人员注册',
		component: weihurenyuanRegister
	},
]

const router = createRouter({
	history: createWebHashHistory(process.env.BASE_URL),
	routes
})

export default router
