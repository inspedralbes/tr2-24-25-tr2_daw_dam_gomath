<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class sudokuResults extends Model
{
    // Nombre de la tabla asociada
    protected $table = 'sudoku_results';

    // Campos asignables en masa
    protected $fillable = [
        'nivel',    // Nivel del juego
        'tiempo',   // Tiempo tardado en segundos
        'errores',  // Cantidad de errores cometidos
    ];

    // Si no deseas utilizar los campos de timestamps (created_at y updated_at)
    // puedes desactivar esta funcionalidad:
    // public $timestamps = false;
}
