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
        // Validar las credenciales proporcionadas por el usuario
        $credenciales = $request->validate([
            'email' => 'required|email',
            'password' => 'required|string',
        ]);

        // Intentar autenticar al usuario con el correo y la contraseña proporcionados
        $user = User::where('email', $request->email)->first();  // Buscar el usuario por correo

        // Si no se encuentra el usuario o las contraseñas no coinciden
        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json(['status' => 'error', 'message' => 'Correo o contraseña incorrectos'], 401);
        }

        // Si las credenciales son correctas, generar el token de acceso
        $token = $user->createToken('auth-token')->plainTextToken;

        return response()->json([
            'status' => 'success',
            'message' => 'Login exitoso',
            'token' => $token,
            'user' => $user
        ]);
    }

    public function registerUser(Request $request) {
        // Validar los datos de la solicitud
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|string|min:6',
            'rol' => 'required|string|in:student,professor',
        ]);

        // Crear el usuario con los datos validados
        $user = User::store([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => bcrypt($data['password']),
            'rol' => $data['rol'],
        ]);

        $token = $user->createToken('auth-token')->plainTextToken;

        // Retornar la respuesta de éxito con el token
        return response()->json([
            'status' => 'success',
            'message' => 'Usuario registrado exitosamente',
            'token' => $token,
            'user' => $user
        ]);
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


