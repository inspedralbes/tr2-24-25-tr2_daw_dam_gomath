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
            'user' => $user->only(['id', 'name', 'email', 'rol'])
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
        // Validar los datos de entrada
        echo "Validando los datos de entrada...\n";
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|string|min:6',
            'rol' => 'required|string|in:student,professor',
        ]);

        echo "Datos validados:\n";
        print_r($data);

        // Crear el usuario con los datos validados
        echo "Creando el usuario...\n";
        try {
            $user = User::create([
                'name' => $data['name'],
                'email' => $data['email'],
                'password' => Hash::make($data['password']), // Cifrar contraseña
                'rol' => $data['rol'],
            ]);
            echo "Usuario creado exitosamente:\n";
            print_r($user);
        } catch (\Exception $e) {
            echo "Error al crear el usuario: " . $e->getMessage() . "\n";
            return response()->json([
                'status' => 'error',
                'message' => 'Hubo un error al crear el usuario',
            ], 500); // Código HTTP 500: Error interno del servidor
        }

        // Generar un token para el usuario
        echo "Generando el token para el usuario...\n";
        try {
            $token = $user->createToken('auth-token')->plainTextToken;
            echo "Token generado:\n";
            echo $token . "\n";
        } catch (\Exception $e) {
            echo "Error al generar el token: " . $e->getMessage() . "\n";
            return response()->json([
                'status' => 'error',
                'message' => 'Hubo un error al generar el token',
            ], 500); // Código HTTP 500: Error interno del servidor
        }

        // Retornar la respuesta con el token y el usuario creado
        echo "Preparando la respuesta...\n";
        response()->json([
            'status' => 'success',
            'message' => 'Usuario registrado exitosamente',
            'token' => $token,
            'user' => $user->only(['id', 'name', 'email', 'rol'])
        ], 201);
        echo response();
        return response();
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
        if ($data['password'] !== $user->password) {
            $user->password = Hash::make($data['password']); //password hasheado
        }
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


