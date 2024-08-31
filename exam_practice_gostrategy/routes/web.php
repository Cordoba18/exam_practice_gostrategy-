<?php

use App\Http\Controllers\CustomerController;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\LoginController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\HomeController;


Route::get('/login', [LoginController::class, 'index'])->name('login');
Route::post('/logueo', [LoginController::class, 'login'])->name('logueo');

Route::get('/register', [RegisterController::class, 'index'])->name('register');
Route::post('/register/save', [RegisterController::class, 'register'])->name('register.save');

Route::post('/logout', [LoginController::class, 'logout'])->name('logout');


Route::get('/', [function () {
  return redirect()->route('home');
}]);


Route::prefix('home')->group(function () {
    Route::get('', [HomeController::class, 'index'])->name('home');

    Route::prefix('customers')->group(function () {
        Route::get('', [CustomerController::class, 'index'])->name('home.customer');


    });

});






