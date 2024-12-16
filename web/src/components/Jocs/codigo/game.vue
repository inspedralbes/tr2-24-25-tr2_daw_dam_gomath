<template>
  <div class="game-container">
    <h1>Adivina el código secreto</h1>

    <div v-if="codes.length > 0" class="codes-list">
      <p><strong>Pistas para el código secreto:</strong></p>
      <ul>
        <li v-for="(codeItem, index) in codes" :key="index" class="code-item">
          {{ codeItem.code  }}
          {{ codeItem.pista }}
        </li>
      </ul>
      <input v-model="userGuess" type="text" maxlength="3" placeholder="Escribe tu código" />
      <button @click="checkGuess">Intentar</button>
      <p v-if="feedback" :class="{ success: isCorrect, error: !isCorrect }">{{ feedback }}</p>
    </div>

    <div v-else>
      <p>Cargando las pistas...</p>
    </div>
  </div>
</template>

<script>
import { fetchCodes } from '@/stores/comunicationManager';

export default {
  name: 'Game',
  data() {
    return {
      codes: [],
      secretCode: '',
      userGuess: '',
      feedback: '',
      isCorrect: false
    };
  },
  methods: {
    checkGuess() {
      if (this.userGuess === this.secretCode) {
        this.feedback = 'Correcto, has adivinado el código secreto!';
        this.isCorrect = true;
      } else {
        this.feedback = 'Incorrecto, intenta de nuevo.';
        this.isCorrect = false;
      }
      this.userGuess = '';
    }
  },
  async created() {
    try {
      const codesData = await fetchCodes();
      if (Array.isArray(codesData) && codesData.length > 0) {
        const firstItem = codesData[0];
        if (firstItem.codi_json) {
          const decodedData = JSON.parse(firstItem.codi_json);
          if (decodedData.codes) {
            this.codes = decodedData.codes;
          }
          if (decodedData.secretCode) {
            this.secretCode = decodedData.secretCode;
          }
        }
      }
    } catch (error) {
      console.error('Error al cargar los códigos:', error);
    }
  }
};
</script>

<style scoped>
.game-container {
  text-align: center;
  margin: 20px;
}

input {
  padding: 8px;
  font-size: 16px;
  margin: 10px 0;
}

button {
  padding: 10px;
  font-size: 16px;
  background-color: #28a745;
  color: white;
  border: none;
  cursor: pointer;
}

button:hover {
  background-color: #218838;
}

p {
  font-size: 18px;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  font-size: 16px;
  margin: 5px 0;
}

.success {
  color: green;
}

.error {
  color: red;
}
</style>
