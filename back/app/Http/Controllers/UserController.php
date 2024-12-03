<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function loginUser(Request $request) {
        
        $credenciales = $request->validate([
            "email" => ["required", "email"],
            "password" => "required",
        ]);

        if (Auth::attempt($credenciales)) {
            //$request->session()->regenerate();
            $user = Auth::user();

            $token = $user->createToken('auth-token')->plainTextToken;
            //session(['auth-token', $token]);

            //dd($token);

            return response()->json(['status'=> 'success', 'token' => $token ,'user'=> $user ]);

        }

        //return back()->withErrors(['email'=> 'Correo o contraseña no son correctas'])->onlyInput('email');
        return response()->json(['status' => 'error', 'message' => 'Usuario no encontrado']);
    }
    public function index()
    {
        $user = User::all();

        return response()->json($user);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'name'=>'required',
            'email'=>'required',
            'password'=>'required',
            'rol'=>'required',
            'clase_id'=>'required',
        ]);

        $user = new User();
        $user -> name = $data['name'];
        $user -> email = $data['email'];
        $user -> password = $data['password'];
        $user -> rol = $data['rol'];
        $user -> clase_id = $data['clase_id'];
        $user->save();

        return response()->json(['message'=>'Usuario creado correctamente']);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $data = $request->validate([
            'name'=>'required',
            'email'=>'required',
            'password'=>'required',
            'rol'=>'required',
            'clase_id'=>'required',
        ]);

        $user = User::find($id);
        if (!$user) {
            return response()->json(['error' => 'Usuario no encontrado'], 404);
        }
        $user -> name = $data['name'];
        $user -> email = $data['email'];
        $user -> password = $data['password'];
        $user -> rol = $data['rol'];
        $user -> clase_id = $data['clase_id'];
        $user->save();

        return response()->json(['message'=>'Usuario actualizado correctamente']);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $user = User::find($id); 
        if (!$user) {
            return response()->json(['error' => 'Usuario no encontrado'], 404);
        }
        $user->delete(); 
        return response()->json(['message'=>'Usuario borrado correctamente']);
    }
}
