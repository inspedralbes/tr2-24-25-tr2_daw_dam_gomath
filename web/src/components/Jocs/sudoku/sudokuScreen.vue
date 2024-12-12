<template>
  <div>
    <!-- Selector de nivel -->
    <h1>Escull el nivell</h1>
    <div v-if="showLeveler" class="leveler">
      <div class="level" v-for="(nivel, index) in niveles" :key="index">
        <button @click="seleccionarNivel(nivel.interno)">{{ nivel.visible }}</button>
      </div>
    </div>

    <!-- Tablero y números (ocultos inicialmente) -->
    <div v-else>
      <div class="tauler">
        <!-- Aquí se generará dinámicamente el tablero -->
        <div v-for="(row, rowIndex) in tablero" :key="rowIndex" class="sudoku-row">
          <input v-for="(cell, colIndex) in row" :key="colIndex" class="sudoku-cell" :readonly="cell.readonly"
            :value="cell.value" @input="updateCell(rowIndex, colIndex, $event.target.value)"
            :class="{ 'peer': cell.isPeer }" @click="resaltarPeers(rowIndex, colIndex)" /> <!-- Clase condicional para resaltar los peers -->
        </div>
      </div>
      <div class="numeros">
        <!-- Números para interactuar -->
        <button v-for="num in [1, 2, 3, 4, 5, 6, 7, 8, 9]" :key="num">{{ num }}</button>
      </div>
    </div>
  </div>
</template>


<style scoped>
.leveler {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 20px 0;
}

.level {
  margin: 10px 0;
}

.tauler {
  display: grid;
  grid-template-columns: repeat(9, 1fr);
  gap: 2px;
  /* Gap entre todas las celdas */
  width: 360px;
  /* Asegúrate de que el tablero sea cuadrado */
  height: 360px;
  /* Asegúrate de que el tablero sea cuadrado */
  margin: 20px auto;
  /* Centrado horizontal */
}

.sudoku-cell {
  width: 100%;
  height: 100%;
  text-align: center;
  font-size: 16px;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #f9f9f9;
  /* Color de fondo de las celdas */
  border: 1px solid #ccc;
  /* Borde por defecto */
}

.sudoku-cell.peer {
  background-color: #f0f0f0;  /* Color para las celdas de los vecinos */
  border: 2px solid red; /* Borde rojo para marcar los "peers" */
}

/* Separación entre los bloques de 3x3 utilizando gap */
.tauler {
  display: grid;
  grid-template-columns: repeat(9, 1fr);
  gap: 5px 5px;
  /* Gap de 5px tanto en filas como en columnas */
}

/* Estilo para las celdas vacías */
.sudoku-cell.empty {
  background-color: #e0e0e0;
  /* Color para casillas vacías */
}

/* Estilo para marcar celdas de "peers" */
.sudoku-cell.peer {
  background-color: #f0f0f0;
  /* Color para las celdas de los vecinos */
  border: 2px solid red;
  /* Borde rojo para marcar los "peers" */
}

.numeros button {
  margin: 5px;
  width: 40px;
  height: 40px;
  font-size: 16px;
  display: inline-block;
  border: 1px solid #ccc;
  background-color: #f0f0f0;
  cursor: pointer;
}

.numeros button:hover {
  background-color: #ddd;
  /* Color cuando el botón es hover */
}
</style>




<script>
import { generarSudoku } from "../../../services/SudokuService.js"; // Reutilizando el generador

export default {
  data() {
    return {
      showLeveler: true, // Mostrar/ocultar el selector de nivel
      niveles: [
        { visible: "NOVELL", interno: "easy" },
        { visible: "VETERÀ", interno: "medium" },
        { visible: "ELIT", interno: "hard" },
        { visible: "PROFESSIONAL", interno: "expert" },
      ],
      nivelSeleccionado: null, // Guardará el nivel interno seleccionado
      tablero: [], // Tablero generado según el nivel
      selectedCell: { row: null, col: null }, // Estado para la celda seleccionada
    };
  },
  methods: {
    seleccionarNivel(nivel) {
      this.nivelSeleccionado = nivel;
      this.showLeveler = false; // Oculta el selector de nivel
      this.generarTablero();
    },
    generarTablero() {
      // Llamar al generador de Sudoku con dificultad (puedes pasar 'this.nivelSeleccionado' si el generador lo soporta)
      this.tablero = generarSudoku(this.nivelSeleccionado);
    },
    updateCell(row, col, value) {
      this.tablero[row][col].value = value;
    },
    resaltarPeers(row, col) {
      // Limpiamos el estado de "isPeer" en todas las celdas
      this.tablero.forEach(r => r.forEach(cell => cell.isPeer = false));

      // Resaltamos los peers de la celda seleccionada
      // Resaltar fila y columna
      for (let i = 0; i < 9; i++) {
        this.tablero[row][i].isPeer = true; // Resaltamos la fila
        this.tablero[i][col].isPeer = true; // Resaltamos la columna
      }

      // Resaltar el subcuadro 3x3
      const startRow = Math.floor(row / 3) * 3;
      const startCol = Math.floor(col / 3) * 3;
      for (let i = startRow; i < startRow + 3; i++) {
        for (let j = startCol; j < startCol + 3; j++) {
          this.tablero[i][j].isPeer = true;
        }
      }
    },
  },
};
</script>
