<template>
  <div>
    <!-- Selector de Nivell -->
    <div class="leveler" v-if="!nivelSeleccionado">
      <div class="nivel" v-for="nivel in niveles" :key="nivel" @click="seleccionarNivel(nivel)">
        {{ nivel }}
      </div>
    </div>

    <!-- Tablero de Sudoku -->
    <div v-if="nivelSeleccionado">
      <div class="tauler">
        <div v-for="(row, rowIndex) in tablero" :key="rowIndex" class="sudoku-row">
          <div v-for="(cell, colIndex) in row" :key="colIndex" class="sudoku-cell"
            :class="{ 'selected': selectedCell.row === rowIndex && selectedCell.col === colIndex }"
            @click="seleccionarCelda(rowIndex, colIndex)">
            <input :value="cell.value" :readonly="cell.readonly" @click="updateCell(rowIndex, colIndex)" />
          </div>
        </div>
      </div>

      <!-- Insertar número -->
      <div>
        <button v-for="num in [1, 2, 3, 4, 5, 6, 7, 8, 9]" :key="num" @click="insertarNumero(num)">
          {{ num }}
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import { isValidMove, sudokuGenerator } from "../../../services/sudokuService";


export default {
  data() {
    return {
      // Estado inicial del tablero, vacío con 9 filas y 9 columnas
      tablero: Array(9).fill().map(() => Array(9).fill({ value: '', readonly: false })),
      selectedCell: { row: null, col: null },
      dificultad: null,
      numeroSeleccionado: null, // Número seleccionado para insertar
      nivelSeleccionado: false, // Indicador de si se ha seleccionado un nivel
      niveles: ["Novell", "Vetera", "Elit", "Professional"]
    };
  },

  methods: {
    /**
     * Crea una subgrilla vacía con 9 celdas.
     * @returns {Array} Subgrilla creada
     */
    createSubgrid() {
      return Array.from({ length: 9 }, () => ({ value: '', readonly: false }));
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
     * Marca una celda como seleccionada para permitir su edición.
     * @param {number} row - Fila de la celda seleccionada
     * @param {number} col - Columna de la celda seleccionada
     */
    seleccionarCelda(row, col) {
      this.selectedCell = { row, col }; // Actualiza la celda seleccionada
    },

    /**
     * Actualiza el valor de una celda si el número es válido según las reglas de Sudoku.
     * @param {number} row - Fila de la celda a actualizar
     * @param {number} col - Columna de la celda a actualizar
     */
    updateCell(row, col) {
      if (!this.tablero[row][col].readonly) {
        const num = this.numeroSeleccionado;

        const isMoveOk = isValidMove(this.tablero, row, col, num);

        if (!isMoveOk) {
          alert(`El número ${num} no es válido en esa posición.`);
          return;
        }

        this.tablero[row][col].value = num; // Actualiza el valor si el movimiento es válido
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
      let index = 0;

      // Itera sobre las filas y columnas para actualizar el tablero
      for (let row = 0; row < 9; row++) {
        for (let col = 0; col < 9; col++) {
          this.tablero[col][row] = {
            value: boardArray[index] === '.' ? '' : boardArray[index], // Si es '.', deja vacío
            readonly: boardArray[index] !== '.', // Si no es '.', marca como solo lectura
          };
          index++;
        }
      }
    },

    /**
     * Selecciona el nivel de dificultad y genera el tablero correspondiente.
     * @param {string} nivel - Nivel de dificultad seleccionado
     */
    seleccionarNivel(nivel) {
      console.log(nivel);
      this.dificultad = nivel.toLowerCase();
      console.log(this.dificultad);
      this.nivelSeleccionado = true; // Marca que se ha seleccionado un nivel

      if (this.nivelSeleccionado) {
        // Mapeo de los niveles a las opciones correspondientes del servicio
        const dificultadMap = {
          "novell": "easy",
          "vetera": "medium",
          "elit": "hard",
          "professional": "very-hard"
        };

        const dificultadServicio = dificultadMap[this.dificultad]; // Obtiene la dificultad mapeada
        console.log(dificultadServicio);

        if (dificultadServicio) {
          this.generarTablero(dificultadServicio); // Genera el tablero con la dificultad seleccionada
        } else {
          console.error("Dificultad no válida seleccionada"); // Maneja errores de dificultad no válida
        }
      }
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
