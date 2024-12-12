import { createRouter, createWebHistory } from 'vue-router'
import Login from '../components/Login/LoginScreen.vue'
import Offline from '../components/Offline/OfflineScreen.vue'
import Online from '../components/Online/OnlineScreen.vue'
import Apunts from '../components/Apuntes/ApuntsScreen.vue'
import Jocs from '../components/Jocs/JocsScreen.vue'
import Home from '../components/Homa/HomeScreen.vue'
import Register from '../components/Login/RegisterScreen.vue'
import prePartida from '../components/Offline/PartidaOffline/prePartidaScreen.vue'
import PartidaNumero from '../components/Offline/PartidaOffline/PartidaNumeroScreen.vue'
import PartidaCrono from '../components/Offline/PartidaOffline/PartidaCronoScreen.vue'
import FinPartida from '../components/Offline/PartidaOffline/FinPartidaScreen.vue'
import PartidaFallos from '../components/Offline/PartidaOffline/PartidaFallosScreen.vue'
import Logout from '../components/Login/LogoutScreen.vue'
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
      path: '/Offline/prePartida',
      name: 'prePartida',
      component: prePartida,
    },
    {
      path: '/Offline/PartidaNumero',
      name: 'PartidaNumero',
      component: PartidaNumero,
    },
    {
      path: '/Offline/PartidaCrono',
      name: 'PartidaCrono',
      component: PartidaCrono,
    },
    {
      path: '/Offline/PartidaFallos',
      name: 'PartidaFallos',
      component: PartidaFallos,
    },
    {
      path: '/Offline/FinPartida',
      name: 'FinPartida',
      component: FinPartida,
    },
    {
      path: '/logout',
      name: 'Logout',
      component: Logout,
    },
  ],
})

export default router
