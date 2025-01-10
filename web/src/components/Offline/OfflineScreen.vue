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

      return {
        tipoPartidaStore,
      };
    },
  };
</script>
<template>
    <div class="explicacions">
    <p><strong>Els nostres jocs:</strong> Aquí pots trobar una selecció de jocs educatius per a passar una bona estona mentre millores les teves habilitats:</p>
    <ul>
      <li><strong>Operacions:</strong> Hi ha 4 tipus d'operacions diferents per posar a prova la teva capacitat de fer càlculs, pots diferenciar els modes pel seu símbol.</li>
      <li><strong>Sudoku:</strong> Un joc clàssic de lògica per a posar a prova la teva capacitat de raonament. Completa les cel·les amb els números correctes sense repetir-ne cap.</li>
      <li><strong>Codi:</strong> Un joc d'enigmes on hauràs de desxifrar codis i resoldre trencaclosques per avançar.</li>
    </ul>
    </div>
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
    <router-link to="/Offline/jocs/sudoku" class="grid-item">
      <img src="../../assets/img/images.png" alt="Sudoku">
    </router-link>
    <router-link to="/Offline/jocs/codigo" class="grid-item">
      <img src="../../assets/img/codigo.png" alt="Otro juego">
    </router-link>
  </div>
  </template>
  
  <style scoped>
  .grid-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr); 
    gap: 20px; 
    max-width: 600px; 
    margin: 20px auto 30px; 
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

.explicacions p {
  margin-bottom: 10px;
}

.explicacions ul {
  padding-left: 20px;
}

.explicacions li {
  margin-bottom: 8px;
}

.explicacions strong {
  color: #0056b3;
  font-weight: bold;
}
  </style>
  