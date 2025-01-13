<template>
  <q-page class="flex flex-center">
    <q-card class="q-pa-md" style="width: 300px;">
      <q-card-section>
        <div class="text-h6">Registra't</div>
        <div class="text-subtitle2">Introdueix les teves credencials</div>
      </q-card-section>

      <q-card-section>
        <q-input v-model="username" label="Nom d'usuari" outlined dense />
        <q-input
          v-model="email"
          label="Email"
          outlined
          dense
          class="q-mt-md"
          :error="!isValidEmail && email !== ''"
          error-message="Introduce un correo válido"
        />
        <q-input v-model="password" label="Contrasenya" type="password" outlined dense class="q-mt-md" />
        <div class="q-mt-md">
          <q-toggle v-model="isProfe" label="Soc professor" color="primary" />
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
        <q-btn label="Registra'm" color="primary" @click="registration" />
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
    const avatar = ref(''); // Avatar aleatorio
    const router = useRouter();
    const divActivo = inject('divActivo');

    // Actualiza el estado de 'divActivo' cuando se monta el componente
    onMounted(() => {
      if (divActivo) {
        divActivo.value = 'register';
      }
      generateRandomAvatar(); // Generar un avatar al cargar
    });

    // Genera un avatar aleatorio usando la API de randomuser.me
    function generateRandomAvatar() {
      const gender = Math.random() > 0.5 ? 'men' : 'women'; // Alternar entre géneros
      const id = Math.floor(Math.random() * 99); // Seleccionar un número aleatorio entre 0 y 99
      avatar.value = `https://randomuser.me/api/portraits/thumb/${gender}/${id}.jpg`;
    }

    const isValidEmail = computed(() => {
      const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
      return emailRegex.test(email.value.trim());
    });

    function registration() {
      if (!isValidEmail.value) {
        alert('Por favor introduce un email válido.');
        return;
      }

      if (!username.value || !password.value || !email.value) {
        alert('Por favor completa todos los campos.');
        return;
      }

      if (isProfe.value) {
        if (!codiProfe.value.trim()) {
          alert('Por favor ingresa el Codi de Profe.');
          return;
        }
        if (codiProfe.value !== '4321') {
          alert('Codi de profe incorrecte.');
          return;
        }
        role.value = 'professor';
      } else {
        role.value = 'student';
      }

      const formData = {
        username: username.value,
        email: email.value,
        password: password.value,
        rol: role.value,
        avatar: avatar.value, // Incluir avatar en los datos
      };

      fetch('http://127.0.0.1:8000/api/users/store', {
        method: 'POST',
        mode: 'cors',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),
      })
        .then((response) => response.json())
        .then((data) => {
          if (data.status === 'success') {
            router.push('/');

            const appStore = useAppStore();
            appStore.setRegistrationInfo({
              loggedIn: true,
              username: username.value,
              role: role.value,
              image: avatar.value, // Usar avatar generado
            });
            appStore.setLoginInfo({
              loggedIn: true,
              username: username.value,
              role: role.value,
              image: avatar.value,
            });
          } else {
            alert('Error en el registro: ' + data.message);
          }
        })
        .catch((error) => {
          console.error('Error en el registro: ', error);
          alert('Hubo un problema al registrar al usuario.');
        });
    }

    return {
      username,
      email,
      password,
      codiProfe,
      isProfe,
      registration,
      isValidEmail,
      avatar,
      generateRandomAvatar,
    };
  },
};
</script>
