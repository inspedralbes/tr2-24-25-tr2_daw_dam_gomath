<template>
  <div>
    <div v-if="operation">
      <h2>{{ operation.question }}</h2>

      <div class="opciones">
        <q-btn
          v-for="(answer, index) in operation.answers"
          :key="index"
          :color="getButtonColor(index)"
          class="opcion-btn"
          @click="handleAnswer(answer, index)"
          style="width: 200px; margin: 5px auto;"
        >
          {{ answer.value }}  
        </q-btn>
      </div>

      <div class="navegacion">
        <q-btn
          @click="previousQuestion"
          label="Anterior"
          :disabled="currentQuestionIndex === 0"
        />
        <q-btn
          v-if="siguiente"
          @click="nextQuestion"
          label="Siguiente"
        />
        <q-btn
          v-else
          @click="finalizar"
          label="Finalizar"
        />
      </div>
    </div>
    <div v-else class="loading-container">
      <img src="../../../assets/img/loading.gif" alt="cargando" />
    </div>
  </div>
</template>
<script>
import { computed, onMounted, ref, onUnmounted } from 'vue';
import { useOperationsStore } from "@/stores/comunicationManager";
import { inject } from "vue";
import { useTipoPartidaStore } from "../../../App.vue";
import { useRouter } from 'vue-router';
import { useRespuesta } from '../../../stores/respuesta'
import { useUnaRespuesta } from '../../../stores/comunicationManager'
import { useEstadisticasPartida } from '../../../stores/useEstadisticasPartida';

export default {
  setup() {
    const estadisticas = useEstadisticasPartida();
    const unaRespuesta = useUnaRespuesta();
    const useRespuesta2 = useRespuesta();
    const tipoPartidaStore = useTipoPartidaStore();
    const divActivo = inject("divActivo");
    const operationsStore = useOperationsStore();
    const preguntasRespondidas = ref([]);
    const currentQuestionIndex = ref(0);
    const selectedAnswer = ref(null);
    const correctAnswer = ref(null);
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

    const siguiente = computed(() => {
      return currentQuestionIndex.value < tipoPartidaStore.tipoPartida.cantidad - 1;
    });

    onMounted(async () => {
      await operationsStore.fetchOperations();
      estadisticas.setEstadisticasZero();
    });
    const getButtonColor = (index) => {
      return preguntasRespondidas.value[currentQuestionIndex.value] === index
        ? "grey"
        : "primary";
    };

    const handleAnswer = async (selected, index) => {
  const preguntaRespondida = preguntasRespondidas.value[currentQuestionIndex.value];

  selectedAnswer.value = selected;
  preguntasRespondidas.value[currentQuestionIndex.value] = index;

  useRespuesta2.setRespuesta(operation.value.answers[index].value);
  useRespuesta2.setId(operation.value.id_pregunta);
  await unaRespuesta.fetchRespuesta();

  console.log('Comparación para corrección', operation.value.answers[index].value, useRespuesta2.correcta);

  if (preguntaRespondida !== undefined) {
    console.log("Respuesta ya registrada para esta pregunta. No se actualizan estadísticas.");
    return;
  }

  if (operation.value.answers[index].value !== useRespuesta2.correcta) {
    estadisticas.setPreguntaIncorrecta();
    estadisticas.setPuntos(-50);

    if (estadisticas.estadisticasPartida.preguntasFalladas === tipoPartidaStore.tipoPartida.cantidad) {
      router.push('/Offline/FinPartida');
    }
  } else {
    estadisticas.setPreguntaCorrecta();
    estadisticas.setPuntos(100);
  }
};

    const nextQuestion = () => {
      if (siguiente.value) {
        currentQuestionIndex.value++;
        correctAnswer.value = null;
        selectedAnswer.value = null;
      }
    };

    const previousQuestion = () => {
      if (currentQuestionIndex.value > 0) {
        currentQuestionIndex.value--;
        correctAnswer.value = null;
      }
    };

    function finalizar () {
      router.push('/Offline/FinPartida');
    };

    return {
      operation,
      handleAnswer,
      nextQuestion,
      previousQuestion,
      finalizar,
      currentQuestionIndex,
      selectedAnswer,
      getButtonColor,
      siguiente,
      preguntasRespondidas,
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
</style>
