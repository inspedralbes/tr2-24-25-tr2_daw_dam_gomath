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
          @click="handleAnswer(answer,index)"
          :disabled="answered && answer !== selectedAnswer"
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

export default {
  setup() {
    const divActivo = inject('divActivo');
    const operationsStore = useOperationsStore();
    const currentQuestionIndex = ref(0);
    const answered = ref(false); 
    const selectedAnswer = ref(null); 
    const correctAnswer = ref(null);
    const clicked = ref(null);

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
    });

    const getButtonColor = (index) => {
      if (clicked.value == index) {
        console.log('Soy el color red',clicked,index)
        return 'negative';
      }
      console.log('Soy el color blanco',clicked,index)
      return 'primary';
    };
    const handleAnswer = (selected,index) => {
      selectedAnswer.value = selected;
      correctAnswer.value = selected.is_correct;
      answered.value = true;
      clicked.value = index;
    };

    const nextQuestion = () => {
      if (hasNextQuestion.value) {
        currentQuestionIndex.value++;
        answered.value = false; 
        correctAnswer.value = null;
        clicked.value = null;
      }
    };

    const previousQuestion = () => {
      if (currentQuestionIndex.value > 0) {
        currentQuestionIndex.value--;
        answered.value = false; 
        correctAnswer.value = null;
        clicked.value = null;
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
      clicked
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
