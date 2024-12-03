<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Puntuacion;

class PuntuacionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $puntuacion = Puntuacion::all();

        return response()->json($puntuacion);
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
            'user_id'=>'required',
            'modo'=>'required',
            'puntuacion'=>'required',
        ]);

        $puntuacion = new Puntuacion();
        $puntuacion -> user_id = $data['user_id'];
        $puntuacion -> modo = $data['modo'];
        $puntuacion -> puntuacion = $data['puntuacion'];
        $puntuacion->save();

        return response()->json(['message'=>'Puntuacion creada correctamente']);
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
            'user_id'=>'required',
            'modo'=>'required',
            'puntuacion'=>'required',
        ]);

        $puntuacion = Puntuacion::find($id);
        if (!$puntuacion) {
            return response()->json(['error' => 'Puntuacion no encontrada'], 404);
        }
        $puntuacion -> user_id = $data['user_id'];
        $puntuacion -> modo = $data['modo'];
        $puntuacion -> puntuacion = $data['puntuacion'];
        $puntuacion->save();
        $puntuacion->save();

        return response()->json(['message'=>'Puntuacion actualizada correctamente']);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $puntuacion = Puntuacion::find($id); 
        if (!$puntuacion) {
            return response()->json(['error' => 'Puntuacion no encontrada'], 404);
        }
        $puntuacion->delete(); 
        return response()->json(['message'=>'Puntuacion borrada correctamente']);
    }
}
