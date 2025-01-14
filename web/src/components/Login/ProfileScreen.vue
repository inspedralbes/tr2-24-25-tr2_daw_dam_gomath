<template>
    <q-page class="flex flex-center">
      <q-card class="q-pa-md" style="width: 300px;">
        <q-card-section>
          <div class="text-center">
            <q-avatar size="80px" class="q-mb-md">
              <img :src="avatarUrl" alt="Profile Picture" />
            </q-avatar>
  
            <q-btn dense flat label="Generar nou avatar" @click="toggleInput" class="q-mb-md" style="background-color: #95918f;"/>
  
            <q-input v-if="isEditing" v-model="avatarId" label="Avatar ID" outlined dense @input="updateAvatarUrl"class="q-mb-md"/>
  
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
  import { ref, computed } from 'vue';
  import { useAppStore } from '@/stores/app';
  import { useRouter } from 'vue-router';
  
  export default {
    name: 'ProfileScreen',
    setup() {
      const appStore = useAppStore();
      const router = useRouter();
  
      const user = appStore.loginInfo;
  
      const avatarId = ref(user.username || 'default-user');
      const avatarUrl = computed(() => `https://api.multiavatar.com/${avatarId.value}.png`);
  
      const isEditing = ref(false);
  
      const toggleInput = () => {
        isEditing.value = !isEditing.value;
      };
  
      const updateAvatarUrl = () => {
        avatarUrl.value = `https://api.multiavatar.com/${avatarId.value}.png`;
  
        localStorage.setItem('avatarUrl', avatarUrl.value);
        appStore.setLoginInfo({
          loggedIn: true,
          token: user.token,
          username: user.username,
          email: user.email,
          role: user.role,
          image: avatarUrl.value, 
        });
      };
  
      const formattedDate = new Date().toLocaleDateString('ca-ES', {
        year: 'numeric',
        month: 'long',
        day: 'numeric',
      });
  
      const logout = async () => {
        try {
          const token = appStore.loginInfo.token;
          const response = await fetch('http://localhost:8000/api/userLogout', {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json',
              'Authorization': `Bearer ${token}`,
            },
          });
  
          if (!response.ok) {
            throw new Error('Error al cerrar sesión');
          }
  
          appStore.logout();
  
          router.push('/login');
        } catch (error) {
          console.error('Error al cerrar sesión:', error);
        }
      };
  
      return {
        user,
        formattedDate,
        avatarUrl,
        avatarId,
        isEditing,
        toggleInput,
        updateAvatarUrl,
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
  