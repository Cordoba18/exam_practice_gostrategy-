<?php

use Closure;
use Illuminate\Http\Request;
use App\Models\Token;

class CheckToken
{
    public function handle(Request $request, Closure $next)
    {
        $tokenString = $request->header('Authorization');

        if (!$tokenString) {
            return response()->json(['error' => 'Token no proporcionado'], 401);
        }

        $token = Token::where('token', $tokenString)->first();

        if (!$token || $token->expires_at < now()) {
            // return response()->json(['error' => 'Token inválido o expirado'], 401);
            return redirect()->route('login');
        }

        // Pasar al siguiente middleware
        return $next($request);
    }
}
