<template>
  <q-page class="flex flex-center">
    <q-card class="q-pa-md" style="width: 300px;">
      <q-card-section>
        <div class="text-h6">Iniciar sessió</div>
        <div class="text-subtitle2">Introdueix les teves credencials</div>
      </q-card-section>

      <q-card-section>
        <q-input
          v-model="email"
          label="Email"
          outlined
          dense
          :error="!isValidEmail && email !== ''"
          error-message="Introduce un correo válido"
        />
        <q-input
          v-model="password"
          label="Contraseña"
          type="password"
          outlined
          dense
          class="q-mt-md"
        />
      </q-card-section>

      <q-card-actions align="right">
        <q-btn label="Iniciar sessió" color="primary" @click="login" :loading="isLoading" />
      </q-card-actions>
    </q-card>
  </q-page>
</template>

<script>
import { ref, computed } from 'vue';
import { useRouter } from 'vue-router';
import { useAppStore } from '@/stores/app.js';

export default {
  name: 'LoginPage',
  setup() {
    const email = ref('');
    const password = ref('');
    const router = useRouter();
    const isLoading = ref(false);  
    const errorMessage = ref(''); 

    const isValidEmail = computed(() => {
      const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
      return emailRegex.test(email.value.trim());
    });

    async function login() {
      if (!isValidEmail.value) {
        alert('Por favor introduce un email válido.');
        return;
      }

      isLoading.value = true;  // Activamos el estado de carga
      errorMessage.value = ''; // Limpiamos cualquier mensaje de error anterior

      try {
        const response = await fetch('http://127.0.0.1:8000/api/userLogin', {  
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            email: email.value,
            password: password.value,
          }),
        });

        const data = await response.json();
        console.log(data);

        if (response.ok) {
          // Si la respuesta es OK, guardamos los datos en el store
          const appStore = useAppStore();
          console.log('antes del setter');

          appStore.setLoginInfo({
            loggedIn: true,
            token: data.token,
            username: data.user.name,
            email: data.user.email,
            role: data.user.rol,
          });

          // Redirige a la página de votaciones (u otra página)
          router.push('/');
        } else {
          // Si la respuesta no es OK, muestra el mensaje de error
          errorMessage.value = data.message || 'Credenciales incorrectes';
        }
      } catch (error) {
        console.error('Error de conexión o al hacer el fetch:', error);
        errorMessage.value = 'Hubo un error al conectar con el servidor.';
      } finally {
        isLoading.value = false;  // Desactivamos el estado de carga
      }
    }

    return {
      email,
      password,
      isValidEmail,
      login,
      isLoading,
      errorMessage,
    };
  },
};
</script>
