<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('sudoku_results', function (Blueprint $table) {
            $table->id(); // ID autoincremental
            $table->string('nivel'); // Nivel del juego (fácil, medio, difícil)
            $table->integer('tiempo'); // Tiempo tardado en segundos
            $table->integer('errores'); // Cantidad de errores cometidos
            $table->timestamps(); // Para almacenar created_at y updated_at
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sudoku_results');
    }
};
