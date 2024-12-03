import { createRouter, createWebHistory } from 'vue-router'
import Login from '../components/LoginScreen.vue'
import Offline from '../components/OfflineScreen.vue'
import Online from '../components/OnlineScreen.vue'
import Home from '../components/HomeScreen.vue'
const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
    },
    {
      path: '/login',
      name: 'login',
      component: Login,
    },
    {
      path: '/Offline',
      name: 'Offline',
      component: Offline,
    },
    {
      path: '/Online',
      name: 'Online',
      component: Online,
    }
  ],
})

export default router
