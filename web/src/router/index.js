import { createRouter, createWebHistory } from 'vue-router';
import Login from '../components/Login/LoginScreen.vue';
import Offline from '../components/Offline/OfflineScreen.vue';
import Online from '../components/Online/OnlineScreen.vue';
import Apunts from '../components/Apuntes/ApuntsScreen.vue';
import Jocs from '../components/Jocs/JocsScreen.vue';
import Home from '../components/Homa/HomeScreen.vue';
import Register from '../components/Login/RegisterScreen.vue';
import prePartida from '../components/Offline/PartidaOffline/prePartidaScreen.vue';
import Partida from '../components/Offline/PartidaOffline/PartidaScreen.vue';

import Sudoku from '../components/Jocs/sudoku/sudoku.vue';

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
      path: '/Offline/Partida',
      name: 'Partida',
      component: Partida,
    },
    {
      path: '/Jocs/sudoku',
      name: 'Sudoku',
      component: Sudoku,
    }
  ],
});

export default router;
