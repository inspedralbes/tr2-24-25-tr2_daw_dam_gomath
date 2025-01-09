<template>
  <div>
    <!-- Selector de Nivel -->
    <div class="leveler1" v-if="!nivelSeleccionado">
      <h1>Nivell</h1>
    </div>
    <div class="leveler2" v-if="!nivelSeleccionado">
      <q-btn color="primary" class="nivel" v-for="nivel in niveles" :key="nivel" @click="seleccionarNivel(nivel)">
        {{ nivel }}
      </q-btn>
    </div>

    <!-- Tablero de Sudoku -->
    <div v-if="nivelSeleccionado && !gameOver" class="game-container">
      <div class="tauler">
        <div v-for="colIndex in 9" :key="colIndex" class="sudoku-row">
          <div v-for="rowIndex in 9" :key="rowIndex" class="sudoku-cell"
            :class="{ 'selected': selectedCell.row === rowIndex && selectedCell.col === colIndex }"
            @click="seleccionarCelda(rowIndex, colIndex)">
            <input :value="tablero[(rowIndex - 1) * 9 + (colIndex - 1)].value"
              :readonly="tablero[(rowIndex - 1) * 9 + (colIndex - 1)].readonly"
              @click="updateCell(rowIndex - 1, colIndex - 1)" />
          </div>
        </div>
      </div>

      <!-- Insertar número -->
      <div class="numeros">
        <q-btn color="primary" v-for="num in numeros" :key="num" @click="insertarNumero(num)">
          {{ num }}
        </q-btn>
      </div>

      <!-- Control Panel -->
      <div class="control-panel">
        <div class="temps" id="tempPanel">Temps: {{ timeFormatted }}</div>
        <div class="vides" id="errorPanel">Vides: {{ vides }}</div>
      </div>
    </div>

    <!-- Pantalla final -->
    <div v-if="gameOver" class="final">
      <h2>¡Juego terminado!</h2>
      <p>Errores cometidos: {{ OriginVides - vides }}</p>
      <q-btn color="primary" @click="salir">Salir</q-btn>
    </div>
  </div>
</template>


<script>
import * as sudokuService from "../../../services/sudokuService";


