<template>
  <q-page>
    <!-- Contenedor principal -->
    <q-layout view="lHh Lpr lFf">

      <!-- Contenido de Logout -->
      <q-page-container>
        <q-card class="q-pa-md q-ma-md shadow-2">
          <q-card-section style="text-align: center;">
            <p style="font-size: 20px; font-weight: bold;">Estàs segur que vols tancar la sessió?</p>
            <img src="@/assets/img/adios.gif" alt="Adiós" />
          </q-card-section>
          <q-card-section class="text-center">
            <q-btn label="SI" color="red" icon="logout" @click="logout()" />
          </q-card-section>
        </q-card>

      </q-page-container>
    </q-layout>
  </q-page>
</template>

<script>
import { useAppStore } from '@/stores/app';

export default {
  methods: {
    async logout() {
      try {
        const appStore = useAppStore();
        const token = appStore.loginInfo.token;
        console.log('ya tengo el token: ', token);
        console.log('antes del fetch');

        const response = await fetch('http://localhost:8000/api/userLogout', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${token}`,
          },
        });

        console.log(response);

        if (!response.ok) {
          throw new Error('Error al cerrar sesión');
        }

        console.log('antes de limpiar en pinia');
        appStore.logout();
        this.$router.push('/');
      } catch (error) {
        console.error('Error al cerrar sesión:', error);
      }
    },  
  }
};
</script>
<style>
.goodbye-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: auto;
  background-color: white;
}
.goodbye-container img {
  max-width: 100%;
  height: auto;
}
</style>