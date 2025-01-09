import { createRouter, createWebHistory } from 'vue-router'
import Login from '../components/Login/LoginScreen.vue'
import Offline from '../components/Offline/OfflineScreen.vue'
import Online from '../components/Online/OnlineScreen.vue'
import Apunts from '../components/Apuntes/apunts.vue'
import Jocs from '../components/Jocs/JocsScreen.vue'
import Home from '../components/Home/HomeScreen.vue'
import Register from '../components/Login/RegisterScreen.vue'
import prePartida from '../components/Offline/PartidaOffline/prePartidaScreen.vue'
import PartidaNumero from '../components/Offline/PartidaOffline/PartidaNumeroScreen.vue'
import PartidaCrono from '../components/Offline/PartidaOffline/PartidaCronoScreen.vue'
import FinPartida from '../components/Offline/PartidaOffline/FinPartidaScreen.vue'
import PartidaFallos from '../components/Offline/PartidaOffline/PartidaFallosScreen.vue'
import Logout from '../components/Login/LogoutScreen.vue'
import Codigo from '../components/Jocs/codigo/game.vue'
import Sudoku from '../components/Jocs/sudoku/sudokuScreen.vue';
import PartidaNumeroOnline from '@/components/Online/PartidaOnline/PartidaNumeroOnlineScreen.vue'
import SalaEspera from '@/components/Online/SalaEsperaScreen.vue'
import prePartidaOnline from '@/components/Online/PartidaOnline/prePartidaOnline.vue'
import CodigoPartida from '@/components/Online/PartidaOnline/codigoScreen.vue'
import PartidaCronoOnline from '@/components/Online/PartidaOnline/PartidaCronoOnlineScreen.vue'
import PartidaFallosOnline from '@/components/Online/PartidaOnline/PartidaFallosOnlineScreen.vue'
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
    {
      path: '/Jocs/codigo',
      name: 'Codigo',
      component: Codigo,
    },
    {
      path: '/Jocs/sudoku',
      name: 'Sudoku',
      component: Sudoku,
    },
    {
      path: '/SalaEspera',
      name: 'SalaEspera',
      component: SalaEspera,
    },
    {
      path: '/Online/PartidaNumeroOnline',
      name: 'PartidaNumeroOnline',
      component: PartidaNumeroOnline,
    },
    {
      path: '/Online/PartidaCronoOnline',
      name: 'PartidaCronoOnline',
      component: PartidaCronoOnline,
    },
    {
      path: '/Online/PartidaFallosOnline',
      name: 'PartidaFallosOnline',
      component: PartidaFallosOnline,
    },
    {
      path: '/Online/prePartidaOnline',
      name: 'prePartidaOnline',
      component: prePartidaOnline,
    },
    {
      path: '/Online/CodigoPartida',
      name: 'CodigoPartida',
      component: CodigoPartida,
    },
    {
      path: '/Apuntes',
      name: 'Apunts',
      component: Apunts,
    },
  ],
});

export default router;
