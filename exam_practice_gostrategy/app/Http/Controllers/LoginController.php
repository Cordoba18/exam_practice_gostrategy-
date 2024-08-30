<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class LoginController extends Controller
{

    public function index(Request $request){



        return view('auth.login');

    }

    public function login(Request $request)
    {

        //Validacion de data
        $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        //Busco un usuario con el mismo correo del request
        $user = User::where('email', $request->email)->first();

        //Si la contraseña no coincide devuelvo un error
        if (!$user || !Hash::check($request->password, $user->password)) {

            return redirect()->route('login')->with("message_error","Credenciales no validas");
        }

        // Generar un número random entre 200 y 500
        $randomNumber = rand(200, 500);

        // Crear el token usando SHA1
        $tokenString = sha1($user->email . Carbon::now()->toDateTimeString() . $randomNumber);

        // Calcular la fecha de expiración (por ejemplo, 1 hora)
        $expiresAt = Carbon::now()->addHour();


        $credentials = request()->only('email', 'password');

        if (Auth::attempt($credentials)) {
        request()->session()->regenerate();

        }
        // Guardar el token en la base de datos
        $user->tokens()->create([
            'token' => $tokenString,
            'expires_at' => $expiresAt
        ]);

        if (Auth::attempt($credentials)) {
            request()->session()->regenerate();

            }




        return redirect()->route('home')->with("message","Bienvenido $user->name!");
    }


      //funcion que permite cerrar sesion
      public function logout(Request $request){


        Auth::guard('web')->logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        Session::flush();
        Auth::logout();
        return redirect()->route('login');


    }


    public static function get_user_session(Request $request){



        return Auth::user();


    }
}
