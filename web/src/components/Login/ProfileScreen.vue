<template>
    <q-page class="flex flex-center">
      <q-card class="q-pa-md q-ma-md shadow-2" style="width: 300px; text-align: center;">
        <q-card-section>
          <img :src="avatar" alt="Avatar" style="border-radius: 50%; width: 100px; height: 100px;" />
          <h3>Hola, {{ username }}</h3>
        </q-card-section>
      </q-card>
    </q-page>
  </template>
  
  <script>
  import { useAppStore } from '@/stores/app';
  
  export default {
    setup() {
      const appStore = useAppStore();
      const username = appStore.loginInfo.username || 'Usuario';
      const avatar = appStore.loginInfo.avatar || 'https://via.placeholder.com/100';
  
      return {
        username,
        avatar,
      };
    },
  };
  </script>
  