<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class sudokuResults extends Model
{
    // Nombre de la tabla asociada
    protected $table = 'sudoku_results';

    // Campos asignables en masa
    protected $fillable = [
        'boardString', //tablero en una dimension
        'nivell',    // Nivel del juego
        'vides',   // Tiempo tardado en segundos
        'temps',  // Cantidad de errores cometidos
    ];
}
