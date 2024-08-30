<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\LoginController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\HomeController;
use App\Http\Middleware\EnsureTokenIsValid;

Route::get('/login', [LoginController::class, 'index'])->name('login');
Route::post('/logueo', [LoginController::class, 'login'])->name('logueo');

Route::get('/register', [RegisterController::class, 'index'])->name('register');
Route::post('/register/save', [RegisterController::class, 'register'])->name('register.save');


Route::get('', [function () {
    return redirect()->route('home');
}]);

Route::middleware('auth')->group(function () {
Route::prefix('home')->group(function () {
    Route::get('', [HomeController::class, 'index'])->name('home');
    Route::post('/logout', [LoginController::class, 'logout'])->name('logout');
});
})->withoutMiddleware([EnsureTokenIsValid::class]);


