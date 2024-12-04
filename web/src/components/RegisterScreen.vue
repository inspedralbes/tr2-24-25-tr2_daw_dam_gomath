<template>
  <q-page class="flex flex-center">
    <q-card class="q-pa-md" style="width: 300px;">
      <q-card-section>
        <div class="text-h6">Registra't</div>
        <div class="text-subtitle2">Ingresa les teves credencials</div>
      </q-card-section>

      <q-card-section>
        <q-input v-model="username" label="Nom d'usuari" outlined dense />
        <q-input v-model="email" label="Email" outlined dense class="q-mt-md" />
        <q-input v-model="password" label="Contrasenya" type="password" outlined dense class="q-mt-md" />

        <div class="q-mt-md">
          <q-toggle v-model="isProfe" label="Soc professor" color="primary" />
        </div>

        <q-input v-if="isProfe" v-model="codiProfe" label="Codi de profe" type="password" outlined dense
          class="q-mt-md" />
      </q-card-section>

      <q-card-actions align="right">
        <q-btn label="Registra'm" color="primary" @click="registration" />
      </q-card-actions>
    </q-card>
  </q-page>
</template>

<script>
import { ref, inject, onMounted } from 'vue';
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
    const divActivo = inject('divActivo')

    onMounted(() => {
      if (divActivo) {
        divActivo.value = 'register';
      }
    })

    function registration() {
  // Valida credenciales
  if (username.value && password.value && email.value) {
    // Si es profesor, valida el código de profesor
    if (isProfe.value) {
      if (codiProfe.value.trim() === '') {
        alert("Por favor ingresa el Codi de Profe.");
        return;
      }

      // Verifica si el código de profesor es correcto
      if (codiProfe.value !== '4321') {
        alert("Codi de profe incorrecte.");
        return;
      }
      role.value = 'professor';
    } else {
      role.value = 'student';
    }

    // Realiza el fetch a tu backend
    const formData = {
      username: username.value,
      email: email.value,
      password: password.value,
      role: role.value
    };

    // Hacer fetch con los datos
    fetch('http://localhost:8000/Users/create', {
      method: 'POST',
      mode: 'cors',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(formData),  // Enviar los datos del formulario
    })
      .then((response) => response.json())
      .then((data) => {

        if (data.success) {
          // El registro fue exitoso
          router.push('/Offline');

          // Actualiza el estado de la aplicación
          const appStore = useAppStore();
          appStore.setRegistrationInfo({
            loggedIn: true,
            username: username.value,
            role: role.value,
            image: 'https://randomuser.me/api/portraits/thumb/women/56.jpg',
          });
          appStore.setLoginInfo({
            loggedIn: true,
            username: username.value,
            role: role.value,
            image: 'https://randomuser.me/api/portraits/thumb/women/56.jpg',
          });
        } else {
          // Mostrar mensaje de error si la respuesta es negativa
          alert('Error en el registro: ' + data.message);
        }
      })
      .catch((error) => {
        console.error('Error al registrar:', error);
        alert('Hubo un problema al registrar al usuario.');
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
      registration,
    };
  },
};
</script>