export default {
  data() {
    return {
      tablero: Array(81).fill({ value: '', readonly: false }),
      selectedCell: { row: null, col: null },
      dificultad: null,
      OriginVides: null,
      vides: null,
      maxTime: null,
      temporizador: null,
      timeFormatted: null,
      numeroSeleccionado: null,
      nivelSeleccionado: false,
      niveles: ["Novell", "Vetera", "Elit", "Professional"],
      numeros: [1, 2, 3, 4, 5, 6, 7, 8, 9],
      contadorNumeros: { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0, 9: 0 },
      gameOver: false,
      gameTime: [],
      gameData: {},
    };
  },

  methods: {

    /**
     * Selecciona el nivel de dificultad y genera el tablero correspondiente.
     * @param {string} nivel - Nivel de dificultad seleccionado
     * novell = 6err
     * vetera = 4err
     * elit = 3err & 5'maxTime
     * professional = 2err & 4'maxTime
     */
    seleccionarNivel(nivel) {
      console.log(nivel);
      this.dificultad = nivel.toLowerCase();
      console.log(this.dificultad);
      this.nivelSeleccionado = true; // Marca que se ha seleccionado un nivel

      if (this.nivelSeleccionado) {
        //Mapeo de los niveles a las opciones correspondientes del servicio
        const dificultadMap = {
          "novell": "easy",
          "vetera": "medium",
          "elit": "hard",
          "professional": "very-hard"
        };

        // Inicialización de la variable errors según el nivel seleccionado
        switch (this.dificultad) {
          case "novell":
            this.vides = 6;
            this.OriginVides = 6;
            this.maxTime = 600000;
            break;
          case "vetera":
            this.vides = 4;
            this.OriginVides = 4;
            this.maxTime = 600000;
            break;
          case "elit":
            this.vides = 3;
            this.OriginVides = 3;
            this.maxTime = 300000;
            break;
          case "professional":
            this.vides = 2;
            this.OriginVides = 2;
            this.maxTime = 240000;
            break;
          default:
            this.vides = 0;
            break;
        }

        const dificultadServicio = dificultadMap[this.dificultad]; // Obtiene la dificultad mapeada
        console.log(dificultadServicio);

        if (dificultadServicio) {
          this.generarTablero(dificultadServicio); // Genera el tablero con la dificultad seleccionada
        } else {
          console.error("Dificultad no válida seleccionada"); // Maneja errores de dificultad no válida
        }
      }
    },

    /**
     * Genera un tablero de Sudoku con el nivel de dificultad seleccionado.
     * @param {string} dificultad - Dificultad del tablero
     */
    async generarTablero(dificultad) {
      try {
        const generatedBoard = sudokuService.sudokuGenerator(dificultad); // Llama al generador de Sudoku
        console.log("Tablero generado:", generatedBoard);
        this.actualizarTablero(generatedBoard); // Actualiza el tablero
        this.inicializarContNum(generatedBoard); //Inicia el contador de numeros en la tabla
        this.setTemporizador();  // Inicia el temporizador
      } catch (error) {
        console.error("Error al generar el tablero:", error);
      }
    },

    /**
     * Actualiza el tablero con un nuevo conjunto de valores.
     * @param {string} boardString - Representación del tablero como un string
     */
    actualizarTablero(boardString) {
      const boardArray = boardString.split(''); // Convierte el string en un array
      this.tablero = boardArray.map((char) => ({
        value: char === '.' ? '' : char,
        readonly: char !== '.',
      }));
    },

    /**
     * Crea y configura el temporizador del juego
     */
    setTemporizador() {
      const startTime = Date.now();
      this.temporizador = setInterval(() => {
        this.maxTime -= 1000; // Reduce un segundo (1000ms)
        this.timeFormatted = this.formatearTiempo(this.maxTime);
        console.log(`Tiempo restante: ${Math.floor(this.maxTime / 1000)}s`);

        // Si el tiempo se agota, termina el juego
        if (this.maxTime <= 0) {
          clearInterval(this.temporizador);
          console.log("¡Tiempo agotado!");
          this.gameTime = (Date.now() - startTime) / 1000; // Calculamos el tiempo transcurrido en segundos
          this.finalizarJuego(false); // Finaliza el juego
        }

        // Si las vidas se acaban, termina el juego
        if (this.vides === 0) {
          clearInterval(this.temporizador);
          this.gameTime = (Date.now() - startTime) / 1000; // Calculamos el tiempo transcurrido en segundos
          this.finalizarJuego(false); // Finaliza el juego
        }
      }, 1000); // Intervalo de 1 segundo
    },


    /**
     * Cuenta cada numero en el tablero para garantizar el correcto funcionamiento de la variable
     */
    inicializarContNum(boardString) {
      for (let i = 0; i < boardString.length; i++) {
        let num = parseInt(boardString[i]);
        this.contadorNumeros[num]++;
      }
      console.log(this.contadorNumeros);
    },

    /**
     * Formatea el tiempo de milisegundos a formato mm:ss
     * @param {integer} ms - Current time
     * @returns {string} - Tiempo formateado
     */
    formatearTiempo(ms) {
      let minutos = Math.floor(ms / 60000); // Convertir a minutos
      let segundos = Math.floor((ms % 60000) / 1000); // Obtener los segundos restantes
      segundos = segundos < 10 ? '0' + segundos : segundos; // Asegurar que los segundos sean dos dígitos
      return `${minutos}:${segundos}`;
    },

    /**
     * Convierte el tablero al que usa el servicio
     * @returns
     */
    convertirTableroAStrIng() {
      return this.tablero.map(celda => celda.value || '.').join('');
    },

    /**
     * Marca una celda como seleccionada para permitir su edición.
     * @param {number} row - Fila de la celda seleccionada
     * @param {number} col - Columna de la celda seleccionada
     */
    seleccionarCelda(row, col) {
      this.selectedCell = { row, col }; // Actualiza la celda seleccionada
    },

    /**
     * Establece el número seleccionado para usar en el tablero.
     * @param {number} num - Número seleccionado
     */
    insertarNumero(num) {
      if (!this.numeros.includes(num)) return; // Si el número ya ha sido eliminado, no hacer nada

      this.numeroSeleccionado = num;
      console.log(this.numeroSeleccionado);
    },

    /**
     * Actualiza el valor de una celda si el número es válido según las reglas de Sudoku.
     * @param {number} row - Fila de la celda a actualizar
     * @param {number} col - Columna de la celda a actualizar
     */
    updateCell(row, col) {
      const index = row * 9 + col;
      if (!this.tablero[index].readonly) {
        const num = this.numeroSeleccionado;
        const boardString = this.convertirTableroAStrIng(this.tablero);
        console.log('tablero String: ', boardString);
        const isMoveOk = sudokuService.isValidMove(boardString, row, col, num);
        if (!isMoveOk) {
          alert(`El número ${num} no es válido en esa posición.`);
          if (this.vides == 0) {
            console.log('GAME OVER');
            this.gameOver = true;
          } else {
            this.vides--;
          }
          return;
        }

        this.contadorNumeros[num]++;


        if (this.contadorNumeros[num] == 9) {
          this.numeros = this.numeros.filter(n => n !== num);
        }

        this.tablero[index].value = num;
        this.tablero[index].readonly = true;
        const resultado = this.convertirTableroAStrIng(this.tablero)
        console.log('tablero cambiado: ', resultado);
        if (!resultado.includes('.')) {
          console.log('¡Felicidades! El tablero está resuelto.');
          this.jocAcabat(boardString);
        }
      }
    },

    /**
    * Marca el final del juego, actualiza el estado de `gameOver` a `true` y guarda los datos de la partida.
    * Muestra en la consola un mensaje indicando que el juego ha terminado, junto con las vidas restantes y el tiempo jugado.
    * Si ocurre un error durante el proceso, lo captura y lo muestra en la consola para su depuración.
    *
    * @param {string} boardString - Representación en cadena del tablero al final del juego.
    * @returns {boolean} - Retorna `true` si el proceso finalizó correctamente.
    */
    jocAcabat(boardString) {

      try {
        this.gameOver = true;
        console.log(`Juego terminado. vidas restantes: ${this.vides}/${this.OriginVides}`);

        this.gameData = {
          boardString: boardString,
          nivell: this.nivelSeleccionado,
          vides: `${this.vides}/${this.OriginVides}`,
          temps: `${this.gameTime}`,
        }

        sudokuService.guardarDades(this.gameData);
      } catch (error) {
        console.error('Error al finalizar el juego:', error);
      }

      return true;
    },

    /**
    * Redirige al usuario a la página de selección de juegos.
    * Utiliza el router para navegar a la ruta `/jocs`.
    *
    * @returns {void}
    */
    salir() {
      this.$router.push('/jocs');
    }
  }
}
</script>

