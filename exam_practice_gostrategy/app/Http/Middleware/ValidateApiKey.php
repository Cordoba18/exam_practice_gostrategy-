<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Models\Token;
class ValidateApiKey
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {


            if ($request->is('api/*')) {



            $validation_token_bd = Token::where('token',$request->input('token'))->first();
            //Obtener fecha actual
            $date_now = date('Y-m-d H:i:s');


            if (!$request->input('token') ) {
                return response()->json([
                    'message'=>"Not token",
                    'status' => false,
                ]);

            }

            //Validar si el token no existe ,si no se encuentra en la base de datos o si ya expiro

            if (!$validation_token_bd) {



                return response()->json([
                    'message'=>"The token does not exist",
                    'status' => false,
                ]);




        }
        //Validacion de existencia de token
            if ($request->input('token') !== $validation_token_bd->token) {


                return response()->json([
                    'message'=>"Invalid token",
                    'status' => false,
                ]);



        }


        //Validacion de expiracion de token

        if ($validation_token_bd && $validation_token_bd->expires_at < $date_now ) {

            return response()->json([
                'message'=>"Expired token",
                'status' => false,
            ]);

        }



    }

        return $next($request);

        exit;
    }
}
