<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\OperacionController;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/adminer', function () {
    return view('app');
});

Route::get('/operacion', [OperacionController::class, 'index'])->name('operacions');
Route::delete('/operacion/{id}', [OperacionController::class, 'destroy'])->name('operacions.destroy');
