<script>
import { ref, provide } from 'vue';

export default {
  setup() {
    const isLeftDrawerOpen = ref(false);
    const divActivo = ref('login');
    provide('divActivo', divActivo);
    return {
      isLeftDrawerOpen,
      divActivo,
      toggleDrawer() {
        isLeftDrawerOpen.value = !isLeftDrawerOpen.value;
      }
    };
  }
}
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
        <q-route-tab to="/Offline" label="OFFLINE" />
        <q-route-tab to="/Online" label="ONLINE" />
        <q-route-tab to="/Jocs" label="JOCS" />
        <q-route-tab to="/Apunts" label="APUNTS" />
        <q-route-tab to="/login" label="LOGIN" />
      </q-tabs>
    </q-header>

    <q-drawer v-if="divActivo === 'login'"  show-if-above v-model="isLeftDrawerOpen" side="left" bordered>
  <q-tabs vertical>
    <q-route-tab to="/Puntuaciones" label="PUNTUACIONES"/>
    <q-route-tab to="/Configuracion" label="CONFIGURACION"/>
    <q-route-tab
      to="/Cerrar-sesion"
      label="Cerrar sesión"
      class="text-red"
    />
  </q-tabs>
</q-drawer>
    <q-page-container>
      <router-view />
    </q-page-container>

  </q-layout>
</template>
