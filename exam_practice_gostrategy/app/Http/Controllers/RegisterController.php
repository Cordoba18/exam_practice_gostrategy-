<?php



namespace App\Http\Controllers;

//Importaciones
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

//

class RegisterController extends Controller
{


    //Metodo que me retorna la nueva vista de Creación de usuario
    public function index(Request $request){



        return view('auth.register');

    }


    //Metodo para guardar un nuevo usuario
    public function register(Request $request){

        //capturacion de variables del request
        $name = $request->name;
        $email = $request->email;
        $password = $request->password;
        $password_confirmation = $request->password_confirmation;


        try {
            $request->validate([
                'name' => 'required',
                'email' => 'required|email',
                'password' => 'required',
                'password_confirmation' => 'required'
            ]);

        } catch (\Throwable $th) {
            return redirect()->route('register')->with("message_error","Hubo un error en el envio de datos.");
        }


        //Validacion de campos
        if ($name == "") {
            return redirect()->route('register')->with("message_error","El nombre no puede estar vacio");
        }
          if ($email == ""|| !filter_var($email, FILTER_VALIDATE_EMAIL) ) {
            return redirect()->route('register')->with("message_error","Formato de correo no valido");
        }
          if ($password != $password_confirmation) {
            return redirect()->route('register')->with("message_error","Las contraseñas no coinciden");
        }

        //Validamos existencia del usuario
        $validation_user = User::where("email",$email)->first();

        if ($validation_user) {
            //retornamos mensaje de existencia de usuario
            return redirect()->route('register')->with("message_error","El usuario ya existe");
        }else{



            try {
                $user = new User();
                $user->name = $name;
                $user->email = $email;
                $user->password = Hash::make($request->password);;
                $user->save();

                return redirect()->route('register')->with("message","Usuario creado correctamente");
            } catch (\Throwable $th) {
                return redirect()->route('register')->with("message_error","Ocurrio un error");
            }



        }

    }

}
