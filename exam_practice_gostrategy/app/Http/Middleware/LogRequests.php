<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log as LogModel;

class LogRequests
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        // Registrar log de entrada si LOG_ENTRADA es true
        if (config('app.log_entrada')) {
            LogModel::info('Entrada', [
                'ip' => $request->ip(),
                'url' => $request->fullUrl(),
                'method' => $request->method(),
                'input' => $request->all()
            ]);

            LogModel::create([
                'type' => 'Entrada',
                'ip' => $request->ip(),
                'url' => $request->fullUrl(),
                'method' => $request->method(),
                'message' => json_encode($request->all())
            ]);
        }

        // Procesar la solicitud y obtener la respuesta
        $response = $next($request);

        // Registrar log de salida si APP_DEBUG es true
        if (config('app.debug')) {
            LogModel::info('Salida', [
                'ip' => $request->ip(),
                'url' => $request->fullUrl(),
                'method' => $request->method(),
                'response' => $response->getContent()
            ]);

            LogModel::create([
                'type' => 'Salida',
                'ip' => $request->ip(),
                'url' => $request->fullUrl(),
                'method' => $request->method(),
                'message' => $response->getContent()
            ]);
        }

        return $response;
    }
}
