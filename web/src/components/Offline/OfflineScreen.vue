<script>
  import { inject, onMounted } from 'vue';
  import { useTipoPartidaStore } from '../../App.vue';

  export default {
    setup() {
      const tipoPartidaStore = useTipoPartidaStore();
      const divActivo = inject('divActivo');

      onMounted(() => {
        if (divActivo) {
          divActivo.value = 'offline';
        }
      });

      return {
        tipoPartidaStore,
      };
    },
  };
</script>
<template>
    <div class="grid-container">
    <router-link to="/Offline/prePartida" class="grid-item" @click="tipoPartidaStore.setOperacion('suma')">
      <img src="../../assets/img/suma.svg" alt="Suma">
    </router-link>
    <router-link to="/Offline/prePartida" class="grid-item" @click="tipoPartidaStore.setOperacion('resta')">
      <img src="../../assets/img/resta.svg" alt="Resta">
    </router-link>
    <router-link to="/Offline/prePartida" class="grid-item" @click="tipoPartidaStore.setOperacion('multiplicacion')">
      <img src="../../assets/img/mult.svg" alt="Multiplicación">
    </router-link>
    <router-link to="/Offline/prePartida" class="grid-item" @click="tipoPartidaStore.setOperacion('division')">
      <img src="../../assets/img/div.svg" alt="División">
    </router-link>
  </div>
  </template>
  
  <style scoped>
  .grid-container {
    display: grid;
    grid-template-columns: repeat(2, 1fr); 
    gap: 20px; 
    max-width: 600px; 
    margin: 20px auto 0; 
  }
  
  .grid-item {
    border: 2px solid #ccc;
    border-radius: 12px;
    overflow: hidden;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
  }
  
  .grid-item:hover {
    transform: scale(1.02);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    z-index: 10;
    position: relative;
  }
  
  .grid-item img {
    width: 100%;
    height: auto;
  }
  </style>
  