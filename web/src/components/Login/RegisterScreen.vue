<template>
  <q-page class="flex flex-center">
    <q-card class="q-pa-md" style="width: 300px;">
      <q-card-section>
        <div class="text-h6">Registra't</div>
        <div class="text-subtitle2">Ingresa les teves credencials</div>
      </q-card-section>

      <q-card-section>
        <!-- Input para nombre de usuario -->
        <q-input v-model="username" label="Nom d'usuari" outlined dense />

        <!-- Validación de email -->
        <q-input v-model="email" label="Email" outlined dense class="q-mt-md" :error="!isValidEmail && email !== ''"
          error-message="Introduce un correo válido" />

        <!-- Input para la contraseña -->
        <q-input v-model="password" label="Contrasenya" type="password" outlined dense class="q-mt-md" />

        <div class="q-mt-md">
          <q-toggle v-model="isProfe" label="Soc professor" color="primary" />
        </div>

        <!-- Código de profesor, solo si es profesor -->
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
    const role = ref(''); // Role de usuario: 'student' o 'professor'
    const router = useRouter();
    const divActivo = inject('divActivo'); // Inyectar 'divActivo' si es necesario

    // Actualiza el estado de 'divActivo' cuando se monta el componente
    onMounted(() => {
      if (divActivo) {
        divActivo.value = 'register';
      }
    });

    // Computed para validar el email
    const isValidEmail = computed(() => {
      const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
      return emailRegex.test(email.value.trim());
    });

    // Función de registro
    function registration() {
      if (!isValidEmail.value) {
        alert('Por favor introduce un email válido.');
        return;
      }

      // Validar si los campos obligatorios están completos
      if (!username.value || !password.value || !email.value) {
        alert("Por favor completa todos los campos.");
        return;
      }

      // Si es profesor, valida el código de profesor
      if (isProfe.value) {
        if (!codiProfe.value.trim()) {
          alert("Por favor ingresa el Codi de Profe.");
          return;
        }

        // Verificar si el código de profesor es correcto
        if (codiProfe.value !== '4321') {
          alert("Codi de profe incorrecte.");
          return;
        }
        role.value = 'professor';
      } else {
        role.value = 'student';
      }

      // Preparar los datos a enviar
      const formData = {
        username: username.value,
        email: email.value,
        password: password.value,
        rol: role.value
      };

      // Hacer la solicitud fetch al backend
      fetch('http://127.0.0.1:8000/api/users/store', {
        method: 'POST',
        mode: 'cors',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),  // Enviar los datos del formulario
      })
        .then((response) => response.json())
        .then((data) => {
          console.log(data);
          if (data.status === 'success') {

              // Si el registro fue exitoso, redirigir al usuario
              router.push('/Offline');

              // Actualizar el estado de la aplicación (usando Vuex o store)
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
          console.error('Error al insertar datos en Pinia: ', error);
          alert('Hubo un problema al registrar al usuario.');
        });
    }

    // Retornar las variables y funciones necesarias para el template
    return {
      username,
      email,
      password,
      codiProfe,
      isProfe,
      registration,
      isValidEmail,
    };
  },
};
</script>
