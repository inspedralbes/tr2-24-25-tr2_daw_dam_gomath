<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ClaseController;


Route::get('/', function () {
    return view('welcome');
});

Route::get('/clases', [ClaseController::class, 'index'])->name('clases.index');
Route::get('/clases/create', [ClaseController::class, 'create'])->name('clases.create');
Route::post('/clases', [ClaseController::class, 'store'])->name('clases.store');
Route::get('/clases/{id}', [ClaseController::class, 'show'])->name('clases.show');
Route::get('/clases/{id}/edit', [ClaseController::class, 'edit'])->name('clases.edit');
Route::put('/clases/{id}', [ClaseController::class, 'update'])->name('clases.update');
Route::delete('/clases/{id}', [ClaseController::class, 'destroy'])->name('clases.destroy');
