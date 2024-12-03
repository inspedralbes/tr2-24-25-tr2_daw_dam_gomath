<template>
  <q-page class="flex flex-center">
    <q-card class="q-pa-md login" style="width: 300px;">
      <q-card-section>
        <div class="text-h6">Iniciar sesión</div>
        <div class="text-subtitle2">Por favor ingresa tus credenciales</div>
      </q-card-section>
      
      <q-card-section>
        <q-input
          v-model="username"
          label="Nombre de usuario"
          outlined
          dense
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
        <q-btn label="Iniciar sesión" color="primary" @click="login" />
      </q-card-actions>
    </q-card>
  </q-page>
</template>

<style>
</style>

<script>
  import { inject, onMounted } from 'vue';
  
  export default {
    setup() {
      const divActivo = inject('divActivo'); 
  
      onMounted(() => {
        if (divActivo) {
          divActivo.value = 'login';
        }
      });
  
      return {};
    },
  };
  </script>
