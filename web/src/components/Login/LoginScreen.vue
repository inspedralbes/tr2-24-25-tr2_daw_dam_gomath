<template>
  <q-page class="flex flex-center">
    <q-card class="q-pa-md" style="width: 300px;">
      <q-card-section>
        <div class="text-h6">Iniciar sesión</div>
        <div class="text-subtitle2">Ingresa les teves credencials</div>
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
import { useAppStore } from '@/stores/app';

export default {
  name: 'LoginPage',
  setup() {
    const email = ref('');
    const password = ref('');
    const router = useRouter();
    const isLoading = ref(false);  // Para controlar el estado de carga
    const errorMessage = ref('');  // Para manejar los errores

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
        const response = await fetch('http://127.0.0.1:8000/api/userLogin', {  // Cambia la URL por la de tu API
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

        if (response.ok) {
          // Si la respuesta es OK, guardamos los datos en el store
          const appStore = useAppStore();
          appStore.setLoginInfo({
            loggedIn: true,
            email: email.value,
            image: data.user.image || 'https://randomuser.me/api/portraits/thumb/women/56.jpg', // Si tienes una imagen en la respuesta, reemplázala
          });

          // Redirige a la página de votaciones (u otra página)
          router.push('/Offline');
        } else {
          // Si la respuesta no es OK, muestra el mensaje de error
          errorMessage.value = data.message || 'Credenciales incorrectas';
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
