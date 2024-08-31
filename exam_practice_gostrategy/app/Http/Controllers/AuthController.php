<?php
namespace App\Http\Controllers;

use GuzzleHttp\Psr7\Request;
use App\Models\Token;

class AuthController extends Controller
{

    //Validar token de autenticacion

    public static function AuthUser(){



        //intento de obtener token de la cookie
        $validation = session('token');
          //intento obtener token de base de datos
        $validation_token_bd = Token::where('token', session('token'))->first();
        //Obtener fecha actual
        $date_now = date('Y-m-d H:i:s');


        //Validar si el token no existe ,si no se encuentra en la base de datos o si ya expiro
        if (!$validation || !$validation_token_bd || $validation_token_bd->expires_at < $date_now ) {


            // Destruir toda la sesión
            try {
            // Eliminar el token de la sesión
            session()->forget('token');

            } catch (\Throwable $th) {
                //throw $th;
            }

            redirect()->route('login')->send(); // Enviar la redirección inmediatamente
            exit; // Detener la ejecución del script
        }
    }




}
