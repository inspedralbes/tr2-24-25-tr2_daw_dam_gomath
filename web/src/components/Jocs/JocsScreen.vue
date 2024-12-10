<template>
  <div class="grid-container">
    <router-link to="/jocs/sudoku" class="grid-item">
      <img src="../../assets/img/images.png" alt="Sudoku">
    </router-link>
    <router-link to="/jocs/otro-juego" class="grid-item">
      <img src="../../assets/img/codigo.png" alt="Otro juego">
    </router-link>
    <router-link to="/jocs/resta" class="grid-item">
      <img src="../../assets/img/resta.svg" alt="Resta">
    </router-link>
  </div>
</template>

<script>
import { inject, onMounted } from 'vue';

export default {
  setup() {
    const divActivo = inject('divActivo');

    onMounted(() => {
      if (divActivo) {
        divActivo.value = 'jocs';
      }
    });

    return {};
  },
};
</script>

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
