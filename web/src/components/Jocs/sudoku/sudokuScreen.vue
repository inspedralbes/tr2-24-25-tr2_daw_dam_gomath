<template>
  <div>
    <!-- Selector de Nivel -->
    <div class="leveler" v-if="!nivelSeleccionado">
      <div class="nivel" v-for="nivel in niveles" :key="nivel" @click="seleccionarNivel(nivel)">
        {{ nivel }}
      </div>
    </div>

    <!-- Tablero de Sudoku -->
    <div v-if="nivelSeleccionado && !gameOver">
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
      <div>
        <button v-for="num in [1, 2, 3, 4, 5, 6, 7, 8, 9]" :key="num" @click="insertarNumero(num)">
          {{ num }}
        </button>
      </div>

      <!-- Control Panel -->
      <div>
        <div class="temps" id="tempPanel">Temps: 00:00</div>
        <div class="errors" id="errorPanel">Errors: 0</div>
      </div>

    </div>

    <!-- Pantalla final -->
    <div v-if="gameOver">
      <h2>¡Juego terminado!</h2>
      <p>Errores cometidos: {{ errors }}</p>
      <button>Salir</button>
    </div>
  </div>
</template>


<script>
import { isValidMove, sudokuGenerator } from "../../../services/sudokuService";


export default {
  data() {
    return {
      // Estado inicial del tablero, vacío con 9 filas y 9 columnas
      tablero: Array(81).fill({ value: '', readonly: false }),
      selectedCell: { row: null, col: null },
      dificultad: null,
      errors: null,
      maxTime: null,
      numeroSeleccionado: null, // Número seleccionado para insertar
      nivelSeleccionado: false, // Indicador de si se ha seleccionado un nivel
      niveles: ["Novell", "Vetera", "Elit", "Professional"],
      gameOver: false,
    };
  },

  methods: {

    /**
     * Selecciona el nivel de dificultad y genera el tablero correspondiente.
     * @param {string} nivel - Nivel de dificultad seleccionado
     * novell = 6err
     * vetera = 4err
     * elit = 3err 5'maxTime
     * professional = 2err 4'maxTime
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
            this.errors = 6;
            this.OriginError = 6
            break;
          case "vetera":
            this.errors = 4;
            this.OriginError = 4
            break;
          case "elit":
            this.errors = 3;
            this.OriginError = 3
            this.maxTime = 5;
            break;
          case "professional":
            this.errors = 2;
            this.OriginError = 2
            this.maxTime = 4;
            break;
          default:
            this.errors = 0;
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
        const generatedBoard = sudokuGenerator(dificultad); // Llama al generador de Sudoku
        console.log("Tablero generado:", generatedBoard);
        this.actualizarTablero(generatedBoard); // Actualiza el tablero
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
      this.numeroSeleccionado = num; // Asigna el número seleccionado
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
        const isMoveOk = isValidMove(boardString, row, col, num);
        if (!isMoveOk) {
          alert(`El número ${num} no es válido en esa posición.`);
          if (this.errors == 0) {
            console.log('GAME OVER');
          } else {
            this.errors--;
          }
          return;
        }
        this.tablero[index].value = num;
        const resultado = this.convertirTableroAStrIng(this.tablero)
        console.log('tablero cambiado: ', resultado);
        if (!resultado.includes('.')) {
          console.log('¡Felicidades! El tablero está resuelto.');
          this.jocAcabat();
        }
      }
    },

    jocAcabat() {
      this.gameOver = true;
      console.log(`Juego terminado. Errores cometidos: ${this.errors}/${this.OriginError}`);
    }
  }
}
</script>

<style scoped>
/*Estilos del selector de nivel*/
.leveler {
  display: flex;
  justify-content: center;
  gap: 1rem;
  margin: 20px 0;
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

/* Estilos del tablero */
.tauler {
  display: grid;
  grid-template-columns: repeat(9, 1fr);
  /* 9 columnas, una por cada celda del tablero */
  grid-template-rows: repeat(9, 1fr);
  /* 9 filas */
  width: 470px;
  /* Tamaño fijo del tablero */
  height: 470px;
  /* Asegura que sea cuadrado */
  margin: 50px auto;
  gap: 1px;
  /* Espacio entre las celdas */
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
  /* Ajusta el tamaño del input dentro de la celda */
  height: 99%;
  /* Mantiene la relación de aspecto dentro de la celda */
  text-align: center;
  border: solid black 0.5px;
  background-color: #f0f0f0;
}

.sudoku-cell input:focus {
  outline: none;
}
</style>
