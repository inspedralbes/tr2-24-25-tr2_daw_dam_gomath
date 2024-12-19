<script>
import { ref, provide, onMounted, computed } from 'vue';
import { useRouter, useRoute } from 'vue-router';
import { defineStore, storeToRefs } from 'pinia';
import { useAppStore } from '@/stores/app';

const localStorageTipoPartida = 'tipoPartida';

export const useTipoPartidaStore = defineStore(localStorageTipoPartida, () => {
  const router = useRouter();

  const tipoPartida = ref(
    JSON.parse(localStorage.getItem(localStorageTipoPartida)) || {
      operacion: 'suma',
      modo: 'numero',
      cantidad: 10,
      dificultat: 'facil',
    }
  );

  function updateLocalStorage() {
    localStorage.setItem(localStorageTipoPartida, JSON.stringify(tipoPartida.value));
  };

  function setOperacion(operacion) {
    tipoPartida.value.operacion = operacion;
    updateLocalStorage();
    console.log('Hola soy operacion', operacion, tipoPartida);
  }

  function setModo(modo) {
    tipoPartida.value.modo = modo;
    updateLocalStorage();
    console.log('Hola soy modo', modo, tipoPartida);
  }

  function setCantidad(cantidad) {
    tipoPartida.value.cantidad = cantidad;
    updateLocalStorage();
    console.log('Hola soy cantidad', cantidad, tipoPartida);
    if (tipoPartida.value.modo == 'numero') {
      router.push('/Offline/PartidaNumero');
    }
    else if (tipoPartida.value.modo == 'crono') {
      router.push('/Offline/PartidaCrono');
    } else if (tipoPartida.value.modo == 'fallos') {
      router.push('/Offline/PartidaFallos');
    }
  }
  function setCantidadOnline(cantidad){
    tipoPartida.value.cantidad = cantidad;
    updateLocalStorage();
    console.log('Hola soy cantidad', cantidad, tipoPartida);
    if (tipoPartida.value.modo == 'numero') {
      router.push('/Online/CodigoPartida');
    }
    else if (tipoPartida.value.modo == 'crono') {
      router.push('/Online/CodigoPartida');
    } else if (tipoPartida.value.modo == 'fallos') {
      router.push('/Online/CodigoPartida');
    }
  }

  function setDificultat(dificultat) {
    tipoPartida.value.dificultat = dificultat;
    updateLocalStorage();
    console.log('Hola soy dificultad', dificultat, tipoPartida);
  }

  return {
    tipoPartida,
    setOperacion,
    setModo,
    setCantidad,
    setDificultat,
    setCantidadOnline,
  };
});

export default {
  setup() {
    const isLeftDrawerOpen = ref(false);
    const divActivo = ref('');
    provide('divActivo', divActivo);
    const router = useRouter();
    const route = useRoute();
    const appStore = useAppStore();
    const { isLoggedIn } = storeToRefs(appStore);

    const tabs = computed(() => {
      const baseTabs = [
        { to: '/', label: 'HOME' },
        { to: '/Offline', label: 'OFFLINE' },
        { to: '/SalaEspera', label: 'ONLINE' },
        { to: '/Jocs', label: 'JOCS' },
        { to: '/Apunts', label: 'APUNTS' },
      ];

      if (!isLoggedIn.value) {
        baseTabs.push({ to: '/login', label: 'LOGIN' });
      } else {
        baseTabs.push({
          to: '/logout',
          label: 'LOGOUT',
          style: 'background-color: #ff4d4d; color: white; border-top-left-radius: 5px; border-top-right-radius: 5px;'
        });
      }

      return baseTabs;
    });

    const { tipoPartida, setDificultat } = useTipoPartidaStore();
    const updateDivActivo = () => {
      const currentRoute = route.path;
      divActivo.value = currentRoute === '/login' ? 'login' : '';
    };

    onMounted(updateDivActivo);
    router.afterEach(updateDivActivo);

    return {
      color: ref(tipoPartida.dificultat),
      isLeftDrawerOpen,
      divActivo,
      tabs,
      isLoggedIn,
      setDificultat,
      toggleDrawer() {
        isLeftDrawerOpen.value = !isLeftDrawerOpen.value;
      },
    };
  },
};
</script>

