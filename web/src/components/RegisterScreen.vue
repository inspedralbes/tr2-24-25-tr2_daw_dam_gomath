<template>
  <q-page class="flex flex-center">
    <q-card class="q-pa-md" style="width: 300px;">
      <q-card-section>
        <div class="text-h6">Registra't</div>
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
          v-model="email"
          label="Email"
          outlined
          dense
          class="q-mt-md"
        />
        <q-input
          v-model="password"
          label="Contrasenya"
          type="password"
          outlined
          dense
          class="q-mt-md"
        />

        <div class="q-mt-md">
          <q-toggle
            v-model="isProfe"
            label="Soc professor"
            color="primary"
          />
        </div>

        <q-input
          v-if="isProfe"
          v-model="codiProfe"
          label="Codi de profe"
          type="password"
          outlined
          dense
          class="q-mt-md"
        />
      </q-card-section>

      <q-card-actions align="right">
        <q-btn label="Registra'm" color="primary" @click="login" />
      </q-card-actions>
    </q-card>
  </q-page>
</template>

<script>
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import { useAppStore } from '@/stores/app';

export default {
  name: 'LoginPage',
  setup() {
    const username = ref('');
    const email = ref('');
    const password = ref('');
    const codiProfe = ref('');
    const isProfe = ref(false);
    const router = useRouter();

    function login() {
      // Valida credenciales
      if (username.value === 'user' && password.value === '1234') {
        if (isProfe.value && codiProfe.value.trim() === '') {
          alert("Por favor ingresa el Codi de Profe.");
          return;
        }


        router.push('/Offline');

        
        const appStore = useAppStore();
        appStore.setLoginInfo({
          loggedIn: true,
          username: username.value,
          image: 'https://randomuser.me/api/portraits/thumb/women/56.jpg', // Reemplaza con tu avatar real
        });
      } else {
        alert("Credenciales incorrectas");
      }
    }

    return {
      username,
      email,
      password,
      codiProfe,
      isProfe,
      login,
    };
  },
};
</script>

<style>
/* Agrega estilos personalizados si lo necesitas */
</style>
