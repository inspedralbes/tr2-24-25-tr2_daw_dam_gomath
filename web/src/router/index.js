import { createRouter, createWebHistory } from 'vue-router'
import Login from '../components/LoginScreen.vue'
import Offline from '../components/OfflineScreen.vue'
import Online from '../components/OnlineScreen.vue'
import Apunts from '../components/ApuntsScreen.vue'
import Jocs from '../components/JocsScreen.vue'
import Home from '../components/HomeScreen.vue'
import Register from '../components/RegisterScreen.vue';
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
      path: '/register',
      name: 'register',
      component: Register,
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
    },
    {
      path: '/Jocs',
      name: 'Jocs',
      component: Jocs,
    },
    {
      path: '/Apunts',
      name: 'Apunts',
      component: Apunts,
    }
  ],
})

export default router
