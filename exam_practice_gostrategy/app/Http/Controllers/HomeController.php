<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{



    public function index(Request $request){

        dd("hola");
        // return view('dashboard');
    }
}
