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
            :disabled="answered"
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
            @click="nextQuestion"
            label="Siguiente"
            :disabled="!answered"
          />
        </div>
      </div>
      <div v-else class="loading-container">
        <img src="../../../assets/img/loading.gif" alt="cargando">
      </div>
    </div>
  </template>
  
  <script>
import { computed, onMounted, ref } from 'vue';
import { useOperationsStore } from "@/stores/comunicationManager";
import { inject } from 'vue';
import { useTipoPartidaStore } from '../../../App.vue';
import { useRouter } from 'vue-router';
import { useEstadisticasPartida } from '../../../stores/useEstadisticasPartida';
import { useRespuesta } from '../../../stores/respuesta'
import { useUnaRespuesta } from '../../../stores/comunicationManager'
export default {
  setup() {
    const estadisticasPartida2 = useEstadisticasPartida(); 
    const tipoPartidaStore = useTipoPartidaStore();
    const divActivo = inject('divActivo');
    const operationsStore = useOperationsStore();
    const preguntasRespondidas = ref([]);
    const currentQuestionIndex = ref(0);
    const answered = ref(false);
    const selectedAnswer = ref(null); 
    const router = useRouter();
    const unaRespuesta = useUnaRespuesta();
    const useRespuesta2 = useRespuesta();
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
      estadisticasPartida2.setEstadisticasZero();
    });

    const getButtonColor = (index) => {
      if (answered.value) {
        if (operation.value.answers[index] == useRespuesta2.correcta) {
          return 'green'; 
        }
        return 'red'; 
      }
      return 'primary'; 
    };
    
    const handleAnswer = (selected, index) => {
      answered.value = true;
      selectedAnswer.value = selected;
      unaRespuesta.fetchRespuesta();
      useRespuesta2.setRespuesta(operation.value.answers[index].value);
      useRespuesta2.setId(operation.value.id_pregunta);
      // Si deseas realizar validaciones adicionales, usa los datos de operation.value
      // Por ejemplo:
      // if (!operation.value.answers[index].is_correct) {
      //   estadisticasPartida2.setPreguntaIncorrecta();
      //   estadisticasPartida2.setPuntos(-50);
      //   if (estadisticasPartida2.estadisticasPartida.preguntasFalladas === tipoPartidaStore.tipoPartida.cantidad) {
      //     router.push('/Offline/FinPartida');
      //   }
      // } else {
      //   estadisticasPartida2.setPreguntaCorrecta();
      //   estadisticasPartida2.setPuntos(100);
      // }

      preguntasRespondidas.value[currentQuestionIndex.value] = index;
    };

    const nextQuestion = () => {
      if (hasNextQuestion.value) {
        currentQuestionIndex.value++;
        answered.value = false;
        selectedAnswer.value = null;
      }
    };

    const previousQuestion = () => {
      if (currentQuestionIndex.value > 0) {
        currentQuestionIndex.value--;
        answered.value = false;
        selectedAnswer.value = null;
      }
    };

    const hasNextQuestion = computed(() => {
      return currentQuestionIndex.value < operationsStore.operations.operaciones_filtradas.length - 1;
    });

    return {
      operation,
      handleAnswer,
      nextQuestion,
      previousQuestion,
      currentQuestionIndex,
      answered,
      selectedAnswer,
      getButtonColor,
      hasNextQuestion,
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
    transition: background-color 0.3s; 
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
  