<style scoped>
/*Estilos del selector de nivel*/
.leveler1 {
  display: flex;
  justify-content: center;
  gap: 1rem;
  margin-top: 100px;
}

.leveler2 {
  display: flex;
  justify-content: center;
  gap: 1rem;
  margin-top: 20px;
}

.readonly {
  font-weight: bold;
}

.nivel {
  padding: 10px 20px;
  border: 2px solid #000;
  background-color: #f0f0f0;
  cursor: pointer;
  transition: background-color 0.3s;
}

.nivel:hover {
  background-color: #ddd;
}

/* Contenedor principal del tablero y el panel de control */
.game-container {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
}

/* Estilos del tablero */
.tauler {
  display: grid;
  grid-template-columns: repeat(9, 1fr);
  grid-template-rows: repeat(9, 1fr);
  width: 470px;
  height: 470px;
  margin-top: 50px;
  margin-left: 50px;
  margin-right: 20px;
  gap: 1px;
}

/* Estilos de las celdas del tablero */
.sudoku-cell {
  display: flex;
  justify-content: center;
  align-items: center;
  border: solid black 1px;
  padding: 0;
  width: 100%;
  height: 25%;
}

.sudoku-cell input {
  width: 99%;
  height: 99%;
  text-align: center;
  border: solid black 0.5px;
  background-color: #f0f0f0;
}

.sudoku-cell input:focus {
  outline: none;
}

/* Estilos de los números a escoger */
.numeros {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 10px;
  justify-items: center;
  width: 100%;
  max-width: 150px;
  margin: 0 auto;
  margin-top: 180px;
}

.numeros q-btn {
  padding: 15px;
  font-size: 20px;
  cursor: pointer;
  border: 1px solid #000;
  transition: background-color 0.3s;
  width: 50px;
  /* Ajusta el tamaño de los botones */
  height: 50px;
  /* Ajusta el tamaño de los botones */
  display: flex;
  align-items: center;
  justify-content: center;
}


/* Estilos del Panel de Control a la derecha */
.control-panel {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  width: 200px;
  padding: 10px;
  margin-top: 180px;
  margin-right: 50px;
  background-color: #f7f7f7;
  border: 2px solid #ddd;
  border-radius: 10px;
  box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
}

/*Estilos del Panel de Control */

.temps {
  font-family: 'Aller', sans-serif;
  font-size: 2rem;
  color: rgb(77, 133, 236);
  /* Un color destacado para el tiempo */
  text-align: center;
  margin-top: 1rem;
  animation: blink 1s infinite alternate;
  /* Animación para dar efecto de parpadeo */
}

/* Animación opcional para el tiempo */
@keyframes blink {
  from {
    opacity: 1;
  }

  to {
    opacity: 0.5;
  }
}


.vides {
  font-family: 'Blogger Sans', sans-serif;
  font-size: 1.5rem;
  color: #F05050;
  background-color: #ffffff;
  border: 2px solid #F05050;
  border-radius: 5px;
  padding: 0.5rem 1rem;
  text-align: center;
  margin-top: 1rem;
  width: fit-content;
  margin-left: auto;
  margin-right: auto;
  box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.35);
}

/* Estilos de la pantalla final*/

.final {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: lightgrey;
  /* Fondo oscuro */
  color: black;
  /* Texto claro */
  padding: 30px;
  border-radius: 15px;
  box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
  text-align: center;
  width: 80%;
  max-width: 400px;
  z-index: 100;
}

.final h2 {
  font-family: 'Blogger Sans', sans-serif;
  font-size: 24px;
  margin-bottom: 15px;
}

.final p {
  font-family: 'Aller', sans-serif;
  font-size: 18px;
  margin-bottom: 20px;
}
</style>
