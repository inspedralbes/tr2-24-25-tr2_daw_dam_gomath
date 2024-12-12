<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Operacion;

class OperacionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function operacionsFiltro(Request $request)
    {
        $operacion = $request->input('operacion');
        $modo = $request->input('modo');
        $cantidad = $request->input('cantidad');
        $dificultat = $request->input('dificultat');

        if (!$operacion || !in_array($operacion, ['suma', 'resta', 'multiplicacion', 'division'])) {
            return response()->json(['error' => 'Operación no válida o no especificada'], 400);
        }
        if($modo=='numero'){
            $operaciones = Operacion::where('tipo_operacion', $operacion)->where('nivel_dificultad', $dificultat)->inRandomOrder()->take($cantidad)->get();
            return response()->json([
                'filtro_operacion' => $operacion,
                'filtro_dificultat' => $dificultat,
                'operaciones_filtradas' => $operaciones,
            ]);
        }
        $operaciones = Operacion::where('tipo_operacion', $operacion)->inRandomOrder()->get();

        return response()->json([
            'filtro_operacion' => $operacion,
            'filtro_dificultat' => $dificultat,
            'operaciones_filtradas' => $operaciones,
        ]);
    }

    public function index()
    {
        $operaciones = Operacion::all();

        if (request()->is('api/*')) {
            return response()->json($operaciones);
        }

        foreach ($operaciones as $operacion) {
            $operacion->decoded_problem = json_decode($operacion->problem_json);
        }

        return view('operacions.index', compact('operaciones')); // assuming the view is operacions/index
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
        $request->validate([
            'question' => 'required|string',
            'answers' => 'required|array',
            'difficulty' => 'required|string|in:fácil,intermedio,difícil',
            'operation_type' => 'required|string|in:suma,resta,multiplicación,division',
        ]);

        $problem_json = [
            'question' => $request->question,
            'answers' => array_map(function ($answer, $index) use ($request) {
                return [
                    'value' => $answer['value'],
                    'is_correct' => $request->has("answers.$index.is_correct"),
                ];
            }, $request->input('answers', []), array_keys($request->input('answers'))),
        ];

        Operacion::create([
            'problem_json' => json_encode($problem_json),
            'nivel_dificultad' => $request->difficulty,    
            'tipo_operacion' => $request->operation_type,   
        ]);

        return redirect()->route('operacions.index')->with('success', 'Problema agregado correctamente.');
    }

    /**
     * Show the specified resource.
     */
    public function show($id)
    {
        
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $operacion = Operacion::findOrFail($id);
        $operacion->decoded_problem = json_decode($operacion->problem_json, true);

        return view('operacions.edit', compact('operacion')); // Assuming you have an edit view
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $data = $request->validate([
            'problem_json' => 'required|array',
            'problem_json.question' => 'required|string',
            'problem_json.answers' => 'required|array',
            'nivel_dificultad' => 'required|string',
            'tipo_operacion' => 'required|string',
        ]);

        $operacion = Operacion::find($id);
        if (!$operacion) {
            return response()->json(['error' => 'Operación no encontrada'], 404);
        }

        $problem = json_decode($operacion->problem_json, true);

        $answers = [];
        foreach ($request->input('problem_json.answers') as $index => $answer) {
            $answers[] = [
                'value' => $answer['value'],
                'is_correct' => ($index == $request->input('correct_answer')),  // Mark the correct answer
            ];
        }

        $problem['question'] = $request->input('problem_json.question');
        $problem['answers'] = $answers;

        $operacion->problem_json = json_encode($problem);
        $operacion->nivel_dificultad = $data['nivel_dificultad'];
        $operacion->tipo_operacion = $data['tipo_operacion'];
        $operacion->save();

        if (request()->is('api/*')) {
            return response()->json(['message' => 'Operación actualizada correctamente']);
        }

        return redirect()->route('operacions.index')->with('success', 'Operación actualizada correctamente');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $operacion = Operacion::find($id);
        if (!$operacion) {
            return response()->json(['error' => 'Operación no encontrada'], 404);
        }
        $operacion->delete();

        if (request()->is('api/*')) {
            return response()->json(['message' => 'Operación eliminada correctamente']);
        }

        return redirect()->route('operacions.index')->with('success', 'Operación eliminada correctamente.');
    }

    /**
     * Filter operaciones based on parameters.
     */
}
