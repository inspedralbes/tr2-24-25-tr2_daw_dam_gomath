// sudokuService.js

const sudoku = {};  // Lógica de la librería Sudoku

// Funciones internas necesarias para generar el Sudoku

sudoku._cross = function(A, B) {
  var result = [];
  for (var i = 0; i < A.length; i++) {
    for (var j = 0; j < B.length; j++) {
      result.push(A[i] + B[j]);
    }
  }
  return result;
};

sudoku.DIGITS = "123456789";  // Dígitos permitidos
var ROWS = "ABCDEFGHI";  // Filas
var COLS = sudoku.DIGITS;  // Columnas
var SQUARES = sudoku._cross(ROWS, COLS);  // Casillas

var DIFFICULTY = {
  "easy": 62,
  "medium": 53,
  "hard": 44,
  "very-hard": 35,
  "insane": 26,
  "inhuman": 17,
};

sudoku.BLANK_CHAR = '.';  // Carácter de casilla vacía

sudoku._shuffle = function(array) {
  var shuffled = array.slice(0);
  for (var i = shuffled.length - 1; i > 0; i--) {
    var j = Math.floor(Math.random() * (i + 1));
    [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
  }
  return shuffled;
};

// Función pública para generar el Sudoku
function generarSudoku(dificultad) {
  const difficulty = DIFFICULTY[dificultad] || DIFFICULTY.easy;

  // Generar tablero vacío con las casillas posibles
  var board = Array(81).fill(sudoku.BLANK_CHAR);

  // Lógica para generar el Sudoku, que se puede expandir según sea necesario
  var numBlanks = difficulty;
  var filledSquares = sudoku._shuffle(SQUARES).slice(0, 81 - numBlanks);  // Elimina casillas según la dificultad

  // Asignación de valores en el tablero
  filledSquares.forEach(function(square) {
    board[SQUARES.indexOf(square)] = sudoku.DIGITS.charAt(Math.floor(Math.random() * 9)); // Asignar valor aleatorio
  });

  return board.join('');
}

// Exportar la función directamente
export { generarSudoku };
