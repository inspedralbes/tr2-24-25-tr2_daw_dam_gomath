<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ClaseController;


Route::get('/', function () {
    return view('welcome');
});

// Mostrar todas las clases
Route::get('/clases', [ClaseController::class, 'index'])->name('clases.index');

// Mostrar formulario para crear una nueva clase
Route::get('/clases/create', [ClaseController::class, 'create'])->name('clases.create');

// Crear una nueva clase
Route::post('/clases', [ClaseController::class, 'store'])->name('clases.store');

// Mostrar una clase específica
Route::get('/clases/{id}', [ClaseController::class, 'show'])->name('clases.show');

// Mostrar el formulario de edición de una clase
Route::get('/clases/{id}/edit', [ClaseController::class, 'edit'])->name('clases.edit');

// Actualizar una clase
Route::put('/clases/{id}', [ClaseController::class, 'update'])->name('clases.update');

// Borrar una clase
Route::delete('/clases/{id}', [ClaseController::class, 'destroy'])->name('clases.destroy');
