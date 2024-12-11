<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\OperacionController;
use App\Http\Controllers\ClaseController;
use App\Http\Controllers\LoginRegisterController;


Route::get('/', function () {
    return view('welcome');
});

Route::get('/adminer', function () {
    return view('app');
});

Route::get('/operacion', [OperacionController::class, 'index'])->name('operacions.index');
Route::resource('operacions',OperacionController::class);
Route::delete('/operacion/{id}',[OperacionController::class,'destroy'])->name('operacions.destroy');


    
Route::get('/clases', [ClaseController::class, 'index'])->name('clases.index');
Route::get('/clases/create', [ClaseController::class, 'create'])->name('clases.create');
Route::get('/clases/{id}/edit', [ClaseController::class, 'edit'])->name('clases.edit');
Route::put('/clases/{id}', [ClaseController::class, 'update'])->name('clases.update');
Route::delete('/clases/{id}', [ClaseController::class, 'destroy'])->name('clases.destroy');


Route::get('/', [LoginRegisterController::class, 'showLoginForm'])->name('home');
Route::get('/welcome', [LoginRegisterController::class, 'showWelcome'])->name('welcome');
Route::post('/logout', [LoginRegisterController::class, 'logout'])->name('logout');
Route::get('/login', [LoginRegisterController::class, 'showLoginForm'])->name('login.showForm');
Route::post('/login', [LoginRegisterController::class, 'authenticate'])->name('login');
Route::post('/register', [LoginRegisterController::class, 'register'])->name('register');