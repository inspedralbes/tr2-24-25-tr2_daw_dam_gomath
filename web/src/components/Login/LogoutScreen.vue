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
            <q-btn label="SI" color="red" icon="logout" @click="logout" />
          </q-card-section>
        </q-card>
      </q-page-container>
    </q-layout>
  </q-page>
</template>

<script>
// Importa Pinia si aún no lo has hecho en tu componente
import { useAppStore } from '@/stores/app';

export default {
  data() {
    return {
      name: 'LogoutPage',
    };
  },
  methods: {
    async logout() {
      try {
        const response = await fetch('127.0.0.1:8000/api/logout', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          credentials: 'include',
        });

        if (!response.ok) {
          throw new Error('Error al cerrar sesión');
        }

        // Limpiar la sesión en Pinia
        const appStore = useAppStore();
        appStore.logout();

        // Redirigimos al usuario a la página de login
        this.$router.push('/login');
      } catch (error) {
        console.error('Error al cerrar sesión:', error);
      }
    },
  },
};
</script>
