<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Clase;

class ClaseController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $query = $request->input('query');
    
        $clases = Clase::when($query, function ($queryBuilder) use ($query) {
            return $queryBuilder->where('nombre_clase', 'LIKE', '%' . $query . '%');
        })->get();
    
        return view('clases.index', compact('clases'));
    }
    

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        // Retornar la vista 'create' para mostrar el formulario de creación
        return view('clases.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // Validación de los datos del formulario
        $data = $request->validate([
            'nombre_clase' => 'required|string|max:255',
        ]);

        // Crear una nueva clase
        $clase = new Clase();
        $clase->nombre_clase = $data['nombre_clase'];
        $clase->save();

        // Redirigir a la lista de clases con un mensaje de éxito
        return redirect()->route('clases.index')->with('success', 'Clase creada correctamente');
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        // Buscar la clase por su ID
        $clase = Clase::find($id);

        // Verificar si la clase existe
        if (!$clase) {
            return redirect()->route('clases.index')->with('error', 'Clase no encontrada');
        }

        // Retornar la vista de mostrar clase con los datos de la clase
        return view('clases.show', compact('clase'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        // Buscar la clase por su ID
        $clase = Clase::find($id);

        // Verificar si la clase existe
        if (!$clase) {
            return redirect()->route('clases.index')->with('error', 'Clase no encontrada');
        }

        // Retornar la vista de edición de la clase
        return view('clases.edit', compact('clase'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        // Validación de los datos
        $data = $request->validate([
            'nombre_clase' => 'required|string|max:255',
        ]);

        // Buscar la clase por su ID
        $clase = Clase::find($id);

        // Verificar si la clase existe
        if (!$clase) {
            return redirect()->route('clases.index')->with('error', 'Clase no encontrada');
        }

        // Actualizar los datos de la clase
        $clase->nombre_clase = $data['nombre_clase'];
        $clase->save();

        // Redirigir a la lista de clases con un mensaje de éxito
        return redirect()->route('clases.index')->with('success', 'Clase actualizada correctamente');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        // Buscar la clase por su ID
        $clase = Clase::find($id);

        // Verificar si la clase existe
        if (!$clase) {
            return redirect()->route('clases.index')->with('error', 'Clase no encontrada');
        }

        // Eliminar la clase
        $clase->delete();

        // Redirigir a la lista de clases con un mensaje de éxito
        return redirect()->route('clases.index')->with('success', 'Clase eliminada correctamente');
    }
}
