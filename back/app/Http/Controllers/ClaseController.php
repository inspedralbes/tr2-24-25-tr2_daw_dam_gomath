<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Clase;

class ClaseController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $clase = Clase::all();

        return response()->json($clase);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'nombre_clase'=>'required',
        ]);

        $clase = new Clase();
        $clase -> nombre_clase = $data['nombre_clase'];
        $clase->save();

        return response()->json(['message'=>'Clase creada correctamente']);
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
            'nombre_clase'=>'required',
        ]);

        $puntuacion = Operacion::find($id);
        if (!$puntuacion) {
            return response()->json(['error' => 'Clase no encontrada'], 404);
        }
        $clase -> nombre_clase = $data['nombre_clase'];
        $clase->save();

        return response()->json(['message'=>'Clase actualizada correctamente']);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $clase = Clase::find($id); 
        if (!$clase) {
            return response()->json(['error' => 'Clase no encontrada'], 404);
        }
        $clase->delete(); 
        return response()->json(['message'=>'Clase borrada correctamente']);
    }
}
