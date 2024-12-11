<template>
    <div class="game-container">
      <h1>Adivina el código secreto</h1>
      <p>El código secreto es un número de 3 dígitos. ¡Buena suerte!</p>
  
      <!-- Mostrar pistas -->
      <div v-for="(code, index) in codes" :key="index" class="code-item">
        <p>Código: {{ code.code }}</p>
        <p>Pista: {{ getHint(code.code) }}</p>
      </div>
  
      <!-- Input para que el usuario ingrese su código -->
      <div>
        <input type="number" v-model="userInput" placeholder="Introduce tu código" max="999" min="0" />
        <button @click="checkGuess">Comprobar</button>
      </div>
  
      <!-- Resultado de la comprobación -->
      <div v-if="result !== null">
        <p v-if="result === true">¡Correcto! Has adivinado el código secreto.</p>
        <p v-else>Lo siento, intenta de nuevo. El código secreto no es el correcto.</p>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        // Código secreto generado aleatoriamente
        secretCode: this.generateSecretCode(),
        // Entrada del usuario
        userInput: "",
        // Resultado de la comprobación
        result: null,
        // Los 5 códigos propuestos con sus respectivas pistas
        codes: [
          { code: "123", hint: "Tiene 1 número correcto en la posición correcta." },
          { code: "234", hint: "Tiene 1 número correcto pero en la posición incorrecta." },
          { code: "345", hint: "Tiene 2 números correctos en posiciones incorrectas." },
          { code: "456", hint: "Tiene 0 números correctos." },
          { code: "567", hint: "Tiene 1 número correcto en la posición correcta." }
        ]
      };
    },
    methods: {
      // Genera un código secreto aleatorio de 3 dígitos
      generateSecretCode() {
        return String(Math.floor(Math.random() * 900) + 100); // Genera un número entre 100 y 999
      },
      // Compara la entrada del usuario con el código secreto
      checkGuess() {
        if (this.userInput === this.secretCode) {
          this.result = true; // Correcto
        } else {
          this.result = false; // Incorrecto
        }
      },
      // Método para obtener las pistas para cada código propuesto
      getHint(code) {
        const secret = this.secretCode.split('');
        const guess = code.split('');
        let correctPosition = 0;
        let correctNumberWrongPosition = 0;
  
        // Contamos cuántos números están en la posición correcta
        for (let i = 0; i < 3; i++) {
          if (guess[i] === secret[i]) {
            correctPosition++;
          }
        }
  
        // Contamos cuántos números están en el código pero en posición incorrecta
        for (let i = 0; i < 3; i++) {
          if (secret.includes(guess[i]) && guess[i] !== secret[i]) {
            correctNumberWrongPosition++;
          }
        }
  
        // Retornamos la pista según la comparación
        if (correctPosition > 0 && correctNumberWrongPosition > 0) {
          return `${correctPosition} número(s) correcto(s) en la posición correcta, ${correctNumberWrongPosition} número(s) en la posición incorrecta.`;
        } else if (correctPosition > 0) {
          return `${correctPosition} número(s) correcto(s) en la posición correcta.`;
        } else if (correctNumberWrongPosition > 0) {
          return `${correctNumberWrongPosition} número(s) en la posición incorrecta.`;
        } else {
          return "No hay números correctos.";
        }
      }
    }
  };
  </script>
  
  <style scoped>
  .game-container {
    text-align: center;
    margin: 20px;
  }
  
  .code-item {
    margin: 10px 0;
  }
  
  input {
    padding: 8px;
    font-size: 16px;
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
  </style>
  