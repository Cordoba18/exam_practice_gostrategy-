<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function Get_users(Request $request){


        $users = User::all();




        return response()->json([
            'data'=>$users,
            'status' => true,
        ]);
    }
}
