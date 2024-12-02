<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class clase extends Model
{
    use HasFactory;
    protected $fillable = [
        'nombre_clase',
    ];
    protected $table = 'clases';

    public function users()
    {
        return $this->hasMany(User::class, 'clase_id');
    }
}
