<script>
import { ref, provide, onMounted } from 'vue';
import { useRouter, useRoute } from 'vue-router';
import { useAppStore } from './stores/app.js';

import { defineStore } from 'pinia';
export const useTipoPartidaStore = defineStore('tipoPartida', () => {
  const router = useRouter();
  const tipoPartida = ref({
    operacion: 'suma',
    modo: 'numero',
    cantidad: '10p',
    dificultat: 'facil',
  });
  console.log('Hola soy Tipo de partida', tipoPartida);

  function setOperacion(operacion) {
    tipoPartida.value.operacion = operacion;
    console.log('Hola soy operacion', operacion, tipoPartida);
  }

  function setModo(modo) {
    tipoPartida.value.modo = modo;
    console.log('Hola soy modo', modo, tipoPartida);
  }

  function setCantidad(cantidad) {
    tipoPartida.value.cantidad = cantidad;
    console.log('Hola soy cantidad', cantidad, tipoPartida);
    router.push('/Offline/Partida');
  }

  function setDificultat(dificultat) {
    tipoPartida.value.dificultat = dificultat;
    console.log('Hola soy dificultad', dificultat, tipoPartida);
  }

  return {
    tipoPartida,
    setOperacion,
    setModo,
    setCantidad,
    setDificultat, // Nueva función para actualizar la dificultad
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

    const { tipoPartida, setDificultat } = useTipoPartidaStore(); // Accede al estado y función de la tienda

    const updateDivActivo = () => {
      const currentRoute = route.path;
      if (currentRoute === '/login') {
        divActivo.value = 'login';
      } else {
        divActivo.value = '';
      }
    };

    onMounted(updateDivActivo);
    router.afterEach(updateDivActivo);

    return {
      color: ref(tipoPartida.dificultat), // Sincronizamos con el estado de dificultad
      isLeftDrawerOpen,
      divActivo,
      appStore,
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

    <q-tabs align="left">
      <q-route-tab to="/" label="HOME" />
      <q-route-tab to="/Offline" label="OFFLINE" />
      <q-route-tab to="/Online" label="ONLINE" />
      <q-route-tab to="/Jocs" label="JOCS" />
      <q-route-tab to="/Apunts" label="APUNTS" />

      <!-- Mostrar solo si el usuario NO está logueado -->
      <q-route-tab v-if="!appStore.isLoggedIn" to="/login" label="LOGIN" />
    </q-tabs>
  </q-header>
    <q-drawer v-if="divActivo === 'login' || divActivo === 'register'" show-if-above v-model="isLeftDrawerOpen"
      side="left" bordered>
      <q-tabs vertical>
        <q-route-tab to="/register" label="REGISTRATE" />
        <q-route-tab to="/Puntuacions" label="Puntuacións" />
        <q-route-tab to="/Configuracio" label="CONFIGURACIÓ" />
        <q-route-tab to="/Cerrar-sesion" label="Tancar sessió" class="text-red" />
      </q-tabs>
</q-drawer>
<q-drawer v-if="divActivo === 'partida'" show-if-above v-model="isLeftDrawerOpen" side="left" bordered>
  <q-tabs vertical>
    <q-list>
      <q-item tag="label" v-ripple>
        <q-item-section avatar>
          <q-radio
            v-model="color"
            val="teal"
            color="blue"
            @update:model-value="setDificultat('fácil')"
          />
        </q-item-section>
        <q-item-section>
          <q-item-label>Fácil</q-item-label>
        </q-item-section>
      </q-item>

      <q-item tag="label" v-ripple>
        <q-item-section avatar>
          <q-radio
            v-model="color"
            val="orange"
            color="orange"
            @update:model-value="setDificultat('intermedio')"
          />
        </q-item-section>
        <q-item-section>
          <q-item-label>Intermedio</q-item-label>
        </q-item-section>
      </q-item>

      <q-item tag="label" v-ripple>
        <q-item-section avatar>
          <q-radio
            v-model="color"
            val="cyan"
            color="red"
            @update:model-value="setDificultat('difícil')"
          />
        </q-item-section>
        <q-item-section>
          <q-item-label>Difícil</q-item-label>
        </q-item-section>
      </q-item>
    </q-list>
  </q-tabs>
</q-drawer>
<q-drawer v-if="divActivo === 'offline'"  show-if-above v-model="isLeftDrawerOpen" side="left" bordered>
  <q-tabs vertical>
        <q-route-tab to="/Offline/prePartida" label="SUMA" />
        <q-route-tab to="/Offline/prePartida" label="RESTA" />
        <q-route-tab to="/Offline/prePartida" label="MULTIPLICACION" />
        <q-route-tab to="/Offline/prePartida" label="DIVISION" />
      </q-tabs>
</q-drawer>
<q-drawer v-if="divActivo === 'apunts'"  show-if-above v-model="isLeftDrawerOpen" side="left" bordered>
  <q-tabs vertical>
    <q-route-tab to="/tablasMultiplicar" label="TAULES DE MULTIPLICAR"/>
    <q-route-tab to="/equacions" label="EQUACIONS"/>
    <q-route-tab to="/pitagoras" label="PITAGORAS"/>
  </q-tabs>
</q-drawer>
<q-drawer v-if="divActivo === 'jocs'"  show-if-above v-model="isLeftDrawerOpen" side="left" bordered>
  <q-tabs vertical>
    <q-route-tab to="/ocaMatematica" label="Oca Matematica"/>
    <q-route-tab to="/buscaminas" label="BUSCAMINAS"/>
  </q-tabs>
</q-drawer>
<q-drawer v-if="divActivo === 'online'"  show-if-above v-model="isLeftDrawerOpen" side="left" bordered>
  <q-tabs vertical>
    <q-route-tab to="/sumaOffline" label="SUMA"/>
    <q-route-tab to="/restaOffline" label="RESTA"/>
    <q-route-tab to="/multiplicacionOffline" label="MULTIPLICACION"/>
    <q-route-tab to="/divisionOffline" label="DIVISION"/>
  </q-tabs>
    </q-drawer>

  <!-- Drawers condicionales -->
  <q-drawer v-if="divActivo === 'login' || divActivo === 'register'" show-if-above v-model="isLeftDrawerOpen" side="left" bordered>
    <q-tabs vertical>
      <q-route-tab to="/register" label="REGISTRATE" />
      <q-route-tab to="/Puntuacions" label="Puntuaciones" />
      <q-route-tab to="/Configuracio" label="CONFIGURACIÓ" />
      <q-route-tab to="/Cerrar-sesion" label="Tancar sessió" class="text-red" />
    </q-tabs>
  </q-drawer>

  <q-drawer v-if="divActivo === 'offline'" show-if-above v-model="isLeftDrawerOpen" side="left" bordered>
    <q-tabs vertical>
      <q-route-tab to="/Offline/Partida" label="SUMA" />
      <q-route-tab to="/Offline/Partida" label="RESTA" />
      <q-route-tab to="/Offline/Partida" label="MULTIPLICACION" />
      <q-route-tab to="/Offline/Partida" label="DIVISION" />
    </q-tabs>
  </q-drawer>

  <q-drawer v-if="divActivo === 'apunts'" show-if-above v-model="isLeftDrawerOpen" side="left" bordered>
    <q-tabs vertical>
      <q-route-tab to="/tablasMultiplicar" label="TAULES DE MULTIPLICAR"/>
      <q-route-tab to="/equacions" label="EQUACIONS"/>
      <q-route-tab to="/pitagoras" label="PITAGORAS"/>
    </q-tabs>
  </q-drawer>
    <q-footer elevated style="height: calc(50px + 5px);">
      <div class="text-center py-2">
        <p>&#169; 2024 GoMath. Todos los derechos reservados. <a href="https://www.institutpedralbes.cat"
            target="_blank" class="text-white">institutpedralbes.cat</a></p>

        <p style="font-size: 10px; color: #F7FFF7;">
          La información contenida en esta aplicación es solo para fines educativos. No nos responsabilizamos por su uso
          inapropiado.
        </p>

  <q-drawer v-if="divActivo === 'jocs'" show-if-above v-model="isLeftDrawerOpen" side="left" bordered>
    <q-tabs vertical>
      <q-route-tab to="/ocaMatematica" label="Oca Matematica"/>
      <q-route-tab to="/buscaminas" label="BUSCAMINAS"/>
    </q-tabs>
  </q-drawer>

  <q-drawer v-if="divActivo === 'online'" show-if-above v-model="isLeftDrawerOpen" side="left" bordered>
    <q-tabs vertical>
      <q-route-tab to="/sumaOffline" label="SUMA"/>
      <q-route-tab to="/restaOffline" label="RESTA"/>
      <q-route-tab to="/multiplicacionOffline" label="MULTIPLICACION"/>
      <q-route-tab to="/divisionOffline" label="DIVISION"/>
    </q-tabs>
  </q-drawer>

  <q-page-container>
    <router-view />
  </q-page-container>

  <q-footer elevated style="height: calc(50px + 5px);">
    <div class="text-center py-2">
      <p>&#169; 2024 GoMath. Todos los derechos reservados. <a href="https://www.institutpedralbes.cat"
          target="_blank" class="text-white">institutpedralbes.cat</a></p>
      <p style="font-size: 10px; color: #F7FFF7;">
        La información contenida en esta aplicación es solo para fines educativos. No nos responsabilizamos por su uso
        inapropiado.
      </p>
    </div>
  </q-footer>

</q-layout>



</template>
