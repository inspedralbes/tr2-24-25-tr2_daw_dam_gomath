<template>
  <div>
    <div v-if="!loading">
      <div v-if="operation">
        <h2>{{ operation.question }}</h2>

        <div class="opciones">
          <q-btn
            v-for="(answer, index) in operation.answers"
            :key="index"
            :color="getButtonColor(index)"
            class="opcion-btn"
            @click="handleAnswer(index)"
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
            label="Següent"
          />
          <q-btn
            v-else
            @click="finalizar"
            label="Finalitzar"
          />
        </div>
      </div>
      <div v-else class="loading-container">
        <img src="../../../assets/img/loading.gif" alt="cargando" />
      </div>
    </div>
    <div v-else class="loading-container">
      <img src="../../../assets/img/loading.gif" alt="Cargando respuestas" />
    </div>
  </div>
</template>

<script>
import { computed, onMounted, reactive, ref } from 'vue';
import { useOperationsStore, useUnaRespuesta } from "@/stores/comunicationManager";
import { useTipoPartidaStore } from "../../../App.vue";
import { useRouter } from 'vue-router';
import { useRespuesta } from '../../../stores/respuesta';
import { useEstadisticasPartida } from '../../../stores/useEstadisticasPartida';

export default {
  setup() {
    const unaRespuesta = useUnaRespuesta();
    const estadisticas = useEstadisticasPartida();
    const useRespuesta2 = useRespuesta();
    const tipoPartidaStore = useTipoPartidaStore();
    const operationsStore = useOperationsStore();
    const respuestasPendientes = ref([]);
    const currentQuestionIndex = ref(0);
    const selectedAnswer = ref(null);  
    const loading = ref(false);
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

    const preguntasRespondidas = reactive({});

    const getButtonColor = (index) => {
      return selectedAnswer.value === index ? "grey" : "primary";
    };

    const handleAnswer = (index) => {
      selectedAnswer.value = index; 
      const preguntaRespondida = preguntasRespondidas[currentQuestionIndex.value];

      if (preguntaRespondida === undefined) {
        preguntasRespondidas[currentQuestionIndex.value] = index;
        respuestasPendientes.value.push({
          id_pregunta: operation.value.id_pregunta,
          respuesta: operation.value.answers[index].value
        });
      } else {
        respuestasPendientes.value = respuestasPendientes.value.filter(r => r.id_pregunta !== operation.value.id_pregunta);
        respuestasPendientes.value.push({
          id_pregunta: operation.value.id_pregunta,
          respuesta: operation.value.answers[index].value
        });
      }
    };

    const nextQuestion = () => {
      if (siguiente.value) {
        currentQuestionIndex.value++;
        selectedAnswer.value = null; 
      }
    };

    const previousQuestion = () => {
      if (currentQuestionIndex.value > 0) {
        currentQuestionIndex.value--;
        selectedAnswer.value = null; 
      }
    };

    const finalizar = async () => {
      loading.value = true;
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
      loading.value = false;
      router.push('/Offline/FinPartida');
    };

    return {
      operation,
      handleAnswer,
      nextQuestion,
      previousQuestion,
      finalizar,
      currentQuestionIndex,
      getButtonColor,
      siguiente,
      preguntasRespondidas,
      loading
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
