<template>
    <div class="estadisticas-partida">
      <h2>Estadísticas de la Partida</h2>
  
      <div class="estadisticas">
        <div class="estadistica">
          <h3>Preguntas Acertadas</h3>
          <p>{{ estadisticas.preguntasAcertadas }}</p>
        </div>
  
        <div class="estadistica">
          <h3>Preguntas Falladas</h3>
          <p>{{ estadisticas.preguntasFalladas }}</p>
        </div>
  
        <div class="estadistica">
          <h3>Puntos</h3>
          <p>{{ estadisticas.puntos }}</p>
        </div>
      </div>
  
      <q-btn @click="resetEstadisticasYRedirigir" label="Volver a jugar" color="secondary" />
    </div>
  </template>
  
  <script>
  import { useEstadisticasPartida } from "@/stores/useEstadisticasPartida"; 
  import { computed } from "vue";
  import { useRouter } from "vue-router";  
  
  export default {
    setup() {
      const estadisticasPartidaStore = useEstadisticasPartida();
  
      const estadisticas = computed(() => estadisticasPartidaStore.estadisticasPartida);
  
      const router = useRouter();
  
      const resetEstadisticasYRedirigir = () => {
        estadisticasPartidaStore.setEstadisticasZero();  
        router.push("/Offline");  
      };
  
      return {
        estadisticas,
        resetEstadisticasYRedirigir,
      };
    },
  };
  </script>
  
  <style scoped>
  .estadisticas-partida {
    padding: 20px;
    text-align: center;
    border: 1px solid #ccc;
    border-radius: 8px;
    background-color: #f9f9f9;
  }
  
  .estadisticas {
    display: flex;
    justify-content: space-around;
    margin-top: 20px;
  }
  
  .estadistica {
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  
  .estadistica h3 {
    margin-bottom: 5px;
    font-size: 1.2rem;
  }
  
  .estadistica p {
    font-size: 1.5rem;
    font-weight: bold;
  }
  
  .q-btn {
    margin-top: 20px;
  }
  </style>
  