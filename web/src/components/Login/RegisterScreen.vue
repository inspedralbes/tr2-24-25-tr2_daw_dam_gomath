<template>
  <q-page class="flex flex-center">
    <q-card class="q-pa-md" style="width: 300px;">
      <q-card-section>
        <div class="text-h6">Registra't</div>
        <div class="text-subtitle2">Introdueix les teves credencials</div>
      </q-card-section>

      <q-card-section>
        <!-- Input per al nom d'usuari -->
        <q-input v-model="username" label="Nom d'usuari" outlined dense />

        <!-- Validació de l'email -->
        <q-input
          v-model="email"
          label="Email"
          outlined
          dense
          class="q-mt-md"
          :error="!isValidEmail && email !== ''"
          error-message="Introdueix un correu electrònic vàlid"
        />

        <!-- Input per a la contrasenya -->
        <q-input v-model="password" label="Contrasenya" type="password" outlined dense class="q-mt-md" />

        <div class="q-mt-md">
          <q-toggle v-model="isProfe" label="Soc professor" color="primary" />
        </div>

        <!-- Codi de professor, només si és professor -->
        <q-input
          v-if="isProfe"
          v-model="codiProfe"
          label="Codi de profe"
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
        <q-btn label="Registra'm" color="primary" @click="registration" :loading="isLoading" />
      </q-card-actions>
    </q-card>
  </q-page>
</template>

<script>
import { ref, inject, onMounted, computed } from 'vue';
import { useRouter } from 'vue-router';
import { useAppStore } from '@/stores/app';

export default {
  name: 'RegistrationPage',
  setup() {
    const username = ref('');
    const email = ref('');
    const password = ref('');
    const codiProfe = ref('');
    const isProfe = ref(false);
    const role = ref('');
    const router = useRouter();
    const divActivo = inject('divActivo');
    const errorMessage = ref(''); 
    const isLoading = ref(false); 

    onMounted(() => {
      if (divActivo) {
        divActivo.value = 'register';
      }
    });

    const isValidEmail = computed(() => {
      const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
      return emailRegex.test(email.value.trim());
    });

    async function registration() {
      if (!isValidEmail.value) {
        errorMessage.value = 'Introdueix un correu electrònic vàlid.';
        return;
      }

      if (!username.value || !password.value || !email.value) {
        errorMessage.value = 'Si us plau, completa tots els camps.';
        return;
      }

      if (isProfe.value) {
        if (!codiProfe.value.trim()) {
          errorMessage.value = 'Introdueix el Codi de Profe.';
          return;
        }

        if (codiProfe.value !== '4321') {
          errorMessage.value = 'Codi de profe incorrecte.';
          return;
        }
        role.value = 'professor';
      } else {
        role.value = 'student';
      }

      errorMessage.value = '';
      isLoading.value = true;

      const avatarUrl = `https://api.multiavatar.com/${username.value}.png`;

      const formData = {
        username: username.value,
        email: email.value,
        password: password.value,
        rol: role.value,
        image: avatarUrl,
      };

      try {
        const response = await fetch('http://gomath.daw.inspedralbes.cat/public/api/users/store', {
          method: 'POST',
          mode: 'cors',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(formData),
        });

        const data = await response.json();

        if (data.status === 'success') {
          const appStore = useAppStore();
          appStore.setRegistrationInfo({
            loggedIn: true,
            username: username.value,
            role: role.value,
            image: avatarUrl, 
          });
          appStore.setLoginInfo({
            loggedIn: true,
            username: username.value,
            role: role.value,
            image: avatarUrl, 
          });

          router.push('/');
        } else {
          errorMessage.value = data.message || 'Error en el registre.';
        }
      } catch (error) {
        console.error('Error al registrar l\'usuari:', error);
        errorMessage.value = 'La contrasenya ha de tenir un mínim de 6 caràcters.';
      } finally {
        isLoading.value = false;
      }
    }

    return {
      username,
      email,
      password,
      codiProfe,
      isProfe,
      registration,
      isValidEmail,
      errorMessage,
      isLoading,
    };
  },
};
</script>
