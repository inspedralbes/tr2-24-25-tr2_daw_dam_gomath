<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Operacion extends Model
{
    protected $table = 'operacions';

    protected $fillable = [
        'problem_json',
        'nivel_dificultad',
        'tipo_operacion',
    ];
    public $timestamps = false;
}
