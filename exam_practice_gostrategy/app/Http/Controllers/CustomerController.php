<?php

namespace App\Http\Controllers;

use App\Models\Commune;
use App\Models\Customer;
use App\Models\Region;
use Illuminate\Http\Request;
use PHPUnit\Framework\TestStatus\Success;

class CustomerController extends Controller
{
    public function index(Request $request){


        return view('customers.show');
    }


    public function get_regiones(Request $request){


        //Obtenemos la regiones activas y validamos
        try {
            $regions = Region::where("status", 1)->get();
        } catch (\Throwable $th) {
            return response()->json([
                'data'=>null,
                'message'=>$th,
                'status'=>false,
            ]);
        }


        //retornamos la data obtenida
        return response()->json([
            'data'=>$regions,
            'message'=>'success',
            'status'=>true,
        ]);

    }


    public function get_communes(Request $request){


        //obtenemos las comunas y validamos la variable requerida
try {
    $request->validate([
        'id_reg' => 'required',
    ]);
} catch (\Throwable $th) {
    return response()->json([
        'data'=>null,
        'message'=>$th,
        'status'=>false,
    ]);
}


//
        $id_reg = $request->id_reg;


        $communes = Commune::where('id_reg', $id_reg)->where('status',1)->get();

        try {
            $communes = Commune::where('id_reg', $id_reg)->where('status',1)->get();
        } catch (\Throwable $th) {
            return response()->json([
                'data'=>null,
                'message'=>$th,
                'status'=>false,
            ]);
        }

        return response()->json([
            'data'=>$communes,
            'message'=>'success',
            'status'=>true,
        ]);

    }

    //funcion que me permitira guardar un customer
    public function save(Request $request){


        //obtenemos las comunas y validamos la variable requerida
try {
    $request->validate([
        'dni' => 'required|integer|min:11',
        'id_com' => 'required|integer',
        'email' => 'required|email|max:120',
        'name' => 'required|max:45',
        'lastname' => 'required:max:45',
        'address' => 'max:255',
        'date_reg' => 'required|date',
        'status' => 'required|integer|max:1',
    ]);
} catch (\Throwable $th) {
    return response()->json([
        'data'=>null,
        'message'=>$th->getMessage(),
        'status'=>false,
    ]);
}


//validamos si el id de la comuna es valido con alguno de la base de datos


try {
    $validate_id_com = Commune::where('id_com',
    $request->id_com)->first();

} catch (\Throwable $th) {
    return response()->json([
        'data'=>null,
        'message'=>$th->getMessage(),
        'status'=>false,
    ]);
}

if (!$validate_id_com) {
    return response()->json([
        'data'=>null,
        'message'=>'invalid commune',
        'status'=>false,
    ]);
}

//consultamos si existe un customer con la cedula enviada por el frontend
$customer = Customer::where('dni', $request->dni)->first();

if ($customer) {
    return response()->json([
        'data'=>$customer,
        'message'=>"Existed user whit this dni ($request->dni)",
        'status'=>false,
    ]);
}


//procedemos a guardar el customer
try {
    $customer = new Customer();

    $customer->dni = $request->dni;
    $customer->id_reg = $validate_id_com->id_reg;
    $customer->id_com = $request->id_com;
    $customer->email = $request->email;
    $customer->name = $request->name;
    $customer->lastname = $request->lastname;
    $customer->address = $request->address;
    $customer->date_reg = $request->date_reg;
    $customer->status = $request->status;
    $customer->save();

    //retornamos la data
    $customer = Customer::join('communes', 'customers.id_com', "communes.id_com")
    ->join('regions', 'customers.id_reg', "regions.id_reg")
    ->select("customers.*", 'communes.description as description_commune','regions.description as description_region')->first();

    return response()->json([
        'data'=>$customer,
        'message'=>"Successfully created",
        'status'=>true,
    ]);
} catch (\Throwable $th) {
    return response()->json([
        'data'=>null,
        'message'=>$th->getMessage(),
        'status'=>false,
    ]);
}

    }


    //obtener customers
    public function get_customers(Request $request){





        try {
            //verificar data para la posible busqueda
            $dni = $request->dni;
            if (!$dni || !intval($dni)) {
             $dni = "";
            }
            $email = $request->email;
            if (!$email) {
             $email = "";
            }


            //armar cuerpo de consulta
            $consult =  Customer::join('communes', 'customers.id_com', "communes.id_com")
            ->join('regions', 'customers.id_reg', "regions.id_reg")
            ->select("customers.*", 'communes.description as description_commune','regions.description as description_region');

            //condiciones para la consulta
            if ($dni != ""  && $email != "") {
             $consult->where(function($query) use ($dni, $email) {
                $query->where("customers.dni", "like", "%$dni%")
                      ->orWhere("customers.email", "like", "%$email%");
            });
            }else if ($dni) {
                $consult->where("customers.dni","like","%$dni%");
            }else if($email){
                $consult->Where("customers.email","like","%$email%");
            }


            //obtener customers

            $customers = $consult->where('customers.status', 1)->get();

            //retornar data
            return response()->json([
                'data'=>$customers,
                'message'=>'Success',
                'status'=>true,
            ]);

        } catch (\Throwable $th) {
            //mensaje de error en caso de que lo haya
            return response()->json([
                'data'=>null,
                'message'=>$th->getMessage(),
                'status'=>false,
            ]);
        }



    }

    //funcion que me permitira eliminar un customer
    public function delete(Request $request){

        //validar data
        try {
            $request->validate([
                'dni' => 'required|integer|min:11',
            ]);
        } catch (\Throwable $th) {
            return response()->json([
                'data'=>null,
                'message'=>$th->getMessage(),
                'status'=>false,
            ]);
        }


        $customer = Customer::where("dni",$request->dni)->first();


        if (!$customer) {
            return response()->json([
                'data'=>null,
                'message'=>'Registro no existe',
                'status'=>true,
            ]);
        }


        try {
            //Cambiamos estado a inactivo
            $customer->status = 2;
            $customer->save();

            return response()->json([
                'data'=>$customer,
                'message'=>"Successfully deleted",
                'status'=>true,
            ]);
        } catch (\Throwable $th) {
            return response()->json([
                'data'=>null,
                'message'=>$th->getMessage(),
                'status'=>false,
            ]);
        }


    }
}

