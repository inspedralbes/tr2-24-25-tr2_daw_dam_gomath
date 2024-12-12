<template>
    <div>
      <div v-if="operation">
        <h2>{{ operation.question }}</h2>
  
        <div class="crono">Tiempo restante: {{ timeLeft }}s</div>
  
        <div class="opciones">
          <q-btn
            v-for="(answer, index) in operation.answers"
            :key="index"
            :color="getButtonColor(index)"
            class="opcion-btn"
            @click="handleAnswer(answer, index)"
            :disabled="!isTimeRemaining"
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
            :disabled="answered && !selectedAnswer"
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
import { useRouter } from 'vue-router';  // Importar useRouter
import { useTipoPartidaStore } from '../../../App.vue';

export default {
  setup() {
    const tipoPartidaStore = useTipoPartidaStore();
    const divActivo = inject('divActivo');
    const operationsStore = useOperationsStore();
    const preguntasRespondidas = ref([]);
    const currentQuestionIndex = ref(0);
    const answered = ref(false); 
    const selectedAnswer = ref(null); 
    const correctAnswer = ref(null);
    const timeLeft = ref(tipoPartidaStore.tipoPartida.cantidad); 
    const isTimeRemaining = ref(true);
    let timer = null;

    const router = useRouter();

    const operation = computed(() => {
      const operacionesFiltradas = operationsStore.operations && operationsStore.operations.operaciones_filtradas;
      if (operacionesFiltradas && operacionesFiltradas[currentQuestionIndex.value]) {
        const firstOperation = operacionesFiltradas[currentQuestionIndex.value];
        try {
          return JSON.parse(firstOperation.problem_json);
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
    });

    const startTimer = () => {
      if (timer) clearInterval(timer);
      timer = setInterval(() => {
        if (timeLeft.value > 0) {
          timeLeft.value--;
        } else {
          isTimeRemaining.value = false;
          clearInterval(timer);
          redirectToEnd();  // Llamar a la función para redirigir al finalizar el tiempo
        }
      }, 1000);
    };

    const redirectToEnd = () => {
      // Redirigir a la página de fin de partida cuando se termine el tiempo
      router.push('/Offline/FinPartida');
    };

    const getButtonColor = (index) => {
      if (preguntasRespondidas.value[currentQuestionIndex.value] === index) {
        return 'grey';
      }
      return 'primary';
    };

    const handleAnswer = (selected, index) => {
      if (!isTimeRemaining.value) return;
      selectedAnswer.value = selected;
      correctAnswer.value = selected.is_correct;
      preguntasRespondidas.value[currentQuestionIndex.value] = index;
    };

    const nextQuestion = () => {
      if (hasNextQuestion.value) {
        currentQuestionIndex.value++;
        answered.value = false;
        correctAnswer.value = null;
        selectedAnswer.value = null;
      }
    };

    const previousQuestion = () => {
      if (currentQuestionIndex.value > 0) {
        currentQuestionIndex.value--;
        answered.value = false;
        correctAnswer.value = null;
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
      timeLeft,
      isTimeRemaining
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
