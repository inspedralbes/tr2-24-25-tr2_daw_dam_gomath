// sudokuService.js

const sudoku = {}; // Lógica de la librería Sudoku

/**
 * Combina elementos de dos arreglos y devuelve un nuevo arreglo con todas las combinaciones posibles.
 * @param {string[]} A - Primer arreglo de elementos.
 * @param {string[]} B - Segundo arreglo de elementos.
 * @returns {string[]} - Arreglo con todas las combinaciones posibles de A y B.
 */
sudoku._cross = function (A, B) {
  const result = [];
  for (let i = 0; i < A.length; i++) {
    for (let j = 0; j < B.length; j++) {
      result.push(A[i] + B[j]);
    }
  }
  return result;
};

// Constantes clave
sudoku.DIGITS = "123456789"; // Dígitos permitidos
const ROWS = "ABCDEFGHI"; // Filas
const COLS = sudoku.DIGITS; // Columnas
const SQUARES = sudoku._cross(ROWS, COLS); // Todas las casillas ("A1", "A2", ... "I9")

// Niveles de dificultad: Número de casillas visibles
const DIFFICULTY = {
  "easy": 62,
  "medium": 53,
  "hard": 44,
  "very-hard": 35,
  "insane": 26,
  "inhuman": 17,
};

sudoku.BLANK_CHAR = "."; // Carácter de casilla vacía

/**
 * Baraja un arreglo aleatoriamente.
 * @param {any[]} array - El arreglo a barajar.
 * @returns {any[]} - Una copia del arreglo barajado.
 */
sudoku._shuffle = function (array) {
  const shuffled = array.slice();
  for (let i = shuffled.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
  }
  return shuffled;
};

/**
 * Resuelve un tablero de Sudoku utilizando backtracking.
 * @param {string[]} board - Tablero de Sudoku representado como un arreglo de 81 caracteres.
 * @returns {string[]|false} - Tablero resuelto o false si no tiene solución.
 */
function solveSudoku(board) {
  const findEmpty = board.indexOf(sudoku.BLANK_CHAR);
  if (findEmpty === -1) return board; // Tablero completo

  const row = Math.floor(findEmpty / 9);
  const col = findEmpty % 9;

  for (const digit of sudoku.DIGITS) {
    if (isValidMove(board, row, col, digit)) {
      board[findEmpty] = digit;
      if (solveSudoku(board)) return board;
      board[findEmpty] = sudoku.BLANK_CHAR; // Backtracking
    }
  }

  return false; // Sin solución
}

/**
 * Verifica si un movimiento es válido en un tablero de Sudoku.
 *
 * @param {string[]} board - Un array que representa el tablero de Sudoku en forma de cadena de caracteres,
 *                           donde cada posición es un dígito o un '.' para celdas vacías.
 * @param {number} row - Índice de la fila donde se intenta colocar el número.
 * @param {number} col - Índice de la columna donde se intenta colocar el número.
 * @param {string} digit - El número que se desea colocar, representado como un carácter ('1'-'9').
 * @returns {boolean} - Retorna `true` si el movimiento es válido según las reglas del Sudoku; de lo contrario, `false`.
 */
function isValidMove(board, row, col, digit) {
  console.log('on service');

  console.log('tabla compartida:', board);

  const startRow = Math.floor(row / 3) * 3;
  const startCol = Math.floor(col / 3) * 3;

  // Validar fila
  console.log('Validation 1');
  for (let i = 0; i < 9; i++) {
    if (board[row * 9 + i] == digit) {
      return false;
    }
  }

  // Validar columna
  console.log('Validation 2');
  for (let i = 0; i < 9; i++) {
    if (board[i * 9 + col] == digit) {
      return false;
    }
  }

  // Validar subcuadrícula 3x3
  console.log('Validation 3');
  for (let i = 0; i < 9; i++) {
    const subRow = startRow + Math.floor(i / 3);
    const subCol = startCol + (i % 3);
    console.log(`Checking subgrid position: row=${subRow}, col=${subCol}, value:${board[i]}`); // Depuración
    if (board[subRow * 9 + subCol] == digit) {
      return false;
    }
  }

  console.log('Final');

  return true;
}



/**
 * Genera un tablero de Sudoku válido según el nivel de dificultad.
 * @param {string} dificultad - Nivel de dificultad ("easy", "medium", "hard", etc.).
 * @returns {string} - Tablero de Sudoku generado como cadena.
 */
function generarSudoku(dificultad) {
  if (!DIFFICULTY[dificultad]) {
    throw new Error(`Dificultad inválida: ${dificultad}. Niveles permitidos: ${Object.keys(DIFFICULTY).join(", ")}`);
  }

  const difficulty = DIFFICULTY[dificultad];

  // Crear un tablero vacío
  let board = Array(81).fill(sudoku.BLANK_CHAR);

  // Resolver el tablero completo
  solveSudoku(board);

  // Calcular cuántas casillas deben eliminarse
  const casillasNoEliminar = difficulty;
  const casillasAEliminar = 81 - casillasNoEliminar;

  // Crear un arreglo de posiciones aleatorias para eliminar
  const positions = sudoku._shuffle([...Array(81).keys()]);

  // Eliminar las casillas necesarias
  for (let i = 0; i < casillasAEliminar; i++) {
    board[positions[i]] = sudoku.BLANK_CHAR;
  }

  // Retornar el tablero como un string
  return board.join("");
}


/**
 * Verifica si una posición específica es válida dentro del tablero.
 * @param {string} square - Posición de la casilla (e.g., "A1").
 * @returns {boolean} - True si la posición es válida, false de lo contrario.
 */
function isSquareValid(square) {
  return SQUARES.includes(square);
}

// Exportar las funciones necesarias
export { generarSudoku as sudokuGenerator, isSquareValid, isValidMove };
