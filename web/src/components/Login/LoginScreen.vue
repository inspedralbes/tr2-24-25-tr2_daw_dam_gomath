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
          error-message="Introdueix un correu electrònic vàlid"
        />
        <q-input
          v-model="password"
          label="Contrasenya"
          type="password"
          outlined
          dense
          class="q-mt-md"
        />
        
        <!-- Mostrar missatge d'error -->
        <div v-if="errorMessage" class="text-negative text-caption q-mt-md">
          {{ errorMessage }}
        </div>
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
    const errorMessage = ref(''); // Variable per emmagatzemar el missatge d'error

    const isValidEmail = computed(() => {
      const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
      return emailRegex.test(email.value.trim());
    });

    async function login() {
      // Validació del correu electrònic
      if (!isValidEmail.value) {
        errorMessage.value = 'Correu o contrasenya invàlids.';
        return;
      }

      isLoading.value = true;  
      errorMessage.value = '';

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
          // Guardar dades al store si la resposta és correcta
          const appStore = useAppStore();
          appStore.setLoginInfo({
            loggedIn: true,
            token: data.token,
            username: data.user.name,
            email: data.user.email,
            role: data.user.rol,
            image: data.user.image || 'https://randomuser.me/api/portraits/thumb/women/56.jpg',
          });

          // Redirigir l'usuari
          router.push('/Offline');
        } else {
          // Mostrar missatge d'error si les credencials són incorrectes
          errorMessage.value = data.message || 'Credencials incorrectes.';
        }
      } catch (error) {
        console.error('Error en l\'inici de sessió:', error);
        errorMessage.value = 'Hi ha hagut un problema en connectar amb el servidor.';
      } finally {
        isLoading.value = false; // Desactivar l'estat de càrrega
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
