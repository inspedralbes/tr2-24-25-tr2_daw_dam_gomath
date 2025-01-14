<template>
    <q-page class="flex flex-center">
      <q-card class="q-pa-md" style="width: 300px;">
        <q-card-section>
          <div class="text-center">
            <q-avatar size="80px" class="q-mb-md">
              <img :src="user.image" alt="Profile Picture" />
            </q-avatar>
            <div class="text-h6">{{ user.username }}</div>
            <div class="text-subtitle2">{{ user.email }}</div>
          </div>
        </q-card-section>
  
        <q-card-section>
          <q-list>
            <q-item>
              <q-item-section>Rol</q-item-section>
              <q-item-section side>{{ user.role }}</q-item-section>
            </q-item>
            <q-item>
              <q-item-section>Data de registre</q-item-section>
              <q-item-section side>{{ formattedDate }}</q-item-section>
            </q-item>
          </q-list>
        </q-card-section>
  
        <q-card-actions align="right">
          <q-btn label="Tancar sessió" color="negative" @click="logout" />
        </q-card-actions>
      </q-card>
    </q-page>
  </template>
  
  <script>
  import { useAppStore } from '@/stores/app';
  import { useRouter } from 'vue-router';
  
  export default {
    name: 'ProfileScreen',
    setup() {
      const appStore = useAppStore();
      const router = useRouter();
  
      const user = appStore.loginInfo;
  
      const formattedDate = new Date().toLocaleDateString('ca-ES', {
        year: 'numeric',
        month: 'long',
        day: 'numeric',
      });
  
      const logout = () => {
        appStore.clearLoginInfo();
        router.push('/login');
      };
  
      return {
        user,
        formattedDate,
        logout,
      };
    },
  };
  </script>
  
  <style scoped>
  .q-avatar img {
    border-radius: 50%;
  }
  .text-center {
    text-align: center;
  }
  </style>
  