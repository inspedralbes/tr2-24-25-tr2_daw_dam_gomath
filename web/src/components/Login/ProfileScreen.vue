<template>
    <q-page class="flex flex-center">
      <q-card class="q-pa-md q-ma-md shadow-2" style="width: 300px; text-align: center;">
        <q-card-section>
          <img :src="avatar" alt="Avatar" style="border-radius: 50%; width: 100px; height: 100px;" />
          <h3>Hola, {{ username }}</h3>
        </q-card-section>
        <q-card-actions align="center">
        <q-btn 
          label="Cerrar sesión" 
          color="red" 
          @click="goToLogout" 
        />
      </q-card-actions>
      </q-card>
    </q-page>
  </template>
  
  <script>
  import { useRouter } from 'vue-router';
  import { useAppStore } from '@/stores/app';
  
  export default {
    setup() {
      const appStore = useAppStore();
      const router = useRouter();
      const username = appStore.loginInfo.username || 'Usuario';
      const avatar = appStore.loginInfo.avatar || 'https://via.placeholder.com/100';
  
      const goToLogout = () => {
      router.push('/Logout'); 
      };

      return {
        username,
        avatar,
        goToLogout,
      };
    },
  };
  </script>
  