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
import { sudokuGenerator } from "../../../services/sudokuService";

export default {
  data() {
    return {
      tablero: Array(9).fill().map(() => Array(9).fill({ value: '', readonly: false })),
      selectedCell: { row: null, col: null },
      dificultad: null,
      numeroSeleccionado: null, // Para almacenar el número seleccionado
      nivelSeleccionado: false,
      niveles: ["Novell", "Vetera", "Elit", "Professional"] // Niveles de dificultad
    };
  },
  methods: {
    createSubgrid() {
      return Array.from({ length: 9 }, () => ({ value: '', readonly: false }));
    },
    insertarNumero(num) {
      this.numeroSeleccionado = num; // Guardamos el número seleccionado
      console.log(this.numeroSeleccionado);

    },
    seleccionarCelda(row, col) {
      this.selectedCell = { row, col }; // Seleccionamos la celda
    },
    updateCell(row, col) {
  console.log(row, col);

  console.log('antes del update');

  // Comprobamos si la celda no es de solo lectura
  if (!this.tablero[row][col].readonly) {
    // Actualizamos el valor de la celda con el número seleccionado o vacío si no hay selección
    this.tablero[row][col].value = this.numeroSeleccionado || '';
  }
},

    async generarTablero(dificultad) {
      try {
        // Generar tablero desde el servicio
        const generatedBoard = sudokuGenerator(dificultad);
        console.log("Tablero generado:", generatedBoard);

        // Actualizar el tablero
        this.actualizarTablero(generatedBoard);
      } catch (error) {
        console.error("Error al generar el tablero:", error);
      }
    },
    actualizarTablero(boardString) {
  // Convertir el string generado en el formato esperado por el componente
  const boardArray = boardString.split('');
  let index = 0;

  // Iterar sobre las filas (9 filas)
  for (let row = 0; row < 9; row++) {
    // Iterar sobre las columnas (9 columnas por fila)
    for (let col = 0; col < 9; col++) {
      // Cada celda será un objeto con su valor y si es solo de lectura o no
      this.tablero[col][row] = {
        value: boardArray[index] === '.' ? '' : boardArray[index],  // Si es '.', dejamos la celda vacía
        readonly: boardArray[index] !== '.',  // Si no es '.', la celda es de solo lectura
      };
      index++;  // Aumentamos el índice para movernos al siguiente carácter en el string
    }
  }
},
    seleccionarNivel(nivel) {
      console.log(nivel);
      this.dificultad = nivel.toLowerCase();
      console.log(this.dificultad);
      this.nivelSeleccionado = true;
      if (this.nivelSeleccionado) {
        const dificultadMap = {
          "novell": "easy",
          "vetera": "medium",
          "elit": "hard",
          "professional": "very-hard"
        };
        //Mapeo del nivel introducido por el usuario
        const dificultadServicio = dificultadMap[this.dificultad];
        console.log(dificultadServicio);

        if (dificultadServicio) {
          this.generarTablero(dificultadServicio);
        } else {
          console.error("Dificultad no válida seleccionada");
        }
      }
    }
  }
};
</script>

<style scoped>
/*Estilos del selector de nivel*/
.leveler {
  display: flex;
  justify-content: center;
  gap: 1rem;
  margin: 20px 0;
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
  grid-template-columns: repeat(9, 1fr);  /* 9 columnas, una por cada celda del tablero */
  grid-template-rows: repeat(9, 1fr);     /* 9 filas */
  width: 470px;                           /* Tamaño fijo del tablero */
  height: 470px;                          /* Asegura que sea cuadrado */
  margin: 50px auto;
  gap: 1px; /* Espacio entre las celdas */
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
  width: 99%;   /* Ajusta el tamaño del input dentro de la celda */
  height: 99%;  /* Mantiene la relación de aspecto dentro de la celda */
  text-align: center;
  border: solid black 0.5px;
  background-color: #f0f0f0;
}

.sudoku-cell input:focus {
  outline: none;
}




</style>
