<?php

namespace App\Http\Controllers;


//Importaciones
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\AuthController;
use App\Models\Token;

////////////////////////////////

class HomeController extends Controller
{


    //Constructor para validacion de Token de session
    public function __construct() {
        AuthController::AuthUser();

    }


    //Metodo inicial para renderizar vista inicial
    public function index(Request $request){
        return view('dashboard');
    }



}
