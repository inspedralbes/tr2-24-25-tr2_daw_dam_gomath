<template>
  <div>
    <!-- Tablero de Sudoku -->
    <div class="tauler">
      <div v-for="(row, rowIndex) in tablero" :key="rowIndex" class="sudoku-row">
        <div v-for="(cell, colIndex) in row" :key="colIndex" class="sudoku-cell"
          :class="{ 'selected': selectedCell.row === rowIndex && selectedCell.col === colIndex }"
          @click="seleccionarCelda(rowIndex, colIndex)">

          <!-- Subgrid dentro de cada celda -->
          <div class="subgrid">
            <div v-for="(subcell, subIndex) in cell.subgrid" :key="subIndex" class="subgrid-cell">
              <input :value="subcell.value" :readonly="subcell.readonly"
                @click="updateCell(rowIndex, colIndex, subIndex)" />
            </div>
          </div>
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
      selectedCell: { row: null, col: null },
      numeroSeleccionado: null,  // Para almacenar el número seleccionado
    };
  },
  methods: {
    createSubgrid() {
      return Array.from({ length: 9 }, () => ({ value: '', readonly: false }));
    },
    insertarNumero(num) {
      this.numeroSeleccionado = num;  // Guardamos el número seleccionado
    },
    seleccionarCelda(row, col) {
      this.selectedCell = { row, col }; // Seleccionamos la celda
    },
    updateCell(row, col, subIndex) {
      if (!this.tablero[row][col].subgrid[subIndex].readonly) {
        this.tablero[row][col].subgrid[subIndex].value = this.numeroSeleccionado || '';
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
  width: 100%;
  height: 100%;
  text-align: center;
  border: solid black 0.5px;
  background-color: #f0f0f0;
}

.sudoku-cell input:focus {
  outline: none;
}
</style>
