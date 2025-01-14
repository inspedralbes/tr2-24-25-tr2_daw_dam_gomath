<template>
  <div>
    <div v-if="!loading">
      <div v-if="operation">
        <h2>{{ operation.question }}</h2>
        <div class="crono">Temps restant: {{ timeLeft }}s</div>
        <div class="opciones">
          <q-btn v-for="(answer, index) in operation.answers" :key="index" :color="getButtonColor(index)"
            class="opcion-btn" @click="handleAnswer(answer, index)" :disabled="!isTimeRemaining"
            style="width: 200px; margin: 5px auto;">
            {{ answer.value }}
          </q-btn>
        </div>

        <div class="navegacion">
          <q-btn @click="previousQuestion" label="Anterior" />
          <q-btn @click="nextQuestion" label="Siguiente" />
        </div>
      </div>
      <div v-else class="loading-container">
        <img src="../../../assets/img/loading.gif" alt="cargando">
      </div>
    </div>
    <div v-else class="loading-container">
      <img src="../../../assets/img/loading.gif" alt="Cargando respuestas" />
    </div>
  </div>
</template>

<script>
import { computed, onMounted, ref, onUnmounted, inject } from "vue";
import { useOperationsStore } from "@/stores/comunicationManager";
import { useRouter } from "vue-router";
import { useTipoPartidaStore } from "../../../App.vue";
import { useRespuesta } from "../../../stores/respuesta";
import { useUnaRespuesta } from "../../../stores/comunicationManager";
import { useEstadisticasPartida } from "../../../stores/useEstadisticasPartida";
import { colors } from "quasar";

export default {
  setup() {
    const loading = ref(false);
    const respuestasPendientes = ref([]);
    const estadisticas = useEstadisticasPartida();
    const unaRespuesta = useUnaRespuesta();
    const useRespuesta2 = useRespuesta();
    const tipoPartidaStore = useTipoPartidaStore();
    const divActivo = inject("divActivo");
    const operationsStore = useOperationsStore();
    const currentQuestionIndex = ref(0);
    const selectedAnswer = ref(null);
    const correctAnswer = ref(null);
    const timeLeft = ref(tipoPartidaStore.tipoPartida.cantidad);
    const isTimeRemaining = ref(true);
    let timer = null;
    const isActive = ref(true);
    const router = useRouter();

    const operation = computed(() => {
      const operacionesFiltradas = operationsStore.operations.preguntas_y_respuestas;
      if (operacionesFiltradas && operacionesFiltradas[currentQuestionIndex.value]) {
        const firstOperation = operacionesFiltradas[currentQuestionIndex.value];
        try {
          return {
            question: firstOperation.question,
            answers: firstOperation.respuestas.map((value) => ({ value })),
            id_pregunta: firstOperation.id_pregunta,
          };
        } catch (e) {
          console.error("Error al decodificar el JSON:", e);
          return null;
        }
      }
      return null;
    });

    onMounted(async () => {
      await operationsStore.fetchOperations();
      startTimer();
      estadisticas.setEstadisticasZero();
    });

    onUnmounted(() => {
      isActive.value = false;
      clearInterval(timer);
    });

    const startTimer = () => {
      if (timer) clearInterval(timer);
      timer = setInterval(async() => {
        if (timeLeft.value > 0) {
          timeLeft.value--;
        } else {
          isTimeRemaining.value = false;
          clearInterval(timer);
          await corregirRespuests();
          redirectToEnd();
        }
      }, 1000);
    };

    const redirectToEnd = () => {
      router.push("/Offline/FinPartida");
    };

    const corregirRespuests = async () => {
      loading.value = true;
      try {
        const respuestasPromises = respuestasPendientes.value.map(async (respuesta) => {
          useRespuesta2.setRespuesta(respuesta.respuesta);
          useRespuesta2.setId(respuesta.id_pregunta);
          await unaRespuesta.fetchRespuesta();

          if (respuesta.respuesta !== useRespuesta2.correcta) {
            estadisticas.setPreguntaIncorrecta();
            estadisticas.setPuntos(-50);
          } else {
            estadisticas.setPreguntaCorrecta();
            estadisticas.setPuntos(100);
          }
        });

        await Promise.all(respuestasPromises);
      } catch (error) {
        console.error("Error al corregir respuestas:", error);
      } finally {
        loading.value = false;
      }
    };

    const getButtonColor = (index) => {
      if (selectedAnswer.value === index) {
        return "grey";
      }
      return "primary";
    };

    const handleAnswer = async (selected, index) => {
      if (!isTimeRemaining.value) return;
      
      selectedAnswer.value = index;
      
      const preguntaRespondida = respuestasPendientes.value.find(
        (r) => r.id_pregunta === operation.value.id_pregunta
      );

      if (!preguntaRespondida) {
        respuestasPendientes.value.push({
          id_pregunta: operation.value.id_pregunta,
          respuesta: operation.value.answers[index].value,
        });
      } else {
        respuestasPendientes.value = respuestasPendientes.value.filter(
          (r) => r.id_pregunta !== operation.value.id_pregunta
        );
        respuestasPendientes.value.push({
          id_pregunta: operation.value.id_pregunta,
          respuesta: operation.value.answers[index].value,
        });
      }
    };

    const nextQuestion = () => {
      if (hasNextQuestion.value) {
        currentQuestionIndex.value++;
        correctAnswer.value = null;
        selectedAnswer.value = null; 
      }
    };

    const previousQuestion = () => {
      if (currentQuestionIndex.value > 0) {
        currentQuestionIndex.value--;
        correctAnswer.value = null;
        selectedAnswer.value = null;
      }
    };

    const hasNextQuestion = computed(() => {
      return currentQuestionIndex.value < tipoPartidaStore.tipoPartida.cantidad - 1;
    });

    return {
      operation,
      handleAnswer,
      nextQuestion,
      previousQuestion,
      currentQuestionIndex,
      selectedAnswer,
      getButtonColor,
      hasNextQuestion,
      timeLeft,
      isTimeRemaining,
      loading,
    };
  },
};

</script>

<style scoped>
.opciones {
  display: flex;
  flex-direction: column;
  gap: 10px;
  margin-top: 20px;
  align-items: center;
}

.opcion-btn {
  width: 100%;
  text-align: center;
}

.navegacion {
  margin-top: 20px;
  display: flex;
  justify-content: space-between;
}

.q-btn {
  width: 48%;
}

.loading-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  transform: translateY(-100px);
  color: rgb(26, 26, 168);
}

.crono {
  font-size: 1.5em;
  font-weight: bold;
  margin-top: 10px;
  text-align: center;
  color: #e63946;
}
</style>
