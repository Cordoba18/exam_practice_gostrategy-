<?php

namespace App\Http\Middleware;


use Closure;

use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

use App\Http\Controllers\LoginController;
class EnsureTokenIsValid
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {

        if ($request->is('home/*') || $request->is('home')) {
            $user = LoginController::get_user_session($request);
            $cookieValue = $request;
            dd($cookieValue);
            if ($user) {
                if ($request->input('token') !== 'my-secret-token') {
                    // Comprueba si la ruta actual es la de login
                    if (!$request->is('login')) {
                        // Si el token no es correcto y no es la ruta de login, redirige al usuario al login


                        return redirect()->route('login');
                    }
                }
            }


        }

     // Verifica si el token es correcto



        return $next($request);
    }
}
