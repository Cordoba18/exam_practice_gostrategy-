<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class RegisterController extends Controller
{
    public function index(Request $request){



        return view('auth.register');

    }

    public function register(Request $request){


        dd($request);

        // return view('auth.register');

    }

}
