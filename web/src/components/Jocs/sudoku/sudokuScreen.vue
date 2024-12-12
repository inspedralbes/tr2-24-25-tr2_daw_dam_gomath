<template>
  <div>
    <!-- Tablero de Sudoku -->
    <div class="tauler">
      <div v-for="(row, rowIndex) in tablero" :key="rowIndex" class="sudoku-row">
        <div v-for="(cell, colIndex) in row" :key="colIndex"
             class="sudoku-cell"
             :class="{ 'selected': selectedCell.row === rowIndex && selectedCell.col === colIndex }"
             @click="seleccionarCelda(rowIndex, colIndex)">

          <!-- Subgrid dentro de cada celda -->
          <div class="subgrid">
            <div v-for="(subcell, subIndex) in cell.subgrid" :key="subIndex" class="subgrid-cell">
              <input v-model="subcell.value" @input="updateCell(rowIndex, colIndex, subIndex, subcell.value)" :readonly="subcell.readonly" />
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Insertar número -->
    <div>
      <button v-for="num in [1,2,3,4,5,6,7,8,9]" :key="num" @click="insertarNumero(num)">
        {{ num }}
      </button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tablero: [
      [
        { subgrid: this.createSubgrid() },
        { subgrid: this.createSubgrid() },
        { subgrid: this.createSubgrid() }
      ],
      [
        { subgrid: this.createSubgrid() },
        { subgrid: this.createSubgrid() },
        { subgrid: this.createSubgrid() }
      ],
      [
        { subgrid: this.createSubgrid() },
        { subgrid: this.createSubgrid() },
        { subgrid: this.createSubgrid() }
      ]
    ],
    selectedCell: { row: null, col: null, subcell: null },
  };
},
  methods: {
    createSubgrid() {
    return Array.from({ length: 9 }, () => ({ value: '', readonly: false }));
  },
    seleccionarCelda(row, col) {
      this.selectedCell = { row, col, subcell: null }; // Ahora se incluye la selección de subcelda como null
    },
    updateCell(row, col, subIndex, value) {
      // Actualizamos la celda correspondiente del tablero, con la subcelda indicada
      this.tablero[row][col].subgrid[subIndex].value = value;
    },
    insertarNumero(num) {
      if (this.selectedCell.row !== null && this.selectedCell.col !== null && this.selectedCell.subcell !== null) {
        // Para simplificar, asignamos el número a la subcelda seleccionada
        this.tablero[this.selectedCell.row][this.selectedCell.col].subgrid[this.selectedCell.subcell].value = num;
      }
    },
    seleccionarSubcelda(subIndex) {
      // Permite seleccionar una subcelda dentro de una celda
      if (this.selectedCell.row !== null && this.selectedCell.col !== null) {
        this.selectedCell.subcell = subIndex;
      }
    }
  },
};
</script>


<style scoped>

/*Estilos del tablero*/
.tauler {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: repeat(3, 1fr);
  width: 500px;
  height: 500px;
  margin: 50px auto;
}

.sudoku-cell {
  display: grid;
  position: relative;
  border: solid black 1px;
  padding: 0;
  width: 100%;
  height: 80%;
}

.subgrid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: repeat(3, 1fr);
  width: 100%;
  height: 100%;
  gap: 0;
}

.subgrid .subgrid-cell {
  display: flex;
  justify-content: center;
  align-items: center;
}

.sudoku-cell input {
  width: 100%; /* Ocupa el 100% del espacio disponible */
  height: 100%; /* Ocupa el 100% del espacio disponible */
  text-align: center;
  border: solid black 0.5px; /* Elimina el borde de los inputs */
  background-color: #f0f0f0; /* Color de fondo */
}

.sudoku-cell input:focus {
  outline: none; /* Elimina el contorno cuando el input está enfocado */
}


</style>
