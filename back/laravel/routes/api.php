<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\OperacionController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ClaseController;
use App\Http\Controllers\PuntuacionController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::get('/operaciones', [OperacionController::class, 'index']);
Route::get('/users', [UserController::class, 'index']);
Route::get('/clases', [ClaseController::class, 'index']);
Route::get('/puntuaciones', [PuntuacionController::class, 'index']);