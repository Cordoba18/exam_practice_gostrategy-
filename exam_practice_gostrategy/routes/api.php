<?php

use App\Http\Controllers\CustomerController;
use App\Http\Controllers\HomeController;
use App\Http\Middleware\ValidateApiKey;

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
// Define tus rutas API aquí



    Route::middleware(ValidateApiKey::class)->group(function () {




    Route::get('/get_users', [UserController::class, 'Get_users']);

    Route::prefix('customers')->group(function () {
    Route::get('/get_regiones', [CustomerController::class, 'get_regiones']);
    Route::get('/get_communes', [CustomerController::class, 'get_communes']);
    Route::get('/get_customers', [CustomerController::class, 'get_customers']);
    Route::post('/save', [CustomerController::class, 'save']);
    Route::post('/delete', [CustomerController::class, 'delete']);
    });
});
    Route::get('/get_token', [HomeController::class, 'get_token']);

