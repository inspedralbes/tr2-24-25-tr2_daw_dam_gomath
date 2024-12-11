<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function loginUser(Request $request) {

        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json(['status' => 'error', 'message' => 'Correo o contraseña incorrectos'], 401);
        }

        $token = $user->createToken('auth-token')->plainTextToken;
        $resposta = response()->json([
            'status' => 'success',
            'message' => 'Login exitoso',
            'token' => $token,
            'user' => $user->only(['id', 'name', 'email', 'rol'])
        ], 201);


        return $resposta;
    }

    public function logoutUser(Request $request) {
        //dd($request->user());
        //$request->user()->currentAccessToken()->delete();

        return response()->json(['message' => 'Logout exitoso'], 200);
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
            'username' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|string|min:6',
            'rol' => 'required|string|in:student,professor',
        ]);
        // Validar los datos de entrada

        // Crear el usuario con los datos validados
        try {
            $user = User::create([
                'name' => $data['username'],
                'email' => $data['email'],
                'password' => Hash::make($data['password']),
                'rol' => $data['rol'],
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'Hubo un error al crear el usuario: ' . $e->getMessage(),
            ], 500); // Código HTTP 500: Error interno del servidor
        }

        // Generar un token para el usuario
        try {
            $token = $user->createToken('auth-token')->plainTextToken;
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'Hubo un error al generar el token: ' . $e->getMessage(),
            ], 500); // Código HTTP 500: Error interno del servidor
        }

        // Retornar la respuesta con el token y el usuario creado
        return response()->json([
            'status' => 'success',
            'message' => 'Usuario registrado exitosamente',
            'token' => $token,
            'user' => $user->only(['id', 'name', 'email', 'rol', 'clase_id']),
        ], 201); // Código HTTP 201: Creado

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
            'rol'=>'required'
        ]);

        $user = User::find($id);
        if (!$user) {
            return response()->json(['error' => 'Usuario no encontrado'], 404);
        }
        $user -> name = $data['name'];
        $user -> email = $data['email'];
        if ($data['password'] !== $user->password) {
            $user->password = Hash::make($data['password']); //password hasheado
        }
        $user -> rol = $data['rol'];
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


