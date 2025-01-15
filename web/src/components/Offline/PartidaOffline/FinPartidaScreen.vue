<template>
  <div class="estadisticas-partida">
    <h4>Estadístiques de la Partida</h4>
    <div v-if="gifActivo == 'easterEgg'">
      <p>EasterEgg</p>
      <img src="../../../assets/img/easterEgg.webp" alt="" style="width: 250px;">
    </div>
    <div v-if="gifActivo == 'moltBonaPartida'">
      <p>Molt bona partida!!!</p>
      <img src="../../../assets/img/muyBuenaPartida.gif" alt="" style="width: 250px;">
    </div>
    <div v-if="gifActivo == 'buenaPartida'">
      <p>Bona partida!</p>
      <img src="../../../assets/img/buenaPartida.gif" alt="" style="width: 250px;">
    </div>
    <div v-if="gifActivo == 'malaPartida'">
      <p>Has de practicar més!</p>
      <img src="../../../assets/img/malaPartida.gif" alt="" style="width: 250px;">
    </div>
    <div v-if="gifActivo == 'partidaNula'">
      <img src="../../../assets/img/ningunaRespondida.webp" alt="" style="width: 250px;">
    </div>
    <div class="estadisticas">
      <div class="estadistica">
        <h3>Preguntes Encertades</h3>
        <p>{{ estadisticas.preguntasAcertadas }}</p>
      </div>

      <div class="estadistica">
        <h3>Preguntes Fallades</h3>
        <p>{{ estadisticas.preguntasFalladas }}</p>
      </div>

      <div class="estadistica">
        <h3>Puntuació</h3>
        <p>{{ estadisticas.puntos }}</p>
      </div>
    </div>

    <q-btn @click="handleVolverAJugar" label="Tornar a jugar" color="secondary" />
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
      } else if (estadisticas.value.puntos >= 3000) {
        gifActivo.value = "easterEgg";
      } else if (estadisticas.value.puntos < 3000 && estadisticas.value.puntos >= 1500) {
        gifActivo.value = "moltBonaPartida";
      } else if (estadisticas.value.puntos < 1500  && estadisticas.value.puntos >= 300) {
        gifActivo.value = "buenaPartida";
      } else if (estadisticas.value.puntos < 300) {
        gifActivo.value = "malaPartida";
      }
    };

    actualizarGifActivo();

    watch(estadisticas, () => {
      actualizarGifActivo();
    });
    const resetEstadisticasYRedirigir = () => {
      estadisticasPartidaStore.setEstadisticasZero();
      router.push("/Offline");
    };

    const enviarEstadisticas = async () => {
      try {
        const response = await fetch("http://localhost:3000/api/onlineGames", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            session_id: "556r5",
            player_email: "example@gmail.com",
            preguntasAcertadas: estadisticas.value.preguntasAcertadas,
            preguntasFalladas: estadisticas.value.preguntasFalladas,
            puntos: estadisticas.value.puntos,
          }),
        });

        if (!response.ok) {
          throw new Error(`Error al enviar estadísticas: ${response.statusText}`);
        }

        console.log("Estadísticas enviadas correctamente");
      } catch (error) {
        console.error("Error al enviar estadísticas:", error);
      }
    };

    const handleVolverAJugar = async () => {
      try {
        await enviarEstadisticas();
        resetEstadisticasYRedirigir(); // Se ejecuta solo si enviarEstadisticas tiene éxito
      } catch (error) {
        console.error("Error en el flujo de volver a jugar:", error);
      }
    };

    return {
      estadisticas,
      resetEstadisticasYRedirigir,
      handleVolverAJugar,
      gifActivo
    };
  },
};
</script>

<style scoped>
.estadisticas-partida {
  padding: 3px;
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