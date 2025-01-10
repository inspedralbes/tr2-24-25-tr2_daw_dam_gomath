<template>
  <div class="grid-container">
    <router-link to="/Offline/prePartida" class="grid-item" @mouseover="onHover('suma')" @mouseleave="onLeave">
      <img src="../../assets/img/suma.svg" alt="Suma">
    </router-link>
    <router-link to="/Offline/prePartida" class="grid-item" @mouseover="onHover('resta')" @mouseleave="onLeave">
      <img src="../../assets/img/resta.svg" alt="Resta">
    </router-link>
    <router-link to="/Offline/prePartida" class="grid-item" @mouseover="onHover('multiplicacion')" @mouseleave="onLeave">
      <img src="../../assets/img/mult.svg" alt="Multiplicación">
    </router-link>
    <router-link to="/Offline/prePartida" class="grid-item" @mouseover="onHover('division')" @mouseleave="onLeave">
      <img src="../../assets/img/div.svg" alt="División">
    </router-link>
    <router-link to="/Offline/jocs/sudoku" class="grid-item" @mouseover="onHover('sudoku')" @mouseleave="onLeave">
      <img src="../../assets/img/images.png" alt="Sudoku">
    </router-link>
    <router-link to="/Offline/jocs/codigo" class="grid-item" @mouseover="onHover('codigo')" @mouseleave="onLeave">
      <img src="../../assets/img/codigo.png" alt="Otro juego">
    </router-link>
  </div>
</template>

<script>
import { inject, onMounted } from 'vue';
import { useTipoPartidaStore } from '@/App.vue';

export default {
  setup() {
    const tipoPartidaStore = useTipoPartidaStore();
    const divActivo = inject('divActivo');

    onMounted(() => {
      if (divActivo) {
        divActivo.value = 'offline';
      }
    });

    // Funció que canvia l'operació quan es fa hover sobre una imatge
    const onHover = (operacion) => {
      tipoPartidaStore.setOperacion(operacion);  // Actualitzar l'operació seleccionada
      window.dispatchEvent(new CustomEvent('image-hover', { detail: operacion })); // Enviar esdeveniment
    };

    const onLeave = () => {
      window.dispatchEvent(new CustomEvent('image-hover', { detail: null })); // Restablir
    };

    return {
      tipoPartidaStore,
      onHover,
      onLeave,
    };
  },
};
</script>


<style scoped>
.grid-container {
  display: grid;
  grid-template-columns: repeat(3, 1fr); 
  gap: 20px; 
  max-width: 600px; 
  margin: 20px auto 30px; 
  padding-bottom: 60px; 
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

.explicacions {
  font-family: Arial, sans-serif;
  font-size: 16px;
  color: #333;
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  margin-bottom: 20px;
}
</style>
