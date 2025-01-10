<?php

namespace App\Http\Controllers;

use App\Models\sudokuResults;
use Illuminate\Http\Request;

class SudokuResultsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
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
        // Validación de los datos que recibimos
        $request->validate([
            'boardString' => 'required|string', // Verifica que boardString esté presente y sea una cadena
            'nivell' => 'required|string', // Nivel de dificultad
            'vides' => 'required|string', // Vidas restantes
            'temps' => 'required|string', // Tiempo usado
        ]);

        // Crear el nuevo registro en la base de datos
        try {
            $gameData = sudokuResults::create([
                'boardString ' => $request->boardString, // Tablero 2D
                'nivell' => $request->nivell, // Nivel
                'vides' => $request->vides, // Vidas restantes
                'temps' => $request->temps, // Tiempo usado
            ]);

            return response()->json(['message' => 'Datos guardados con éxito', 'gameData' => $gameData], 200);
        } catch (\Exception $e) {
            // Si ocurre un error al guardar los datos
            return response()->json(['message' => 'Hubo un error al guardar los datos', 'error' => $e->getMessage()], 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(sudokuResults $sudokuResults)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(sudokuResults $sudokuResults)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, sudokuResults $sudokuResults)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(sudokuResults $sudokuResults)
    {
        //
    }
}