<template>
  <q-layout view="hHh lpR fFf">
    <q-header elevated class="bg-primary text-white" height-hint="98">
      <q-toolbar>
        <q-btn dense flat round icon="menu" @click="toggleDrawer" />
        <q-toolbar-title>
          <q-avatar>
            <img src="./assets/img/infinity-math-icon-2ab72a.webp">
          </q-avatar>
          GoMath
        </q-toolbar-title>
      </q-toolbar>

      <q-tabs align="center">
        <q-route-tab v-for="tab in tabs" :key="tab.label" :to="tab.to" :label="tab.label" :style="tab.style || ''" />
      </q-tabs>
    </q-header>

    <q-drawer v-if="divActivo === 'login' || divActivo === 'register'" show-if-above v-model="isLeftDrawerOpen"
      side="left" bordered>
      <q-tabs vertical>
        <q-route-tab to="/register" label="Registra't" />
        <q-route-tab to="/Puntuacions" label="Puntuacions" />
        <q-route-tab to="/Configuracio" label="Configuració" />
        <q-route-tab to="/Cerrar-sesion" label="Tancar sessió" class="text-red" />
      </q-tabs>
    </q-drawer>

    <q-drawer v-if="divActivo === 'partida'" show-if-above v-model="isLeftDrawerOpen" side="left" bordered>
      <q-tabs vertical>
        <q-list>
          <q-item tag="label" v-ripple>
            <q-item-section avatar>
              <q-radio size="45px" v-model="color" val="teal" color="blue"
                @update:model-value="setDificultat('fácil')" />
            </q-item-section>
            <q-item-section>
              <q-item-label>Fàcil</q-item-label>
            </q-item-section>
          </q-item>

          <q-item tag="label" v-ripple>
            <q-item-section avatar>
              <q-radio size="45px" v-model="color" val="orange" color="orange"
                @update:model-value="setDificultat('intermedio')" />
            </q-item-section>
            <q-item-section>
              <q-item-label>Intermig</q-item-label>
            </q-item-section>
          </q-item>

          <q-item tag="label" v-ripple>
            <q-item-section avatar>
              <q-radio size="45px" v-model="color" val="cyan" color="red"
                @update:model-value="setDificultat('difícil')" />
            </q-item-section>
            <q-item-section>
              <q-item-label>Difícil</q-item-label>
            </q-item-section>
          </q-item>
        </q-list>
      </q-tabs>
    </q-drawer>

    <q-drawer v-if="divActivo === 'offline'" show-if-above v-model="isLeftDrawerOpen" side="left" bordered>
      <q-tabs vertical>
        <q-route-tab to="/Offline/prePartida" label="SUMES" />
        <q-route-tab to="/Offline/prePartida" label="RESTES" />
        <q-route-tab to="/Offline/prePartida" label="MULTIPLICACIÓNS" />
        <q-route-tab to="/Offline/prePartida" label="DIVISIÓNS" />
      </q-tabs>
    </q-drawer>

    <q-drawer v-if="divActivo === 'apunts'" show-if-above v-model="isLeftDrawerOpen" side="left" bordered>
      <q-tabs vertical>
        <q-route-tab to="/tablasMultiplicar" label="TAULES DE MULTIPLICAR" />
        <q-route-tab to="/equacions" label="EQUACIONS" />
        <q-route-tab to="/pitagoras" label="PITAGORAS" />
      </q-tabs>
    </q-drawer>

    <q-drawer v-if="divActivo === 'jocs'" show-if-above v-model="isLeftDrawerOpen" side="left" bordered>
      <q-tabs vertical>
        <q-route-tab to="/jocs/sudoku" label="SUDOKU" />
        <q-route-tab to="/jocs/codigo" label="Adivina el codigo" />
        <q-route-tab to="/nerdle" label="Nerdle(cambiar nombre)" />
      </q-tabs>
    </q-drawer>

    <q-drawer v-if="divActivo === 'online'" show-if-above v-model="isLeftDrawerOpen" side="left" bordered>
      <q-tabs vertical>
        <q-route-tab to="/sumaOffline" label="SUMES" />
        <q-route-tab to="/restaOffline" label="RESTA" />
        <q-route-tab to="/multiplicacionOffline" label="MULTIPLICACIÓNS" />
        <q-route-tab to="/divisionOffline" label="DIVISIÓNS" />
      </q-tabs>
    </q-drawer>

    <q-drawer v-if="divActivo === 'partida'" show-if-above v-model="isLeftDrawerOpen" side="left" bordered>
      <q-tabs vertical>
        <q-list>
          <q-item tag="label" v-ripple>
            <q-item-section avatar>
              <q-radio v-model="color" val="teal" color="blue" @update:model-value="setDificultat('fácil')" />
            </q-item-section>
            <q-item-section>
              <q-item-label>Fàcil</q-item-label>
            </q-item-section>
          </q-item>

          <q-item tag="label" v-ripple>
            <q-item-section avatar>
              <q-radio v-model="color" val="orange" color="orange" @update:model-value="setDificultat('intermedio')" />
            </q-item-section>
            <q-item-section>
              <q-item-label>Intermig</q-item-label>
            </q-item-section>
          </q-item>

          <q-item tag="label" v-ripple>
            <q-item-section avatar>
              <q-radio v-model="color" val="cyan" color="red" @update:model-value="setDificultat('difícil')" />
            </q-item-section>
            <q-item-section>
              <q-item-label>Difícil</q-item-label>
            </q-item-section>
          </q-item>
        </q-list>
      </q-tabs>
    </q-drawer>

    <q-page-container>
      <router-view />
    </q-page-container>

    <q-footer elevated style="height: calc(50px + 5px);">
      <div class="text-center py-2">
        <p>&#169; 2024 GoMath. Tots els drets reservats. <a href="https://www.institutpedralbes.cat"
            target="_blank" class="text-white">institutpedralbes.cat</a></p>
        <p style="font-size: 10px; color: #F7FFF7;">
          La informació continguda en aquesta aplicació és només per a fins educatius.
          No ens responsabilitzem pel seu ús inapropiat.
        </p>
      </div>
    </q-footer>
  </q-layout>
</template>
