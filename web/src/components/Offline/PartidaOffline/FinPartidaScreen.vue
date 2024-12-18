<template>
    <div class="estadisticas-partida">
      <h2>Estadísticas de la Partida</h2>
      <div v-if="gifActivo=='easterEgg'"> 
        <img src="../../../assets/img/easterEgg.webp" alt=""style="width: 250px;"> </div> 
        <div v-if="gifActivo=='buenaPartida'"> 
          <img src="../../../assets/img/buenaPartida.gif" alt=""style="width: 250px;"> </div> 
          <div v-if="gifActivo=='malaPartida'"> 
            <img src="../../../assets/img/malaPartida.gif" alt=""style="width: 250px;"> </div> 
          <div v-if="gifActivo=='partidaNula'"> 
            <img src="../../../assets/img/ningunaRespondida.webp" alt=""style="width: 250px;"> </div> 
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
  import { useRouter } from "vue-router";  
  import { watch, ref, computed } from "vue";
import { useEstadisticasPartida } from "@/stores/useEstadisticasPartida";

export default {
  setup() {
    const router = useRouter();
    const estadisticasPartidaStore = useEstadisticasPartida();
    const gifActivo = ref("");
    const estadisticas = computed(() => estadisticasPartidaStore.estadisticasPartida || {
      preguntasAcertadas: 0,
      preguntasFalladas: 0,
      puntos: 0,
    });

    const actualizarGifActivo = () => {
      if (estadisticas.value.preguntasAcertadas + estadisticas.value.preguntasFalladas === 0) {
        gifActivo.value = "partidaNula";
      } else if (estadisticas.value.puntos >= 1000) {
        gifActivo.value = "easterEgg";
      } else if (estadisticas.value.puntos > 300) {
        gifActivo.value = "buenaPartida";
      } else {
        gifActivo.value = "malaPartida";
      }
    };

    // Ejecutar una vez al montar
    actualizarGifActivo();

    // Reactividad en los cambios
    watch(estadisticas, () => {
      actualizarGifActivo();
    });
      const resetEstadisticasYRedirigir = () => {
        estadisticasPartidaStore.setEstadisticasZero();  
        router.push("/Offline");  
      };
  
      return {
        estadisticas,
        resetEstadisticasYRedirigir,
        gifActivo
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
  