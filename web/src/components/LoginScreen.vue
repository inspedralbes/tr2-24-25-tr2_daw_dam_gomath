<template>
  <q-page class="flex flex-center">
    <q-card class="q-pa-md" style="width: 300px;">
      <q-card-section>
        <div class="text-h6">Iniciar sesió</div>
        <div class="text-subtitle2">Ingresa les teves credencials</div>
      </q-card-section>

      <q-card-section>
        <q-input
          v-model="username"
          label="Nom d'usuari"
          outlined
          dense
        />
        <q-input
          v-model="password"
          label="Contrasenya"
          type="password"
          outlined
          dense
          class="q-mt-md"
        />
      </q-card-section>

      <q-card-actions align="right">
        <q-btn label="Iniciar sesió" color="primary" @click="login" />
      </q-card-actions>
    </q-card>
  </q-page>
</template>

<style>

</style>

<script>
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import { useAppStore } from '@/stores/app'

export default {
  name: 'LoginPage',
  setup() {
    const username = ref('');
    const password = ref('');
    const router = useRouter();

    function login(){
      if (username.value === 'user' && password.value === '1234') {
        // Redirige a la página de votaciones
        router.push('/Offline');

        // Almacena la información en el store
        const appStore = useAppStore();
        appStore.setLoginInfo({
            loggedIn: true,
            username: username.value,
            image: 'https://randomuser.me/api/portraits/thumb/women/56.jpg', // Reemplaza con la URL real del avatar si la tienes
          });

      } else {
        alert("Credenciales incorrectas")
      }
    };

    return {
      username,
      password,
      login,
    };
  },
};
</script>
