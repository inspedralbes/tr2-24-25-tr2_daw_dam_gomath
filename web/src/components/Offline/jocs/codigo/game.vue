<template>
  <div class="game-container">
    <h4>Endevina el codi secret</h4>

    <div v-if="codes.length > 0" class="codes-list">
      <p><strong>Pistes per al codi secret:</strong></p>
      <ul>
        <li v-for="(codeItem, index) in codes" :key="index" class="code-item">
          {{ codeItem.code  }}
          {{ codeItem.pista }}
        </li>
      </ul>
      <input v-model="userGuess" type="text" maxlength="3" placeholder="Escribe tu código" />
      <button @click="checkGuess">Intentar</button>
      <p v-if="feedback" :class="{ success: isCorrect, error: !isCorrect }">{{ feedback }}</p>
      <br>
      <button @click="fetchNewCode" :disabled="!isCorrect">Jugar amb un altre codi</button>
    </div>

    <div v-else>
      <p>Carregant les pistes...</p>
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
      isCorrect: false,
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
    },
    async fetchNewCode() {
      try {
        const codesData = await fetchCodes();
        if (codesData && codesData.codi_json) {
          const decodedData = JSON.parse(codesData.codi_json);
          if (decodedData.codes) {
            this.codes = decodedData.codes;
          }
          if (decodedData.secretCode) {
            this.secretCode = decodedData.secretCode;
          }
          this.feedback = '';
          this.isCorrect = false;
          this.userGuess = '';
        }
      } catch (error) {
        console.error('Error al cargar un nuevo código:', error);
      }
    },
  },
  async created() {
    this.fetchNewCode();
  },
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
