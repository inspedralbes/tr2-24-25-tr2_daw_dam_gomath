<?php

use App\Http\Controllers\CodiJocController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\OperacionController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ClaseController;
use App\Http\Controllers\PuntuacionController;


Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::get('/operacions', [OperacionController::class, 'index']);
Route::get('/users', [UserController::class, 'index']);
Route::post('/users/store', [UserController::class, 'store']);
Route::get('/clases', [ClaseController::class, 'index']);
Route::get('/puntuaciones', [PuntuacionController::class, 'index']);
Route::post('/userLogin', [UserController::class,'loginUser']);
Route::post('/userLogout', [UserController::class, 'logoutUser'])->middleware('auth:sanctum');
Route::post('/operacionsFiltro', [OperacionController::class, 'operacionsFiltro']);
Route::put('user/update/{id}', [UserController::class, 'updateName']);
Route::post('/userLogin', [UserController::class,'loginUser']);
Route::post('/userLogout', [UserController::class, 'logoutUser'])->middleware('auth:sanctum');
Route::post('/operacionsFiltro', [OperacionController::class, 'operacionsFiltro']);
Route::post('/unaRespuesta', [OperacionController::class, 'respuestaCorrectaUnaPregunta']);
Route::get('/codis', [CodiJocController::class, 'index']);
