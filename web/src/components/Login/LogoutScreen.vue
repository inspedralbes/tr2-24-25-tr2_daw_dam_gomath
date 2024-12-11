<template>
  <q-page>
    <!-- Contenedor principal -->
    <q-layout view="lHh Lpr lFf">

      <!-- Contenido de Logout -->
      <q-page-container>
        <q-card class="q-pa-md q-ma-md shadow-2">
          <q-card-section style="text-align: center;">
            <h3>¿Segur que vols tancar sesión?</h3>
            <h6>No podràs unir-te a cap sessió si no t'has loguejat prèviament.</h6>
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
// Importa el store de Pinia donde guardas el token
import { useAppStore } from '@/stores/app';

export default {
  methods: {
    async logout() {
      try {
        // Obtener el token desde Pinia
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

        // Limpiar la sesión en Pinia
        appStore.logout();


        if (!token) {
          this.$router.push('/login');
          return;
        }
        //this.$router.push('/login');
      } catch (error) {
        console.error('Error al cerrar sesión:', error);
      }
    },
  },
};
</script>
