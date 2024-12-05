<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Operacion;
class OperacionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $operaciones = Operacion::all();

        if (request()->is('api/*')) {
            return response()->json($operaciones); 
        }
        
        return view('operacions', compact('operaciones'));
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
            'problem_json'=>'required',
            'nivel_dificultad'=>'required',
            'tipo_operacion'=>'required',
        ]);

        $operacion = new Operacion();
        $operacion -> problem_json = $data['problem_json'];
        $operacion -> nivel_dificultad = $data['nivel_dificultad'];
        $operacion -> tipo_operacion = $data['tipo_operacion'];
        $operacion->save();

        return response()->json(['message'=>'Operacion creada correctamente']);
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
            'problem_json'=>'required',
            'nivel_dificultad'=>'required',
            'tipo_operacion'=>'required',
        ]);

        $puntuacion = Operacion::find($id);
        if (!$puntuacion) {
            return response()->json(['error' => 'Operacion no encontrada'], 404);
        }
        $operacion -> problem_json = $data['problem_json'];
        $operacion -> nivel_dificultad = $data['nivel_dificultad'];
        $operacion -> tipo_operacion = $data['tipo_operacion'];
        $operacion->save();

        return response()->json(['message'=>'Operacion actualizada correctamente']);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy( $id)
    {
        $operacion = Operacion::find($id); 
        if (!$operacion) {
            return response()->json(['error' => 'Operacion no encontrada'], 404);
        }
        $operacion->delete(); 
        return response()->json(['message'=>'Operacion borrada correctamente']);
    }
}
