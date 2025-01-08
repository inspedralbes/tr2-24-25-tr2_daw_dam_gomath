<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class puntuacion extends Model
{
    protected $table = 'puntuacions';

    protected $fillable = [
        'user_id',
        'modo',
        'puntuacion',
    ];
    public function users()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
